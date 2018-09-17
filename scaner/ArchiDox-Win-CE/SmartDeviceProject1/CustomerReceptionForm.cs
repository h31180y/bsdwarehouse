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

    public partial class CustomerReceptionForm : Form
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
        private string pin = "";

        public CustomerReceptionForm()
        {
            Console.SetError(Global.errStream);
            Console.Error.WriteLine("Reception form initilized");

            InitializeComponent();
            Global.current_form = this;

            order_backButton.Click += new System.EventHandler(this.backToOrders);
            order_refreshButton.Click += new System.EventHandler(this.refreshOrdersListEvent);
            order_goButton.Click += new System.EventHandler(this.pinVerify);


            string url = ArchiDox.Properties.Resources.ordersAcceptURL;
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

        private void refreshOrdersListEvent(object sender, EventArgs e)
        {
            this.statusLabel.Visible = false;
            string url = ArchiDox.Properties.Resources.ordersAcceptURL;
            string postData = "orders=all";
            string orders = Global.SendData("POST", url, postData);
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

        private void refreshOrdersList()
        {
            this.statusLabel.Visible = false;
            string url = ArchiDox.Properties.Resources.ordersAcceptURL;
            string postData = "orders=all";
            string orders = Global.SendData("POST", url, postData);
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

        private void exitApp(object sender, EventArgs e)
        {
            Console.Error.Close();
            Application.Exit();
        }

        private void backToOrders(object sender, EventArgs e)
        {
            this.statusLabel.Visible = false;
            Form sf = new SearchForm();
            sf.Show();
            this.Dispose();
            this.Hide();
            
        }

        private void pinVerify(object sender, EventArgs e)
        {
            int selectedIndex = this.ordersList.SelectedIndex;

            if (selectedIndex < 0)
            {
                this.statusLabel.Text = "Wybierz zamówienie";
                this.statusLabel.Visible = true;
            }
            else
            {
                this.statusLabel.Visible = false;

                Order item = (Order)this.ordersList.SelectedItem;
                string id = item.id;
                this.order_id = int.Parse(id);
                Console.Error.WriteLine("Selected id " + id + " with pin number:" + item.pin);


                PinForm pinForm = new PinForm();

                if (pinForm.ShowDialog() == DialogResult.OK && pinForm.pinBox.Text == item.pin)
                {
                    DialogResult dresult = MessageBox.Show("Zamówienie zostanie oznaczone jako dostarczone", "Pin poprawny", MessageBoxButtons.OK, MessageBoxIcon.Asterisk, MessageBoxDefaultButton.Button1);

                    if (dresult == DialogResult.OK)
                    {

                        this.pin = pinForm.pinBox.Text;
                        Console.Error.WriteLine("Entered PIN OK: " + this.pin);
                        statusLabel.Visible = false;

                        string deliver_url = ArchiDox.Properties.Resources.orderDeliverURL;
                        string deliverPostData = "order_id=" + id;
                        string deliverResult = Global.SendData("POST", deliver_url, deliverPostData);

                        try
                        {
                            JsonResponseConfirmOrder deliverResponseObj = JsonConvert.DeserializeObject<JsonResponseConfirmOrder>(deliverResult);

                            if (deliverResponseObj.status == "OK")
                            {
                                Console.Error.WriteLine("Zamówienie {0} zostało dostarczone", id);
                                this.refreshOrdersList();
                            }
                        }
                        catch (Exception ex)
                        {
                            Console.Error.WriteLine(ex.Message);
                            Console.Error.WriteLine(ex.StackTrace);
                            Console.Error.Flush();
                        }
                    }
                }
                else
                {
                    this.statusLabel.Text = "Podałeś zły pin";
                    this.statusLabel.Visible = true;
                    this.pin = "";
                    pinForm.pinBox.Text = "";
                    Console.Error.WriteLine("Entered PIN NOT OK");
                }
                pinForm.Dispose();
            }
            
        }

        private void warehouseReception(object sender, EventArgs e)
        {
            this.statusLabel.Visible = false;
            Form rf = new ReceptionForm();
            rf.Show();
            this.Hide();
        }

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
        }

        private void backToSearch(object sender, EventArgs e)
        {
            this.statusLabel.Visible = false;
            Console.Error.Flush();
            Form sf = new SearchForm();
            sf.Show();
            this.Dispose();
            this.Hide();
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