namespace ArchiDox
{
    partial class SearchForm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;
        private System.Windows.Forms.MainMenu SearchMenu;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (hDcd != null)
            {
                if (reqID != -1)
                    hDcd.CancelRequest(reqID);
                hDcd.Dispose();
                hDcd = null;
            }

            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(SearchForm));
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.code = new System.Windows.Forms.TextBox();
            this.pictureBox2 = new System.Windows.Forms.PictureBox();
            this.ordersList = new System.Windows.Forms.ListBox();
            this.orderDetailsList = new System.Windows.Forms.ListBox();
            this.refreshButton = new System.Windows.Forms.Button();
            this.backButton = new System.Windows.Forms.Button();
            this.goButton = new System.Windows.Forms.Button();
            this.order_goButton = new System.Windows.Forms.Button();
            this.order_backButton = new System.Windows.Forms.Button();
            this.order_refreshButton = new System.Windows.Forms.Button();
            this.button1 = new System.Windows.Forms.Button();
            this.finishButton = new System.Windows.Forms.Button();
            this.menuItem2 = new System.Windows.Forms.MenuItem();
            this.menuItem6 = new System.Windows.Forms.MenuItem();
            this.menuItem7 = new System.Windows.Forms.MenuItem();
            this.menuItem3 = new System.Windows.Forms.MenuItem();
            this.menuItem4 = new System.Windows.Forms.MenuItem();
            this.menuItem1 = new System.Windows.Forms.MenuItem();
            this.menuItem5 = new System.Windows.Forms.MenuItem();
            this.mainMenu1 = new System.Windows.Forms.MainMenu();
            this.SuspendLayout();
            // 
            // pictureBox1
            // 
            this.pictureBox1.BackColor = System.Drawing.SystemColors.Control;
            this.pictureBox1.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox1.Image")));
            this.pictureBox1.Location = new System.Drawing.Point(0, 0);
            this.pictureBox1.Name = "pictureBox1";
            this.pictureBox1.Size = new System.Drawing.Size(480, 588);
            this.pictureBox1.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            // 
            // code
            // 
            this.code.BackColor = System.Drawing.SystemColors.Control;
            this.code.ForeColor = System.Drawing.SystemColors.Window;
            this.code.Location = new System.Drawing.Point(34, 450);
            this.code.Name = "code";
            this.code.Size = new System.Drawing.Size(414, 41);
            this.code.TabIndex = 7;
            this.code.Text = "Kod pudła ...";
            this.code.Visible = false;
            this.code.GotFocus += new System.EventHandler(this.clearSearchBox);
            this.code.KeyDown += new System.Windows.Forms.KeyEventHandler(this.scanFinished);
            // 
            // pictureBox2
            // 
            this.pictureBox2.BackColor = System.Drawing.SystemColors.Control;
            this.pictureBox2.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox2.Image")));
            this.pictureBox2.Location = new System.Drawing.Point(78, 62);
            this.pictureBox2.Name = "pictureBox2";
            this.pictureBox2.Size = new System.Drawing.Size(324, 58);
            this.pictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.StretchImage;
            // 
            // ordersList
            // 
            this.ordersList.Font = new System.Drawing.Font("Tahoma", 8F, System.Drawing.FontStyle.Regular);
            this.ordersList.Location = new System.Drawing.Point(34, 178);
            this.ordersList.Name = "ordersList";
            this.ordersList.Size = new System.Drawing.Size(414, 262);
            this.ordersList.TabIndex = 8;
            // 
            // orderDetailsList
            // 
            this.orderDetailsList.Font = new System.Drawing.Font("Tahoma", 8F, System.Drawing.FontStyle.Regular);
            this.orderDetailsList.Location = new System.Drawing.Point(34, 178);
            this.orderDetailsList.Name = "orderDetailsList";
            this.orderDetailsList.Size = new System.Drawing.Size(414, 262);
            this.orderDetailsList.TabIndex = 10;
            this.orderDetailsList.Visible = false;
            // 
            // refreshButton
            // 
            this.refreshButton.Location = new System.Drawing.Point(173, 499);
            this.refreshButton.Name = "refreshButton";
            this.refreshButton.Size = new System.Drawing.Size(123, 85);
            this.refreshButton.TabIndex = 15;
            this.refreshButton.Text = "Odśwież";
            // 
            // backButton
            // 
            this.backButton.Location = new System.Drawing.Point(34, 499);
            this.backButton.Name = "backButton";
            this.backButton.Size = new System.Drawing.Size(111, 85);
            this.backButton.TabIndex = 17;
            this.backButton.Text = "< Wróć";
            // 
            // goButton
            // 
            this.goButton.Location = new System.Drawing.Point(337, 499);
            this.goButton.Name = "goButton";
            this.goButton.Size = new System.Drawing.Size(111, 85);
            this.goButton.TabIndex = 18;
            this.goButton.Text = "Dalej >";
            // 
            // order_goButton
            // 
            this.order_goButton.Location = new System.Drawing.Point(337, 499);
            this.order_goButton.Name = "order_goButton";
            this.order_goButton.Size = new System.Drawing.Size(111, 85);
            this.order_goButton.TabIndex = 23;
            this.order_goButton.Text = "Dalej >";
            // 
            // order_backButton
            // 
            this.order_backButton.Location = new System.Drawing.Point(34, 499);
            this.order_backButton.Name = "order_backButton";
            this.order_backButton.Size = new System.Drawing.Size(111, 85);
            this.order_backButton.TabIndex = 22;
            this.order_backButton.Text = "< Wróć";
            // 
            // order_refreshButton
            // 
            this.order_refreshButton.Location = new System.Drawing.Point(173, 499);
            this.order_refreshButton.Name = "order_refreshButton";
            this.order_refreshButton.Size = new System.Drawing.Size(123, 85);
            this.order_refreshButton.TabIndex = 21;
            this.order_refreshButton.Text = "Odśwież";
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(173, 499);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(123, 41);
            this.button1.TabIndex = 26;
            this.button1.Text = "Odśwież";
            this.button1.Visible = false;
            // 
            // finishButton
            // 
            this.finishButton.Location = new System.Drawing.Point(173, 543);
            this.finishButton.Name = "finishButton";
            this.finishButton.Size = new System.Drawing.Size(123, 41);
            this.finishButton.TabIndex = 27;
            this.finishButton.Text = "Zakończ";
            this.finishButton.Visible = false;
            // 
            // menuItem2
            // 
            this.menuItem2.Text = "Wyloguj";
            this.menuItem2.Click += new System.EventHandler(this.exitApp);
            // 
            // menuItem6
            // 
            this.menuItem6.Text = "Zamówienia";
            this.menuItem6.Click += new System.EventHandler(this.orderWarehouseReception);
            // 
            // menuItem7
            // 
            this.menuItem7.Text = "Pudeł";
            this.menuItem7.Click += new System.EventHandler(this.boxWarehouseReception);
            // 
            // menuItem3
            // 
            this.menuItem3.MenuItems.Add(this.menuItem6);
            this.menuItem3.MenuItems.Add(this.menuItem7);
            this.menuItem3.Text = "Przyjęcie";
            // 
            // menuItem4
            // 
            this.menuItem4.Text = "Doręczenie";
            this.menuItem4.Click += new System.EventHandler(this.customerDelivery);
            // 
            // menuItem1
            // 
            this.menuItem1.MenuItems.Add(this.menuItem2);
            this.menuItem1.MenuItems.Add(this.menuItem3);
            this.menuItem1.MenuItems.Add(this.menuItem4);
            this.menuItem1.Text = "Menu";
            // 
            // menuItem5
            // 
            this.menuItem5.Text = "Synchornizuj";
            this.menuItem5.Click += new System.EventHandler(this.synchronizeWithServer);
            // 
            // mainMenu1
            // 
            this.mainMenu1.MenuItems.Add(this.menuItem1);
            this.mainMenu1.MenuItems.Add(this.menuItem5);
            // 
            // SearchForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(192F, 192F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.ClientSize = new System.Drawing.Size(480, 588);
            this.Controls.Add(this.finishButton);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.order_goButton);
            this.Controls.Add(this.order_backButton);
            this.Controls.Add(this.order_refreshButton);
            this.Controls.Add(this.goButton);
            this.Controls.Add(this.backButton);
            this.Controls.Add(this.orderDetailsList);
            this.Controls.Add(this.pictureBox2);
            this.Controls.Add(this.ordersList);
            this.Controls.Add(this.code);
            this.Controls.Add(this.refreshButton);
            this.Controls.Add(this.pictureBox1);
            this.KeyPreview = true;
            this.Location = new System.Drawing.Point(0, 0);
            this.Menu = this.mainMenu1;
            this.Name = "SearchForm";
            this.Text = "ArchiDox for Windows";
            this.TopMost = true;
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.KeyDown += new System.Windows.Forms.KeyEventHandler(this.Form1_KeyDown);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.TextBox code;
        private System.Windows.Forms.PictureBox pictureBox2;
        private System.Windows.Forms.ListBox ordersList;
        private System.Windows.Forms.ListBox orderDetailsList;
        private System.Windows.Forms.Button refreshButton;
        private System.Windows.Forms.Button backButton;
        private System.Windows.Forms.Button goButton;
        private System.Windows.Forms.Button order_goButton;
        private System.Windows.Forms.Button order_backButton;
        private System.Windows.Forms.Button order_refreshButton;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button finishButton;
        private System.Windows.Forms.MenuItem menuItem2;
        private System.Windows.Forms.MenuItem menuItem6;
        private System.Windows.Forms.MenuItem menuItem7;
        private System.Windows.Forms.MenuItem menuItem3;
        private System.Windows.Forms.MenuItem menuItem4;
        private System.Windows.Forms.MenuItem menuItem1;
        private System.Windows.Forms.MenuItem menuItem5;
        private System.Windows.Forms.MainMenu mainMenu1;
    }
}

