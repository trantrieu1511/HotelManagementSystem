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
    public partial class RoomType : Form
    {
        public RoomType()
        {
            InitializeComponent();
            dgRoomType.AllowUserToAddRows = false;
            numericUpDownMaxAdult.Minimum = 1;
            numericUpDownMaxAdult.Maximum = 20;
            numericUpDownMaxChildren.Minimum = 0;
            numericUpDownMaxChildren.Maximum = 20;
            txtRoomTypeID.Enabled = false;
            txtRoomTypeName.Enabled = false;
            txtPrice.Enabled = false;
            txtImg.Enabled = false;
            numericUpDownMaxAdult.Enabled = false;
            numericUpDownMaxChildren.Enabled = false;
            txtDescription.Enabled = false;
            btnSearchByID.Enabled = false;
            btnSearchByName.Enabled = false;
            btnSearchByPrice.Enabled = false;
            btnSearchByMaxAdult.Enabled = false;
            btnSearchByMaxChildren.Enabled = false;
            btnAdd.Enabled = false;
            btnUpdate.Enabled = false;
            btnDelete.Enabled = false;
        }

        private void RoomType_Load(object sender, EventArgs e)
        {
            loadData();
            //dgRoomType.CurrentCell = dgRoomType.Rows[0].Cells[0];
        }

        private void loadData()
        {
            //load datagrid
            using (MyHotelContext context = new MyHotelContext())
            {
                var data = context.RoomTypes
                    .Select(item => new
                    {
                        RoomTypeId = item.RoomTypeId,
                        Name = item.Name,
                        Price = (int)item.Price,
                        Img = item.Img,
                        Description = item.Description,
                        Adult = item.Adult,
                        Children = item.Children
                    })
                    .ToList();
                dgRoomType.DataSource = data;
                dgRoomType.Columns["RoomTypeId"].HeaderText = "Mã kiểu phòng";
                dgRoomType.Columns["Name"].HeaderText = "Tên kiểu phòng";
                dgRoomType.Columns["Price"].HeaderText = "Giá (VNĐ)";
                dgRoomType.Columns["Img"].HeaderText = "Hình ảnh";
                dgRoomType.Columns["Description"].HeaderText = "Mô tả kiểu phòng";
                dgRoomType.Columns["Adult"].HeaderText = "SL người lớn";
                dgRoomType.Columns["Children"].HeaderText = "SL trẻ nhỏ";
                //dgRoomType.Columns["RoomTypeDetails"].Visible = false;
                //dgRoomType.Columns["Rooms"].Visible = false;
            }
        }

        private void btnNew_Click(object sender, EventArgs e)
        {
            txtRoomTypeName.Enabled = true;
            txtPrice.Enabled = true;
            txtImg.Enabled = true;
            numericUpDownMaxAdult.Enabled = true;
            numericUpDownMaxChildren.Enabled = true;
            txtDescription.Enabled = true;
            btnSearchByID.Enabled = true;
            btnSearchByName.Enabled = true;
            btnSearchByPrice.Enabled = true;
            btnSearchByMaxAdult.Enabled = true;
            btnSearchByMaxChildren.Enabled = true;
            btnAdd.Enabled = true;
            btnUpdate.Enabled = false;
            btnDelete.Enabled = false;
        }

        private void resetFields()
        {
            txtRoomTypeID.Text = "";
            txtRoomTypeName.Text = "";
            txtPrice.Text = "";
            txtImg.Text = "";
            txtDescription.Text = "";
            numericUpDownMaxAdult.Value = numericUpDownMaxAdult.Minimum;
            numericUpDownMaxChildren.Value = numericUpDownMaxChildren.Minimum;
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            //validation
            if (string.IsNullOrWhiteSpace(txtRoomTypeID.Text))
            {
                MessageBox.Show("Mã kiểu phòng đang bị trống! Làm ơn chọn một phòng bất kỳ trong danh sách phía dưới để thêm mới!");
                return;
            }
            if (string.IsNullOrWhiteSpace(txtRoomTypeName.Text))
            {
                MessageBox.Show("Tên kiểu phòng không được trống! Làm ơn nhập lại!");
                return;
            }
            if (string.IsNullOrWhiteSpace(txtPrice.Text))
            {
                MessageBox.Show("Giá của kiểu phòng không được trống! Làm ơn nhập lại!");
                return;
            }
            try
            {
                if (Convert.ToInt32(txtPrice.Text) < 0 || Convert.ToInt32(txtPrice.Text) > 999999999)
                {
                    MessageBox.Show("Giá ở trong khoảng từ 0 - 999tr. Làm ơn nhập lại!");
                    return;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return;
            }
            if (string.IsNullOrWhiteSpace(txtDescription.Text))
            {
                MessageBox.Show("Mô tả kiểu phòng không được trống! Làm ơn nhập lại!");
                return;
            }
            /*if (string.IsNullOrWhiteSpace(numericUpDownMaxAdult.Value.ToString()))
            {
                MessageBox.Show("SL người lớn của kiểu phòng không được trống! Làm ơn nhập lại!");
                return;
            }
            if (string.IsNullOrWhiteSpace(numericUpDownMaxChildren.Value.ToString()))
            {
                MessageBox.Show("SL trẻ em của kiểu phòng không được trống! Làm ơn nhập lại!");
                return;
            }*/

            using (MyHotelContext context = new MyHotelContext())
            {
                //Tạo đối tượng sẽ insert
                Models.RoomType rt = new Models.RoomType
                {
                    Name = txtRoomTypeName.Text,
                    Price = Convert.ToDecimal(txtPrice.Text),
                    Img = txtImg.Text,
                    Description = txtDescription.Text,
                    Adult = (int)numericUpDownMaxAdult.Value,
                    Children = (int)numericUpDownMaxChildren.Value
                };
                context.RoomTypes.Add(rt);
                if (context.SaveChanges() > 0)
                {
                    MessageBox.Show("Insert successfully!");
                }
                loadData();
                resetFields();
            }
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            txtRoomTypeName.Enabled = true;
            txtPrice.Enabled = true;
            txtImg.Enabled = true;
            numericUpDownMaxAdult.Enabled = true;
            numericUpDownMaxChildren.Enabled = true;
            txtDescription.Enabled = true;
            btnSearchByID.Enabled = true;
            btnSearchByName.Enabled = true;
            btnSearchByPrice.Enabled = true;
            btnSearchByMaxAdult.Enabled = true;
            btnSearchByMaxChildren.Enabled = true;
            btnAdd.Enabled = false;
            btnUpdate.Enabled = true;
            btnDelete.Enabled = true;
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            //validate
            if (string.IsNullOrWhiteSpace(txtRoomTypeID.Text))
            {
                MessageBox.Show("Mã kiểu phòng đang bị trống! Làm ơn chọn một phòng bất kỳ trong danh sách phía dưới để cập nhật!");
                return;
            }
            if (string.IsNullOrWhiteSpace(txtRoomTypeName.Text))
            {
                MessageBox.Show("Tên kiểu phòng không được trống! Làm ơn nhập lại!");
                return;
            }
            if (string.IsNullOrWhiteSpace(txtPrice.Text))
            {
                MessageBox.Show("Giá của kiểu phòng không được trống! Làm ơn nhập lại!");
                return;
            }
            try
            {
                if (Convert.ToInt32(txtPrice.Text) < 0 || Convert.ToInt32(txtPrice.Text) > 999999999)
                {
                    MessageBox.Show("Giá ở trong khoảng từ 0 - 999tr. Làm ơn nhập lại!");
                    return;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return;
            }
            if (string.IsNullOrWhiteSpace(txtDescription.Text))
            {
                MessageBox.Show("Mô tả kiểu phòng không được trống! Làm ơn nhập lại!");
                return;
            }

            using (MyHotelContext context = new MyHotelContext())
            {
                //Tìm RoomType muốn update
                Models.RoomType rt = context.RoomTypes
                    .SingleOrDefault(item => item.RoomTypeId == Convert.ToInt32(txtRoomTypeID.Text));

                //Setting lại những giá trị muốn update
                rt.Name = txtRoomTypeName.Text;
                rt.Price = Convert.ToDecimal(txtPrice.Text);
                rt.Img = txtImg.Text;
                rt.Description = txtDescription.Text;
                rt.Adult = (int)numericUpDownMaxAdult.Value;
                rt.Children = (int)numericUpDownMaxChildren.Value;

                if (context.SaveChanges() > 0)
                {
                    MessageBox.Show("Update successfully!");
                }
                loadData();
                resetFields();
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            //validate
            if (string.IsNullOrWhiteSpace(txtRoomTypeID.Text))
            {
                MessageBox.Show("Mã kiểu phòng đang bị trống! Làm ơn chọn một phòng bất kỳ trong danh sách phía dưới để xóa!");
                return;
            }
            if (string.IsNullOrWhiteSpace(txtRoomTypeName.Text))
            {
                MessageBox.Show("Tên kiểu phòng không được trống! Làm ơn nhập lại!");
                return;
            }
            if (string.IsNullOrWhiteSpace(txtPrice.Text))
            {
                MessageBox.Show("Giá của kiểu phòng không được trống! Làm ơn nhập lại!");
                return;
            }
            try
            {
                if (Convert.ToInt32(txtPrice.Text) < 0 || Convert.ToInt32(txtPrice.Text) > 999999999)
                {
                    MessageBox.Show("Giá ở trong khoảng từ 0 - 999tr. Làm ơn nhập lại!");
                    return;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return;
            }
            if (string.IsNullOrWhiteSpace(txtDescription.Text))
            {
                MessageBox.Show("Mô tả kiểu phòng không được trống! Làm ơn nhập lại!");
                return;
            }

            using (MyHotelContext context = new MyHotelContext())
            {
                //Tìm RoomType sẽ delete
                Models.RoomType rt = context.RoomTypes
                    .SingleOrDefault(item => item.RoomTypeId == Convert.ToInt32(txtRoomTypeID.Text));

                if (MessageBox.Show("Bạn có muốn xóa kiểu phòng này?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
                {
                    context.RoomTypes.Remove(rt);
                    if (context.SaveChanges() > 0)
                    {
                        MessageBox.Show("Delete successfully!");
                    }
                    loadData();
                    resetFields();
                }
            }
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn thoát?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
            {
                this.Close();
            }
        }

        private void btnReset_Click(object sender, EventArgs e)
        {
            loadData();
            resetFields();
        }

        /*private void btnSearchByID_Click(object sender, EventArgs e)
        {
            using (MyHotelContext context = new MyHotelContext())
            {
                var result = context.RoomTypes.Where(item => item.RoomTypeId == Convert.ToInt32(txtRoomTypeID.Text)).ToList();
                dgRoomType.DataSource = result;
            }
        }*/

        private void btnSearchByName_Click(object sender, EventArgs e)
        {
            using (MyHotelContext context = new MyHotelContext())
            {
                var result = context.RoomTypes
                    .Select(item => new
                    {
                        RoomTypeId = item.RoomTypeId,
                        Name = item.Name,
                        Price = (int)item.Price,
                        Img = item.Img,
                        Description = item.Description,
                        Adult = item.Adult,
                        Children = item.Children
                    })
                    .Where(item => item.Name.Contains(txtRoomTypeName.Text))
                    .ToList();
                dgRoomType.DataSource = result;
            }
        }

        private void btnSearchByPrice_Click(object sender, EventArgs e)
        {
            //validate
            try
            {
                if (string.IsNullOrWhiteSpace(txtPrice.Text))
                {
                    MessageBox.Show("Giá của kiểu phòng không được trống! Làm ơn nhập lại!");
                    return;
                }
                if (Convert.ToInt32(txtPrice.Text) < 0 || Convert.ToInt32(txtPrice.Text) > 999999999)
                {
                    MessageBox.Show("Giá ở trong khoảng từ 0 - 999tr. Làm ơn nhập lại!");
                    return;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                return;
            }
            using (MyHotelContext context = new MyHotelContext())
            {
                var result = context.RoomTypes
                    .Select(item => new
                    {
                        RoomTypeId = item.RoomTypeId,
                        Name = item.Name,
                        Price = (int)item.Price,
                        Img = item.Img,
                        Description = item.Description,
                        Adult = item.Adult,
                        Children = item.Children
                    })
                    .Where(item => item.Price <= Convert.ToDecimal(txtPrice.Text) &&
                item.Price > 0)
                    .ToList();
                dgRoomType.DataSource = result;
            }
        }

        private void btnSearchByMaxAdult_Click(object sender, EventArgs e)
        {
            using (MyHotelContext context = new MyHotelContext())
            {
                var result = context.RoomTypes
                    .Select(item => new
                    {
                        RoomTypeId = item.RoomTypeId,
                        Name = item.Name,
                        Price = (int)item.Price,
                        Img = item.Img,
                        Description = item.Description,
                        Adult = item.Adult,
                        Children = item.Children
                    })
                    .Where(item => item.Adult > 0 && item.Adult <= (int)numericUpDownMaxAdult.Value)
                    .ToList();
                dgRoomType.DataSource = result;
            }
        }

        private void btnSearchByMaxChildren_Click(object sender, EventArgs e)
        {
            using (MyHotelContext context = new MyHotelContext())
            {
                var result = context.RoomTypes
                    .Select(item => new
                    {
                        RoomTypeId = item.RoomTypeId,
                        Name = item.Name,
                        Price = (int)item.Price,
                        Img = item.Img,
                        Description = item.Description,
                        Adult = item.Adult,
                        Children = item.Children
                    })
                    .Where(item => item.Children >= 0 && item.Children <= (int)numericUpDownMaxChildren.Value)
                    .ToList();
                dgRoomType.DataSource = result;
            }
        }

        private void dgRoomType_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex == -1)
            {
                return;
            }
            txtRoomTypeID.Text = dgRoomType.Rows[e.RowIndex].Cells[0].FormattedValue.ToString();
            txtRoomTypeName.Text = dgRoomType.Rows[e.RowIndex].Cells[1].FormattedValue.ToString();
            txtPrice.Text = dgRoomType.Rows[e.RowIndex].Cells[2].FormattedValue.ToString();
            txtImg.Text = dgRoomType.Rows[e.RowIndex].Cells[3].FormattedValue.ToString();
            txtDescription.Text = dgRoomType.Rows[e.RowIndex].Cells[4].FormattedValue.ToString();
            if (dgRoomType.Rows[e.RowIndex].Cells[5].FormattedValue.ToString().Trim() == "")
            {
                numericUpDownMaxAdult.Value = 0;
            }
            else
            {
                numericUpDownMaxAdult.Value = Convert.ToInt32(dgRoomType.Rows[e.RowIndex].Cells[5].FormattedValue.ToString());
            }
            if (dgRoomType.Rows[e.RowIndex].Cells[6].FormattedValue.ToString().Trim() == "")
            {
                numericUpDownMaxChildren.Value = 0;
            }
            else
            {
                numericUpDownMaxChildren.Value = Convert.ToInt32(dgRoomType.Rows[e.RowIndex].Cells[6].FormattedValue.ToString());
            }
        }

        private void dgRoomType_CellEnter(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex == -1)
            {
                return;
            }
            txtRoomTypeID.Text = dgRoomType.Rows[e.RowIndex].Cells[0].FormattedValue.ToString();
            txtRoomTypeName.Text = dgRoomType.Rows[e.RowIndex].Cells[1].FormattedValue.ToString();
            txtPrice.Text = dgRoomType.Rows[e.RowIndex].Cells[2].FormattedValue.ToString();
            txtImg.Text = dgRoomType.Rows[e.RowIndex].Cells[3].FormattedValue.ToString();
            txtDescription.Text = dgRoomType.Rows[e.RowIndex].Cells[4].FormattedValue.ToString();
            if (dgRoomType.Rows[e.RowIndex].Cells[5].FormattedValue.ToString().Trim() == "")
            {
                numericUpDownMaxAdult.Value = 0;
            }
            else
            {
                numericUpDownMaxAdult.Value = Convert.ToInt32(dgRoomType.Rows[e.RowIndex].Cells[5].FormattedValue.ToString());
            }
            if (dgRoomType.Rows[e.RowIndex].Cells[6].FormattedValue.ToString().Trim() == "")
            {
                numericUpDownMaxChildren.Value = 0;
            }
            else
            {
                numericUpDownMaxChildren.Value = Convert.ToInt32(dgRoomType.Rows[e.RowIndex].Cells[6].FormattedValue.ToString());
            }
        }
    }
}
