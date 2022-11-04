
namespace ContentManagementSystem
{
    partial class BookDetailFrm
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
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.groupBox2 = new System.Windows.Forms.GroupBox();
            this.txtRoomPrice = new System.Windows.Forms.TextBox();
            this.label12 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.txtRoomName = new System.Windows.Forms.TextBox();
            this.cbRoomType = new System.Windows.Forms.ComboBox();
            this.txtBookID = new System.Windows.Forms.TextBox();
            this.label11 = new System.Windows.Forms.Label();
            this.dgBookingDetail = new System.Windows.Forms.DataGridView();
            this.btnExit = new System.Windows.Forms.Button();
            this.txtAmount = new System.Windows.Forms.TextBox();
            this.dtpCheckOut = new System.Windows.Forms.DateTimePicker();
            this.btnReset = new System.Windows.Forms.Button();
            this.dtpCheckIn = new System.Windows.Forms.DateTimePicker();
            this.btnDelete = new System.Windows.Forms.Button();
            this.btnAdd = new System.Windows.Forms.Button();
            this.btnUpdate = new System.Windows.Forms.Button();
            this.txtRoomID = new System.Windows.Forms.TextBox();
            this.btnCancelBook = new System.Windows.Forms.Button();
            this.txtBD_ID = new System.Windows.Forms.TextBox();
            this.label8 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.groupBox3 = new System.Windows.Forms.GroupBox();
            this.label10 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.button7 = new System.Windows.Forms.Button();
            this.button8 = new System.Windows.Forms.Button();
            this.lblIsCancelled = new System.Windows.Forms.Label();
            this.groupBox1.SuspendLayout();
            this.groupBox2.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgBookingDetail)).BeginInit();
            this.groupBox3.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.SystemColors.ControlLight;
            this.label1.Font = new System.Drawing.Font("Segoe UI Semibold", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.label1.Location = new System.Drawing.Point(304, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(558, 38);
            this.label1.TabIndex = 0;
            this.label1.Text = "QUẢN LÝ HÓA ĐƠN ĐẶT PHÒNG CHI TIẾT";
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.lblIsCancelled);
            this.groupBox1.Controls.Add(this.groupBox2);
            this.groupBox1.Controls.Add(this.txtBookID);
            this.groupBox1.Controls.Add(this.label11);
            this.groupBox1.Controls.Add(this.dgBookingDetail);
            this.groupBox1.Controls.Add(this.btnExit);
            this.groupBox1.Controls.Add(this.txtAmount);
            this.groupBox1.Controls.Add(this.dtpCheckOut);
            this.groupBox1.Controls.Add(this.btnReset);
            this.groupBox1.Controls.Add(this.dtpCheckIn);
            this.groupBox1.Controls.Add(this.btnDelete);
            this.groupBox1.Controls.Add(this.btnAdd);
            this.groupBox1.Controls.Add(this.btnUpdate);
            this.groupBox1.Controls.Add(this.txtRoomID);
            this.groupBox1.Controls.Add(this.btnCancelBook);
            this.groupBox1.Controls.Add(this.txtBD_ID);
            this.groupBox1.Controls.Add(this.label8);
            this.groupBox1.Controls.Add(this.label7);
            this.groupBox1.Controls.Add(this.label6);
            this.groupBox1.Controls.Add(this.label3);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Font = new System.Drawing.Font("Segoe UI Semibold", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.groupBox1.Location = new System.Drawing.Point(703, 107);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(483, 668);
            this.groupBox1.TabIndex = 1;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Thông tin chi tiết đặt phòng";
            // 
            // groupBox2
            // 
            this.groupBox2.Controls.Add(this.txtRoomPrice);
            this.groupBox2.Controls.Add(this.label12);
            this.groupBox2.Controls.Add(this.label5);
            this.groupBox2.Controls.Add(this.label4);
            this.groupBox2.Controls.Add(this.txtRoomName);
            this.groupBox2.Controls.Add(this.cbRoomType);
            this.groupBox2.Location = new System.Drawing.Point(220, 0);
            this.groupBox2.Name = "groupBox2";
            this.groupBox2.Size = new System.Drawing.Size(257, 157);
            this.groupBox2.TabIndex = 3;
            this.groupBox2.TabStop = false;
            this.groupBox2.Text = "Thông tin chi tiết phòng";
            // 
            // txtRoomPrice
            // 
            this.txtRoomPrice.Location = new System.Drawing.Point(99, 123);
            this.txtRoomPrice.Name = "txtRoomPrice";
            this.txtRoomPrice.Size = new System.Drawing.Size(116, 27);
            this.txtRoomPrice.TabIndex = 17;
            // 
            // label12
            // 
            this.label12.AutoSize = true;
            this.label12.Location = new System.Drawing.Point(6, 126);
            this.label12.Name = "label12";
            this.label12.Size = new System.Drawing.Size(83, 20);
            this.label12.TabIndex = 16;
            this.label12.Text = "RoomPrice";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(6, 82);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(81, 20);
            this.label5.TabIndex = 0;
            this.label5.Text = "RoomType";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(6, 35);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(50, 20);
            this.label4.TabIndex = 0;
            this.label4.Text = "Name";
            // 
            // txtRoomName
            // 
            this.txtRoomName.Location = new System.Drawing.Point(99, 32);
            this.txtRoomName.Name = "txtRoomName";
            this.txtRoomName.Size = new System.Drawing.Size(116, 27);
            this.txtRoomName.TabIndex = 3;
            // 
            // cbRoomType
            // 
            this.cbRoomType.FormattingEnabled = true;
            this.cbRoomType.Location = new System.Drawing.Point(99, 79);
            this.cbRoomType.Name = "cbRoomType";
            this.cbRoomType.Size = new System.Drawing.Size(151, 28);
            this.cbRoomType.TabIndex = 5;
            // 
            // txtBookID
            // 
            this.txtBookID.Location = new System.Drawing.Point(108, 80);
            this.txtBookID.Name = "txtBookID";
            this.txtBookID.Size = new System.Drawing.Size(70, 27);
            this.txtBookID.TabIndex = 2;
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(15, 83);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(59, 20);
            this.label11.TabIndex = 15;
            this.label11.Text = "BookID";
            // 
            // dgBookingDetail
            // 
            this.dgBookingDetail.ColumnHeadersHeight = 29;
            this.dgBookingDetail.Location = new System.Drawing.Point(16, 434);
            this.dgBookingDetail.Name = "dgBookingDetail";
            this.dgBookingDetail.RowHeadersWidth = 51;
            this.dgBookingDetail.Size = new System.Drawing.Size(455, 228);
            this.dgBookingDetail.TabIndex = 15;
            this.dgBookingDetail.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgBookingDetail_CellClick);
            // 
            // btnExit
            // 
            this.btnExit.ForeColor = System.Drawing.Color.Crimson;
            this.btnExit.Location = new System.Drawing.Point(118, 381);
            this.btnExit.Name = "btnExit";
            this.btnExit.Size = new System.Drawing.Size(96, 41);
            this.btnExit.TabIndex = 14;
            this.btnExit.Text = "Exit";
            this.btnExit.UseVisualStyleBackColor = true;
            this.btnExit.Click += new System.EventHandler(this.btnExit_Click);
            // 
            // txtAmount
            // 
            this.txtAmount.Location = new System.Drawing.Point(108, 290);
            this.txtAmount.Name = "txtAmount";
            this.txtAmount.Size = new System.Drawing.Size(151, 27);
            this.txtAmount.TabIndex = 8;
            // 
            // dtpCheckOut
            // 
            this.dtpCheckOut.CustomFormat = "yyyy-MM-dd";
            this.dtpCheckOut.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpCheckOut.Location = new System.Drawing.Point(107, 242);
            this.dtpCheckOut.Name = "dtpCheckOut";
            this.dtpCheckOut.Size = new System.Drawing.Size(151, 27);
            this.dtpCheckOut.TabIndex = 7;
            // 
            // btnReset
            // 
            this.btnReset.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.btnReset.Location = new System.Drawing.Point(16, 381);
            this.btnReset.Name = "btnReset";
            this.btnReset.Size = new System.Drawing.Size(96, 41);
            this.btnReset.TabIndex = 13;
            this.btnReset.Text = "Reset";
            this.btnReset.UseVisualStyleBackColor = true;
            this.btnReset.Click += new System.EventHandler(this.btnReset_Click);
            // 
            // dtpCheckIn
            // 
            this.dtpCheckIn.CustomFormat = "yyyy-MM-dd";
            this.dtpCheckIn.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpCheckIn.Location = new System.Drawing.Point(108, 193);
            this.dtpCheckIn.Name = "dtpCheckIn";
            this.dtpCheckIn.Size = new System.Drawing.Size(150, 27);
            this.dtpCheckIn.TabIndex = 6;
            // 
            // btnDelete
            // 
            this.btnDelete.ForeColor = System.Drawing.Color.Green;
            this.btnDelete.Location = new System.Drawing.Point(220, 334);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(96, 41);
            this.btnDelete.TabIndex = 11;
            this.btnDelete.Text = "Delete";
            this.btnDelete.UseVisualStyleBackColor = true;
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
            // 
            // btnAdd
            // 
            this.btnAdd.ForeColor = System.Drawing.Color.Green;
            this.btnAdd.Location = new System.Drawing.Point(16, 334);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(96, 41);
            this.btnAdd.TabIndex = 9;
            this.btnAdd.Text = "Add";
            this.btnAdd.UseVisualStyleBackColor = true;
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);
            // 
            // btnUpdate
            // 
            this.btnUpdate.ForeColor = System.Drawing.Color.Green;
            this.btnUpdate.Location = new System.Drawing.Point(118, 334);
            this.btnUpdate.Name = "btnUpdate";
            this.btnUpdate.Size = new System.Drawing.Size(96, 41);
            this.btnUpdate.TabIndex = 10;
            this.btnUpdate.Text = "Update";
            this.btnUpdate.UseVisualStyleBackColor = true;
            this.btnUpdate.Click += new System.EventHandler(this.btnUpdate_Click);
            // 
            // txtRoomID
            // 
            this.txtRoomID.Location = new System.Drawing.Point(108, 124);
            this.txtRoomID.Name = "txtRoomID";
            this.txtRoomID.Size = new System.Drawing.Size(70, 27);
            this.txtRoomID.TabIndex = 4;
            // 
            // btnCancelBook
            // 
            this.btnCancelBook.Location = new System.Drawing.Point(335, 337);
            this.btnCancelBook.Name = "btnCancelBook";
            this.btnCancelBook.Size = new System.Drawing.Size(136, 38);
            this.btnCancelBook.TabIndex = 12;
            this.btnCancelBook.Text = "Cancel this book";
            this.btnCancelBook.UseVisualStyleBackColor = true;
            this.btnCancelBook.Click += new System.EventHandler(this.btnCancelBook_Click);
            // 
            // txtBD_ID
            // 
            this.txtBD_ID.Location = new System.Drawing.Point(108, 33);
            this.txtBD_ID.Name = "txtBD_ID";
            this.txtBD_ID.Size = new System.Drawing.Size(70, 27);
            this.txtBD_ID.TabIndex = 1;
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(15, 293);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(64, 20);
            this.label8.TabIndex = 0;
            this.label8.Text = "Amount";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(14, 247);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(75, 20);
            this.label7.TabIndex = 0;
            this.label7.Text = "CheckOut";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(15, 198);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(63, 20);
            this.label6.TabIndex = 0;
            this.label6.Text = "CheckIn";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(16, 127);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(64, 20);
            this.label3.TabIndex = 0;
            this.label3.Text = "RoomID";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(15, 36);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(50, 20);
            this.label2.TabIndex = 0;
            this.label2.Text = "BD_ID";
            // 
            // groupBox3
            // 
            this.groupBox3.BackColor = System.Drawing.SystemColors.Control;
            this.groupBox3.Controls.Add(this.label10);
            this.groupBox3.Controls.Add(this.label9);
            this.groupBox3.Controls.Add(this.button7);
            this.groupBox3.Controls.Add(this.button8);
            this.groupBox3.Font = new System.Drawing.Font("Segoe UI Semibold", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.groupBox3.Location = new System.Drawing.Point(12, 107);
            this.groupBox3.Name = "groupBox3";
            this.groupBox3.Size = new System.Drawing.Size(685, 103);
            this.groupBox3.TabIndex = 2;
            this.groupBox3.TabStop = false;
            this.groupBox3.Text = "Ghi chú";
            // 
            // label10
            // 
            this.label10.AutoSize = true;
            this.label10.Location = new System.Drawing.Point(71, 67);
            this.label10.Name = "label10";
            this.label10.Size = new System.Drawing.Size(337, 20);
            this.label10.TabIndex = 4;
            this.label10.Text = ": Phòng đã và đang có khách ở, không thể book";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(71, 31);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(260, 20);
            this.label9.TabIndex = 4;
            this.label9.Text = ": Phòng còn trống, sẵn sàng để book";
            // 
            // button7
            // 
            this.button7.BackColor = System.Drawing.Color.Crimson;
            this.button7.Enabled = false;
            this.button7.Location = new System.Drawing.Point(20, 62);
            this.button7.Name = "button7";
            this.button7.Size = new System.Drawing.Size(35, 30);
            this.button7.TabIndex = 0;
            this.button7.UseVisualStyleBackColor = false;
            // 
            // button8
            // 
            this.button8.BackColor = System.Drawing.Color.YellowGreen;
            this.button8.Enabled = false;
            this.button8.Location = new System.Drawing.Point(20, 26);
            this.button8.Name = "button8";
            this.button8.Size = new System.Drawing.Size(35, 30);
            this.button8.TabIndex = 0;
            this.button8.UseVisualStyleBackColor = false;
            // 
            // lblIsCancelled
            // 
            this.lblIsCancelled.AutoSize = true;
            this.lblIsCancelled.ForeColor = System.Drawing.Color.Crimson;
            this.lblIsCancelled.Location = new System.Drawing.Point(237, 382);
            this.lblIsCancelled.Name = "lblIsCancelled";
            this.lblIsCancelled.Size = new System.Drawing.Size(233, 40);
            this.lblIsCancelled.TabIndex = 16;
            this.lblIsCancelled.Text = "Đơn đã bị hủy đặt, hãy nhấn Exit\r\nđể tạo đơn mới";
            // 
            // BookDetailFrm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1198, 786);
            this.Controls.Add(this.groupBox3);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.label1);
            this.Name = "BookDetailFrm";
            this.Text = "Manage BookDetailFrm";
            this.Load += new System.EventHandler(this.BookDetailFrm_Load);
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.groupBox2.ResumeLayout(false);
            this.groupBox2.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.dgBookingDetail)).EndInit();
            this.groupBox3.ResumeLayout(false);
            this.groupBox3.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.ComboBox cbRoomType;
        private System.Windows.Forms.TextBox txtRoomID;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Button btnExit;
        private System.Windows.Forms.Button btnDelete;
        private System.Windows.Forms.Button btnReset;
        private System.Windows.Forms.Button btnUpdate;
        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.GroupBox groupBox3;
        private System.Windows.Forms.Label label10;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Button btnCancelBook;
        private System.Windows.Forms.TextBox txtAmount;
        private System.Windows.Forms.DateTimePicker dtpCheckOut;
        private System.Windows.Forms.DateTimePicker dtpCheckIn;
        private System.Windows.Forms.TextBox txtBD_ID;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Button button7;
        private System.Windows.Forms.Button button8;
        private System.Windows.Forms.DataGridView dgBookingDetail;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.TextBox txtBookID;
        private System.Windows.Forms.TextBox txtRoomName;
        private System.Windows.Forms.Label label12;
        private System.Windows.Forms.TextBox txtRoomPrice;
        private System.Windows.Forms.GroupBox groupBox2;
        private System.Windows.Forms.Label lblIsCancelled;
    }
}