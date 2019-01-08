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
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;
using System.Windows.Interop;

namespace SimpleScreen__Streamer_
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public static Task streamTask;
        public static Socket s;
        public static SolidColorBrush GREEN = new SolidColorBrush((System.Windows.Media.Color)System.Windows.Media.ColorConverter.ConvertFromString("#FF43B581"));
        public static SolidColorBrush RED = new SolidColorBrush((System.Windows.Media.Color)System.Windows.Media.ColorConverter.ConvertFromString("#FFF03E3A"));
        public static System.Drawing.Imaging.PixelFormat PF = System.Drawing.Imaging.PixelFormat.Format32bppArgb;
        public const int FPS = 30;
        public const int PORT = 3000;
        public static int width, height;
        ScreenStreamer streamer;

        public MainWindow()
        {
            InitializeComponent();

            width = (int)SystemParameters.PrimaryScreenWidth;
            height = (int)SystemParameters.PrimaryScreenHeight;

            streamer = new ScreenStreamer(FPS);
        }

        public static void StartStream(string ip)
        {
            streamTask = Task.Run(() =>
            {
                s = new Socket(SocketType.Stream, ProtocolType.Tcp);
                try
                {
                    s.Connect(IPAddress.Parse(ip), 3000);
                }
                catch (Exception)
                {
                    //connection failed
                    MessageBox.Show("No response from " + ip + ".");
                    return;
                }
                while (s.Connected)
                {
                    try
                    {
                        using (Bitmap bmp = PrintScreen()) 
                        {
                            MemoryStream ms = new MemoryStream();
                            bmp.Save(ms, ImageFormat.Jpeg);
                            SendImage(s, ms.ToArray());
                            ms.Dispose();
                        }

                        System.Threading.Thread.Sleep(1000/FPS);
                    }
                    catch (Exception e)
                    {
                        //MessageBox.Show(e.Message);
                    }
                }
            });
        }

        private static int SendImage(Socket s, byte[] data)
        {
            int total = 0;
            int size = data.Length;
            int dataleft = size;
            int sent;

            try
            {
                //send the size of the data
                byte[] datasize = new byte[4];
                datasize = BitConverter.GetBytes(size);
                sent = s.Send(datasize);
                
                //send the image data
                while (total < size)
                {
                    sent = s.Send(data, total, dataleft, SocketFlags.None);
                    total += sent;
                    dataleft -= sent;
                }
            }
            catch { }

            return total;
        }

        private static Bitmap PrintScreen()
        {
            Bitmap bitmap;
            int width = (int)SystemParameters.PrimaryScreenWidth;
            int height = (int)SystemParameters.PrimaryScreenHeight;
            

            using (var bmp = new Bitmap(width, height, PF))
            {
                using (var g = Graphics.FromImage(bmp as System.Drawing.Image))
                {
                    g.CopyFromScreen(0, 0, 0, 0, bmp.Size);
                    bitmap = (Bitmap)bmp.Clone();
                }
            }
            return bitmap;
        }

        private void PlayButton_Click(object sender, RoutedEventArgs e)
        {
            if ((string)PlayButtonLabel.Content == "Start" && IPText.Text != "")
            {
                bool success = false;
                try
                {
                    success = streamer.Connect(IPAddress.Parse(IPText.Text), PORT);
                }
                catch(Exception ex) { throw ex; }

                if (success)
                    streamer.StartStream(width, height, PF);
                else
                    MessageBox.Show("No response from " + IPText.Text + ".");

                if (streamer.StreamTask != null)
                {
                    PlayButtonLabel.Content = "Stop";
                    StatusLabel.Content = "Online";
                    StatusLabel.Foreground = GREEN;
                }
            }
            else
            {
                if (streamer.StreamSocket != null)
                {
                    if (streamer.StreamSocket.Connected)
                        streamer.StreamSocket.Disconnect(false);
                    streamer.StreamSocket.Shutdown(SocketShutdown.Both);
                    streamer.StreamSocket.Close();


                    PlayButtonLabel.Content = "Start";
                    StatusLabel.Content = "Offline";
                    StatusLabel.Foreground = RED;
                }

                if (streamer.StreamTask != null)
                {
                    streamer.StreamTask.Wait();
                    streamer.StreamTask.Dispose();
                }

                streamer.StreamTask = null;

                if (IPText.Text == "")
                    MessageBox.Show("No IP Address given.");
            }
        }

        /* OLD PlayButton_Click
        private void PlayButton_Click(object sender, RoutedEventArgs e)
        {
            if((string)PlayButtonLabel.Content == "Start" && IPText.Text != "")
            {
                StartStream(IPText.Text);

                if (streamTask != null)
                {
                    PlayButtonLabel.Content = "Stop";
                    StatusLabel.Content = "Online";
                    StatusLabel.Foreground = GREEN;
                }
            }
            else
            {
                if (s != null)
                {
                    if(s.Connected)
                        s.Disconnect(false);
                    s.Shutdown(SocketShutdown.Both);
                    s.Close();


                    PlayButtonLabel.Content = "Start";
                    StatusLabel.Content = "Offline";
                    StatusLabel.Foreground = RED;
                }

                if (streamTask != null)
                {
                    streamTask.Wait();
                    streamTask.Dispose();
                }
                    
                streamTask = null;

                if (IPText.Text == "")
                    MessageBox.Show("No IP Address given.");
            }
        }
        */



        private void PlayButton_MouseEnter(object sender, RoutedEventArgs e)
        {
            PlayButton.Cursor = Cursors.Hand;
            PlayButtonLabel.Opacity = 0.2;
        }

        private void PlayButton_MouseLeave(object sender, MouseEventArgs e)
        {
            PlayButton.Cursor = Cursors.Arrow;
            PlayButtonLabel.Opacity = 1.0;
        }

        private void ExitButton_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.Shutdown();
        }

        private void MinimizeButton_Click(object sender, RoutedEventArgs e)
        {
            Application.Current.MainWindow.WindowState = WindowState.Minimized;
        }

        private void DraggableRectangle_MouseDown(object sender, MouseButtonEventArgs e)
        {
            if (e.LeftButton == MouseButtonState.Pressed)
                this.DragMove();
        }
    }
}
