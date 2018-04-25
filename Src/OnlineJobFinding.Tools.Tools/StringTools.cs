using System;
using System.Security.Cryptography;
using System.Text;


namespace OnlineJobFinding.Tools.Tools
{
    public class StringTools
    {
        /// <summary>
        /// Encrypt input string in way MD5 algorithm.
        /// </summary>
        /// <param name="input"></param>
        /// <returns></returns>
        public static string GetMD5Hash(string input)
        {
            MD5 md5Hash = MD5.Create();
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));
            StringBuilder sBuilder = new StringBuilder();
            for (int i = 0; i <= data.Length - 1; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));                
            }
            return sBuilder.ToString();
        }
    }
}
