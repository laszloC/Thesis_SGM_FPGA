using Microsoft.Win32;
using System;
using System.Configuration;
using System.Text.RegularExpressions;
using System.Windows;
using System.Windows.Media.Imaging;
using WinForms = System.Windows.Forms;

namespace PerformanceAnalyzer
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private RunResults results;
        private bool canRun;
        private bool canSave;
        private BitmapImage gtImage;
        private string saveFolder;

        public MainWindow()
        {
            InitializeComponent();
            canRun = false;
            canSave = false;
        }

        private void SelectImagesClick(object sender, RoutedEventArgs e)
        {
            try
            {
                InitializeResult();

                canRun = true;
            }
            catch (Exception ex)
            {
                _ = MessageBox.Show(ex.Message);
            }
        }

        private void RunClick(object sender, RoutedEventArgs e)
        {
            try
            {
                if (!canRun)
                {
                    throw new ApplicationException("Please select images before running");
                }

                GetParameters();

                GetSaveFolder();

                RunSwProcess();

                RunHwProcess();

                canSave = true;
            }
            catch (Exception ex)
            {
                _ = MessageBox.Show(ex.Message);
            }
        }

        private void SaveClick(object sender, RoutedEventArgs e)
        {
            try
            {
                if (!canSave)
                {
                    throw new ApplicationException("Please run before saving");
                }
                string defaultFileName = "results_" + DateTime.Now.ToString("MMdd_HHmmss");
                string filename = GetSavePathFromDialog("Save results as JSON", defaultFileName, ".json", "JSON files (*.json)|*.json");

                // dump results and save as json file
            }
            catch (Exception ex)
            {
                _ = MessageBox.Show(ex.Message);
            }
        }

        private void InitializeResult()
        {
            var inputLeftPath = GetFilePathFromDialog("Select LEFT image");
            var inputRightPath = GetFilePathFromDialog("Select RIGHT image");
            var inputGroundTruthPath = GetFilePathFromDialog("Select GROUND TRUTH image");

            results = new RunResults
            {
                InputLeftPath = inputLeftPath,
                InputRightPath = inputRightPath,
                InputGroundThruthPath = inputGroundTruthPath
            };

            LeftImg.Source = new BitmapImage(new Uri(results.InputLeftPath));
            RightImg.Source = new BitmapImage(new Uri(results.InputRightPath));
            gtImage = new BitmapImage(new Uri(results.InputGroundThruthPath));
            GroundTruthImg.Source = gtImage;
        }

        private void RunSwProcess()
        {
            var swArgs = CreateSwProcessArgs();
            var swPath = GetSwAppPath();

            var swProcessTimer = new ProcessTimer(swPath, swArgs, true);
            var ellapsedMs = swProcessTimer.RunProcess();
            results.ResultSWTime = TimeSpan.FromMilliseconds(ellapsedMs);
            SWTime.Text = results.ResultSWTime.ToString("c");

            // set output image
            var swImage = new BitmapImage(new Uri(results.ResultSWDepthMapPath));
            SWResult.Source = swImage;

            // compute rms and bad matches
            var analyzer = new ResultAnalyzer(swImage, gtImage);
            SWRms.Text = analyzer.GetRmsError().ToString();
            SWBadMatches.Text = analyzer.GetBadMatchesPercentage().ToString();
        }

        private void RunHwProcess()
        {
            var hwArgs = CreateHwProcessArgs();
            var hwPath = GetHwAppPath();

            var hwProcessTimer = new ProcessTimer(hwPath, hwArgs, true);
            var ellapsedMs = hwProcessTimer.RunProcess();
            results.ResultHWTime = TimeSpan.FromMilliseconds(ellapsedMs);
            HWTime.Text = results.ResultHWTime.ToString("c");

            // set output image

            // compute rms and bad matches
        }

        private string GetFilePathFromDialog(string title)
        {
            var openFileDialog = new OpenFileDialog() { Title = title };
            if (openFileDialog.ShowDialog() == true)
            {
                return openFileDialog.FileName;
            }

            throw new ApplicationException("Failed to get file path");
        }

        private string GetFolderPathFromDialog(string description)
        {
            var openFolderDialog = new WinForms.FolderBrowserDialog
            {
                SelectedPath = (!string.IsNullOrEmpty(saveFolder)) ? saveFolder : System.AppDomain.CurrentDomain.BaseDirectory,
                Description = description
            };
            if (openFolderDialog.ShowDialog() == WinForms.DialogResult.OK)
            {
                return openFolderDialog.SelectedPath;
            }

            throw new ApplicationException("Failed to get folder path");
        }

        private string GetSavePathFromDialog(string title, string fileName, string extension, string filter)
        {
            var saveFileDialog = new SaveFileDialog {
                Title = title,
                FileName = fileName,
                DefaultExt = extension,
                Filter = filter,
            };

            if (saveFileDialog.ShowDialog() == true)
            {
                return saveFileDialog.FileName;
            }

            throw new ApplicationException("Failed to get file path");
        }

        private void GetParameters()
        {
            if (string.IsNullOrWhiteSpace(MaxDisp.Text))
            {
                throw new ApplicationException("Maximum disparity not defined");
            }

            if (string.IsNullOrWhiteSpace(P1.Text))
            {
                throw new ApplicationException("P1 not defined");
            }

            if (string.IsNullOrWhiteSpace(P2.Text))
            {
                throw new ApplicationException("P2 not defined");
            }

            results.MaxDisp = System.Convert.ToInt32(MaxDisp.Text);
            results.P1 = System.Convert.ToInt32(P1.Text);
            results.P2 = System.Convert.ToInt32(P2.Text);
        }

        private void GetSaveFolder()
        {
            saveFolder = GetFolderPathFromDialog("Select folder to save results");
            results.ResultSWDepthMapPath = System.IO.Path.Combine(saveFolder, "result_sw.bmp");
            results.ResultSWDepthMapPath = System.IO.Path.Combine(saveFolder, "result_hw.bmp");
        }

        private void IntPreviewTextInput(object sender, System.Windows.Input.TextCompositionEventArgs e)
        {
            Regex r = new Regex("[^0-9]+");
            e.Handled = r.IsMatch(e.Text);
        }

        private string CreateSwProcessArgs()
        {
            return "\"" + results.InputLeftPath + "\" " +
                "\"" + results.InputRightPath + "\" " +
                "\"" + results.ResultSWDepthMapPath + "\" " +
                "sad " +
                results.P1.ToString() + " " +
                results.P2.ToString() + " " +
                results.MaxDisp;
        }

        private string CreateHwProcessArgs()
        {
            throw new NotImplementedException();
        }

        private string GetSwAppPath()
        {
            return ConfigurationManager.AppSettings["SwAppPath"];
        }

        private string GetHwAppPath()
        {
            return ConfigurationManager.AppSettings["HwAppPath"];
        }
    }
}
