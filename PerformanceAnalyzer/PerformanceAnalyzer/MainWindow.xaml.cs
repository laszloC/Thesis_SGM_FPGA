using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace PerformanceAnalyzer
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private RunResults results;

        public MainWindow()
        {
            InitializeComponent();
        }

        private void NewImagesClick(object sender, RoutedEventArgs e)
        {
            // present file dialogs
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

            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void RunClick(object sender, RoutedEventArgs e)
        {

        }

        private void SaveClick(object sender, RoutedEventArgs e)
        {

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
    }
}
