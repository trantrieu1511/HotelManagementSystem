//using ContentManagementSystem.Models;
using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace CrystalReport
{
    public partial class BookingFrm : Form
    {
        public BookingFrm()
        {
            InitializeComponent();
            dgBooking.AllowUserToAddRows = false;
            txtBookID.Enabled = false;
            numNoOfAdult.Minimum = 1;
            numNoOfAdult.Maximum = 10;
            numNoOfChildren.Minimum = 0;
            numNoOfChildren.Maximum = 10;
            numNoOfRoom.Minimum = 1;
            numNoOfRoom.Maximum = 6;
            /*chkPaymentStatus.Enabled = false;
            chkIsCancelled.Enabled = false;*/
        }

        private void Booking_Load(object sender, EventArgs e)
        {
            loadData();
        }

        //cast classes
        /*private static List<T> Cast<T>(T typeHolder, Object x)
        {
            // typeHolder above is just for compiler magic
            // to infer the type to cast x to
            return (List<T>)x;
        }
        private static T CastTo<T>(Object value, T targetType)
        {
            // targetType above is just for compiler magic
            // to infer the type to cast value to
            return (T)value;
        }*/

        DataTable dt = new DataTable();
        //private int cur_cbCustomerSelectedValue = 1;

        DataTable dtReport = new DataTable();
        private void loadData()
        {
            dtReport = (new DataProvider()).executeQuery(
                "select c.LastName + ' ' + c.FirstName as 'Fullname', b.BookDate, b.NumOfAdult, b.NumOfChildren, " +
                "b.NumOfRoom, r.[Name] as 'RoomName', rt.[Name] as 'RoomTypeName', b.PaymentStatus, b.isCancelled, " +
                "bd.Amount " +
                "from Booking b join BookDetail bd " +
                "on b.BookID = bd.BookID join Customer c " +
                "on c.CusID = b.CusID join Room r " +
                "on r.RoomID = bd.RoomID join RoomType rt " +
                "on r.RoomTypeID = rt.RoomTypeID");
            customizeAndDisplay();
            /*using (MyHotelContext context = new MyHotelContext())
            {
                var dataDgBooking = context.Bookings.Select(b => new a
                {
                    BookId = b.BookId,
                    FullCusInfo = b.Cus.LastName + " " + b.Cus.FirstName + " - " + b.Cus.Email + " - " + b.Cus.PhoneNumber,
                    BookDate = b.BookDate,
                    NumOfAdult = b.NumOfAdult,
                    NumOfChildren = b.NumOfChildren,
                    NumOfRoom = b.NumOfRoom,
                    PaymentStatus = b.PaymentStatus,
                    IsCancelled = b.IsCancelled,
                    SpecialRequests = b.SpecialRequests
                }).ToList();
                customizeAndDisplay(dataDgBooking);
                cbCustomer.DataSource = context.Customers
                    .Select(c => new
                    {
                        CusID = c.CusId,
                        FullCusInfo = c.LastName + " " + c.FirstName + " - " + c.Email + " - " + c.PhoneNumber
                    })
                    .ToList();
                cbCustomer.DisplayMember = "FullCusInfo";
                cbCustomer.ValueMember = "CusID";
                cbCustomer.SelectedValue = (int)cur_cbCustomerSelectedValue;
            }*/

        }

        internal class a
        {
            public a()
            {
            }
            public int BookId { get; set; }
            public string FullCusInfo { get; set; }
            public DateTime BookDate { get; set; }
            public int NumOfAdult { get; set; }
            public int NumOfChildren { get; set; }
            public int NumOfRoom { get; set; }
            public bool PaymentStatus { get; set; }
            public string SpecialRequests { get; set; }
            public bool IsCancelled { get; set; }
        }

        private void customizeAndDisplay()
        {
            try
            {
                dt.Columns.Clear();
                dt.Rows.Clear();
                //dt.Columns.Add("Hành động", typeof(string));
                //dt.Columns.Add("Mã đặt phòng", typeof(string));
                dt.Columns.Add("Tên đầy đủ", typeof(string));
                dt.Columns.Add("Ngày đặt phòng", typeof(string));
                dt.Columns.Add("SL người lớn", typeof(string));
                dt.Columns.Add("SL trẻ nhỏ", typeof(string));
                dt.Columns.Add("SL phòng", typeof(string));
                dt.Columns.Add("Tên phòng", typeof(string));
                dt.Columns.Add("Tên kiểu phòng", typeof(string));
                dt.Columns.Add("Trạng thái trả tiền phòng", typeof(string));
                dt.Columns.Add("Trạng thái hủy đặt phòng", typeof(string));
                dt.Columns.Add("Tổng thành tiền", typeof(string));

                foreach (DataRow item in dtReport.Rows)
                {
                    dt.Rows.Add(new object[] {
                        item.ItemArray[0].ToString(),
                        item.ItemArray[1].ToString(),
                        item.ItemArray[2].ToString(),
                        item.ItemArray[3].ToString(),
                        item.ItemArray[4].ToString(),
                        item.ItemArray[5].ToString(),
                        item.ItemArray[6].ToString(),
                        ((bool)item.ItemArray[7] ? "Đã trả" : "Chưa trả"),
                        ((bool)item.ItemArray[8] ? "Đã hủy" : "Chưa hủy"),
                        item.ItemArray[9].ToString()
                    });
                }
                dgBooking.DataSource = dt;
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            /*if (string.IsNullOrWhiteSpace(cbCustomer.Text))
            {
                MessageBox.Show("Thông tin khách hàng đang bị trống! Làm ơn chọn lại!");
                return;
            }
            if (numNoOfAdult.Value < numNoOfRoom.Value)
            {
                MessageBox.Show("Số lượng phòng không được lớn hơn số lượng người lớn! Làm ơn chọn lại!");
                return;
            }

            using (MyHotelContext context = new MyHotelContext())
            {
                //Tạo đối tượng sẽ insert
                Booking book = new Booking
                {
                    CusId = (int)cbCustomer.SelectedValue,
                    BookDate = DateTime.Now,
                    NumOfAdult = (int)numNoOfAdult.Value,
                    NumOfChildren = (int)numNoOfChildren.Value,
                    NumOfRoom = (int)numNoOfRoom.Value,
                    PaymentStatus = false,
                    IsCancelled = false,
                    SpecialRequests = txtSpecialRequests.Text.Trim()
                };
                context.Bookings.Add(book);
                if (context.SaveChanges() > 0)
                {
                    MessageBox.Show("Insert successfully!");
                }
                loadData();
            }*/
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            /*if (string.IsNullOrWhiteSpace(txtBookID.Text))
            {
                MessageBox.Show("Mã đặt phòng đang bị trống! Làm ơn chọn một đơn đặt phòng bất kỳ trong danh sách ở dưới để cập nhật!");
                return;
            }
            if (numNoOfAdult.Value < numNoOfRoom.Value)
            {
                MessageBox.Show("Số lượng phòng không được lớn hơn số lượng người lớn! Làm ơn chọn lại!");
                return;
            }
            *//*if (!Regex.IsMatch(txtEmail.Text.Trim(), "[a-zA-Z0-9]{1,18}[@][a-z]{1,8}[.][a-z]{1,8}"))
            {
                MessageBox.Show("Email must not contain: Unicode characters, special characters other than @ and . ; " +
                    "Allow uppercase, lowercase letters and numeric characters(0 - 9), maximum length of parts of email: " +
                    "username: 18, mail server: 8, domain: 8; max length: 34");
                return;
            }*//*

            using (MyHotelContext context = new MyHotelContext())
            {
                //Tìm Booking muốn update
                Booking book = context.Bookings
                    .SingleOrDefault(item => item.BookId == Convert.ToInt32(txtBookID.Text));

                //Setting lại những giá trị muốn update
                book.CusId = (int)cbCustomer.SelectedValue;
                book.BookDate = DateTime.Now;
                book.NumOfAdult = (int)numNoOfAdult.Value;
                book.NumOfChildren = (int)numNoOfChildren.Value;
                book.NumOfRoom = (int)numNoOfRoom.Value;
                *//*book.PaymentStatus = chkPaymentStatus.Checked;
                book.IsCancelled = chkIsCancelled.Checked;*//*
                book.SpecialRequests = txtSpecialRequests.Text.Trim();

                if (context.SaveChanges() > 0)
                {
                    MessageBox.Show("Update successfully!");
                }
                loadData();
            }*/
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            /*if (string.IsNullOrWhiteSpace(txtBookID.Text))
            {
                MessageBox.Show("Mã đặt phòng đang bị trống! Làm ơn chọn một đơn đặt phòng bất kỳ trong danh sách ở dưới để xóa!");
                return;
            }

            using (MyHotelContext context = new MyHotelContext())
            {
                //Tìm Booking sẽ delete
                Booking book = context.Bookings
                    .SingleOrDefault(item => item.BookId == Convert.ToInt32(txtBookID.Text));

                if (MessageBox.Show("Bạn có muốn xóa thông tin đặt phòng này?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
                {
                    context.Bookings.Remove(book);
                    if (context.SaveChanges() > 0)
                    {
                        MessageBox.Show("Delete successfully!");
                    }
                    loadData();
                    resetFields();
                }
            }*/
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            string option = cbSearchBy.Text.Trim().ToLower();
            //MessageBox.Show(option);
            switch (option)
            {
                case "customer":
                    {
                        /*using (MyHotelContext context = new MyHotelContext())
                        {
                            var dataDgBooking = context.Bookings.Select(b => new a
                            {
                                BookId = b.BookId,
                                FullCusInfo = b.Cus.LastName + " " + b.Cus.FirstName + " - " + b.Cus.Email + " - " + b.Cus.PhoneNumber,
                                BookDate = b.BookDate,
                                NumOfAdult = b.NumOfAdult,
                                NumOfChildren = b.NumOfChildren,
                                NumOfRoom = b.NumOfRoom,
                                PaymentStatus = b.PaymentStatus,
                                IsCancelled = b.IsCancelled,
                                SpecialRequests = b.SpecialRequests
                            })
                                .Where(b => b.FullCusInfo.ToLower().Contains(cbCustomer.Text.ToLower()))
                                .ToList();
                            customizeAndDisplay(dataDgBooking);
                        }*/
                        break;
                    }
                case "bookdate":
                    {
                        /*using (MyHotelContext context = new MyHotelContext())
                        {
                            var dataDgBooking = context.Bookings.Select(b => new a
                            {
                                BookId = b.BookId,
                                FullCusInfo = b.Cus.LastName + " " + b.Cus.FirstName + " - " + b.Cus.Email + " - " + b.Cus.PhoneNumber,
                                BookDate = b.BookDate,
                                NumOfAdult = b.NumOfAdult,
                                NumOfChildren = b.NumOfChildren,
                                NumOfRoom = b.NumOfRoom,
                                PaymentStatus = b.PaymentStatus,
                                IsCancelled = b.IsCancelled,
                                SpecialRequests = b.SpecialRequests
                            })
                                .Where(b => b.BookDate == dtpBookDate.Value)
                                .ToList();
                            customizeAndDisplay(dataDgBooking);
                        }*/
                        break;
                    }
                case "noofadult":
                    {
                        /*using (MyHotelContext context = new MyHotelContext())
                        {
                            var dataDgBooking = context.Bookings.Select(b => new a
                            {
                                BookId = b.BookId,
                                FullCusInfo = b.Cus.LastName + " " + b.Cus.FirstName + " - " + b.Cus.Email + " - " + b.Cus.PhoneNumber,
                                BookDate = b.BookDate,
                                NumOfAdult = b.NumOfAdult,
                                NumOfChildren = b.NumOfChildren,
                                NumOfRoom = b.NumOfRoom,
                                PaymentStatus = b.PaymentStatus,
                                IsCancelled = b.IsCancelled,
                                SpecialRequests = b.SpecialRequests
                            })
                                .Where(b => b.NumOfAdult <= (int)numNoOfAdult.Value)
                                .ToList();
                            customizeAndDisplay(dataDgBooking);
                        }*/
                        break;
                    }
                case "noofchildren":
                    {
                        /*using (MyHotelContext context = new MyHotelContext())
                        {
                            var dataDgBooking = context.Bookings.Select(b => new a
                            {
                                BookId = b.BookId,
                                FullCusInfo = b.Cus.LastName + " " + b.Cus.FirstName + " - " + b.Cus.Email + " - " + b.Cus.PhoneNumber,
                                BookDate = b.BookDate,
                                NumOfAdult = b.NumOfAdult,
                                NumOfChildren = b.NumOfChildren,
                                NumOfRoom = b.NumOfRoom,
                                PaymentStatus = b.PaymentStatus,
                                IsCancelled = b.IsCancelled,
                                SpecialRequests = b.SpecialRequests
                            })
                                .Where(b => b.NumOfChildren <= (int)numNoOfChildren.Value)
                                .ToList();
                            customizeAndDisplay(dataDgBooking);
                        }*/
                        break;
                    }
                case "noofroom":
                    {
                        /*using (MyHotelContext context = new MyHotelContext())
                        {
                            var dataDgBooking = context.Bookings.Select(b => new a
                            {
                                BookId = b.BookId,
                                FullCusInfo = b.Cus.LastName + " " + b.Cus.FirstName + " - " + b.Cus.Email + " - " + b.Cus.PhoneNumber,
                                BookDate = b.BookDate,
                                NumOfAdult = b.NumOfAdult,
                                NumOfChildren = b.NumOfChildren,
                                NumOfRoom = b.NumOfRoom,
                                PaymentStatus = b.PaymentStatus,
                                IsCancelled = b.IsCancelled,
                                SpecialRequests = b.SpecialRequests
                            })
                                .Where(b => b.NumOfRoom <= (int)numNoOfRoom.Value)
                                .ToList();
                            customizeAndDisplay(dataDgBooking);
                        }*/
                        break;
                    }
                case "paymentstatus":
                    {
                        /*using (MyHotelContext context = new MyHotelContext())
                        {
                            var dataDgBooking = context.Bookings.Select(b => new a
                            {
                                BookId = b.BookId,
                                FullCusInfo = b.Cus.LastName + " " + b.Cus.FirstName + " - " + b.Cus.Email + " - " + b.Cus.PhoneNumber,
                                BookDate = b.BookDate,
                                NumOfAdult = b.NumOfAdult,
                                NumOfChildren = b.NumOfChildren,
                                NumOfRoom = b.NumOfRoom,
                                PaymentStatus = b.PaymentStatus,
                                IsCancelled = b.IsCancelled,
                                SpecialRequests = b.SpecialRequests
                            })
                                .Where(b => b.PaymentStatus == chkPaymentStatus.Checked)
                                .ToList();
                            customizeAndDisplay(dataDgBooking);
                        }*/
                        break;
                    }
                case "iscancelled":
                    {
                        dtReport = (new DataProvider()).executeQuery(
                            "select c.LastName + ' ' + c.FirstName as 'Fullname', b.BookDate, b.NumOfAdult, b.NumOfChildren, " +
                "b.NumOfRoom, r.[Name] as 'RoomName', rt.[Name] as 'RoomTypeName', b.PaymentStatus, b.isCancelled, " +
                "bd.Amount " +
                "from Booking b join BookDetail bd " +
                "on b.BookID = bd.BookID join Customer c " +
                "on c.CusID = b.CusID join Room r " +
                "on r.RoomID = bd.RoomID join RoomType rt " +
                "on r.RoomTypeID = rt.RoomTypeID where b.isCancelled = '" + chkIsCancelled.Checked + "'");
                        customizeAndDisplay();

                        /*using (MyHotelContext context = new MyHotelContext())
                        {
                            var dataDgBooking = context.Bookings.Select(b => new a
                            {
                                BookId = b.BookId,
                                FullCusInfo = b.Cus.LastName + " " + b.Cus.FirstName + " - " + b.Cus.Email + " - " + b.Cus.PhoneNumber,
                                BookDate = b.BookDate,
                                NumOfAdult = b.NumOfAdult,
                                NumOfChildren = b.NumOfChildren,
                                NumOfRoom = b.NumOfRoom,
                                PaymentStatus = b.PaymentStatus,
                                IsCancelled = b.IsCancelled,
                                SpecialRequests = b.SpecialRequests
                            })
                                .Where(b => b.IsCancelled == chkIsCancelled.Checked)
                                .ToList();
                            customizeAndDisplay(dataDgBooking);
                        }*/
                        break;
                    }
                case "specialrequests":
                    {
                        /*using (MyHotelContext context = new MyHotelContext())
                        {
                            var dataDgBooking = context.Bookings.Select(b => new a
                            {
                                BookId = b.BookId,
                                FullCusInfo = b.Cus.LastName + " " + b.Cus.FirstName + " - " + b.Cus.Email + " - " + b.Cus.PhoneNumber,
                                BookDate = b.BookDate,
                                NumOfAdult = b.NumOfAdult,
                                NumOfChildren = b.NumOfChildren,
                                NumOfRoom = b.NumOfRoom,
                                PaymentStatus = b.PaymentStatus,
                                IsCancelled = b.IsCancelled,
                                SpecialRequests = b.SpecialRequests
                            })
                                .Where(b => b.SpecialRequests.ToLower().Contains(txtSpecialRequests.Text.Trim().ToLower()))
                                .ToList();
                            customizeAndDisplay(dataDgBooking);
                        }*/
                        break;
                    }
                default:
                    MessageBox.Show("Xin hãy nhập hoặc chọn một giá trị hợp lệ trong danh sách tìm kiếm!");
                    break;
            }
        }

        private void btnReset_Click(object sender, EventArgs e)
        {
            loadData();
            resetFields();
        }

        private void resetFields()
        {
            txtBookID.Text = "";
            cbCustomer.Text = "";
            dtpBookDate.Value = DateTime.Now;
            numNoOfAdult.Value = numNoOfAdult.Minimum;
            numNoOfChildren.Value = numNoOfChildren.Minimum;
            numNoOfRoom.Value = numNoOfRoom.Minimum;
            chkPaymentStatus.Checked = false;
            chkIsCancelled.Checked = false;
            txtSpecialRequests.Text = "";
            cbSearchBy.Text = "";
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn thoát?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
            {
                this.Close();
            }
        }

        private void dgBooking_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            /*using (MyHotelContext context = new MyHotelContext())
            {*/
            if (e.RowIndex == -1)
            {
                return;
            }
            /*if (e.ColumnIndex == dgBooking.Columns["Detail"].Index)
            {
                int BookID = Convert.ToInt32(dgBooking.Rows[e.RowIndex].Cells["Mã đặt phòng"].FormattedValue.ToString());
                //MessageBox.Show(BookID.ToString());
                //BookDetailFrm bookDetailFrm = new BookDetailFrm(BookID, context.Bookings.SingleOrDefault(b => b.BookId == BookID).IsCancelled);
                //bookDetailFrm.Show();
                *//*Show show = context.Shows.Find(showId);
                BookingGUI book = new BookingGUI(show, context);
                DialogResult dr = book.ShowDialog();*//*
            }*/
            txtBookID.Text = dgBooking.Rows[e.RowIndex].Cells[1].FormattedValue.ToString();
            cbCustomer.Text = dgBooking.Rows[e.RowIndex].Cells[2].FormattedValue.ToString();
            dtpBookDate.Value = Convert.ToDateTime(dgBooking.Rows[e.RowIndex].Cells[3].FormattedValue.ToString());
            numNoOfAdult.Value = Convert.ToDecimal(dgBooking.Rows[e.RowIndex].Cells[4].FormattedValue.ToString());
            numNoOfChildren.Value = Convert.ToDecimal(dgBooking.Rows[e.RowIndex].Cells[5].FormattedValue.ToString());
            numNoOfRoom.Value = Convert.ToDecimal(dgBooking.Rows[e.RowIndex].Cells[6].FormattedValue.ToString());
            chkPaymentStatus.Checked = false;
            if (dgBooking.Rows[e.RowIndex].Cells[7].FormattedValue.ToString() == "Đã trả")
            {
                chkPaymentStatus.Checked = true;
            }
            chkIsCancelled.Checked = false;
            if (dgBooking.Rows[e.RowIndex].Cells[8].FormattedValue.ToString() == "Đã hủy")
            {
                chkIsCancelled.Checked = true;
            }
            //txtSpecialRequests.Text = dgBooking.Rows[e.RowIndex].Cells[9].FormattedValue.ToString();
            /*}*/
        }

        private void btnReport_Click(object sender, EventArgs e)
        {
            Form1 crystalReport = new Form1(dtReport);
            crystalReport.Show();
        }

        /*private void dgBooking_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            return;
        }*/
    }
}
