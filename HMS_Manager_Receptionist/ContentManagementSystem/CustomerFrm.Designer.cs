
namespace ContentManagementSystem
{
    partial class CustomerFrm
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
            this.dgCustomer = new System.Windows.Forms.DataGridView();
            this.groupBox1 = new System.Windows.Forms.GroupBox();
            this.btnAdd = new System.Windows.Forms.Button();
            this.btnExit = new System.Windows.Forms.Button();
            this.txtPhonenumber = new System.Windows.Forms.TextBox();
            this.btnUpdate = new System.Windows.Forms.Button();
            this.txtEmail = new System.Windows.Forms.TextBox();
            this.btnReset = new System.Windows.Forms.Button();
            this.btnSearchByAddress = new System.Windows.Forms.Button();
            this.btnDelete = new System.Windows.Forms.Button();
            this.btnSearchByPhonenumber = new System.Windows.Forms.Button();
            this.btnSearchByEmail = new System.Windows.Forms.Button();
            this.btnSearchByDOB = new System.Windows.Forms.Button();
            this.btnSearchByGender = new System.Windows.Forms.Button();
            this.btnSearchByFirstname = new System.Windows.Forms.Button();
            this.btnSearchByLastname = new System.Windows.Forms.Button();
            this.dtpDOB = new System.Windows.Forms.DateTimePicker();
            this.txtAddress = new System.Windows.Forms.TextBox();
            this.rdoFemale = new System.Windows.Forms.RadioButton();
            this.rdoMale = new System.Windows.Forms.RadioButton();
            this.txtPassword = new System.Windows.Forms.TextBox();
            this.txtLastname = new System.Windows.Forms.TextBox();
            this.txtFirstname = new System.Windows.Forms.TextBox();
            this.txtCusID = new System.Windows.Forms.TextBox();
            this.label13 = new System.Windows.Forms.Label();
            this.label9 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.label7 = new System.Windows.Forms.Label();
            this.label11 = new System.Windows.Forms.Label();
            this.label5 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.lblFirstname = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dgCustomer)).BeginInit();
            this.groupBox1.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.SystemColors.ControlLight;
            this.label1.Font = new System.Drawing.Font("Segoe UI Semibold", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.label1.Location = new System.Drawing.Point(313, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(326, 38);
            this.label1.TabIndex = 0;
            this.label1.Text = "QUẢN LÝ KHÁCH HÀNG";
            // 
            // dgCustomer
            // 
            this.dgCustomer.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dgCustomer.Location = new System.Drawing.Point(12, 412);
            this.dgCustomer.Name = "dgCustomer";
            this.dgCustomer.RowHeadersWidth = 51;
            this.dgCustomer.RowTemplate.Height = 29;
            this.dgCustomer.Size = new System.Drawing.Size(958, 307);
            this.dgCustomer.TabIndex = 21;
            this.dgCustomer.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dgCustomer_CellClick);
            // 
            // groupBox1
            // 
            this.groupBox1.Controls.Add(this.btnAdd);
            this.groupBox1.Controls.Add(this.btnExit);
            this.groupBox1.Controls.Add(this.txtPhonenumber);
            this.groupBox1.Controls.Add(this.btnUpdate);
            this.groupBox1.Controls.Add(this.txtEmail);
            this.groupBox1.Controls.Add(this.btnReset);
            this.groupBox1.Controls.Add(this.btnSearchByAddress);
            this.groupBox1.Controls.Add(this.btnDelete);
            this.groupBox1.Controls.Add(this.btnSearchByPhonenumber);
            this.groupBox1.Controls.Add(this.btnSearchByEmail);
            this.groupBox1.Controls.Add(this.btnSearchByDOB);
            this.groupBox1.Controls.Add(this.btnSearchByGender);
            this.groupBox1.Controls.Add(this.btnSearchByFirstname);
            this.groupBox1.Controls.Add(this.btnSearchByLastname);
            this.groupBox1.Controls.Add(this.dtpDOB);
            this.groupBox1.Controls.Add(this.txtAddress);
            this.groupBox1.Controls.Add(this.rdoFemale);
            this.groupBox1.Controls.Add(this.rdoMale);
            this.groupBox1.Controls.Add(this.txtPassword);
            this.groupBox1.Controls.Add(this.txtLastname);
            this.groupBox1.Controls.Add(this.txtFirstname);
            this.groupBox1.Controls.Add(this.txtCusID);
            this.groupBox1.Controls.Add(this.label13);
            this.groupBox1.Controls.Add(this.label9);
            this.groupBox1.Controls.Add(this.label8);
            this.groupBox1.Controls.Add(this.label7);
            this.groupBox1.Controls.Add(this.label11);
            this.groupBox1.Controls.Add(this.label5);
            this.groupBox1.Controls.Add(this.label4);
            this.groupBox1.Controls.Add(this.lblFirstname);
            this.groupBox1.Controls.Add(this.label2);
            this.groupBox1.Font = new System.Drawing.Font("Segoe UI Semibold", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.groupBox1.Location = new System.Drawing.Point(12, 83);
            this.groupBox1.Name = "groupBox1";
            this.groupBox1.Size = new System.Drawing.Size(958, 323);
            this.groupBox1.TabIndex = 2;
            this.groupBox1.TabStop = false;
            this.groupBox1.Text = "Thông tin của nhân viên";
            // 
            // btnAdd
            // 
            this.btnAdd.ForeColor = System.Drawing.Color.Green;
            this.btnAdd.Location = new System.Drawing.Point(855, 207);
            this.btnAdd.Name = "btnAdd";
            this.btnAdd.Size = new System.Drawing.Size(87, 29);
            this.btnAdd.TabIndex = 18;
            this.btnAdd.Text = "Add";
            this.btnAdd.UseVisualStyleBackColor = true;
            this.btnAdd.Click += new System.EventHandler(this.btnAdd_Click);
            // 
            // btnExit
            // 
            this.btnExit.ForeColor = System.Drawing.Color.Red;
            this.btnExit.Location = new System.Drawing.Point(855, 278);
            this.btnExit.Name = "btnExit";
            this.btnExit.Size = new System.Drawing.Size(87, 29);
            this.btnExit.TabIndex = 22;
            this.btnExit.Text = "Exit";
            this.btnExit.UseVisualStyleBackColor = true;
            this.btnExit.Click += new System.EventHandler(this.btnExit_Click);
            // 
            // txtPhonenumber
            // 
            this.txtPhonenumber.Location = new System.Drawing.Point(546, 135);
            this.txtPhonenumber.Name = "txtPhonenumber";
            this.txtPhonenumber.Size = new System.Drawing.Size(163, 27);
            this.txtPhonenumber.TabIndex = 15;
            // 
            // btnUpdate
            // 
            this.btnUpdate.ForeColor = System.Drawing.Color.Green;
            this.btnUpdate.Location = new System.Drawing.Point(762, 242);
            this.btnUpdate.Name = "btnUpdate";
            this.btnUpdate.Size = new System.Drawing.Size(87, 29);
            this.btnUpdate.TabIndex = 19;
            this.btnUpdate.Text = "Update";
            this.btnUpdate.UseVisualStyleBackColor = true;
            this.btnUpdate.Click += new System.EventHandler(this.btnUpdate_Click);
            // 
            // txtEmail
            // 
            this.txtEmail.Location = new System.Drawing.Point(546, 81);
            this.txtEmail.Name = "txtEmail";
            this.txtEmail.Size = new System.Drawing.Size(228, 27);
            this.txtEmail.TabIndex = 13;
            // 
            // btnReset
            // 
            this.btnReset.ForeColor = System.Drawing.SystemColors.ControlDarkDark;
            this.btnReset.Location = new System.Drawing.Point(762, 278);
            this.btnReset.Name = "btnReset";
            this.btnReset.Size = new System.Drawing.Size(87, 29);
            this.btnReset.TabIndex = 21;
            this.btnReset.Text = "Reset";
            this.btnReset.UseVisualStyleBackColor = true;
            this.btnReset.Click += new System.EventHandler(this.btnReset_Click);
            // 
            // btnSearchByAddress
            // 
            this.btnSearchByAddress.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.btnSearchByAddress.Location = new System.Drawing.Point(570, 239);
            this.btnSearchByAddress.Name = "btnSearchByAddress";
            this.btnSearchByAddress.Size = new System.Drawing.Size(139, 29);
            this.btnSearchByAddress.TabIndex = 10;
            this.btnSearchByAddress.Text = "SearchByAddress";
            this.btnSearchByAddress.UseVisualStyleBackColor = true;
            this.btnSearchByAddress.Click += new System.EventHandler(this.btnSearchByAddress_Click);
            // 
            // btnDelete
            // 
            this.btnDelete.ForeColor = System.Drawing.Color.Green;
            this.btnDelete.Location = new System.Drawing.Point(855, 242);
            this.btnDelete.Name = "btnDelete";
            this.btnDelete.Size = new System.Drawing.Size(87, 29);
            this.btnDelete.TabIndex = 20;
            this.btnDelete.Text = "Delete";
            this.btnDelete.UseVisualStyleBackColor = true;
            this.btnDelete.Click += new System.EventHandler(this.btnDelete_Click);
            // 
            // btnSearchByPhonenumber
            // 
            this.btnSearchByPhonenumber.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.btnSearchByPhonenumber.Location = new System.Drawing.Point(795, 134);
            this.btnSearchByPhonenumber.Name = "btnSearchByPhonenumber";
            this.btnSearchByPhonenumber.Size = new System.Drawing.Size(139, 29);
            this.btnSearchByPhonenumber.TabIndex = 16;
            this.btnSearchByPhonenumber.Text = "SearchByPhone#";
            this.btnSearchByPhonenumber.UseVisualStyleBackColor = true;
            this.btnSearchByPhonenumber.Click += new System.EventHandler(this.btnSearchByPhonenumber_Click);
            // 
            // btnSearchByEmail
            // 
            this.btnSearchByEmail.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.btnSearchByEmail.Location = new System.Drawing.Point(795, 80);
            this.btnSearchByEmail.Name = "btnSearchByEmail";
            this.btnSearchByEmail.Size = new System.Drawing.Size(139, 29);
            this.btnSearchByEmail.TabIndex = 14;
            this.btnSearchByEmail.Text = "SearchByEmail";
            this.btnSearchByEmail.UseVisualStyleBackColor = true;
            this.btnSearchByEmail.Click += new System.EventHandler(this.btnSearchByEmail_Click);
            // 
            // btnSearchByDOB
            // 
            this.btnSearchByDOB.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.btnSearchByDOB.Location = new System.Drawing.Point(795, 28);
            this.btnSearchByDOB.Name = "btnSearchByDOB";
            this.btnSearchByDOB.Size = new System.Drawing.Size(139, 29);
            this.btnSearchByDOB.TabIndex = 12;
            this.btnSearchByDOB.Text = "SearchByDOB";
            this.btnSearchByDOB.UseVisualStyleBackColor = true;
            this.btnSearchByDOB.Click += new System.EventHandler(this.btnSearchByDOB_Click);
            // 
            // btnSearchByGender
            // 
            this.btnSearchByGender.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.btnSearchByGender.Location = new System.Drawing.Point(284, 184);
            this.btnSearchByGender.Name = "btnSearchByGender";
            this.btnSearchByGender.Size = new System.Drawing.Size(151, 29);
            this.btnSearchByGender.TabIndex = 8;
            this.btnSearchByGender.Text = "SearchByGender";
            this.btnSearchByGender.UseVisualStyleBackColor = true;
            this.btnSearchByGender.Click += new System.EventHandler(this.btnSearchByGender_Click);
            // 
            // btnSearchByFirstname
            // 
            this.btnSearchByFirstname.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.btnSearchByFirstname.Location = new System.Drawing.Point(284, 130);
            this.btnSearchByFirstname.Name = "btnSearchByFirstname";
            this.btnSearchByFirstname.Size = new System.Drawing.Size(151, 29);
            this.btnSearchByFirstname.TabIndex = 5;
            this.btnSearchByFirstname.Text = "SearchByFirstname";
            this.btnSearchByFirstname.UseVisualStyleBackColor = true;
            this.btnSearchByFirstname.Click += new System.EventHandler(this.btnSearchByFirstname_Click);
            // 
            // btnSearchByLastname
            // 
            this.btnSearchByLastname.ForeColor = System.Drawing.SystemColors.ButtonHighlight;
            this.btnSearchByLastname.Location = new System.Drawing.Point(284, 80);
            this.btnSearchByLastname.Name = "btnSearchByLastname";
            this.btnSearchByLastname.Size = new System.Drawing.Size(151, 29);
            this.btnSearchByLastname.TabIndex = 3;
            this.btnSearchByLastname.Text = "SearchByLastname";
            this.btnSearchByLastname.UseVisualStyleBackColor = true;
            this.btnSearchByLastname.Click += new System.EventHandler(this.btnSearchByLastname_Click);
            // 
            // dtpDOB
            // 
            this.dtpDOB.CustomFormat = "dd/MM/yyyy";
            this.dtpDOB.Format = System.Windows.Forms.DateTimePickerFormat.Custom;
            this.dtpDOB.Location = new System.Drawing.Point(546, 27);
            this.dtpDOB.Name = "dtpDOB";
            this.dtpDOB.Size = new System.Drawing.Size(163, 27);
            this.dtpDOB.TabIndex = 11;
            // 
            // txtAddress
            // 
            this.txtAddress.Location = new System.Drawing.Point(107, 239);
            this.txtAddress.Multiline = true;
            this.txtAddress.Name = "txtAddress";
            this.txtAddress.Size = new System.Drawing.Size(441, 68);
            this.txtAddress.TabIndex = 9;
            // 
            // rdoFemale
            // 
            this.rdoFemale.AutoSize = true;
            this.rdoFemale.Location = new System.Drawing.Point(190, 186);
            this.rdoFemale.Name = "rdoFemale";
            this.rdoFemale.Size = new System.Drawing.Size(79, 24);
            this.rdoFemale.TabIndex = 7;
            this.rdoFemale.TabStop = true;
            this.rdoFemale.Text = "Female";
            this.rdoFemale.UseVisualStyleBackColor = true;
            // 
            // rdoMale
            // 
            this.rdoMale.AutoSize = true;
            this.rdoMale.Location = new System.Drawing.Point(107, 186);
            this.rdoMale.Name = "rdoMale";
            this.rdoMale.Size = new System.Drawing.Size(64, 24);
            this.rdoMale.TabIndex = 6;
            this.rdoMale.TabStop = true;
            this.rdoMale.Text = "Male";
            this.rdoMale.UseVisualStyleBackColor = true;
            // 
            // txtPassword
            // 
            this.txtPassword.Location = new System.Drawing.Point(546, 185);
            this.txtPassword.Name = "txtPassword";
            this.txtPassword.Size = new System.Drawing.Size(163, 27);
            this.txtPassword.TabIndex = 17;
            // 
            // txtLastname
            // 
            this.txtLastname.Location = new System.Drawing.Point(107, 81);
            this.txtLastname.Name = "txtLastname";
            this.txtLastname.Size = new System.Drawing.Size(162, 27);
            this.txtLastname.TabIndex = 2;
            // 
            // txtFirstname
            // 
            this.txtFirstname.Location = new System.Drawing.Point(107, 131);
            this.txtFirstname.Name = "txtFirstname";
            this.txtFirstname.Size = new System.Drawing.Size(162, 27);
            this.txtFirstname.TabIndex = 4;
            // 
            // txtCusID
            // 
            this.txtCusID.Location = new System.Drawing.Point(107, 29);
            this.txtCusID.Name = "txtCusID";
            this.txtCusID.Size = new System.Drawing.Size(75, 27);
            this.txtCusID.TabIndex = 1;
            // 
            // label13
            // 
            this.label13.AutoSize = true;
            this.label13.Location = new System.Drawing.Point(20, 242);
            this.label13.Name = "label13";
            this.label13.Size = new System.Drawing.Size(63, 20);
            this.label13.TabIndex = 1;
            this.label13.Text = "Address";
            // 
            // label9
            // 
            this.label9.AutoSize = true;
            this.label9.Location = new System.Drawing.Point(459, 136);
            this.label9.Name = "label9";
            this.label9.Size = new System.Drawing.Size(62, 20);
            this.label9.TabIndex = 1;
            this.label9.Text = "Phone#";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(20, 186);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(59, 20);
            this.label8.TabIndex = 1;
            this.label8.Text = "Gender";
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Location = new System.Drawing.Point(459, 84);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(46, 20);
            this.label7.TabIndex = 1;
            this.label7.Text = "Email";
            // 
            // label11
            // 
            this.label11.AutoSize = true;
            this.label11.Location = new System.Drawing.Point(459, 186);
            this.label11.Name = "label11";
            this.label11.Size = new System.Drawing.Size(73, 20);
            this.label11.TabIndex = 1;
            this.label11.Text = "Password";
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(459, 32);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(40, 20);
            this.label5.TabIndex = 1;
            this.label5.Text = "DOB";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(20, 84);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(73, 20);
            this.label4.TabIndex = 1;
            this.label4.Text = "Lastname";
            // 
            // lblFirstname
            // 
            this.lblFirstname.AutoSize = true;
            this.lblFirstname.Location = new System.Drawing.Point(20, 134);
            this.lblFirstname.Name = "lblFirstname";
            this.lblFirstname.Size = new System.Drawing.Size(76, 20);
            this.lblFirstname.TabIndex = 1;
            this.lblFirstname.Text = "Firstname";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(20, 32);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(48, 20);
            this.label2.TabIndex = 0;
            this.label2.Text = "CusID";
            // 
            // CustomerFrm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(982, 731);
            this.Controls.Add(this.groupBox1);
            this.Controls.Add(this.dgCustomer);
            this.Controls.Add(this.label1);
            this.Name = "CustomerFrm";
            this.Text = "Manage CustomerFrm";
            this.Load += new System.EventHandler(this.CustomerFrm_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dgCustomer)).EndInit();
            this.groupBox1.ResumeLayout(false);
            this.groupBox1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView dgCustomer;
        private System.Windows.Forms.GroupBox groupBox1;
        private System.Windows.Forms.Label label13;
        private System.Windows.Forms.Label label9;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.Label label11;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Label lblFirstname;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox txtLastname;
        private System.Windows.Forms.TextBox txtFirstname;
        private System.Windows.Forms.TextBox txtCusID;
        private System.Windows.Forms.TextBox txtPhonenumber;
        private System.Windows.Forms.TextBox txtEmail;
        private System.Windows.Forms.DateTimePicker dtpDOB;
        private System.Windows.Forms.TextBox txtAddress;
        private System.Windows.Forms.RadioButton rdoFemale;
        private System.Windows.Forms.RadioButton rdoMale;
        private System.Windows.Forms.TextBox txtPassword;
        private System.Windows.Forms.Button btnExit;
        private System.Windows.Forms.Button btnReset;
        private System.Windows.Forms.Button btnDelete;
        private System.Windows.Forms.Button btnUpdate;
        private System.Windows.Forms.Button btnAdd;
        private System.Windows.Forms.Button btnSearchByAddress;
        private System.Windows.Forms.Button btnSearchByPhonenumber;
        private System.Windows.Forms.Button btnSearchByEmail;
        private System.Windows.Forms.Button btnSearchByDOB;
        private System.Windows.Forms.Button btnSearchByGender;
        private System.Windows.Forms.Button btnSearchByFirstname;
        private System.Windows.Forms.Button btnSearchByLastname;
    }
}