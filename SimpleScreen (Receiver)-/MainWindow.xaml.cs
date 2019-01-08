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
using System.Net;
using System.Net.Sockets;
using System.Net.WebSockets;
using System.Drawing;
using System.Drawing.Imaging;
using System.IO;

namespace SimpleScreen__Receiver_
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public Socket s;

        public MainWindow()
        {
            InitializeComponent();

            Task.Run(async () =>
            {
                TcpListener listener = TcpListener.Create(3000);
                while (true)
                {
                    listener.Start();
                    s = await listener.AcceptSocketAsync();
                    Dispatcher.Invoke(delegate () { WaitText.Visibility = Visibility.Collapsed; });
                    while (s.Connected)
                    {
                        try
                        {
                            using (MemoryStream ms = new MemoryStream())
                            {
                                byte[] buffer = ReceiveImage(s);
                                ms.Write(buffer, 0, buffer.Length);

                                using (Bitmap bmp = new Bitmap(ms))
                                {
                                    try
                                    {
                                        Dispatcher.Invoke(new Action<System.Drawing.Image>(ChangeBackground), new object[] { (System.Drawing.Image)bmp.Clone() });
                                        bmp.Dispose();
                                    }
                                    catch (Exception ex)
                                    {
                                        //throw ex;
                                    }
                                    bmp.Dispose();
                                }
                            }
                        }
                        catch (Exception ex)
                        {
                            //throw ex;
                        }

                    }
                    s.Disconnect(true);
                    s.Close();
                }
            });
        }

        public void ChangeBackground(System.Drawing.Image img)
        {
            Application.Current.MainWindow.Width = img.Width;
            Application.Current.MainWindow.Height = img.Height;
            StreamImage.Width = img.Width;
            StreamImage.Height = img.Height;
            using (MemoryStream ms = new MemoryStream())
            {
                img.Save(ms, ImageFormat.Jpeg);
                ms.Position = 0;
                BitmapImage bmp = new BitmapImage();
                try
                {
                    bmp.BeginInit();
                    bmp.StreamSource = ms;
                    bmp.EndInit();
                    bmp.Freeze();
                    /*StreamImage.Source = bmp as ImageSource;
                    if (!StreamImage.Source.IsFrozen && StreamImage.Source.CanFreeze)
                        StreamImage.Source.Freeze();
                    */
                    StreamImage.BeginInit();
                    StreamImage.Source = bmp as ImageSource;
                    StreamImage.EndInit();
                    //MessageBox.Show("a");
                }
                catch (Exception e) { }
            }

        }

        private static byte[] ReceiveImage(Socket s)
        {
            int total = 0;
            int recv;
            byte[] datasize = new byte[4];

            recv = s.Receive(datasize, 0, 4, 0);
            int size = BitConverter.ToInt32(datasize, 0);
            int dataleft = size;
            byte[] data = new byte[size];


            while (total < size)
            {
                recv = s.Receive(data, total, dataleft, 0);
                if (recv == 0)
                {
                    break;
                }
                total += recv;
                dataleft -= recv;
            }
            return data;
        }




        private void MinimizeButton_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.MainWindow.WindowState = WindowState.Minimized;
        }

        private void ExitButton_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void DraggableRectangle_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
                this.DragMove();
        }
    }
}
