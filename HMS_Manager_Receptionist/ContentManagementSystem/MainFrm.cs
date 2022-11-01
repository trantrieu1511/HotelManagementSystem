using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ContentManagementSystem
{
    public partial class MainFrm : Form
    {
        bool isManager = false;
        public MainFrm(bool isManager, string username)
        {
            this.isManager = isManager;
            InitializeComponent();
            usernameToolStripMenuItem.Text = "Welcome: " + username;
            if (this.isManager == false) //Receptionist
            {
                manageRoomTypeToolStripMenuItem.Visible = false;
                manageRoomTypeDetailToolStripMenuItem.Visible = false;
                manageBedTypeToolStripMenuItem.Visible = false;
                manageEmployeeToolStripMenuItem.Visible = false;
            }
        }

        private void manageRoomTypeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            RoomType rt = new RoomType();
            rt.Show();
        }

        private void manageRoomTypeDetailToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void manageRoomToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void manageBedTypeToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void manageBookingToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void manageBookDetailToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void manageCustomerToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void manageEmployeeToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void profileToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void logoutToolStripMenuItem_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn đăng xuất?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
            {
                this.Close();
            }
        }
    }
}
