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
    public partial class BedTypeFrm : Form
    {
        public BedTypeFrm()
        {
            InitializeComponent();
            txtBedTypeID.Enabled = false;
        }

        private void BedTypeFrm_Load(object sender, EventArgs e)
        {
            loadData();
        }

        private void loadData()
        {
            //load datagrid
            using (MyHotelContext context = new MyHotelContext())
            {
                var data = context.BedTypes
                    .Select(item => new
                    {
                        BedTypeId = item.BedTypeId,
                        Name = item.Name
                    })
                    .ToList();
                dgBedType.DataSource = data;
                dgBedType.Columns["BedTypeId"].HeaderText = "Mã kiểu giường";
                dgBedType.Columns["Name"].HeaderText = "Tên kiểu giường";
            }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtBedTypeName.Text))
            {
                MessageBox.Show("Tên kiểu giường không được trống! Làm ơn nhập lại!");
                return;
            }
            using (MyHotelContext context = new MyHotelContext())
            {
                //Tạo đối tượng sẽ insert
                BedType bt = new BedType
                {
                    Name = txtBedTypeName.Text
                };
                context.BedTypes.Add(bt);
                if (context.SaveChanges() > 0)
                {
                    MessageBox.Show("Insert successfully!");
                }
                loadData();
            }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtBedTypeID.Text))
            {
                MessageBox.Show("Mã của kiểu giường đang bị trống! Làm ơn chọn một kiểu giường ở danh sách cạnh bên để cập nhật!");
                return;
            }

            using (MyHotelContext context = new MyHotelContext())
            {
                //Tìm BedType muốn update
                BedType bt = context.BedTypes
                    .SingleOrDefault(item => item.BedTypeId == Convert.ToInt32(txtBedTypeID.Text));

                //Setting lại những giá trị muốn update
                bt.Name = txtBedTypeName.Text;

                if (context.SaveChanges() > 0)
                {
                    MessageBox.Show("Update successfully!");
                }
                loadData();
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtBedTypeID.Text))
            {
                MessageBox.Show("Mã của kiểu giường đang bị trống! Làm ơn chọn một kiểu giường ở danh sách cạnh bên để xóa!");
                return;
            }

            using (MyHotelContext context = new MyHotelContext())
            {
                //Tìm RoomType sẽ delete
                BedType bt = context.BedTypes
                    .SingleOrDefault(item => item.BedTypeId == Convert.ToInt32(txtBedTypeID.Text));

                if (MessageBox.Show("Bạn có muốn xóa kiểu giường này?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
                {
                    context.BedTypes.Remove(bt);
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
            txtBedTypeID.Text = "";
            txtBedTypeName.Text = "";
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn thoát?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
            {
                this.Close();
            }
        }

        private void btnSearchByName_Click(object sender, EventArgs e)
        {
            using (MyHotelContext context = new MyHotelContext())
            {
                var searchResult = context.BedTypes
                    .Select(item => new
                    {
                        BedTypeId = item.BedTypeId,
                        Name = item.Name
                    })
                    .Where(item => item.Name.Contains(txtBedTypeName.Text.Trim()))
                    .ToList();
                dgBedType.DataSource = searchResult;
            }
        }

        private void dgBedType_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex == -1)
            {
                return;
            }
            txtBedTypeID.Text = dgBedType.Rows[e.RowIndex].Cells[0].FormattedValue.ToString();
            txtBedTypeName.Text = dgBedType.Rows[e.RowIndex].Cells[1].FormattedValue.ToString();
        }
    }
}
