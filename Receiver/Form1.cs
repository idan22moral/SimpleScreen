using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Net;
using System.Net.WebSockets;
using System.Net.Sockets;
using System.IO;
using System.Drawing.Imaging;
using Screna;

namespace Receiver
{
    public partial class Form1 : Form
    {
        public Socket s;
        public Form1()
        {
            InitializeComponent();

            Task.Run(async () =>
            {
                int failCounter = 0;

                TcpListener listener = TcpListener.Create(3000);
                while (true)
                {
                    listener.Start();
                    s = await listener.AcceptSocketAsync();
                    while (s.Connected)
                    {
                        try
                        {
                            MemoryStream ms = new MemoryStream();
                            byte[] buffer = ReceiveImage(s);
                            ms.Write(buffer, 0, buffer.Length);

                            using (Bitmap bmp = new Bitmap(ms))
                            {
                                //lock the bmp
                                var rect = new Rectangle(0, 0, bmp.Width, bmp.Height);
                                var bmpData = bmp.LockBits(rect, ImageLockMode.ReadWrite, bmp.PixelFormat);

                                try
                                {
                                    ChangeBackground((Image)bmp.Clone());
                                    bmp.Dispose();
                                }
                                catch (Exception ex)
                                {
                                    //throw ex;
                                }

                                //unlock the bmp
                                bmp.UnlockBits(bmpData);
                                bmp.Dispose();
                            }
                            ms.Flush();
                            failCounter = 0;
                        }
                        catch (Exception ex)
                        {
                            failCounter++;
                            if (failCounter > 500)
                            {
                                failCounter = 0;
                                
                                this.BackgroundImage = Properties.Resources.receiverBG;
                                Invoke(new Action(delegate ()
                                {
                                    this.Width = 564;
                                    this.Height = 380;
                                }));
                                
                                break;
                            }
                            //throw ex;
                        }
                    }
                    s.Disconnect(true);
                    
                }
            });
        }
        public void ChangeBackground(Image img)
        {
            if (InvokeRequired)
            {
                Invoke(new Action<Image>(ChangeBackground), new object[] { img });
                return;
            }
            int width = (this.Width/img.Width > this.Height/img.Height) ? this.Width : img.Width;
            int height = (this.Width / img.Width > this.Height / img.Height) ? this.Height : img.Height;

            this.BackgroundImage = new Bitmap(img, new Size(width, height));
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
    }
}
