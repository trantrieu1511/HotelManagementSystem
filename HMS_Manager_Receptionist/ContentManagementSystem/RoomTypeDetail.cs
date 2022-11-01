﻿using ContentManagementSystem.Models;
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
    public partial class RoomTypeDetail : Form
    {
        public RoomTypeDetail()
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
                        RTD_ID = item.RtdId,
                        RoomType = item.RoomType.Name,
                        BedType = item.BedType.Name,
                        BedAmount = item.BedAmount
                    })
                    .ToList();
                dgRoomTypeDetail.DataSource = data;
                dgRoomTypeDetail.Columns["RTD_ID"].HeaderText = "Mã kiểu phòng chi tiết";
                dgRoomTypeDetail.Columns["RoomType"].HeaderText = "Tên kiểu phòng";
                dgRoomTypeDetail.Columns["BedType"].HeaderText = "Tên kiểu giường";
                dgRoomTypeDetail.Columns["BedAmount"].HeaderText = "SL giường";
                var cbRoomTypeData = context.RoomTypes.ToList();
                var cbBedTypeData = context.BedTypes.ToList();
                cbRoomType.DataSource = cbRoomTypeData;
                cbRoomType.DisplayMember = "Name";
                cbRoomType.ValueMember = "RoomTypeID";
                cbBedType.DataSource = cbBedTypeData;
                cbBedType.DisplayMember = "Name";
                cbBedType.ValueMember = "BedTypeID";
            }
        }

        private void btnNew_Click(object sender, EventArgs e)
        {
            cbRoomType.Enabled = true;
            cbBedType.Enabled = true;
            numericUpDownBedAmount.Enabled = true;
            btnAdd.Enabled = true;
            btnUpdate.Enabled = false;
            btnDelete.Enabled = false;
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            using (MyHotelContext context = new MyHotelContext())
            {
                //Tạo đối tượng sẽ insert
                Models.RoomTypeDetail rtd = new Models.RoomTypeDetail
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
                resetFields();
            }
        }

        private void btnEdit_Click(object sender, EventArgs e)
        {
            cbRoomType.Enabled = true;
            cbBedType.Enabled = true;
            numericUpDownBedAmount.Enabled = true;
            btnAdd.Enabled = false;
            btnUpdate.Enabled = true;
            btnDelete.Enabled = true;
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            using (MyHotelContext context = new MyHotelContext())
            {
                //Tìm RoomTypeDetail muốn update
                Models.RoomTypeDetail rtd = context.RoomTypeDetails
                    .SingleOrDefault(item => item.RtdId == Convert.ToInt32(txtRTD_ID.Text));

                //Setting lại những giá trị muốn update
                //rtd.RtdId = Convert.ToInt32(txtRTD_ID.Text);
                rtd.RoomTypeId = (int)cbRoomType.SelectedValue;
                rtd.BedTypeId = (int)cbBedType.SelectedValue;
                rtd.BedAmount = (int)numericUpDownBedAmount.Value;

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
            using (MyHotelContext context = new MyHotelContext())
            {
                //Tìm RoomTypeDetail sẽ delete
                Models.RoomTypeDetail rtd = context.RoomTypeDetails
                    .SingleOrDefault(item => item.RtdId == Convert.ToInt32(txtRTD_ID.Text));

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

        }

        private void btnSearchByBedType_Click(object sender, EventArgs e)
        {

        }

        private void btnSearchByBedAmount_Click(object sender, EventArgs e)
        {

        }

        private void dgRoomTypeDetail_CellClick(object sender, DataGridViewCellEventArgs e)
        {
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
        }

        private void dgRoomTypeDetail_CellEnter(object sender, DataGridViewCellEventArgs e)
        {
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
        }
    }
}
