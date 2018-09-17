using System;
using System.Linq;
using System.Collections.Generic;
using System.Windows.Forms;
using System.IO;

namespace ArchiDox
{
    internal sealed class Constants
    {
        public const int WM_APP = 0x8000;
        public const int WM_SCANNED = WM_APP + 1;
        public const int WM_TIMEOUT = WM_APP + 2;

        // Added WM_USER constants.
        public const int WM_STARTSCAN = WM_APP + 3;
        public const int WM_STOPSCAN = WM_APP + 4;
        public const int WM_PRESSSCAN = WM_APP + 5;
        public const int WM_RELEASESCAN = WM_APP + 6;
    }

    static class Program
    {
        
        /// <summary>
        /// The main entry point for the application.
        /// </summary>
        [MTAThread]
        static void Main()
        {
            Global.appStart = DateTime.Now;
            Global.app_path = System.IO.Path.GetDirectoryName(System.Reflection.Assembly.GetExecutingAssembly().GetName().CodeBase);

            string offline = Global.app_path + @"\offline";
            string logs = Global.app_path + @"\logs";
            string cache = Global.app_path + @"\cache";

            if (!Directory.Exists(offline))
            {
                try
                {
                    Directory.CreateDirectory(offline);
                }
                catch (Exception e) { }

            }

            if (!Directory.Exists(logs))
            {
                try
                {
                    Directory.CreateDirectory(logs);
                }
                catch (Exception e) { }

            }

            if (!Directory.Exists(cache))
            {
                try
                {
                    Directory.CreateDirectory(cache);
                }
                catch (Exception e) { }

            }

            Global.fn = Global.app_path + @"\logs\error_log-" + Global.appStart.ToString("yyyyMMdd") + ".log";
            Global.errStream = new StreamWriter(Global.fn, true);

            Application.Run(new LoginForm());

            try
            {
                Console.Error.WriteLine("Trying to synchronize with server");
                Global.SendRequestsToServer();
                
            }
            catch (Exception rexp)
            {
                Console.Error.WriteLine("Failed to synchorinize with server");
            }
            Console.Error.Close();
        }
    }
}