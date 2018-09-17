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
using Microsoft.WindowsCE.Forms;
using Datalogic.API;
using System.Text.RegularExpressions;

namespace ArchiDox

{

    public partial class BoxReceptionForm : Form
    {
        private DateTime appStart;
        private bool scan;
        private bool listLoaded;
        private string fn;
        private string app_path;
        public TextWriter errStream;
        private List<Order> ordersBuffer;
        private ListBox ordersListBox;
        private DecodeHandle hDcd;
        private int reqID;
        private BoxReceptionWndMessageWindow wndMsg;
        private DecodeRequest reqType;
        private int order_id;


        public void SetDcdText(int msgReqID)
        {
            CodeId cID = CodeId.NoData;
            string dcdData = "";

            try
            {
                dcdData = hDcd.ReadString(msgReqID, ref cID);
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("String read error: " + ex.Message);
                Console.Error.Flush();
                return;
            }

            this.position.Text = Regex.Replace(dcdData, "[^a-zA-Z0-9_.]+", "", RegexOptions.Compiled);
        }



        public BoxReceptionForm()
        {
            InitializeComponent();

            Global.current_form = this;

            backButton.Visible = true;
            refreshButton.Visible = true;
            goButton.Visible = true;
            

            this.wndMsg = new BoxReceptionWndMessageWindow(this);
            string url = ArchiDox.Properties.Resources.ordersURL;
            string postData = "orders=all";
            string orders = Global.SendData("POST", url, postData);
            Console.SetError(Global.errStream);
            Console.Error.WriteLine(orders);
            Console.Error.Flush();

        }

        private void exitApp(object sender, EventArgs e)
        {
            try
            {
                Console.Error.WriteLine("Trying to synchronize with server");
                Global.SendRequestsToServer();

            }
            catch (Exception rexp)
            {
                Console.Error.WriteLine("Failed to synchorinize with server");
            }

            Application.Exit();
        }


        private void clearSearchBox(object sender, EventArgs e)
        {
            this.position.Text = "";
        }

        private void scanCode(object sender, EventArgs e)
        {
            try
            {
                hDcd.SoftTrigger(DecodeInputType.Barcode, 5000);
            }
            catch (NullReferenceException nre)
            {
                Console.Error.WriteLine("Waiting for scanner init!");
                Console.Error.WriteLine("Scan Code: "+nre.Message);
                Console.Error.Flush();
                
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
                Console.Error.WriteLine(ex.StackTrace);
                Console.Error.Flush();
            }

            Console.Error.Flush();
        }

        private void orderWarehouseReception(object sender, EventArgs e)
        {
            Form wrf = new ReceptionForm();
            wrf.Show();
            this.Dispose();
            this.Hide();
        }
        
        private void boxWarehouseReception(object sender, EventArgs e)
        {
            Form brf = new BoxReceptionForm();
            brf.Show();
            this.Dispose();
            this.Hide();
        }

        public void customerDelivery(object sender, EventArgs e)
        {

            Form rf = new CustomerReceptionForm();
            rf.Show();
            this.Dispose();
            this.Hide();

        }

        public void synchronizeWithServer(object sender, EventArgs e)
        {
            Global.SendRequestsToServer();
        }
        private void receptBox(object sender, EventArgs e)
        {

            string receptBox_url = ArchiDox.Properties.Resources.boxReceptURL;
            string receptBoxPostData = "box_code=" + this.code.Text + "&box_position=" + this.position.Text + "&box_seal1=" + this.seal1.Text + "&box_seal2=" + this.seal2.Text;
            string receptBoxResult = Global.SendData("POST", receptBox_url, receptBoxPostData);

            try
            {
                JsonResponseBoxRecept receptBoxResponseObj = JsonConvert.DeserializeObject<JsonResponseBoxRecept>(receptBoxResult);

                if (receptBoxResponseObj.status == "OK")
                {
                    Console.Error.WriteLine("Pudło {0} dodane", this.code.Text);
                    Console.Error.Flush();

                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Pudło {0} nie zastało dodane", this.code.Text);
                Console.Error.WriteLine("Pudło {0} nie zastało dodane", ex.Message);
                Console.Error.WriteLine("Pudło {0} nie zastało dodane", ex.StackTrace);
                Console.Error.Flush();
            }
        }


        private void backToSearch(object sender, EventArgs e)
        {
            Console.Error.Flush();
            Form sf = new SearchForm();
            sf.Show();
            this.Dispose();
            this.Hide();
        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void seal1_TextChanged(object sender, EventArgs e)
        {

        }

    }
}