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
        public bool isManager = false;
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
            RoomTypeFrm rtFrm = new RoomTypeFrm();
            rtFrm.Show();
        }

        private void manageRoomTypeDetailToolStripMenuItem_Click(object sender, EventArgs e)
        {
            RoomTypeDetailFrm rtdFrm = new RoomTypeDetailFrm();
            rtdFrm.Show();
        }

        private void manageRoomToolStripMenuItem_Click(object sender, EventArgs e)
        {
            RoomFrm roomFrm = new RoomFrm(isManager);
            roomFrm.Show();
        }

        private void manageBedTypeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            BedTypeFrm bedTypeFrm = new BedTypeFrm();
            bedTypeFrm.Show();
        }

        private void manageBookingToolStripMenuItem_Click(object sender, EventArgs e)
        {
            BookingFrm bookingFrm = new BookingFrm();
            bookingFrm.Show();
        }

        private void manageCustomerToolStripMenuItem_Click(object sender, EventArgs e)
        {
            CustomerFrm customerFrm = new CustomerFrm(isManager);
            customerFrm.Show();
        }

        private void manageEmployeeToolStripMenuItem_Click(object sender, EventArgs e)
        {
            EmployeeFrm empFrm = new EmployeeFrm();
            empFrm.Show();
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
