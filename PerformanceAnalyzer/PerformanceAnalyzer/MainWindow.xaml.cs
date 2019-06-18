using Microsoft.Win32;
using System;
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
        private bool can_run;
        private bool can_save;

        public MainWindow()
        {
            InitializeComponent();
            can_run = false;
            can_save = false;
        }

        private void SelectImagesClick(object sender, RoutedEventArgs e)
        {
            try
            {
                results = new RunResults
                {
                    InputLeftPath = GetFilePathFromDialog("Select LEFT image"),
                    InputRightPath = GetFilePathFromDialog("Select RIGHT image"),
                    InputGroundThruthPath = GetFilePathFromDialog("Select GROUND TRUTH image")

                };

                LeftImg.Source = new BitmapImage(new Uri(results.InputLeftPath));
                RightImg.Source = new BitmapImage(new Uri(results.InputRightPath));
                GroundTruthImg.Source = new BitmapImage(new Uri(results.InputGroundThruthPath));

                can_run = true;
            }
            catch (Exception ex)
            {
                can_run = false;
                _ = MessageBox.Show(ex.Message);
            }
        }

        private void RunClick(object sender, RoutedEventArgs e)
        {
            try
            {
                if (!can_run)
                {
                    throw new ApplicationException("Please select images before running");
                }
                // choose folder to save results
                string resultsFolder = GetFolderPathFromDialog("Select folder to save results");
                results.ResultSWDepthMapPath = System.IO.Path.Combine(resultsFolder, "result_sw.bmp");
                results.ResultSWDepthMapPath = System.IO.Path.Combine(resultsFolder, "result_hw.bmp");

                // get parameters max_disp, p1 and p2
                GetParameters();

                // run sw process
                // get results from sw process

                // run hw process
                // get results from hw process
                can_save = true;
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
                if (!can_save)
                {
                    throw new ApplicationException("Please run before saving");
                }
                string defaultFileName = "results_" + DateTime.Now.ToString("MMdd_HHmmss");
                string filename = GetSavePathFromDialog("Save results as JSON", defaultFileName, ".json", "JSON files (*.json)|*.json");
            }
            catch (Exception ex)
            {
                _ = MessageBox.Show(ex.Message);
            }

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
                SelectedPath = System.AppDomain.CurrentDomain.BaseDirectory,
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

        private void IntPreviewTextInput(object sender, System.Windows.Input.TextCompositionEventArgs e)
        {
            Regex r = new Regex("[^0-9]+");
            e.Handled = r.IsMatch(e.Text);
        }
    }
}
