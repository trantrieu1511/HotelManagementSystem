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
    public partial class RoomTypeDetailFrm : Form
    {
        private int cur_cbRoomTypeSelectedValue = 1;
        private int cur_cbBedTypeSelectedValue = 1;

        public RoomTypeDetailFrm()
        {
            InitializeComponent();
            numericUpDownBedAmount.Minimum = 1;
            numericUpDownBedAmount.Maximum = 10;
            txtRTD_ID.Enabled = false;
            cbRoomType.Enabled = false;
            cbBedType.Enabled = false;
            numericUpDownBedAmount.Enabled = false;
            btnSearchByRoomType.Enabled = false;
            btnSearchByBedType.Enabled = false;
            btnSearchByBedAmount.Enabled = false;
            btnAdd.Enabled = false;
            btnUpdate.Enabled = false;
            btnDelete.Enabled = false;
        }

        private void RoomTypeDetail_Load(object sender, EventArgs e)
        {
            loadData();
        }

        private void loadData()
        {
            //load datagrid
            using (MyHotelContext context = new MyHotelContext())
            {
                var data = context.RoomTypeDetails
                    .Select(item => new
                    {
                        //RTD_ID = item.RtdId,
                        RoomType = item.RoomType.Name,
                        BedType = item.BedType.Name,
                        BedAmount = item.BedAmount
                    })
                    .ToList();
                dgRoomTypeDetail.DataSource = data;
                //dgRoomTypeDetail.Columns["RTD_ID"].HeaderText = "Mã kiểu phòng chi tiết";
                dgRoomTypeDetail.Columns["RoomType"].HeaderText = "Tên kiểu phòng";
                dgRoomTypeDetail.Columns["BedType"].HeaderText = "Tên kiểu giường";
                dgRoomTypeDetail.Columns["BedAmount"].HeaderText = "SL giường";
                var cbRoomTypeData = context.RoomTypes.ToList();
                var cbBedTypeData = context.BedTypes.ToList();
                cbRoomType.DataSource = cbRoomTypeData;
                cbRoomType.DisplayMember = "Name";
                cbRoomType.ValueMember = "RoomTypeID";
                cbRoomType.SelectedValue = (int)cur_cbRoomTypeSelectedValue;
                cbBedType.DataSource = cbBedTypeData;
                cbBedType.DisplayMember = "Name";
                cbBedType.ValueMember = "BedTypeID";
                cbBedType.SelectedValue = (int)cur_cbBedTypeSelectedValue;
            }
        }

        private void btnNew_Click(object sender, EventArgs e)
        {
            cbRoomType.Enabled = true;
            cbBedType.Enabled = true;
            numericUpDownBedAmount.Enabled = true;
            btnSearchByRoomType.Enabled = true;
            btnSearchByBedType.Enabled = true;
            btnSearchByBedAmount.Enabled = true;
            btnAdd.Enabled = true;
            btnUpdate.Enabled = false;
            btnDelete.Enabled = false;
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            //validate
            /*if (!string.IsNullOrWhiteSpace(txtRTD_ID.Text))
            {
                MessageBox.Show("Làm ơn nhấn nút reset trước khi thêm mới!");
                return;
            }*/
            if (string.IsNullOrWhiteSpace(cbRoomType.Text))
            {
                MessageBox.Show("Kiểu phòng không được trống! Làm ơn chọn lại!");
                return;
            }
            if (string.IsNullOrWhiteSpace(cbBedType.Text))
            {
                MessageBox.Show("kiểu giường không được trống! Làm ơn chọn lại!");
                return;
            }
            if (string.IsNullOrWhiteSpace(numericUpDownBedAmount.Value.ToString()))
            {
                MessageBox.Show("Số lượng giường không được trống! Làm ơn nhập/chọn lại!");
                return;
            }
            using (MyHotelContext context = new MyHotelContext())
            {
                try
                {
                    //Tạo đối tượng sẽ insert
                    RoomTypeDetail rtd = new RoomTypeDetail
                    {
                        //RtdId = Convert.ToInt32(txtRTD_ID.Text),
                        RoomTypeId = (int)cbRoomType.SelectedValue,
                        BedTypeId = (int)cbBedType.SelectedValue,
                        BedAmount = (int)numericUpDownBedAmount.Value
                    };
                    context.RoomTypeDetails.Add(rtd);
                    if (context.SaveChanges() > 0)
                    {
                        MessageBox.Show("Insert successfully!");
                    }
                    loadData();
                }
                catch (Exception)
                {
                    MessageBox.Show("Loại phòng hiện tại đã có kiểu giường này. Làm ơn chọn cập nhật hoặc xóa!");
                }
            }
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            cbRoomType.Enabled = true;
            cbBedType.Enabled = true;
            numericUpDownBedAmount.Enabled = true;
            btnSearchByRoomType.Enabled = true;
            btnSearchByBedType.Enabled = true;
            btnSearchByBedAmount.Enabled = true;
            btnAdd.Enabled = false;
            btnUpdate.Enabled = true;
            btnDelete.Enabled = true;
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            //validate
            /*if (string.IsNullOrWhiteSpace(txtRTD_ID.Text))
            {
                MessageBox.Show("Mã kiểu phòng chi tiết đang bị trống! Làm ơn chọn một kiểu phòng chi tiết bất kỳ trong danh sách ở cạnh bên để cập nhật!");
                return;
            }*/
            if (string.IsNullOrWhiteSpace(cbRoomType.Text))
            {
                MessageBox.Show("Kiểu phòng không được trống! Làm ơn chọn lại!");
                return;
            }
            if (string.IsNullOrWhiteSpace(cbBedType.Text))
            {
                MessageBox.Show("kiểu giường không được trống! Làm ơn chọn lại!");
                return;
            }
            if (string.IsNullOrWhiteSpace(numericUpDownBedAmount.Value.ToString()))
            {
                MessageBox.Show("Số lượng giường không được trống! Làm ơn nhập/chọn lại!");
                return;
            }

            using (MyHotelContext context = new MyHotelContext())
            {
                //Tìm RoomTypeDetail muốn update
                RoomTypeDetail rtd = context.RoomTypeDetails
                    .SingleOrDefault(item => item.RoomTypeId == Convert.ToInt32(cbRoomType.SelectedValue) && item.BedTypeId == Convert.ToInt32(cbBedType.SelectedValue));

                //Setting lại những giá trị muốn update
                //rtd.RtdId = Convert.ToInt32(txtRTD_ID.Text);
                rtd.RoomTypeId = (int)cbRoomType.SelectedValue;
                rtd.BedTypeId = (int)cbBedType.SelectedValue;
                rtd.BedAmount = (int)numericUpDownBedAmount.Value;

                if (context.SaveChanges() > 0)
                {
                    MessageBox.Show("Update successfully!");
                }
                cur_cbRoomTypeSelectedValue = (int)cbRoomType.SelectedValue;
                cur_cbBedTypeSelectedValue = (int)cbBedType.SelectedValue;
                loadData();
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            //validate
            /*if (string.IsNullOrWhiteSpace(txtRTD_ID.Text))
            {
                MessageBox.Show("Mã kiểu phòng chi tiết đang bị trống! Làm ơn chọn một kiểu phòng chi tiết bất kỳ trong danh sách ở cạnh bên để xóa!");
                return;
            }*/
            if (string.IsNullOrWhiteSpace(cbRoomType.Text))
            {
                MessageBox.Show("Kiểu phòng không được trống! Làm ơn chọn lại!");
                return;
            }
            if (string.IsNullOrWhiteSpace(cbBedType.Text))
            {
                MessageBox.Show("kiểu giường không được trống! Làm ơn chọn lại!");
                return;
            }
            if (string.IsNullOrWhiteSpace(numericUpDownBedAmount.Value.ToString()))
            {
                MessageBox.Show("Số lượng giường không được trống! Làm ơn nhập/chọn lại!");
                return;
            }

            using (MyHotelContext context = new MyHotelContext())
            {
                //Tìm RoomTypeDetail sẽ delete
                /*RoomTypeDetail rtd = context.RoomTypeDetails
                    .SingleOrDefault(item => item.RtdId == Convert.ToInt32(txtRTD_ID.Text));*/
                RoomTypeDetail rtd = context.RoomTypeDetails
                    .SingleOrDefault(item => item.RoomTypeId == Convert.ToInt32(cbRoomType.SelectedValue) && item.BedTypeId == Convert.ToInt32(cbBedType.SelectedValue));

                if (MessageBox.Show("Bạn có muốn xóa chi tiết của kiểu phòng này?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
                {
                    context.RoomTypeDetails.Remove(rtd);
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
            //Reload datagridview
            loadData();
            //Reset fields
            resetFields();
        }

        private void resetFields()
        {
            txtRTD_ID.Text = "";
            cbRoomType.Text = "";
            cbBedType.Text = "";
            numericUpDownBedAmount.Value = numericUpDownBedAmount.Minimum;
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn thoát?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
            {
                this.Close();
            }
        }

        private void btnSearchByRoomType_Click(object sender, EventArgs e)
        {
            using (MyHotelContext context = new MyHotelContext())
            {
                //MessageBox.Show("RoomType selectedItem: "+cbRoomType.Text);
                var result = context.RoomTypeDetails
                    .Select(item => new
                    {
                        /*RTD_ID = item.RtdId,*/
                        RoomType = item.RoomType.Name,
                        BedType = item.BedType.Name,
                        BedAmount = item.BedAmount
                    })
                    .Where(item => item.RoomType.Contains(cbRoomType.Text))
                    .ToList();
                dgRoomTypeDetail.DataSource = result;
            }
        }

        private void btnSearchByBedType_Click(object sender, EventArgs e)
        {
            using (MyHotelContext context = new MyHotelContext())
            {
                var result = context.RoomTypeDetails
                    .Select(item => new
                    {
                        /*RTD_ID = item.RtdId,*/
                        RoomType = item.RoomType.Name,
                        BedType = item.BedType.Name,
                        BedAmount = item.BedAmount
                    })
                    .Where(item => item.BedType.Contains(cbBedType.Text))
                    .ToList();
                dgRoomTypeDetail.DataSource = result;
            }
        }

        private void btnSearchByBedAmount_Click(object sender, EventArgs e)
        {
            using (MyHotelContext context = new MyHotelContext())
            {
                var result = context.RoomTypeDetails
                    .Select(item => new
                    {
                        /*RTD_ID = item.RtdId,*/
                        RoomType = item.RoomType.Name,
                        BedType = item.BedType.Name,
                        BedAmount = item.BedAmount
                    })
                    .Where(item => item.BedAmount <= (int)numericUpDownBedAmount.Value && item.BedAmount > 0)
                    .ToList();
                dgRoomTypeDetail.DataSource = result;
            }
        }

        private void dgRoomTypeDetail_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex == -1)
            {
                return;
            }
            //txtRTD_ID.Text = dgRoomTypeDetail.Rows[e.RowIndex].Cells[0].FormattedValue.ToString();
            cbRoomType.Text = dgRoomTypeDetail.Rows[e.RowIndex].Cells[0].FormattedValue.ToString();
            cbBedType.Text = dgRoomTypeDetail.Rows[e.RowIndex].Cells[1].FormattedValue.ToString();
            if (dgRoomTypeDetail.Rows[e.RowIndex].Cells[2].FormattedValue.ToString().Trim() == "")
            {
                numericUpDownBedAmount.Value = 0;
            }
            else
            {
                numericUpDownBedAmount.Value = Convert.ToInt32(dgRoomTypeDetail.Rows[e.RowIndex].Cells[2].FormattedValue.ToString());
            }
        }

        /*private void dgRoomTypeDetail_CellEnter(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex == -1)
            {
                return;
            }
            txtRTD_ID.Text = dgRoomTypeDetail.Rows[e.RowIndex].Cells[0].FormattedValue.ToString();
            cbRoomType.Text = dgRoomTypeDetail.Rows[e.RowIndex].Cells[1].FormattedValue.ToString();
            cbBedType.Text = dgRoomTypeDetail.Rows[e.RowIndex].Cells[2].FormattedValue.ToString();
            if (dgRoomTypeDetail.Rows[e.RowIndex].Cells[3].FormattedValue.ToString().Trim() == "")
            {
                numericUpDownBedAmount.Value = 0;
            }
            else
            {
                numericUpDownBedAmount.Value = Convert.ToInt32(dgRoomTypeDetail.Rows[e.RowIndex].Cells[3].FormattedValue.ToString());
            }
        }*/
    }
}
