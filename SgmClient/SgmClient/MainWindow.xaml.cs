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

namespace SgmClient
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        private static readonly string FpgaHost = "192.168.1.10";
        private static readonly int Port = 7;

        private Comms.IBitmapTransciever m_transciever = new Comms.SocketTransciever();

        public MainWindow()
        {
            InitializeComponent();
            m_transciever.Connect(FpgaHost, Port);
        }

        private void BtnTestConnection_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                m_transciever.TestConnection();
                MessageBox.Show("Connection successful.",
                                "Success",
                                MessageBoxButton.OK,
                                MessageBoxImage.Information);
            }
            catch (Exception)
            {
                MessageBox.Show("Connection test failed.",
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
    }
}
