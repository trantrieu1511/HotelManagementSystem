using ContentManagementSystem.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace ContentManagementSystem
{
    public partial class RoomFrm : Form
    {
        public RoomFrm(bool isManager)
        {
            InitializeComponent();
            txtRoomID.Enabled = false;
            numericUpDownFloor.Minimum = 1;
            numericUpDownFloor.Maximum = 7;
            if (!isManager) //Nhân viên lễ tân được quyền chỉnh sửa trạng thái của phòng, Quản lý có thể làm mọi thứ
            {
                btnAdd.Enabled = false;
                btnDelete.Enabled = false;
            }
        }

        private void RoomFrm_Load(object sender, EventArgs e)
        {
            loadData();
        }

        int cur_selectedValue = 1;

        Button room = new Button();
        List<Button> listRoom = new List<Button>();
        int cur_x_coordinate = 0;
        int cur_y_coordinate = 0;
        int x_coordinate = 101;
        int y_coordinate = 91;
        private void loadData()
        {
            using (MyHotelContext context = new MyHotelContext())
            {
                var roomdata = context.Rooms.ToList();

                //remove old rooms
                foreach (var item in listRoom)
                {
                    this.Controls.Remove(item);
                }
                /*for (int i = 0; i < listRoom.Count; i++)
                {
                    this.Controls.Remove(listRoom[i]);
                }*/

                //reset listRoom and all its coordinates
                listRoom.Clear();
                cur_x_coordinate = 0;
                cur_y_coordinate = 0;

                //load new rooms
                for (int i = 0; i < roomdata.Count; i++)
                {
                    room = new Button();
                    room.Location = new Point(50 + cur_x_coordinate, 200 + cur_y_coordinate);
                    cur_x_coordinate += x_coordinate;
                    if (cur_x_coordinate == 707)
                    {
                        cur_x_coordinate = 0;
                        cur_y_coordinate += y_coordinate;
                    }
                    room.Name = "room" + roomdata[i].RoomId;
                    room.Size = new Size(95, 85);
                    room.TabIndex = (i + 1);
                    room.Text = roomdata[i].Name;
                    room.UseVisualStyleBackColor = true;
                    if (roomdata[i].IsAvailable == true)
                    {
                        room.BackColor = Color.YellowGreen;
                    }
                    else
                    {
                        room.BackColor = Color.Crimson;
                    }
                    room.Click += Room_Click;
                    listRoom.Add(room);
                    this.Controls.Add(room);
                }
                cbRoomType.DataSource = context.RoomTypes.ToList();
                cbRoomType.DisplayMember = "Name";
                cbRoomType.ValueMember = "RoomTypeId";
                cbRoomType.SelectedValue = cur_selectedValue;
            }
        }

        private void Room_Click(object sender, EventArgs e)
        {
            using (MyHotelContext context = new MyHotelContext())
            {
                //MessageBox.Show((sender as Button).Text);
                foreach (var item in context.Rooms.ToList())
                {
                    if ((sender as Button).Text == item.Name)
                    {
                        txtRoomID.Text = item.RoomId.ToString();
                        txtName.Text = item.Name;
                        cbRoomType.SelectedValue = item.RoomTypeId;
                        numericUpDownFloor.Value = item.Floor;
                        txtView.Text = item.View;
                        chkIsAvailable.Checked = false;
                        if (item.IsAvailable == true)
                        {
                            chkIsAvailable.Checked = true;
                        }
                    }
                }
            }

        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            using (MyHotelContext context = new MyHotelContext())
            {
                if (context.Rooms.ToList().Count >= 35)
                {
                    MessageBox.Show("Số phòng có thể thêm đã đạt tới mức giới hạn!");
                    return;
                }
                else
                {
                    if (string.IsNullOrWhiteSpace(txtName.Text))
                    {
                        MessageBox.Show("Tên phòng không được trống! Làm ơn nhập lại!");
                        return;
                    }
                    if (string.IsNullOrWhiteSpace(txtView.Text))
                    {
                        MessageBox.Show("Tầm nhìn hướng ra ngoài (View) của phòng không được trống! Làm ơn nhập lại!");
                        return;
                    }

                    //Tạo đối tượng sẽ insert
                    Room room = new Room
                    {
                        Name = txtName.Text,
                        RoomTypeId = (int)cbRoomType.SelectedValue,
                        Floor = (int)numericUpDownFloor.Value,
                        View = txtView.Text,
                        IsAvailable = chkIsAvailable.Checked
                    };
                    context.Rooms.Add(room);
                    if (context.SaveChanges() > 0)
                    {
                        MessageBox.Show("Insert successfully!");
                    }
                    loadData();
                }
            }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtRoomID.Text))
            {
                MessageBox.Show("Mã phòng đang bị trống! Làm ơn chọn một phòng bất kỳ ở bên để cập nhật!");
                return;
            }
            /*if (!Regex.IsMatch(txtEmail.Text.Trim(), "[a-zA-Z0-9]{1,18}[@][a-z]{1,8}[.][a-z]{1,8}"))
            {
                MessageBox.Show("Email must not contain: Unicode characters, special characters other than @ and . ; " +
                    "Allow uppercase, lowercase letters and numeric characters(0 - 9), maximum length of parts of email: " +
                    "username: 18, mail server: 8, domain: 8; max length: 34");
                return;
            }*/

            using (MyHotelContext context = new MyHotelContext())
            {
                //Tìm Room muốn update
                Room room = context.Rooms
                    .SingleOrDefault(item => item.RoomId == Convert.ToInt32(txtRoomID.Text));

                //Setting lại những giá trị muốn update
                room.Name = txtName.Text;
                room.RoomTypeId = (int)cbRoomType.SelectedValue;
                room.Floor = (int)numericUpDownFloor.Value;
                room.View = txtView.Text;
                room.IsAvailable = chkIsAvailable.Checked;

                if (context.SaveChanges() > 0)
                {
                    MessageBox.Show("Update successfully!");
                }
                cur_selectedValue = (int)cbRoomType.SelectedValue;
                loadData();
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtRoomID.Text))
            {
                MessageBox.Show("Mã phòng đang bị trống! Làm ơn chọn một phòng bất kỳ ở bên để xóa!");
                return;
            }

            using (MyHotelContext context = new MyHotelContext())
            {
                //Tìm Room sẽ delete
                Room room = context.Rooms
                    .SingleOrDefault(item => item.RoomId == Convert.ToInt32(txtRoomID.Text));

                if (MessageBox.Show("Bạn có muốn xóa thông tin phòng này?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
                {
                    context.Rooms.Remove(room);
                    if (context.SaveChanges() > 0)
                    {
                        MessageBox.Show("Delete successfully!");
                    }
                    loadData();
                    resetFields();
                }
            }
        }

        private void btnReset_Click(object sender, EventArgs e)
        {
            loadData();
            resetFields();
        }

        private void resetFields()
        {
            txtRoomID.Text = "";
            txtName.Text = "";
            cbRoomType.Text = "";
            numericUpDownFloor.Value = numericUpDownFloor.Minimum;
            txtView.Text = "";
            chkIsAvailable.Checked = false;
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn thoát?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
            {
                this.Close();
            }
        }
    }
}
