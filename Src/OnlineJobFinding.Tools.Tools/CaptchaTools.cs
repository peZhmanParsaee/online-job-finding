using System;
using System.Drawing;
using System.Drawing.Drawing2D;
using System.Drawing.Imaging;
using System.Drawing.Text;

namespace OnlineJobFinding.Tools.Tools
{
    public class CaptchaTools
    {
        public string CreateSalt()
        {
            Random rnd = new Random();
            return Convert.ToString(rnd.Next(10000, 99999));
        }

        public string CreateImage(string path, int height, int width)
        {
            Random r = new Random();
            string salt = CreateSalt();
            Bitmap bmp = new Bitmap(width, height, PixelFormat.Format24bppRgb);
            Graphics g = Graphics.FromImage(bmp);
            g.TextRenderingHint = TextRenderingHint.AntiAlias;
            g.Clear(Color.White);
            Matrix mymat = new Matrix();
            for (int i = 0; i <= salt.Length - 1; i++)
            {
                mymat.Reset();
                float f1 = 0.12F;
                float f2 = 0.5F;
                mymat.RotateAt(r.Next(-30, 0), new PointF(width * (f1 * i), height * f2));
                g.Transform = mymat;
                string ch = salt[i].ToString();
                g.DrawString(ch, new Font("Comic Sans MS", 10, FontStyle.Italic), Brushes.Black, width * (f1 * i), height * f2);
                g.ResetTransform();
            }
            bmp.Save(path, ImageFormat.Gif);
            g.Dispose();
            bmp.Dispose();
            g.Dispose();
            bmp.Dispose();
            return salt;
        }
    }
}
