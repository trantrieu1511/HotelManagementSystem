using ContentManagementSystem.Models;
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
    public partial class BookDetailFrm : Form
    {
        int BookID = 0;
        bool isCancelled = false;
        bool paymentStatus = false;
        public BookDetailFrm(int BookID, bool isCancelled, bool paymentStatus)
        {
            InitializeComponent();
            /*MessageBox.Show(BookID.ToString());*/
            dgBookingDetail.AllowUserToAddRows = false;
            this.BookID = BookID;
            this.isCancelled = isCancelled;
            this.paymentStatus = paymentStatus;
            txtBookID.Text = BookID.ToString();
            txtBookID.Enabled = false;
            txtBD_ID.Enabled = false;
            cbRoomType.Enabled = false;
            txtBookID.Enabled = false;
            txtRoomID.Enabled = false;
            txtRoomName.Enabled = false;
            txtRoomPrice.Enabled = false;
            txtAmount.ReadOnly = true;
            lblIsCancelled.Visible = false;
        }

        private void BookDetailFrm_Load(object sender, EventArgs e)
        {
            loadData();
        }

        int cur_selectedValue = 1;

        Button room = new Button();
        List<Button> listRoom = new List<Button>();
        int cur_x_coordinate = 0;
        int cur_y_coordinate = 0;
        int x_coordinate = 91;
        int y_coordinate = 81;

        private void loadData()
        {
            using (MyHotelContext context = new MyHotelContext())
            {
                if (isCancelled || paymentStatus)
                {
                    btnAdd.Enabled = false;
                    btnUpdate.Enabled = false;
                    btnDelete.Enabled = false;
                    btnCancelBook.Enabled = false;
                    btnReset.Enabled = false;
                    lblIsCancelled.Text = (isCancelled ? "Đơn đã bị hủy đặt, hãy nhấn Exit\nđể tạo đơn mới" :
                        "Đơn đã được trả tiền, hãy nhấn Exit\nđể tạo đơn mới");
                    lblIsCancelled.Visible = true;
                }

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
                    room.Location = new Point(32 + cur_x_coordinate, 234 + cur_y_coordinate);
                    cur_x_coordinate += x_coordinate;
                    if (cur_x_coordinate == 637)
                    {
                        cur_x_coordinate = 0;
                        cur_y_coordinate += y_coordinate;
                    }
                    room.Name = "room" + roomdata[i].RoomId;
                    room.Size = new Size(85, 75);
                    room.TabIndex = (i + 1) + 15;
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

                //dgBookingDetail data
                dgBookingDetail.Columns.Clear();
                dgBookingDetail.DataSource = null;
                if (context.BookDetails.Where(b => b.BookId == BookID).ToList().Count == 0)
                {
                    dgBookingDetail.Columns.Add("header", "Trạng thái chi tiết đặt phòng");
                    dgBookingDetail.Rows.Add(new object[] { "Trống, chưa có chi tiết đặt phòng trong hóa đơn này!" });
                }
                else
                {
                    DataTable dt = new DataTable();
                    var dataDgBookDetail = context.BookDetails
                        .Select(b => new
                        {
                            BD_ID = b.BdId,
                            BookId = b.BookId,
                            RoomID = b.RoomId,
                            RoomName = b.Room.Name,
                            RoomType = b.Room.RoomType.Name,
                            RoomPrice = b.Room.RoomType.Price,
                            CheckIn = b.CheckIn,
                            CheckOut = b.CheckOut,
                            Amount = b.Amount
                        })
                        .Where(b => b.BookId == BookID)
                        .ToList();

                    dt.Columns.Add("Mã HĐ đặt phòng chi tiết", typeof(string));
                    dt.Columns.Add("Mã HĐ đặt phòng", typeof(string));
                    dt.Columns.Add("Mã phòng", typeof(string));
                    dt.Columns.Add("Tên phòng", typeof(string));
                    dt.Columns.Add("Kiểu phòng", typeof(string));
                    dt.Columns.Add("Giá phòng", typeof(string));
                    dt.Columns.Add("Ngày vào", typeof(string));
                    dt.Columns.Add("Ngày ra", typeof(string));
                    dt.Columns.Add("Thành tiền (giá phòng * ngày)", typeof(string));
                    foreach (var item in dataDgBookDetail)
                    {
                        dt.Rows.Add(new object[] {
                            item.BD_ID,
                            item.BookId,
                            item.RoomID,
                            item.RoomName,
                            item.RoomType,
                            item.RoomPrice,
                            item.CheckIn.Day + "/" + item.CheckIn.Month + "/" + item.CheckIn.Year,
                            item.CheckOut.Day + "/" + item.CheckOut.Month + "/" + item.CheckOut.Year,
                            item.Amount
                        });
                    }
                    dgBookingDetail.DataSource = dt;
                    /*dgBookingDetail.Columns["BookId"].HeaderText = "Mã HĐ đặt phòng chi tiết";
                    dgBookingDetail.Columns["BookId"].HeaderText = "Mã HĐ đặt phòng";
                    dgBookingDetail.Columns["RoomName"].HeaderText = "Tên phòng";
                    dgBookingDetail.Columns["CheckIn"].HeaderText = "Ngày vào";
                    dgBookingDetail.Columns["CheckOut"].HeaderText = "Ngày ra";
                    dgBookingDetail.Columns["Amount"].HeaderText = "Thành tiền (giá phòng * ngày)";*/
                }
            }
        }

        private void Room_Click(object sender, EventArgs e)
        {
            using (MyHotelContext context = new MyHotelContext())
            {
                //MessageBox.Show((sender as Button).Text);
                foreach (var item in context.Rooms.Select(r => new { RoomId = r.RoomId, Name = r.Name, RoomTypeId = r.RoomTypeId, RoomPrice = r.RoomType.Price }).ToList())
                {
                    if ((sender as Button).Text == item.Name)
                    {
                        txtRoomID.Text = item.RoomId.ToString();
                        txtRoomName.Text = item.Name;
                        cbRoomType.SelectedValue = item.RoomTypeId;
                        txtRoomPrice.Text = item.RoomPrice.ToString();
                    }
                }
            }
        }

        private void btnCancelBook_Click(object sender, EventArgs e)
        {
            using (MyHotelContext context = new MyHotelContext())
            {
                var dataDgBookDetail = context.BookDetails.Where(b => b.BookId == BookID).ToList();
                if (dataDgBookDetail.Count == 0)
                {
                    MessageBox.Show("Không thể hủy đặt phòng cho đơn này nếu như chưa có chi tiết đặt phòng. Bạn có thể xóa trực tiếp hóa đơn này ở quản lý đặt phòng!");
                    return;
                }
                else
                {
                    /*if (context.Bookings.SingleOrDefault(b => b.BookId == Convert.ToInt32(txtBookID.Text)).IsCancelled)
                    {
                        MessageBox.Show("Bạn đã hủy HĐ đặt phòng này! Làm ơn tạo đơn mới!");
                    }
                    else
                    {*/
                    //Tìm Booking muốn update
                    Booking book = context.Bookings
                    .SingleOrDefault(item => item.BookId == Convert.ToInt32(txtBookID.Text));

                    if (MessageBox.Show("Bạn có muốn hủy đặt thông tin chi tiết của HĐ đặt phòng này?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
                    {
                        //Setting lại những giá trị muốn update
                        book.PaymentStatus = true;
                        book.IsCancelled = true;

                        if (context.SaveChanges() > 0)
                        {
                            MessageBox.Show("Cancelled successfully!");
                            for (int i = 0; i < dataDgBookDetail.Count; i++)
                            {
                                //Tìm Room muốn update trạng thái thành trống
                                Room room = context.Rooms
                                    .SingleOrDefault(item => item.RoomId == Convert.ToInt32(dgBookingDetail.Rows[i].Cells[2].FormattedValue.ToString()));

                                //Setting lại những giá trị muốn update
                                room.IsAvailable = true;

                                if (context.SaveChanges() > 0)
                                {
                                    //MessageBox.Show("Update room " + dgBookingDetail.Rows[i].Cells[2].FormattedValue.ToString() + " to available successfully!");
                                }
                            }
                        }
                        isCancelled = true;
                        loadData();
                        /*}*/
                    }
                }
            }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtRoomID.Text))
            {
                MessageBox.Show("Mã phòng đang bị trống! Làm ơn chọn một phòng bất kỳ trong danh sách ở cạnh bên!");
                return;
            }
            //MessageBox.Show((dtpCheckOut.Value - dtpCheckIn.Value).Days.ToString());
            //MessageBox.Show((dtpCheckOut.Value.Day - dtpCheckIn.Value.Day).ToString());
            if ((dtpCheckOut.Value.Day - dtpCheckIn.Value.Day) <= 0)
            {
                MessageBox.Show("Ngày rời đi phải lớn hơn ngày đến! Làm ơn chọn lại!");
                return;
            }

            using (MyHotelContext context = new MyHotelContext())
            {
                if (context.Rooms.SingleOrDefault(r => r.RoomId == Convert.ToInt32(txtRoomID.Text)).IsAvailable == false)
                {
                    MessageBox.Show("Phòng này đã được đặt! Làm ơn chọn phòng khác!");
                    return;
                }
                else
                {
                    //Tạo đối tượng sẽ insert
                    BookDetail bookDetail = new BookDetail
                    {
                        BookId = Convert.ToInt32(txtBookID.Text),
                        RoomId = Convert.ToInt32(txtRoomID.Text),
                        CheckIn = dtpCheckIn.Value,
                        CheckOut = dtpCheckOut.Value,
                        Amount = Convert.ToDecimal((dtpCheckOut.Value.Day - dtpCheckIn.Value.Day) * Convert.ToDouble(txtRoomPrice.Text))
                    };
                    context.BookDetails.Add(bookDetail);
                    if (context.SaveChanges() > 0)
                    {
                        MessageBox.Show("Thêm chi tiết đặt hàng thành công!");
                        cur_selectedValue = (int)cbRoomType.SelectedValue;
                        //Tìm Room muốn update trạng thái thành trống
                        Room room = context.Rooms
                            .SingleOrDefault(item => item.RoomId == Convert.ToInt32(txtRoomID.Text));

                        //Setting lại những giá trị muốn update
                        room.IsAvailable = false;

                        if (context.SaveChanges() > 0)
                        {
                            //MessageBox.Show("Update room " + txtRoomID.Text + " to unavailable successfully!");
                        }
                    }
                    loadData();
                }
            }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtBD_ID.Text))
            {
                MessageBox.Show("Mã HĐ chi tiết đặt phòng đang bị trống! Làm ơn chọn một đơn chi tiết đặt phòng bất kỳ trong danh sách ở dưới để cập nhật!");
                return;
            }
            if (string.IsNullOrWhiteSpace(txtRoomID.Text))
            {
                MessageBox.Show("Mã phòng đang bị trống! Làm ơn chọn một phòng bất kỳ trong danh sách ở bên để thêm HĐ chi tiết đặt phòng!");
                return;
            }
            if ((dtpCheckOut.Value.Day - dtpCheckIn.Value.Day) <= 0)
            {
                MessageBox.Show("Ngày rời đi phải lớn hơn ngày đến! Làm ơn chọn lại!");
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
                //Tìm BookDetail muốn update
                BookDetail bookDetail = context.BookDetails
                    .SingleOrDefault(item => item.BdId == Convert.ToInt32(txtBD_ID.Text));

                //Setting lại những giá trị muốn update
                bookDetail.BookId = Convert.ToInt32(txtBookID.Text);
                bookDetail.RoomId = Convert.ToInt32(txtRoomID.Text);
                bookDetail.CheckIn = dtpCheckIn.Value;
                bookDetail.CheckOut = dtpCheckOut.Value;
                bookDetail.Amount = Convert.ToDecimal((dtpCheckOut.Value.Day - dtpCheckIn.Value.Day) * Convert.ToDouble(txtRoomPrice.Text));

                if (context.SaveChanges() > 0)
                {
                    MessageBox.Show("Cập nhật thành công!");
                    cur_selectedValue = (int)cbRoomType.SelectedValue;
                }
                loadData();
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtBD_ID.Text))
            {
                MessageBox.Show("Mã HĐ chi tiết đặt phòng đang bị trống! Làm ơn chọn một đơn chi tiết đặt phòng bất kỳ trong danh sách ở dưới để xóa!");
                return;
            }

            using (MyHotelContext context = new MyHotelContext())
            {
                //Tìm BookDetail sẽ delete
                BookDetail bookDetail = context.BookDetails
                    .SingleOrDefault(item => item.BdId == Convert.ToInt32(txtBD_ID.Text));

                if (MessageBox.Show("Bạn có muốn xóa thông tin chi tiết đặt phòng này?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
                {
                    context.BookDetails.Remove(bookDetail);
                    if (context.SaveChanges() > 0)
                    {
                        MessageBox.Show("Xóa thành công!");
                        //Tìm Room muốn update trạng thái thành trống
                        Room room = context.Rooms
                            .SingleOrDefault(item => item.RoomId == Convert.ToInt32(txtRoomID.Text));

                        //Setting lại những giá trị muốn update
                        room.IsAvailable = true;

                        if (context.SaveChanges() > 0)
                        {
                            //MessageBox.Show("Update room " + dgBookingDetail.Rows[i].Cells[2].FormattedValue.ToString() + " to available successfully!");
                        }
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
            txtBD_ID.Text = "";
            txtRoomID.Text = "";
            txtRoomName.Text = "";
            cbRoomType.Text = "";
            dtpCheckIn.Value = DateTime.Now;
            dtpCheckOut.Value = DateTime.Now;
            txtAmount.Text = "";
            txtRoomPrice.Text = "";
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            //if (MessageBox.Show("Bạn có muốn thoát?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
            //{
            this.Close();
            //}
        }

        private void dgBookingDetail_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex == -1)
            {
                return;
            }
            if (dgBookingDetail.Columns.Count == 1)
            {
                return;
            }
            else
            {
                txtBD_ID.Text = dgBookingDetail.Rows[e.RowIndex].Cells[0].FormattedValue.ToString();
                txtRoomID.Text = dgBookingDetail.Rows[e.RowIndex].Cells[2].FormattedValue.ToString();
                txtRoomName.Text = dgBookingDetail.Rows[e.RowIndex].Cells[3].FormattedValue.ToString();
                cbRoomType.Text = dgBookingDetail.Rows[e.RowIndex].Cells[4].FormattedValue.ToString();
                txtRoomPrice.Text = dgBookingDetail.Rows[e.RowIndex].Cells[5].FormattedValue.ToString();
                dtpCheckIn.Value = Convert.ToDateTime(dgBookingDetail.Rows[e.RowIndex].Cells[6].FormattedValue.ToString());
                dtpCheckOut.Value = Convert.ToDateTime(dgBookingDetail.Rows[e.RowIndex].Cells[7].FormattedValue.ToString());
                txtAmount.Text = dgBookingDetail.Rows[e.RowIndex].Cells[8].FormattedValue.ToString();
            }
        }
    }
}
