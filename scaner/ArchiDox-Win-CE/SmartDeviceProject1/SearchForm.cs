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

    public partial class SearchForm : Form
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
        private SearchWndMessageWindow wndMsg;
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

            this.code.Text = Regex.Replace(dcdData, "[^a-zA-Z0-9_.]+", "", RegexOptions.Compiled);
            
            List<Box> ordDL = (List<Box>)orderDetailsList.DataSource;

            if (this.scan == false && ordDL.Count() > 0)
            {
                int idx = -1;

                foreach (Box box in ordDL)
                {
                    if (box.id == this.code.Text)
                    {
                        Console.Error.WriteLine(box);
                        Console.Error.WriteLine(ordDL.Count());

                        idx = ordDL.IndexOf(box);

                        ordDL.RemoveAt(idx);
                        Console.Error.WriteLine(ordDL.Count());
                        Console.Error.WriteLine("Indeks:" + idx);
                        Console.Error.WriteLine("Znaleziono pudło {0}", box.id);
                        Console.Error.Flush();
                        break;
                    }
                }
                orderDetailsList.DataSource = null;
                orderDetailsList.DataSource = ordDL;
                orderDetailsList.DisplayMember = "display_name";
                orderDetailsList.ValueMember = "id";
                orderDetailsList.Refresh();

            }
            if (this.scan == false && orderDetailsList.Items.Count == 0)
            {
                string complete_url = ArchiDox.Properties.Resources.orderCompleteURL;
                string completePostData = "order_id=" + this.order_id;
                string completeResult = Global.SendData("POST", complete_url, completePostData);
                try
                {
                    JsonResponseConfirmOrder completeResponseObj = JsonConvert.DeserializeObject<JsonResponseConfirmOrder>(completeResult);

                    if (completeResponseObj.status == "OK")
                    {
                        DialogResult dresult = MessageBox.Show("To zamówienie zostało skompletowane", "Zamówienie skompletowane", MessageBoxButtons.OKCancel, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                        if (dresult == DialogResult.OK)
                        {
                            refreshOrderList();
                        }            
                        Console.Error.WriteLine("Zamówienie {0} zostało skompletowane", this.order_id);
                        Console.Error.Flush();

                    }
                }
                catch (Exception ex)
                {
                    Console.Error.WriteLine("Zamówienie {0} zostało skompletowane ale nie udało się go potwierdzić", this.order_id);
                    Console.Error.Flush();
                }
            }
            else if (this.scan == true)
            {
                try
                {

                    if (addOrderBox(this.order_id, this.code.Text))
                    {
                        Console.Error.WriteLine("Pudło {0} dodano do zamówienia " + this.order_id, this.code.Text);
                        Console.Error.Flush();
                    }
                    else
                    {
                        Console.Error.WriteLine("Pudło {0} nie zostałe dodane do zamówienia " + this.order_id, this.code.Text);
                        Console.Error.Flush();
                    }
                }
                catch (Exception ex)
                {
                    Console.Error.WriteLine("Pudło {0} nie zostałe dodane do zamówienia " + this.order_id, this.code.Text);
                    Console.Error.Flush();

                }
            }
            
        }



        public SearchForm()
        {
            InitializeComponent();

            Global.current_form = this;
            order_backButton.Visible = false;
            order_refreshButton.Visible = false;
            order_goButton.Visible = false;

            backButton.Visible = true;
            refreshButton.Visible = true;
            goButton.Visible = true;
            

            this.wndMsg = new SearchWndMessageWindow(this);
            string url = ArchiDox.Properties.Resources.ordersURL;
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
                            orderDetailsList.Visible = false;
                            ordersList.Visible = true;

                            finishButton.Click += new System.EventHandler(this.finishOrder);
                            backButton.Click += new System.EventHandler(this.exitApp);
                            refreshButton.Click += new System.EventHandler(this.refreshOrderListEvent);
                            goButton.Click += new System.EventHandler(this.showDetails);

                            order_backButton.Click += new System.EventHandler(this.refreshOrderListEvent);
                            order_refreshButton.Click += new System.EventHandler(this.refreshDetails);
                            order_goButton.Click += new System.EventHandler(this.scanBox);

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

        private void scanBox(object sender, EventArgs e)
        {
            order_backButton.Visible = true;
            order_refreshButton.Visible = true;
            order_goButton.Visible = true;

            backButton.Visible = false;
            refreshButton.Visible = false;
            goButton.Visible = false;
            finishButton.Visible = false;

            List<Box> ordDL = (List<Box>)orderDetailsList.DataSource;

            if (this.scan == false && ordDL.Count() > 0)
            {
                int idx = -1;

                foreach (Box box in ordDL)
                {
                    if (box.id == this.code.Text)
                    {
                        Console.Error.WriteLine(box);
                        Console.Error.WriteLine(ordDL.Count());

                        idx = ordDL.IndexOf(box);

                        ordDL.RemoveAt(idx);

                        string url = ArchiDox.Properties.Resources.boxStatusChangeURL;
                        string postData = "box_id=" + box.id;
                        string order_box = Global.SendData("POST", url, postData);

                        JsonResponseResult responseObj = JsonConvert.DeserializeObject<JsonResponseResult>(order_box);

                        if (responseObj.status == "OK")
                        {
                            Console.Error.WriteLine("Znaleziono pudło {0} i zmieniono mu status", box.id);
                        }
                        Console.Error.WriteLine(ordDL.Count());
                        Console.Error.WriteLine("Indeks:" + idx);
                        Console.Error.WriteLine("Znaleziono pudło {0}", box.id);
                        Console.Error.Flush();


                        break;
                    }
                }
                orderDetailsList.DataSource = null;
                orderDetailsList.DataSource = ordDL;
                orderDetailsList.DisplayMember = "display_name";
                orderDetailsList.ValueMember = "id";
                orderDetailsList.Refresh();

            }
            if (this.scan == false && orderDetailsList.Items.Count == 0)
            {
                string complete_url = ArchiDox.Properties.Resources.orderCompleteURL;
                string completePostData = "order_id=" + this.order_id;
                string completeResult = Global.SendData("POST", complete_url, completePostData);
                try
                {
                    JsonResponseConfirmOrder completeResponseObj = JsonConvert.DeserializeObject<JsonResponseConfirmOrder>(completeResult);

                    if (completeResponseObj.status == "OK")
                    {
                        DialogResult dresult = MessageBox.Show("To zamówienie zostało skompletowane", "Zamówienie skompletowane", MessageBoxButtons.OKCancel, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                        if (dresult == DialogResult.OK)
                        {
                            refreshOrderList();
                        }
                        Console.Error.WriteLine("Zamówienie {0} zostało skompletowane", this.order_id);
                        Console.Error.Flush();

                    }
                }
                catch (Exception ex)
                {
                    Console.Error.WriteLine("Zamówienie {0} zostało skompletowane ale nie udało się go potwierdzić", this.order_id);
                    Console.Error.Flush();
                }
            }
            else if (this.scan == true)
            {
                order_refreshButton.Size = new Size(123, 41);
                order_refreshButton.Location = new Point(173, 499);
                finishButton.Visible = true;

                try
                {

                    if (addOrderBox(this.order_id, this.code.Text))
                    {
                        Console.Error.WriteLine("Pudło {0} dodano do zamówienia " + this.order_id, this.code.Text);
                        Console.Error.Flush();
                    }
                    else
                    {
                        Console.Error.WriteLine("Pudło {0} nie zostałe dodane do zamówienia " + this.order_id, this.code.Text);
                        Console.Error.Flush();
                    }
                }
                catch (Exception ex)
                {
                    Console.Error.WriteLine("Pudło {0} nie zostałe dodane do zamówienia " + this.order_id, this.code.Text);
                    Console.Error.Flush();

                }
            }

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

        private void refreshDetails(object sender, EventArgs e)
        {
            order_backButton.Visible = true;
            order_refreshButton.Visible = true;
            order_goButton.Visible = true;

            backButton.Visible = false;
            refreshButton.Visible = false;
            goButton.Visible = false;
            finishButton.Visible = false;

            int selectedIndex = this.ordersList.SelectedIndex;
            Order item = (Order)this.ordersList.SelectedItem;
            string id = item.id;
            this.order_id = int.Parse(id);
            Console.Error.WriteLine("Selected id " + id);
            string url = ArchiDox.Properties.Resources.orderDetailsURL;
            string postData = "order_id=" + id;
            string orderDetails = Global.SendData("POST", url, postData);
            Console.Error.WriteLine("Order details:" + orderDetails);
            Console.Error.Flush();


            if (orderDetails.Length > 0 && this.listLoaded == true)
            {
                try
                {
                    JsonResponseOrderDetailsResult responseObj = JsonConvert.DeserializeObject<JsonResponseOrderDetailsResult>(orderDetails);
                    if (responseObj.status == "OK")
                    {
                        try
                        {
                            if (responseObj.content.Count > 0 && responseObj.scan == false)
                            {
                                this.scan = false;
                                orderDetailsList.DataSource = responseObj.content;
                                orderDetailsList.DisplayMember = "display_name";
                                orderDetailsList.ValueMember = "id";
                                orderDetailsList.Visible = true;
                                ordersList.Visible = false;
                                code.Visible = true;
                                finishButton.Visible = false;
                            }
                         
                            else if (responseObj.scan == true)
                            {
                                orderDetailsList.Items.Clear();

                                this.scan = true;
                              
                                orderDetailsList.Visible = true;
                                ordersList.Visible = false;
                                code.Visible = true;
                                order_refreshButton.Size = new Size(123, 41);
                                order_refreshButton.Location = new Point(173, 499);
                                finishButton.Visible = true;

                                try
                                {
                                    hDcd = new DecodeHandle(DecodeDeviceCap.Exists | DecodeDeviceCap.Barcode);
                                    reqType = (DecodeRequest)1 | DecodeRequest.PostRecurring;
                                    reqID = hDcd.PostRequestMsgEx(reqType, wndMsg, Constants.WM_SCANNED, Constants.WM_TIMEOUT);
                                    Console.Error.WriteLine("Barcode decoder found");
                                    code.GotFocus += new System.EventHandler(this.scanCode);
                                    hDcd.SoftTrigger(DecodeInputType.Barcode, 5000);
                                    Console.Error.Flush();
                                }
                                catch (Exception)
                                {
                                    Console.Error.WriteLine("Barcode decoder not found");
                                    Console.Error.Flush();
                                }
                        
                            }

                            Console.Error.Flush();
                        }
                        catch (Exception ex)
                        {
                            Console.Error.WriteLine(ex.Message);
                            Console.Error.WriteLine(ex.StackTrace);
                            throw;
                        }

                    }
                }
                catch (Exception ex)
                {
                    Console.Error.WriteLine(ex.Message);
                    Console.Error.WriteLine(ex.StackTrace);
                    throw;
                }
            }
            
        }

        private void showDetails(object sender, EventArgs e)
        {
            order_backButton.Visible = true;
            order_refreshButton.Visible = true;
            order_goButton.Visible = true;

            backButton.Visible = false;
            refreshButton.Visible = false;
            goButton.Visible = false;
            finishButton.Visible = false;

            int selectedIndex = this.ordersList.SelectedIndex;
            Order item = (Order)this.ordersList.SelectedItem;
            string id = item.id;
            this.order_id = int.Parse(id);
            Console.Error.WriteLine("Selected id " + id);
            string url = ArchiDox.Properties.Resources.orderDetailsURL;
            string postData = "order_id=" + id;
            string orderDetails = Global.SendData("POST", url, postData);
            Console.Error.WriteLine("Order details:" + orderDetails);
            Console.Error.Flush();


            if (orderDetails.Length > 0 && this.listLoaded == true)
            {
                try
                {
                    JsonResponseOrderDetailsResult responseObj = JsonConvert.DeserializeObject<JsonResponseOrderDetailsResult>(orderDetails);
                    if (responseObj.status == "OK")
                    {
                        try
                        {
                            if (responseObj.content.Count > 0 && responseObj.scan == false)
                            {
                                this.scan = false;
                                DialogResult dresult = MessageBox.Show("To zamówienie zostanie podjęte do realizacji", "Podjąć zamówienie ?", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2);

                                if (dresult == DialogResult.Yes)
                                {
                                    string confirm_url = ArchiDox.Properties.Resources.orderConfirmURL;
                                    string confirmPostData = "order_id=" + id;
                                    string confirmResult = Global.SendData("POST", confirm_url, confirmPostData);

                                    try
                                    {
                                        JsonResponseConfirmOrder confirmResponseObj = JsonConvert.DeserializeObject<JsonResponseConfirmOrder>(confirmResult);

                                        if (confirmResponseObj.status == "OK")
                                        {
                                            Console.Error.WriteLine("Zamówienie {0} zostało potwierdzone", id);
                                            orderDetailsList.DataSource = responseObj.content;
                                            orderDetailsList.DisplayMember = "display_name";
                                            orderDetailsList.ValueMember = "id";
                                            orderDetailsList.Visible = true;
                                            ordersList.Visible = false;
                                            code.Visible = true;                                            
                                            order_refreshButton.Size = new Size(123, 85);
                                            order_refreshButton.Location = new Point(173, 499);

                                            finishButton.Visible = false;

                                            try
                                            {
                                                hDcd = new DecodeHandle(DecodeDeviceCap.Exists | DecodeDeviceCap.Barcode);
                                                reqType = (DecodeRequest)1 | DecodeRequest.PostRecurring;
                                                reqID = hDcd.PostRequestMsgEx(reqType, wndMsg, Constants.WM_SCANNED, Constants.WM_TIMEOUT);
                                                Console.Error.WriteLine("Barcode decoder found");
                                                code.GotFocus += new System.EventHandler(this.scanCode);
                                                hDcd.SoftTrigger(DecodeInputType.Barcode, 5000);
                                                Console.Error.Flush();
                                            }
                                            catch (Exception)
                                            {
                                                Console.Error.WriteLine("Barcode decoder not found");
                                                Console.Error.Flush();
                                            }


                                        }
                                        else
                                        {
                                            Console.Error.WriteLine(confirmResponseObj.error);
                                            Console.Error.Flush();
                                        }
                                    }
                                    catch (Exception ex)
                                    {
                                        Console.Error.WriteLine(ex.Message);
                                        Console.Error.WriteLine(ex.StackTrace);
                                        Console.Error.Flush();
                                    }
                                }
                                else if (dresult == DialogResult.No)
                                {
                                    Console.Error.Flush();
                                }
                            }
                            else if (responseObj.scan == true)
                            {
                                this.scan = true;
                                DialogResult dresult = MessageBox.Show("To zamówienie zostanie podjęte do realizacji i oczekuje skanowania nowych pudeł", "Podjąć zamówienie ?", MessageBoxButtons.YesNo, MessageBoxIcon.Question, MessageBoxDefaultButton.Button2);

                                if (dresult == DialogResult.Yes)
                                {
                                    string confirm_url = ArchiDox.Properties.Resources.orderConfirmURL;
                                    string confirmPostData = "order_id=" + id;
                                    string confirmResult = Global.SendData("POST", confirm_url, confirmPostData);
                                    try
                                    {
                                        JsonResponseConfirmOrder confirmResponseObj = JsonConvert.DeserializeObject<JsonResponseConfirmOrder>(confirmResult);

                                        if (confirmResponseObj.status == "OK")
                                        {
                                            orderDetailsList.Items.Clear();
                                            Console.Error.WriteLine("Zamówienie {0} zostało potwierdzone", id);
                                            orderDetailsList.Visible = true;
                                            ordersList.Visible = false;
                                            code.Visible = true;
                                            order_refreshButton.Size = new Size(123, 41);
                                            order_refreshButton.Location = new Point(173, 499);
                                            finishButton.Visible = true;

                                            try
                                            {
                                                hDcd = new DecodeHandle(DecodeDeviceCap.Exists | DecodeDeviceCap.Barcode);
                                                reqType = (DecodeRequest)1 | DecodeRequest.PostRecurring;
                                                reqID = hDcd.PostRequestMsgEx(reqType, wndMsg, Constants.WM_SCANNED, Constants.WM_TIMEOUT);
                                                Console.Error.WriteLine("Barcode decoder found");
                                                code.GotFocus += new System.EventHandler(this.scanCode);
                                                hDcd.SoftTrigger(DecodeInputType.Barcode, 5000);
                                                Console.Error.Flush();
                                            }
                                            catch (Exception ee)
                                            {
                                                Console.Error.WriteLine("Barcode decoder not found");
                                                Console.Error.Flush();
                                            }
                                        }
                                        else
                                        {
                                            Console.Error.WriteLine(confirmResponseObj.error);
                                            Console.Error.Flush();
                                        }
                                    }
                                    catch (Exception ex)
                                    {
                                        Console.Error.WriteLine(ex.Message);
                                        Console.Error.WriteLine(ex.StackTrace);
                                        Console.Error.Flush();
                                    }
                                }
                                else
                                {
                                    Console.Error.Flush();
                                }
                            }

                            Console.Error.Flush();
                        }
                        catch (Exception ex)
                        {
                            Console.Error.WriteLine(ex.Message);
                            Console.Error.WriteLine(ex.StackTrace);
                            throw;
                        }

                    }
                }
                catch (Exception ex)
                {
                    Console.Error.WriteLine(ex.Message);
                    Console.Error.WriteLine(ex.StackTrace);
                    throw;
                }
            }
          
        }
      
        private void refreshOrderList()
        {
            order_backButton.Visible = false;
            order_refreshButton.Visible = false;
            order_refreshButton.Size = new Size(123, 85);
            order_refreshButton.Location = new Point(173, 499);

            order_goButton.Visible = false;
            finishButton.Visible = false;

            backButton.Visible = true;
            refreshButton.Visible = true;
            goButton.Visible = true;

            string url = ArchiDox.Properties.Resources.ordersURL;
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
                            orderDetailsList.Visible = false;
                            ordersList.Visible = true;
                            code.Visible = false;

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
            order_backButton.Visible = false;
            order_refreshButton.Visible = false;
            order_goButton.Visible = false;
            order_refreshButton.Size = new Size(123, 85);
            order_refreshButton.Location = new Point(173, 499);
            finishButton.Visible = false;

            backButton.Visible = true;
            refreshButton.Visible = true;
            goButton.Visible = true;

            string url = ArchiDox.Properties.Resources.ordersURL;
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
                            orderDetailsList.Visible = false;
                            ordersList.Visible = true;
                            code.Visible = false;

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

        private void clearSearchBox(object sender, EventArgs e)
        {
            this.code.Text = "";
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

        private bool addOrderBox(int order_id, string code)
        {
            string url = ArchiDox.Properties.Resources.addOrderBoxURL;
            string postData = "order_id=" + order_id + "&box_id=" + code;
            string addBoxResult = Global.SendData("POST", url, postData);

            try
            {
                JsonResponseAddOrderBox responseObj = JsonConvert.DeserializeObject<JsonResponseAddOrderBox>(addBoxResult);

                if (responseObj.status == "OK")
                {
                    Box nb = new Box();

                    nb.id = responseObj.content.id;
                    nb.date_from = responseObj.content.date_from;
                    nb.status = responseObj.content.status;
                    nb.warehouse_id = responseObj.content.warehouse_id;
                    nb.display_name = responseObj.content.display_name;

                    orderDetailsList.DataSource = null;
                    orderDetailsList.DisplayMember = "display_name";
                    orderDetailsList.ValueMember = "id";
                    orderDetailsList.Items.Add(nb);
                    orderDetailsList.Refresh();
                    this.code.Text = "";
                    return true;

                }
                else
                {
                    return false;
                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine(ex.Message);
                Console.Error.WriteLine(ex.StackTrace);
                Console.Error.Flush();
                return false;
            }
        }

        private void finishOrder(object sender, EventArgs e) {
            string complete_url = ArchiDox.Properties.Resources.orderCompleteURL;
            string completePostData = "order_id=" + this.order_id;
            string completeResult = Global.SendData("POST", complete_url, completePostData);
            try
            {
                JsonResponseConfirmOrder completeResponseObj = JsonConvert.DeserializeObject<JsonResponseConfirmOrder>(completeResult);

                if (completeResponseObj.status == "OK")
                {
                    DialogResult dresult = MessageBox.Show("To zamówienie zostało skompletowane", "Zamówienie skompletowane", MessageBoxButtons.OKCancel, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                    if (dresult == DialogResult.OK)
                    {
                        refreshOrderList();
                    }

                    Console.Error.WriteLine("Zamówienie {0} zostało skompletowane", this.order_id);
                    Console.Error.Flush();

                }
            }
            catch (Exception ex)
            {
                Console.Error.WriteLine("Zamówienie {0} zostało skompletowane ale nie udało się go potwierdzić", this.order_id);
                Console.Error.Flush();
            }
        }

        private void scanFinished(object sender, KeyEventArgs e)
        {
            List<Box> ordDL = (List<Box>)orderDetailsList.DataSource;

            if (e.KeyCode == Keys.Enter)
            {
                if (this.scan == false && ordDL.Count() > 0)
                {
                    int idx = -1;

                    foreach (Box box in ordDL)
                    {
                        if (box.id == this.code.Text)
                        {
                            Console.Error.WriteLine(box);
                            Console.Error.WriteLine(ordDL.Count());

                            idx = ordDL.IndexOf(box);

                            ordDL.RemoveAt(idx);
                            
                            string url = ArchiDox.Properties.Resources.boxStatusChangeURL;
                            string postData = "box_id=" + box.id;
                            string order_box = Global.SendData("POST", url, postData);

                            JsonResponseResult responseObj = JsonConvert.DeserializeObject<JsonResponseResult>(order_box);

                            if (responseObj.status == "OK")
                            {
                                Console.Error.WriteLine("Znaleziono pudło {0} i zmieniono mu status", box.id);
                            }

                            Console.Error.WriteLine(ordDL.Count());
                            Console.Error.WriteLine("Indeks:" + idx);
                            Console.Error.WriteLine("Znaleziono pudło {0}", box.id);
                            Console.Error.Flush();
                            break;
                        }
                    }

                    orderDetailsList.DataSource = null;
                    orderDetailsList.DataSource = ordDL;
                    orderDetailsList.DisplayMember = "display_name";
                    orderDetailsList.ValueMember = "id";
                    orderDetailsList.Refresh();

                    if (orderDetailsList.Items.Count == 0)
                    {
                        refreshOrderList();
                    }
                }
                else if (this.scan == false && orderDetailsList.Items.Count == 0)
                {
                    string complete_url = ArchiDox.Properties.Resources.orderCompleteURL;
                    string completePostData = "order_id=" + this.order_id;
                    string completeResult = Global.SendData("POST", complete_url, completePostData);
                    try
                    {
                        JsonResponseConfirmOrder completeResponseObj = JsonConvert.DeserializeObject<JsonResponseConfirmOrder>(completeResult);

                        if (completeResponseObj.status == "OK")
                        {
                            DialogResult dresult = MessageBox.Show("To zamówienie zostało skompletowane", "Zamówienie skompletowane", MessageBoxButtons.OKCancel, MessageBoxIcon.Exclamation, MessageBoxDefaultButton.Button1);

                            if (dresult == DialogResult.OK)
                            {
                                refreshOrderList();
                            }    

                            Console.Error.WriteLine("Zamówienie {0} zostało skompletowane", this.order_id);
                            Console.Error.Flush();

                        }
                    }
                    catch (Exception ex)
                    {
                        Console.Error.WriteLine("Zamówienie {0} zostało skompletowane ale nie udało się go potwierdzić", this.order_id);
                        Console.Error.Flush();
                    }
                }
                else if (this.scan == true)
                {
                    try
                    {

                        if (addOrderBox(this.order_id, this.code.Text))
                        {
                            Console.Error.WriteLine("Pudło {0} dodano do zamówienia " + this.order_id, this.code.Text);
                            Console.Error.Flush();
                        }
                        else
                        {
                            Console.Error.WriteLine("Pudło {0} nie zostałe dodane do zamówienia " + this.order_id, this.code.Text);
                            Console.Error.Flush();
                        }
                    }
                    catch (Exception ex)
                    {
                        Console.Error.WriteLine("Pudło {0} nie zostałe dodane do zamówienia " + this.order_id, this.code.Text);
                        Console.Error.Flush();

                    }
                }
            }
            else
            {
                Console.Error.WriteLine(e.KeyCode);
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