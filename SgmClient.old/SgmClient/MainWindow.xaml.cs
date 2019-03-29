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
using SgmClient.Comms.Interfaces;
using SgmClient.Comms.Impl;
using log4net;

namespace SgmClient
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private static readonly string FpgaHost = "192.168.1.10";
        private static readonly int Port = 7;

        private static ILog log = LogManager.GetLogger(nameof(MainWindow));

        private IFpgaConnection connection = null;
        private IBitmapTransciever transciever = null;

        public MainWindow()
        {
            InitializeComponent();
            InitConnection();
        }

        private void BtnTestConnection_Click(object sender, RoutedEventArgs e)
        {
            if (connection?.TestConnection() == true)
            {
                MessageBox.Show("Connection successful.",
                                "Success",
                                MessageBoxButton.OK,
                                MessageBoxImage.Information);
            }
            else
            {
                MessageBox.Show("Connection not established.",
                                "Error",
                                MessageBoxButton.OK,
                                MessageBoxImage.Error);
            }
        }

        private void BtnSendImage_Click(object sender, RoutedEventArgs e)
        {

        }

        private void BtnSrcImgBrowse_Click(object sender, RoutedEventArgs e)
        {

        }

        private void InitConnection()
        {
            try
            {
                connection = connection ?? new SocketConnection(FpgaHost, Port);
                transciever = transciever ?? new FpgaBitmapTransciever(connection);
            }
            catch (Exception e)
            {
                log.Error($"Could not initialize connection. Ex: {e.Message}");
                connection = null;
                transciever = null;
            }
        }
    }
}
