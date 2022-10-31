﻿
namespace ContentManagementSystem
{
    partial class MainFrm
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
            this.label2 = new System.Windows.Forms.Label();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.manageContentToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.manageRoomTypeToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.manageRoomToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.manageBedTypeToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.manageBedTypeToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.manageBookingToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.manageBookDetailToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.manageCustomerToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.manageEmployeeToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.profileToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.profileToolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.logoutToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.menuStrip1.SuspendLayout();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.Color.Transparent;
            this.label1.Font = new System.Drawing.Font("Segoe UI", 16.2F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point);
            this.label1.Location = new System.Drawing.Point(213, 28);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(374, 38);
            this.label1.TabIndex = 0;
            this.label1.Text = "Hotel Management System";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.BackColor = System.Drawing.Color.Transparent;
            this.label2.Font = new System.Drawing.Font("Segoe UI", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point);
            this.label2.Location = new System.Drawing.Point(261, 66);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(270, 28);
            this.label2.TabIndex = 0;
            this.label2.Text = "Content Management System";
            // 
            // menuStrip1
            // 
            this.menuStrip1.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.manageContentToolStripMenuItem,
            this.profileToolStripMenuItem});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(800, 28);
            this.menuStrip1.TabIndex = 1;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // manageContentToolStripMenuItem
            // 
            this.manageContentToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.manageRoomTypeToolStripMenuItem,
            this.manageRoomToolStripMenuItem,
            this.manageBedTypeToolStripMenuItem,
            this.manageBedTypeToolStripMenuItem1,
            this.manageBookingToolStripMenuItem,
            this.manageBookDetailToolStripMenuItem,
            this.manageCustomerToolStripMenuItem,
            this.manageEmployeeToolStripMenuItem});
            this.manageContentToolStripMenuItem.Name = "manageContentToolStripMenuItem";
            this.manageContentToolStripMenuItem.Size = new System.Drawing.Size(129, 24);
            this.manageContentToolStripMenuItem.Text = "ManageContent";
            // 
            // manageRoomTypeToolStripMenuItem
            // 
            this.manageRoomTypeToolStripMenuItem.Name = "manageRoomTypeToolStripMenuItem";
            this.manageRoomTypeToolStripMenuItem.Size = new System.Drawing.Size(261, 26);
            this.manageRoomTypeToolStripMenuItem.Text = "Manage RoomType";
            this.manageRoomTypeToolStripMenuItem.Click += new System.EventHandler(this.manageRoomTypeToolStripMenuItem_Click);
            // 
            // manageRoomToolStripMenuItem
            // 
            this.manageRoomToolStripMenuItem.Name = "manageRoomToolStripMenuItem";
            this.manageRoomToolStripMenuItem.Size = new System.Drawing.Size(261, 26);
            this.manageRoomToolStripMenuItem.Text = "Manage RoomTypeDetail";
            this.manageRoomToolStripMenuItem.Click += new System.EventHandler(this.manageRoomToolStripMenuItem_Click);
            // 
            // manageBedTypeToolStripMenuItem
            // 
            this.manageBedTypeToolStripMenuItem.Name = "manageBedTypeToolStripMenuItem";
            this.manageBedTypeToolStripMenuItem.Size = new System.Drawing.Size(261, 26);
            this.manageBedTypeToolStripMenuItem.Text = "Manage Room";
            // 
            // manageBedTypeToolStripMenuItem1
            // 
            this.manageBedTypeToolStripMenuItem1.Name = "manageBedTypeToolStripMenuItem1";
            this.manageBedTypeToolStripMenuItem1.Size = new System.Drawing.Size(261, 26);
            this.manageBedTypeToolStripMenuItem1.Text = "Manage BedType";
            // 
            // manageBookingToolStripMenuItem
            // 
            this.manageBookingToolStripMenuItem.Name = "manageBookingToolStripMenuItem";
            this.manageBookingToolStripMenuItem.Size = new System.Drawing.Size(261, 26);
            this.manageBookingToolStripMenuItem.Text = "Manage Booking";
            // 
            // manageBookDetailToolStripMenuItem
            // 
            this.manageBookDetailToolStripMenuItem.Name = "manageBookDetailToolStripMenuItem";
            this.manageBookDetailToolStripMenuItem.Size = new System.Drawing.Size(261, 26);
            this.manageBookDetailToolStripMenuItem.Text = "Manage BookDetail";
            // 
            // manageCustomerToolStripMenuItem
            // 
            this.manageCustomerToolStripMenuItem.Name = "manageCustomerToolStripMenuItem";
            this.manageCustomerToolStripMenuItem.Size = new System.Drawing.Size(261, 26);
            this.manageCustomerToolStripMenuItem.Text = "Manage Customer";
            // 
            // manageEmployeeToolStripMenuItem
            // 
            this.manageEmployeeToolStripMenuItem.Name = "manageEmployeeToolStripMenuItem";
            this.manageEmployeeToolStripMenuItem.Size = new System.Drawing.Size(261, 26);
            this.manageEmployeeToolStripMenuItem.Text = "Manage Employee";
            // 
            // profileToolStripMenuItem
            // 
            this.profileToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.profileToolStripMenuItem1,
            this.logoutToolStripMenuItem});
            this.profileToolStripMenuItem.Name = "profileToolStripMenuItem";
            this.profileToolStripMenuItem.Size = new System.Drawing.Size(89, 24);
            this.profileToolStripMenuItem.Text = "Username";
            // 
            // profileToolStripMenuItem1
            // 
            this.profileToolStripMenuItem1.Name = "profileToolStripMenuItem1";
            this.profileToolStripMenuItem1.Size = new System.Drawing.Size(139, 26);
            this.profileToolStripMenuItem1.Text = "Profile";
            // 
            // logoutToolStripMenuItem
            // 
            this.logoutToolStripMenuItem.Name = "logoutToolStripMenuItem";
            this.logoutToolStripMenuItem.Size = new System.Drawing.Size(139, 26);
            this.logoutToolStripMenuItem.Text = "Logout";
            // 
            // MainFrm
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 20F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackgroundImage = global::ContentManagementSystem.Properties.Resources.bg_2;
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Stretch;
            this.ClientSize = new System.Drawing.Size(800, 494);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.menuStrip1);
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "MainFrm";
            this.Text = "Hệ thống";
            this.Load += new System.EventHandler(this.MainForm_Load);
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem manageContentToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem manageRoomTypeToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem profileToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem profileToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem logoutToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem manageRoomToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem manageBedTypeToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem manageBedTypeToolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem manageBookingToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem manageBookDetailToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem manageCustomerToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem manageEmployeeToolStripMenuItem;
    }
}