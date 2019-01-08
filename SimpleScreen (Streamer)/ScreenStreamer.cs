using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Net;
using System.Net.Sockets;
using System.IO;
using System.Drawing;
using System.Drawing.Imaging;
using Screna;

namespace SimpleScreen__Streamer_
{
    class ScreenStreamer
    {
        public int FPS { get; set; }
        public Socket StreamSocket { get; set; }
        public Task StreamTask { get; set; }

        public ScreenStreamer(int fps)
        {
            this.FPS = fps;
        }

        public bool Connect(IPAddress address, int port)
        {
            try
            {
                this.StreamSocket = new Socket(SocketType.Stream, ProtocolType.Tcp);
                this.StreamSocket.Connect(address, port);
                return this.StreamSocket.Connected;
            }
            catch(Exception e) { }
            return false;
        }

        public void StartStream(int width, int height, PixelFormat pf)
        {
            StreamTask = Task.Run(() =>
            {
                while (this.StreamSocket.Connected)
                {
                    try
                    {
                        //using (Bitmap bmp = PrintScreen(width, height, pf))
                        using (Bitmap bmp = ScreenShot.Capture(true))
                        {
                            MemoryStream ms = new MemoryStream();
                            bmp.Save(ms, ImageFormat.Jpeg);
                            SendImage(ms.ToArray());
                            ms.Dispose();                         
                        }
                        
                        //Manage the FPS of the stream
                        System.Threading.Thread.Sleep(1000 / FPS);
                    }
                    catch (Exception e)
                    {
                    }
                }
            });
        }

        public int SendImage(byte[] data)
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
                sent = this.StreamSocket.Send(datasize);

                //send the image data
                while (total < size)
                {
                    sent = this.StreamSocket.Send(data, total, dataleft, SocketFlags.None);
                    total += sent;
                    dataleft -= sent;
                }
            }
            catch { }

            return total;
        }

        /*public static Bitmap PrintScreen(int width, int height, PixelFormat pf)
        {
            Bitmap bitmap;

            using (var bmp = new Bitmap(width, height, pf))
            {
                using (var g = Graphics.FromImage(bmp as System.Drawing.Image))
                {
                    g.CopyFromScreen(0, 0, 0, 0, bmp.Size);
                    bitmap = (Bitmap)bmp.Clone();
                }
            }
            return bitmap;
        }*/
    }
}
