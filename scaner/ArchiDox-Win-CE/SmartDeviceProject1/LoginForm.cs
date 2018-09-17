using System;
using System.Linq;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Text;
using System.Windows.Forms;
using System.Resources;
using System.Net;
using System.IO;
using Newtonsoft.Json;
using Newtonsoft.Json.Converters;
using Newtonsoft.Json.Linq;
using System.Collections.Specialized;


namespace ArchiDox
{

    

    public partial class LoginForm : Form
    {

        private DateTime appStart;
        private string fn;
        private string app_path;
        private TextWriter errStream;
        
        public LoginForm()
        {
            InitializeComponent();

            Global.current_form = this;
        }


        private void Form1_KeyDown(object sender, KeyEventArgs e)
        {
            if ((e.KeyCode == System.Windows.Forms.Keys.Up))
            {
                // Up
            }
            if ((e.KeyCode == System.Windows.Forms.Keys.Down))
            {
                // Down
            }
            if ((e.KeyCode == System.Windows.Forms.Keys.Left))
            {
                // Left
            }
            if ((e.KeyCode == System.Windows.Forms.Keys.Right))
            {
                // Right
            }
            if ((e.KeyCode == System.Windows.Forms.Keys.Enter))
            {
                // Enter
            }

        }

        private void checkLogin(object sender, EventArgs e)
        {
            Console.SetError(Global.errStream);
            string user = this.login.Text;
            string password = this.password.Text;
            string url = ArchiDox.Properties.Resources.loginURL;

            Dictionary<string, string> json = new Dictionary<string, string>();

            json.Add("user", user);
            json.Add("password", password);
            string jsonContent = JsonConvert.SerializeObject(json);
            string postData = "";

            foreach (string key in json.Keys)
            {
                postData += key + "="
                      + json[key] + "&";
            }

            statusLabel.Visible = false;
            Console.Error.WriteLine("checkLogin started");
            Console.Error.WriteLine(postData);
            
            try
            {
                string result = Global.SendData("POST",url,postData);
                Console.Error.WriteLine(result);

                if (result.Length > 0)
                {
                    try
                    {
                        JsonResponseResult responseObj = JsonConvert.DeserializeObject<JsonResponseResult>(result);
                        Console.Error.WriteLine(responseObj.ToString());

                        if ( responseObj.status == "OK")
                        {
                            
                            Console.Error.WriteLine("Login Success: "+user);
                            Console.Error.Flush();
                            Form sf = new SearchForm();
                            sf.Show();
                            this.Hide();
                            
                            
                        }
                        else
                        {
                            statusLabel.Visible = true;
                            statusLabel.Text = "Logowanie nie powiodło się! ";
                            Console.Error.WriteLine("Login Error: " + user);
                            Console.Error.WriteLine(responseObj.content);
                            Console.Error.Flush();
                        }
                    }
                    catch (Exception ex)
                    {
                        string message = ex.Message;
                        statusLabel.Visible = true;
                        statusLabel.Text = "Logowanie nie powiodło się! ";
                        Console.Error.WriteLine(message);
                        Console.Error.Flush();
                    }
                }
                else
                {
                    statusLabel.Visible = true;
                    statusLabel.Text = "Brak odpowiedzi serwera!";
                }
            }
            catch (WebException ex)
            {
                // Log exception and throw as for GET example above
                string message = ex.Message;
                statusLabel.Visible = true;
                statusLabel.Text= "Logowanie nie powiodło się! ";
                Console.Error.WriteLine(message);
                Console.Error.Flush();
                //throw;
            }

            
        }

        private void exitApp(object sender, EventArgs e)
        {
            Application.Exit();
        }

        private void clearLogin(object sender, EventArgs e)
        {
            this.login.Text = "";
        }

        private void clearPass(object sender, EventArgs e)
        {
            this.password.Text = "";
        }
    }
}