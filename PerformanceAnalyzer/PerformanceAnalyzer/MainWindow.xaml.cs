using Microsoft.Win32;
using System;
using System.Configuration;
using System.Globalization;
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
        private int tolerance = 30;

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

                //RunHwProcess();

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
                string defaultFileName = $"results_{DateTime.Now.ToString("MMdd_HHmmss")}";
                string filename = GetSavePathFromDialog("Save results as JSON", defaultFileName, ".json", "JSON files (*.json)|*.json");

                // dump results and save as json file
                System.IO.File.WriteAllText(filename, results.Dump());

                MessageBox.Show($"Results saved to {filename}");
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

            // set time
            results.ResultSWTime = TimeSpan.FromMilliseconds(ellapsedMs);
            SWTime.Text = results.ResultSWTime.ToString("g");

            // set output image
            var swImage = new BitmapImage(new Uri(results.ResultSWDepthMapPath));
            SWResult.Source = swImage;

            var analyzer = new ResultAnalyzer(results.ResultSWDepthMapPath, results.InputGroundThruthPath);

            // compute rms
            results.ResultSWRms = analyzer.GetRmsError();
            SWRms.Text = results.ResultSWRms.ToString("F3");

            // compute bad matches
            results.ResultSWBadMatches = analyzer.GetBadMatchesPercentage(tolerance);
            SWBadMatches.Text = results.ResultSWBadMatches.ToString("F3");
        }

        private void RunHwProcess()
        {
            var hwArgs = CreateHwProcessArgs();
            var hwPath = GetHwAppPath();

            var hwProcessTimer = new ProcessTimer(hwPath, hwArgs, true);
            var ellapsedMs = hwProcessTimer.RunProcess();

            // set time
            results.ResultHWTime = TimeSpan.FromMilliseconds(ellapsedMs);
            HWTime.Text = results.ResultHWTime.ToString("g");

            // set output image
            var hwImage = new BitmapImage(new Uri(results.ResultHWDepthMapPath));
            HWResult.Source = hwImage;

            var analyzer = new ResultAnalyzer(results.ResultHWDepthMapPath, results.InputGroundThruthPath);

            // compute rms
            SWBadMatches.Text = analyzer.GetBadMatchesPercentage(tolerance).ToString("F3");

            // compute bad matches
            results.ResultHWRms = analyzer.GetRmsError();
            HWRms.Text = results.ResultHWRms.ToString("F3");

            results.ResultHWBadMatches = analyzer.GetBadMatchesPercentage(tolerance);
            HWBadMatches.Text = results.ResultHWBadMatches.ToString("F3");

            // compute speedup
            results.ResultHWSpeedup = results.ResultSWTime.TotalMilliseconds / results.ResultHWTime.TotalMilliseconds;
            HWSpeedup.Text = results.ResultHWSpeedup.ToString("F3");
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
            return "\"" + results.InputLeftPath + "\" " +
                "\"" + results.InputRightPath + "\" " +
                "\"" + results.ResultHWDepthMapPath + "\" " +
                "sad " +
                results.P1.ToString() + " " +
                results.P2.ToString() + " " +
                results.MaxDisp;
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
