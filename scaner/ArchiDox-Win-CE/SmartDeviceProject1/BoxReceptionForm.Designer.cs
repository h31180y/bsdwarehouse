namespace ArchiDox
{
    partial class BoxReceptionForm
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(BoxReceptionForm));
            this.pictureBox1 = new System.Windows.Forms.PictureBox();
            this.position = new System.Windows.Forms.TextBox();
            this.pictureBox2 = new System.Windows.Forms.PictureBox();
            this.backButton = new System.Windows.Forms.Button();
            this.goButton = new System.Windows.Forms.Button();
            this.menuItem2 = new System.Windows.Forms.MenuItem();
            this.menuItem6 = new System.Windows.Forms.MenuItem();
            this.menuItem7 = new System.Windows.Forms.MenuItem();
            this.menuItem3 = new System.Windows.Forms.MenuItem();
            this.menuItem4 = new System.Windows.Forms.MenuItem();
            this.menuItem1 = new System.Windows.Forms.MenuItem();
            this.menuItem5 = new System.Windows.Forms.MenuItem();
            this.mainMenu1 = new System.Windows.Forms.MainMenu();
            this.refreshButton = new System.Windows.Forms.Button();
            this.code = new System.Windows.Forms.TextBox();
            this.seal1 = new System.Windows.Forms.TextBox();
            this.seal2 = new System.Windows.Forms.TextBox();
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
            // position
            // 
            this.position.BackColor = System.Drawing.SystemColors.Control;
            this.position.ForeColor = System.Drawing.SystemColors.Window;
            this.position.Location = new System.Drawing.Point(34, 157);
            this.position.Name = "position";
            this.position.Size = new System.Drawing.Size(414, 41);
            this.position.TabIndex = 7;
            this.position.Text = "Kod pozycji ...";
            this.position.GotFocus += new System.EventHandler(this.clearSearchBox);
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
            // backButton
            // 
            this.backButton.Location = new System.Drawing.Point(34, 499);
            this.backButton.Name = "backButton";
            this.backButton.Size = new System.Drawing.Size(111, 85);
            this.backButton.TabIndex = 17;
            this.backButton.Text = "< Wróć";
            this.backButton.Click += new System.EventHandler(this.backToSearch);
            // 
            // goButton
            // 
            this.goButton.Location = new System.Drawing.Point(337, 499);
            this.goButton.Name = "goButton";
            this.goButton.Size = new System.Drawing.Size(111, 85);
            this.goButton.TabIndex = 18;
            this.goButton.Text = "Dalej >";
            this.goButton.Click += new System.EventHandler(this.receptBox);
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
            // refreshButton
            // 
            this.refreshButton.Location = new System.Drawing.Point(173, 499);
            this.refreshButton.Name = "refreshButton";
            this.refreshButton.Size = new System.Drawing.Size(123, 85);
            this.refreshButton.TabIndex = 15;
            this.refreshButton.Text = "Zakończ";
            this.refreshButton.Click += new System.EventHandler(this.backToSearch);
            // 
            // code
            // 
            this.code.BackColor = System.Drawing.SystemColors.Control;
            this.code.ForeColor = System.Drawing.SystemColors.Window;
            this.code.Location = new System.Drawing.Point(33, 217);
            this.code.Name = "code";
            this.code.Size = new System.Drawing.Size(414, 41);
            this.code.TabIndex = 21;
            this.code.Text = "Kod pudła ...";
            this.code.TextChanged += new System.EventHandler(this.textBox1_TextChanged);
            // 
            // seal1
            // 
            this.seal1.BackColor = System.Drawing.SystemColors.Control;
            this.seal1.ForeColor = System.Drawing.SystemColors.Window;
            this.seal1.Location = new System.Drawing.Point(33, 274);
            this.seal1.Name = "seal1";
            this.seal1.Size = new System.Drawing.Size(414, 41);
            this.seal1.TabIndex = 22;
            this.seal1.Text = "Kod plomby 1 ...";
            this.seal1.TextChanged += new System.EventHandler(this.seal1_TextChanged);
            // 
            // seal2
            // 
            this.seal2.BackColor = System.Drawing.SystemColors.Control;
            this.seal2.ForeColor = System.Drawing.SystemColors.Window;
            this.seal2.Location = new System.Drawing.Point(34, 337);
            this.seal2.Name = "seal2";
            this.seal2.Size = new System.Drawing.Size(414, 41);
            this.seal2.TabIndex = 23;
            this.seal2.Text = "Kod plomby 2 ...";
            // 
            // BoxReceptionForm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(192F, 192F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Dpi;
            this.ClientSize = new System.Drawing.Size(480, 588);
            this.Controls.Add(this.seal2);
            this.Controls.Add(this.seal1);
            this.Controls.Add(this.code);
            this.Controls.Add(this.goButton);
            this.Controls.Add(this.backButton);
            this.Controls.Add(this.pictureBox2);
            this.Controls.Add(this.position);
            this.Controls.Add(this.refreshButton);
            this.Controls.Add(this.pictureBox1);
            this.KeyPreview = true;
            this.Location = new System.Drawing.Point(0, 0);
            this.Menu = this.mainMenu1;
            this.Name = "BoxReceptionForm";
            this.Text = "ArchiDox for Windows";
            this.TopMost = true;
            this.WindowState = System.Windows.Forms.FormWindowState.Maximized;
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.PictureBox pictureBox1;
        private System.Windows.Forms.TextBox position;
        private System.Windows.Forms.PictureBox pictureBox2;
        private System.Windows.Forms.Button backButton;
        private System.Windows.Forms.Button goButton;
        private System.Windows.Forms.MenuItem menuItem2;
        private System.Windows.Forms.MenuItem menuItem6;
        private System.Windows.Forms.MenuItem menuItem7;
        private System.Windows.Forms.MenuItem menuItem3;
        private System.Windows.Forms.MenuItem menuItem4;
        private System.Windows.Forms.MenuItem menuItem1;
        private System.Windows.Forms.MenuItem menuItem5;
        private System.Windows.Forms.MainMenu mainMenu1;
        private System.Windows.Forms.Button refreshButton;
        private System.Windows.Forms.TextBox code;
        private System.Windows.Forms.TextBox seal1;
        private System.Windows.Forms.TextBox seal2;
    }
}

