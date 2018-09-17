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

    public partial class ReceptionForm : Form
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
        private ReceptionWndMessageWindow wndMsg;
        private DecodeRequest reqType;
        private int order_id;        


        public ReceptionForm()
        {
            InitializeComponent();

            Global.current_form = this;
            order_backButton.Visible = true;
            order_refreshButton.Visible = true;
            order_goButton.Visible = true;


            this.wndMsg = new ReceptionWndMessageWindow(this);
            string url = ArchiDox.Properties.Resources.inprogressOrdersURL;
            string postData = "orders=all";
            string orders = Global.SendData("POST", url, postData);
            Console.SetError(Global.errStream);
            Console.Error.WriteLine(orders);
            Console.Error.Flush();

            

            if (orders.Length > 0)
            {
                try
                {
                    JsonResponseOrdersResult responseObj = JsonConvert.DeserializeObject<JsonResponseOrdersResult>(orders);
                    ordersBuffer = responseObj.content;

                    if (responseObj.status == "OK")
                    {
                        try
                        {

                            ordersList.DataSource = responseObj.content;
                            ordersList.DisplayMember = "display_name";
                            ordersList.ValueMember = "id";
                            ordersList.Visible = true;

                            order_backButton.Click += new System.EventHandler(this.backToSearch);
                            order_refreshButton.Click += new System.EventHandler(this.refreshOrderListEvent);
                            order_goButton.Click += new System.EventHandler(this.receptOrder);

                            Console.Error.Flush();
                        }
                        catch (Exception ex)
                        {
                            Console.Error.WriteLine(ex.Message);
                            Console.Error.WriteLine(ex.StackTrace);
                            Console.Error.Flush();
                            throw;
                        }

                    }
                }
                catch (Exception ex)
                {
                    string message = ex.Message;
                    Console.Error.WriteLine(message);
                    Console.Error.Flush();
                }
            }
            else
            {
                ordersList.DataSource = null;
                ordersList.Items.Add("Brak danych");
            }
            this.listLoaded = true;
        }

        private void backToSearch(object sender, EventArgs e)
        {
            Console.Error.Flush();
            Form sf = new SearchForm();
            sf.Show();
            this.Dispose();
            this.Hide();
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
      
        private void refreshOrderList()
        {
            order_backButton.Visible = true;
            order_refreshButton.Visible = true;
            order_refreshButton.Size = new Size(123, 85);
            order_refreshButton.Location = new Point(173, 499);

            string url = ArchiDox.Properties.Resources.inprogressOrdersURL;
            string postData = "orders=all";
            string orders = Global.SendData("POST", url, postData);

            if (orders.Length > 0)
            {
                try
                {
                    JsonResponseOrdersResult responseObj = JsonConvert.DeserializeObject<JsonResponseOrdersResult>(orders);
                    ordersBuffer = responseObj.content;

                    if (responseObj.status == "OK")
                    {
                        try
                        {
                            ordersList.DataSource = responseObj.content;
                            ordersList.DisplayMember = "display_name";
                            ordersList.ValueMember = "id";
                            ordersList.Visible = true;

                            Console.Error.Flush();
                        }
                        catch (Exception ex)
                        {
                            Console.Error.WriteLine(ex.Message);
                            Console.Error.WriteLine(ex.StackTrace);
                            Console.Error.Flush();
                        }

                    }
                }
                catch (Exception ex)
                {
                    string message = ex.Message;
                    Console.Error.WriteLine(message);
                    Console.Error.Flush();
                }
            }
            else
            {
                ordersList.DataSource = null;
                ordersList.Items.Add("Brak danych");
            }
        }

        private void refreshOrderListEvent(object sender, EventArgs e)
        {
            order_backButton.Visible = true;
            order_refreshButton.Visible = true;
            order_goButton.Visible = true;
            order_refreshButton.Size = new Size(123, 85);
            order_refreshButton.Location = new Point(173, 499);

            string url = ArchiDox.Properties.Resources.inprogressOrdersURL;
            string postData = "orders=all";
            string orders = Global.SendData("POST", url, postData);

            if (orders.Length > 0)
            {
                try
                {
                    JsonResponseOrdersResult responseObj = JsonConvert.DeserializeObject<JsonResponseOrdersResult>(orders);
                    ordersBuffer = responseObj.content;

                    if (responseObj.status == "OK")
                    {
                        try
                        {
                            ordersList.DataSource = responseObj.content;
                            ordersList.DisplayMember = "display_name";
                            ordersList.ValueMember = "id";
                            ordersList.Visible = true;

                            Console.Error.Flush();
                        }
                        catch (Exception ex)
                        {
                            Console.Error.WriteLine(ex.Message);
                            Console.Error.WriteLine(ex.StackTrace);
                            Console.Error.Flush();
                        }

                    }
                }
                catch (Exception ex)
                {
                    string message = ex.Message;
                    Console.Error.WriteLine(message);
                    Console.Error.Flush();
                }
            }
            else
            {
                ordersList.DataSource = null;
                ordersList.Items.Add("Brak danych");
            }
        }

        private void receptOrder(object sender, EventArgs e) {
        
            try
            {

                    DialogResult dresult = MessageBox.Show("To zamówienie zostanie przyjęte na magazyn i zakończone", "Zamówienie na magazynie", MessageBoxButtons.OKCancel, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    if (dresult == DialogResult.OK)
                    {
                        int selectedIndex = this.ordersList.SelectedIndex;
                        Order item = (Order)this.ordersList.SelectedItem;
                        string id = item.id;
                        this.order_id = int.Parse(id);

                        string complete_url = ArchiDox.Properties.Resources.warehouseReceptURL;
                        string completePostData = "order_id=" + this.order_id;
                        string completeResult = Global.SendData("POST", complete_url, completePostData);
                        JsonResponseConfirmOrder completeResponseObj = JsonConvert.DeserializeObject<JsonResponseConfirmOrder>(completeResult);

                        if (completeResponseObj.status == "OK")
                        {
                            refreshOrderList();
                        }
                    }

                    Console.Error.WriteLine("Zamówienie {0} zostało przyjęte na magazyn", this.order_id);
                    Console.Error.Flush();

                }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Zamówienie {0} zostało przyjęte na magazyn ale nie udało się go potwierdzić", this.order_id);
                Console.Error.Flush();
            }
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
    }
}