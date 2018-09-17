using System;
using System.Linq;
using System.Collections.Generic;
using System.Text;
using System.Net;
using System.IO;
using System.Windows.Forms;
using System.Security.Cryptography;

namespace ArchiDox
{
    public static class Global
    {
        public static string _session;
        public static string Cookie;
        public static WebHeaderCollection headerCollection = new WebHeaderCollection();
        public static Form current_form;

        public static DateTime appStart;
        public static string fn;
        public static string app_path;
        public static TextWriter errStream;

        public static ProgressBar progressbar = new ProgressBar();
        public static Timer timer = new Timer();

        private static string GetMd5Hash(MD5 md5Hash, string input)
        {

            // Convert the input string to a byte array and compute the hash.
            byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));

            // Create a new Stringbuilder to collect the bytes 
            // and create a string.
            StringBuilder sBuilder = new StringBuilder();

            // Loop through each byte of the hashed data  
            // and format each one as a hexadecimal string. 
            for (int i = 0; i < data.Length; i++)
            {
                sBuilder.Append(data[i].ToString("x2"));
            }

            // Return the hexadecimal string. 
            return sBuilder.ToString();
        }

        public static void SaveRequestToBuffer(string url, string data)
        {
            using (MD5 md5Hash = MD5.Create())
            {
                using (StreamWriter w = File.AppendText(Global.app_path + @"\offline\" + GetMd5Hash(md5Hash, url+data) + ".req"))
                {
                    w.WriteLine(url);
                    w.WriteLine(data);
                }
            }
        }

        public static void SendRequestsToServer()
        {
            string[] requestFiles = Directory.GetFiles(Global.app_path + @"\offline\", "*.req");

            foreach (string request in requestFiles)
            {
                string line = "";
                int x = 0;
                string[] requestLines = new string[2];

                using(StreamReader r = File.OpenText(request))
                {
                    while (!r.EndOfStream)
                    {
                        requestLines[x] = r.ReadLine();
                        x++;
                    }
                }

                string result = Global.SendData("POST", requestLines[0].Replace(@"http://" + ArchiDox.Properties.Resources.archidoxHOST, ""), requestLines[1]);

                if (result.Length > 0)
                {
                    Console.Error.WriteLine("Send offline data succeed, removing file...");
                    File.Delete(request);
                }
                else
                {
                    Console.Error.WriteLine("Send offline data failed, will try later...");
                }
            }
        }

        public static void SaveResponseToCache(string url, string data)
        {
            using (MD5 md5Hash = MD5.Create())
            {
                using (StreamWriter w = File.CreateText(Global.app_path + @"\cache\" + GetMd5Hash(md5Hash,url) + ".cache"))
                {
                    w.WriteLine(data);
                }
            }
        }

        public static string ReadResponseFromCache(string url)
        {
            using (MD5 md5Hash = MD5.Create())
            {
                using (StreamReader r = File.OpenText(Global.app_path + @"\cache\" + GetMd5Hash(md5Hash,url) + ".cache"))
                {
                    return r.ReadLine();
                }
            }
        }

       
        public static string SendData(string method, string url, string data)
        {

            Console.SetError(Global.errStream);

            Global.progressbar.Location = new System.Drawing.Point(78, 123);
            Global.progressbar.Size = new System.Drawing.Size(324, 15);
            Global.progressbar.Visible = true;
            Global.progressbar.Maximum = 10;

            Global.current_form.Controls.Add(progressbar);
            Global.progressbar.BringToFront();
            Global.progressbar.Show();

            Global.current_form.Update();
            

            string host = ArchiDox.Properties.Resources.archidoxHOST;
            string full_url = @"http://" + host + url;
            Console.SetError(Global.errStream);
            Console.Error.WriteLine("Send data started");
            Console.Error.WriteLine("URL: " + full_url);
            Console.Error.WriteLine("Params: " + data);


            try
            {
                
                HttpWebRequest request = (HttpWebRequest)WebRequest.Create(full_url);
                request.AllowWriteStreamBuffering = true;
                request.KeepAlive = true;
                request.Method = method;
                request.Timeout = 60000;
                request.ReadWriteTimeout = 10000;

                if (Global.Cookie != null)
                {
                    string[] cookies = Global.Cookie.Split(new char[] { ',' });

                    for (int j = 0; j < cookies.Length; j++)
                    {
                        string[] cookieValues = cookies[j].Split(new char[] { ';' });
                        string[] paramNameValue;
                        foreach (string param in cookieValues)
                        {
                            paramNameValue = param.Trim().Split(new char[] { '=' });
                            paramNameValue[0] = paramNameValue[0].ToLower();
                            if (paramNameValue[0] == "session")
                            {
                                Global._session = param.Split(new char[] { '=' })[1];
                                break;
                            }
                        }
                    }

                    if (Global._session != null)
                    {
                        Console.Error.WriteLine("Session ID: " + Global._session);

                        request.Headers.Add("Cookie", "session=" + Global._session);
                    }

                }
                Global.progressbar.Value = 2;
                request.Credentials = CredentialCache.DefaultCredentials;
                // turn our request string into a byte stream
                byte[] postBytes;

                if (data != null)
                {
                    postBytes = Encoding.UTF8.GetBytes(data);
                }
                else
                {
                    postBytes = new byte[0];
                }

                Console.Error.WriteLine(postBytes.Length);

                request.ContentType = "application/x-www-form-urlencoded";
                request.ContentLength = postBytes.Length;

                Stream requestStream = request.GetRequestStream();
                Global.progressbar.Value = 4;
                // now send it
                requestStream.Write(postBytes, 0, postBytes.Length);
                requestStream.Close();

                HttpWebResponse response;

                response = (HttpWebResponse)request.GetResponse();

                if (response.Headers["Set-Cookie"] != null)
                    Global.Cookie = response.Headers["Set-Cookie"];

                Stream dataStream = response.GetResponseStream();

                StreamReader reader = new StreamReader(dataStream);
                // Read the content.
                string responseFromServer = reader.ReadToEnd();
                Global.progressbar.Value = 6;
                // Clean up the streams and the response.
                reader.Close();
                response.Close();
                Global.progressbar.Value = 10;
                Global.progressbar.Update();
                Global.progressbar.Visible = false;
                Console.Error.Flush();
                Global.timer.Enabled = false;

                try {
                    Global.SaveResponseToCache(full_url, responseFromServer);
                    Console.Error.WriteLine("Writing response to cache");
                }

                catch (Exception eex) {
                    Global.progressbar.Value = 10;
                    Global.progressbar.Update();
                    Global.progressbar.Visible = false;
                    Console.Error.Flush();
                    Global.timer.Enabled = false;
                    Console.Error.WriteLine("Failed to write response to cache");
                }
                
                return responseFromServer;
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Send data failed");
                Console.Error.WriteLine("Send data error: " + ex.Message);

                if (url == ArchiDox.Properties.Resources.orderDeliverURL
                    || url == ArchiDox.Properties.Resources.warehouseReceptURL
                    || url == ArchiDox.Properties.Resources.orderConfirmURL
                    || url == ArchiDox.Properties.Resources.orderCompleteURL
                    || url == ArchiDox.Properties.Resources.addOrderBoxURL) {
                        SaveRequestToBuffer(full_url, data);
                }

                if (url != ArchiDox.Properties.Resources.loginURL)
                {
                    try
                    {
                        Console.Error.WriteLine("Reading last response from cache");
                        Global.progressbar.Value = 10;
                        Global.progressbar.Update();
                        Global.progressbar.Visible = false;
                        Console.Error.Flush();
                        Global.timer.Enabled = false;
                        return Global.ReadResponseFromCache(full_url);
                    }
                    catch (Exception eeeex) {
                        Global.progressbar.Value = 10;
                        Global.progressbar.Update();
                        Global.progressbar.Visible = false;
                        Console.Error.Flush();
                        Global.timer.Enabled = false;
                        Console.Error.WriteLine("Read from cache failed");
                        Console.Error.WriteLine("Send data error: " + eeeex.Message);
                        return "{\"status\":\"OK\",\"content\":[{\"id\":\"0\",\"type\":\"Tryb offline\",\"warehouse_id\":null,\"quantity\":\"0\",\"pickup_date\":\"0000-00-00\",\"create_date\":\"0000-00-00 00:00:00\",\"display_name\":\"Tryb offline\"}]}";
                    }
                }
                else
                {
                    Global.progressbar.Value = 10;
                    Global.progressbar.Update();
                    Global.progressbar.Visible = false;
                    Console.Error.Flush();
                    Global.timer.Enabled = false;
                    return "{\"status\":\"OK\",\"content\":[{\"id\":\"0\",\"type\":\"Tryb offline\",\"warehouse_id\":null,\"quantity\":\"0\",\"pickup_date\":\"0000-00-00\",\"create_date\":\"0000-00-00 00:00:00\",\"display_name\":\"Tryb offline\"}]}";
                }
            }
        }
    }
}
