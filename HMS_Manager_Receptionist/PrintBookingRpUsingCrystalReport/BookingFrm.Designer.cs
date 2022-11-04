
namespace PrintBookingRpUsingCrystalReport
{
    partial class BookingFrm
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
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
            this.label1 = new System.Windows.Forms.Label();
            this.dgBooking = new System.Windows.Forms.DataGridView();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btnReport = new System.Windows.Forms.Button();
            this.btnSearch = new System.Windows.Forms.Button();
            this.cbSearchBy = new System.Windows.Forms.ComboBox();
            this.chkIsCancelled = new System.Windows.Forms.CheckBox();
            this.chkPaymentStatus = new System.Windows.Forms.CheckBox();
            this.numNoOfRoom = new System.Windows.Forms.NumericUpDown();
            this.numNoOfChildren = new System.Windows.Forms.NumericUpDown();
            this.numNoOfAdult = new System.Windows.Forms.NumericUpDown();
            this.txtSpecialRequests = new System.Windows.Forms.TextBox();
            this.dtpBookDate = new System.Windows.Forms.DateTimePicker();
            this.cbCustomer = new System.Windows.Forms.ComboBox();
            this.txtBookID = new System.Windows.Forms.TextBox();
            this.btnExit = new System.Windows.Forms.Button();
            this.btnReset = new System.Windows.Forms.Button();
            this.btnDelete = new System.Windows.Forms.Button();
            this.btnUpdate = new System.Windows.Forms.Button();
            this.btnAdd = new System.Windows.Forms.Button();
            this.label10 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgBooking)).BeginInit();
            this.groupBox1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numNoOfRoom)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numNoOfChildren)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.numNoOfAdult)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.SystemColors.ControlLight;
            this.label1.Font = new System.Drawing.Font("Segoe UI Semibold", 16.2F, System.Drawing.FontStyle.Bold);
            this.label1.Location = new System.Drawing.Point(269, 7);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(443, 38);
            this.label1.TabIndex = 0;
            this.label1.Text = "QUẢN LÝ HÓA ĐƠN ĐẶT PHÒNG";
            // 
            // dgBooking
            // 
            this.dgBooking.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgBooking.Location = new System.Drawing.Point(12, 261);
            this.dgBooking.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.dgBooking.Name = "dgBooking";
            this.dgBooking.RowHeadersWidth = 51;
            this.dgBooking.RowTemplate.Height = 29;
            this.dgBooking.Size = new System.Drawing.Size(969, 257);
            this.dgBooking.TabIndex = 1;
            this.dgBooking.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgBooking_CellClick);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.btnReport);
            this.groupBox1.Controls.Add(this.btnSearch);
            this.groupBox1.Controls.Add(this.cbSearchBy);
            this.groupBox1.Controls.Add(this.chkIsCancelled);
            this.groupBox1.Controls.Add(this.chkPaymentStatus);
            this.groupBox1.Controls.Add(this.numNoOfRoom);
            this.groupBox1.Controls.Add(this.numNoOfChildren);
            this.groupBox1.Controls.Add(this.numNoOfAdult);
            this.groupBox1.Controls.Add(this.txtSpecialRequests);
            this.groupBox1.Controls.Add(this.dtpBookDate);
            this.groupBox1.Controls.Add(this.cbCustomer);
            this.groupBox1.Controls.Add(this.txtBookID);
            this.groupBox1.Controls.Add(this.btnExit);
            this.groupBox1.Controls.Add(this.btnReset);
            this.groupBox1.Controls.Add(this.btnDelete);
            this.groupBox1.Controls.Add(this.btnUpdate);
            this.groupBox1.Controls.Add(this.btnAdd);
            this.groupBox1.Controls.Add(this.label10);
            this.groupBox1.Controls.Add(this.label7);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.label11);
            this.groupBox1.Controls.Add(this.label9);
            this.groupBox1.Controls.Add(this.label6);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.label8);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Font = new System.Drawing.Font("Segoe UI Semibold", 9F, System.Drawing.FontStyle.Bold);
            this.groupBox1.Location = new System.Drawing.Point(12, 63);
            this.groupBox1.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Padding = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.groupBox1.Size = new System.Drawing.Size(969, 193);
            this.groupBox1.TabIndex = 3;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Thông tin đặt phòng";
            // 
            // btnReport
            // 
            this.btnReport.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.btnReport.Location = new System.Drawing.Point(749, 150);
            this.btnReport.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnReport.Name = "btnReport";
            this.btnReport.Size = new System.Drawing.Size(73, 29);
            this.btnReport.TabIndex = 11;
            this.btnReport.Text = "Report";
            this.btnReport.UseVisualStyleBackColor = true;
            this.btnReport.Click += new System.EventHandler(this.btnReport_Click);
            // 
            // btnSearch
            // 
            this.btnSearch.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.btnSearch.Location = new System.Drawing.Point(749, 90);
            this.btnSearch.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnSearch.Name = "btnSearch";
            this.btnSearch.Size = new System.Drawing.Size(73, 29);
            this.btnSearch.TabIndex = 11;
            this.btnSearch.Text = "Search";
            this.btnSearch.UseVisualStyleBackColor = true;
            this.btnSearch.Click += new System.EventHandler(this.btnSearch_Click);
            // 
            // cbSearchBy
            // 
            this.cbSearchBy.FormattingEnabled = true;
            this.cbSearchBy.Items.AddRange(new object[] {
            "Customer",
            "BookDate",
            "NoOfAdult",
            "NoOfChildren",
            "NoOfRoom",
            "PaymentStatus",
            "isCancelled",
            "SpecialRequests"});
            this.cbSearchBy.Location = new System.Drawing.Point(618, 91);
            this.cbSearchBy.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.cbSearchBy.Name = "cbSearchBy";
            this.cbSearchBy.Size = new System.Drawing.Size(125, 28);
            this.cbSearchBy.TabIndex = 10;
            // 
            // chkIsCancelled
            // 
            this.chkIsCancelled.AutoSize = true;
            this.chkIsCancelled.Location = new System.Drawing.Point(725, 62);
            this.chkIsCancelled.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.chkIsCancelled.Name = "chkIsCancelled";
            this.chkIsCancelled.Size = new System.Drawing.Size(18, 17);
            this.chkIsCancelled.TabIndex = 9;
            this.chkIsCancelled.UseVisualStyleBackColor = true;
            // 
            // chkPaymentStatus
            // 
            this.chkPaymentStatus.AutoSize = true;
            this.chkPaymentStatus.Location = new System.Drawing.Point(725, 30);
            this.chkPaymentStatus.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.chkPaymentStatus.Name = "chkPaymentStatus";
            this.chkPaymentStatus.Size = new System.Drawing.Size(18, 17);
            this.chkPaymentStatus.TabIndex = 8;
            this.chkPaymentStatus.UseVisualStyleBackColor = true;
            // 
            // numNoOfRoom
            // 
            this.numNoOfRoom.Location = new System.Drawing.Point(453, 92);
            this.numNoOfRoom.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.numNoOfRoom.Name = "numNoOfRoom";
            this.numNoOfRoom.Size = new System.Drawing.Size(69, 27);
            this.numNoOfRoom.TabIndex = 7;
            // 
            // numNoOfChildren
            // 
            this.numNoOfChildren.Location = new System.Drawing.Point(453, 58);
            this.numNoOfChildren.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.numNoOfChildren.Name = "numNoOfChildren";
            this.numNoOfChildren.Size = new System.Drawing.Size(69, 27);
            this.numNoOfChildren.TabIndex = 6;
            // 
            // numNoOfAdult
            // 
            this.numNoOfAdult.Location = new System.Drawing.Point(453, 26);
            this.numNoOfAdult.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.numNoOfAdult.Name = "numNoOfAdult";
            this.numNoOfAdult.Size = new System.Drawing.Size(69, 27);
            this.numNoOfAdult.TabIndex = 5;
            // 
            // txtSpecialRequests
            // 
            this.txtSpecialRequests.Location = new System.Drawing.Point(157, 126);
            this.txtSpecialRequests.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.txtSpecialRequests.Multiline = true;
            this.txtSpecialRequests.Name = "txtSpecialRequests";
            this.txtSpecialRequests.Size = new System.Drawing.Size(586, 53);
            this.txtSpecialRequests.TabIndex = 4;
            // 
            // dtpBookDate
            // 
            this.dtpBookDate.CustomFormat = "dd/MM/yyyy HH:mm:ss tt";
            this.dtpBookDate.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpBookDate.Location = new System.Drawing.Point(110, 90);
            this.dtpBookDate.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.dtpBookDate.Name = "dtpBookDate";
            this.dtpBookDate.Size = new System.Drawing.Size(209, 27);
            this.dtpBookDate.TabIndex = 3;
            // 
            // cbCustomer
            // 
            this.cbCustomer.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.cbCustomer.FormattingEnabled = true;
            this.cbCustomer.Location = new System.Drawing.Point(110, 58);
            this.cbCustomer.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.cbCustomer.Name = "cbCustomer";
            this.cbCustomer.Size = new System.Drawing.Size(209, 28);
            this.cbCustomer.TabIndex = 2;
            // 
            // txtBookID
            // 
            this.txtBookID.Location = new System.Drawing.Point(110, 26);
            this.txtBookID.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.txtBookID.Name = "txtBookID";
            this.txtBookID.Size = new System.Drawing.Size(80, 27);
            this.txtBookID.TabIndex = 1;
            // 
            // btnExit
            // 
            this.btnExit.ForeColor = System.Drawing.Color.Crimson;
            this.btnExit.Location = new System.Drawing.Point(859, 149);
            this.btnExit.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnExit.Name = "btnExit";
            this.btnExit.Size = new System.Drawing.Size(94, 23);
            this.btnExit.TabIndex = 16;
            this.btnExit.Text = "Exit";
            this.btnExit.UseVisualStyleBackColor = true;
            this.btnExit.Click += new System.EventHandler(this.btnExit_Click);
            // 
            // btnReset
            // 
            this.btnReset.ForeColor = System.Drawing.SystemColors.Info;
            this.btnReset.Location = new System.Drawing.Point(859, 121);
            this.btnReset.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnReset.Name = "btnReset";
            this.btnReset.Size = new System.Drawing.Size(94, 23);
            this.btnReset.TabIndex = 15;
            this.btnReset.Text = "Reset";
            this.btnReset.UseVisualStyleBackColor = true;
            this.btnReset.Click += new System.EventHandler(this.btnReset_Click);
            // 
            // btnDelete
            // 
            this.btnDelete.ForeColor = System.Drawing.Color.Green;
            this.btnDelete.Location = new System.Drawing.Point(859, 81);
            this.btnDelete.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(94, 23);
            this.btnDelete.TabIndex = 14;
            this.btnDelete.Text = "Delete";
            this.btnDelete.UseVisualStyleBackColor = true;
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
            // 
            // btnUpdate
            // 
            this.btnUpdate.ForeColor = System.Drawing.Color.Green;
            this.btnUpdate.Location = new System.Drawing.Point(859, 53);
            this.btnUpdate.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnUpdate.Name = "btnUpdate";
            this.btnUpdate.Size = new System.Drawing.Size(94, 23);
            this.btnUpdate.TabIndex = 13;
            this.btnUpdate.Text = "Update";
            this.btnUpdate.UseVisualStyleBackColor = true;
            this.btnUpdate.Click += new System.EventHandler(this.btnUpdate_Click);
            // 
            // btnAdd
            // 
            this.btnAdd.ForeColor = System.Drawing.Color.Green;
            this.btnAdd.Location = new System.Drawing.Point(859, 25);
            this.btnAdd.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(94, 23);
            this.btnAdd.TabIndex = 12;
            this.btnAdd.Text = "Add";
            this.btnAdd.UseVisualStyleBackColor = true;
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(21, 128);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(117, 20);
            this.label10.TabIndex = 0;
            this.label10.Text = "SpecialRequests";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(334, 94);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(86, 20);
            this.label7.TabIndex = 0;
            this.label7.Text = "NoOfRoom";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(21, 94);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(76, 20);
            this.label4.TabIndex = 0;
            this.label4.Text = "BookDate";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(540, 94);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(72, 20);
            this.label11.TabIndex = 0;
            this.label11.Text = "SearchBy";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(540, 60);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(85, 20);
            this.label9.TabIndex = 0;
            this.label9.Text = "isCancelled";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(334, 60);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(104, 20);
            this.label6.TabIndex = 0;
            this.label6.Text = "NoOfChildren";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(21, 60);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(74, 20);
            this.label3.TabIndex = 0;
            this.label3.Text = "Customer";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(540, 28);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(110, 20);
            this.label8.TabIndex = 0;
            this.label8.Text = "PaymentStatus";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(334, 28);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(83, 20);
            this.label5.TabIndex = 0;
            this.label5.Text = "NoOfAdult";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(21, 28);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(59, 20);
            this.label2.TabIndex = 0;
            this.label2.Text = "BookID";
            // 
            // BookingFrm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(993, 527);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.dgBooking);
            this.Controls.Add(this.label1);
            this.Margin = new System.Windows.Forms.Padding(3, 2, 3, 2);
            this.Name = "BookingFrm";
            this.Text = "Manage Booking";
            this.Load += new System.EventHandler(this.Booking_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgBooking)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.numNoOfRoom)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numNoOfChildren)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.numNoOfAdult)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView dgBooking;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Button btnSearch;
        private System.Windows.Forms.ComboBox cbSearchBy;
        private System.Windows.Forms.CheckBox chkIsCancelled;
        private System.Windows.Forms.CheckBox chkPaymentStatus;
        private System.Windows.Forms.NumericUpDown numNoOfRoom;
        private System.Windows.Forms.NumericUpDown numNoOfChildren;
        private System.Windows.Forms.NumericUpDown numNoOfAdult;
        private System.Windows.Forms.TextBox txtSpecialRequests;
        private System.Windows.Forms.DateTimePicker dtpBookDate;
        private System.Windows.Forms.ComboBox cbCustomer;
        private System.Windows.Forms.TextBox txtBookID;
        private System.Windows.Forms.Button btnExit;
        private System.Windows.Forms.Button btnReset;
        private System.Windows.Forms.Button btnDelete;
        private System.Windows.Forms.Button btnUpdate;
        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Button btnReport;
    }
}