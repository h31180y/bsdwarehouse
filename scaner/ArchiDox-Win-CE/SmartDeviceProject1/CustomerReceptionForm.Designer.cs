namespace ArchiDox
{
    partial class CustomerReceptionForm
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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(CustomerReceptionForm));
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.pictureBox2 = new System.Windows.Forms.PictureBox();
            this.ordersList = new System.Windows.Forms.ListBox();
            this.order_goButton = new System.Windows.Forms.Button();
            this.order_backButton = new System.Windows.Forms.Button();
            this.order_refreshButton = new System.Windows.Forms.Button();
            this.inputPanel1 = new Microsoft.WindowsCE.Forms.InputPanel(this.components);
            this.statusLabel = new System.Windows.Forms.Label();
            this.mainMenu1 = new System.Windows.Forms.MainMenu();
            this.menuItem1 = new System.Windows.Forms.MenuItem();
            this.menuItem2 = new System.Windows.Forms.MenuItem();
            this.menuItem3 = new System.Windows.Forms.MenuItem();
            this.menuItem6 = new System.Windows.Forms.MenuItem();
            this.menuItem7 = new System.Windows.Forms.MenuItem();
            this.menuItem4 = new System.Windows.Forms.MenuItem();
            this.menuItem5 = new System.Windows.Forms.MenuItem();
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
            this.ordersList.TabIndex = 26;
            // 
            // order_goButton
            // 
            this.order_goButton.Location = new System.Drawing.Point(336, 486);
            this.order_goButton.Name = "order_goButton";
            this.order_goButton.Size = new System.Drawing.Size(111, 85);
            this.order_goButton.TabIndex = 31;
            this.order_goButton.Text = "Dalej >";
            // 
            // order_backButton
            // 
            this.order_backButton.Location = new System.Drawing.Point(33, 486);
            this.order_backButton.Name = "order_backButton";
            this.order_backButton.Size = new System.Drawing.Size(111, 85);
            this.order_backButton.TabIndex = 30;
            this.order_backButton.Text = "< Wróć";
            // 
            // order_refreshButton
            // 
            this.order_refreshButton.Location = new System.Drawing.Point(172, 486);
            this.order_refreshButton.Name = "order_refreshButton";
            this.order_refreshButton.Size = new System.Drawing.Size(123, 85);
            this.order_refreshButton.TabIndex = 29;
            this.order_refreshButton.Text = "Odśwież";
            // 
            // statusLabel
            // 
            this.statusLabel.BackColor = System.Drawing.Color.Transparent;
            this.statusLabel.ForeColor = System.Drawing.Color.Red;
            this.statusLabel.Location = new System.Drawing.Point(78, 135);
            this.statusLabel.Name = "statusLabel";
            this.statusLabel.Size = new System.Drawing.Size(324, 40);
            this.statusLabel.TextAlign = System.Drawing.ContentAlignment.TopCenter;
            this.statusLabel.Visible = false;
            // 
            // mainMenu1
            // 
            this.mainMenu1.MenuItems.Add(this.menuItem1);
            this.mainMenu1.MenuItems.Add(this.menuItem5);
            // 
            // menuItem1
            // 
            this.menuItem1.MenuItems.Add(this.menuItem2);
            this.menuItem1.MenuItems.Add(this.menuItem3);
            this.menuItem1.MenuItems.Add(this.menuItem4);
            this.menuItem1.Text = "Menu";
            // 
            // menuItem2
            // 
            this.menuItem2.Text = "Wyloguj";
            this.menuItem2.Click += new System.EventHandler(this.exitApp);
            // 
            // menuItem3
            // 
            this.menuItem3.MenuItems.Add(this.menuItem6);
            this.menuItem3.MenuItems.Add(this.menuItem7);
            this.menuItem3.Text = "Przyjęcie";
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
            // menuItem4
            // 
            this.menuItem4.Text = "Doręczenie";
            this.menuItem4.Click += new System.EventHandler(this.customerDelivery);
            // 
            // menuItem5
            // 
            this.menuItem5.Text = "Synchornizuj";
            this.menuItem5.Click += new System.EventHandler(this.synchronizeWithServer);
            // 
            // CustomerReceptionForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(192F, 192F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.ClientSize = new System.Drawing.Size(480, 588);
            this.Controls.Add(this.statusLabel);
            this.Controls.Add(this.order_goButton);
            this.Controls.Add(this.order_backButton);
            this.Controls.Add(this.order_refreshButton);
            this.Controls.Add(this.ordersList);
            this.Controls.Add(this.pictureBox2);
            this.Controls.Add(this.pictureBox1);
            this.KeyPreview = true;
            this.Location = new System.Drawing.Point(0, 0);
            this.Menu = this.mainMenu1;
            this.Name = "CustomerReceptionForm";
            this.Text = "ArchiDox for Windows";
            this.TopMost = true;
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.PictureBox pictureBox2;
        private System.Windows.Forms.ListBox ordersList;
        private System.Windows.Forms.Button order_goButton;
        private System.Windows.Forms.Button order_backButton;
        private System.Windows.Forms.Button order_refreshButton;
        private Microsoft.WindowsCE.Forms.InputPanel inputPanel1;
        private System.Windows.Forms.Label statusLabel;
        private System.Windows.Forms.MainMenu mainMenu1;
        private System.Windows.Forms.MenuItem menuItem1;
        private System.Windows.Forms.MenuItem menuItem2;
        private System.Windows.Forms.MenuItem menuItem3;
        private System.Windows.Forms.MenuItem menuItem6;
        private System.Windows.Forms.MenuItem menuItem7;
        private System.Windows.Forms.MenuItem menuItem4;
        private System.Windows.Forms.MenuItem menuItem5;
    }
}

