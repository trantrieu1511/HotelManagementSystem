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
    public partial class CustomerFrm : Form
    {
        public CustomerFrm(bool isManager)
        {
            InitializeComponent();
            txtCusID.Enabled = false;
            if (!isManager)
            {
                btnAdd.Enabled = false;
                btnUpdate.Enabled = false;
                btnDelete.Enabled = false;
            }
        }

        private void CustomerFrm_Load(object sender, EventArgs e)
        {
            loadData();
        }

        private void loadData()
        {
            using (MyHotelContext context = new MyHotelContext())
            {
                var dataDg = context.Customers
                    .Select(item => new
                    {
                        CusID = item.CusId,
                        LastName = item.LastName,
                        FirstName = item.FirstName,
                        Gender = (item.Gender != null ? (item.Gender == true ? "Nam" : "Nữ") : ""),
                        DOB = item.Dob,
                        Address = item.Address,
                        Email = item.Email,
                        PhoneNumber = item.PhoneNumber,
                        Password = item.Password,
                    })
                    .ToList();
                dgCustomer.DataSource = dataDg;
                dgCustomer.Columns["CusID"].HeaderText = "Mã khách hàng";
                dgCustomer.Columns["FirstName"].HeaderText = "Tên";
                dgCustomer.Columns["LastName"].HeaderText = "Họ";
                dgCustomer.Columns["Gender"].HeaderText = "Giới tính";
                dgCustomer.Columns["DOB"].HeaderText = "Ngày sinh";
                dgCustomer.Columns["Address"].HeaderText = "Địa chỉ";
                dgCustomer.Columns["PhoneNumber"].HeaderText = "SĐT";
                dgCustomer.Columns["Password"].HeaderText = "Mật khẩu";
            }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtLastname.Text))
            {
                MessageBox.Show("Họ không được trống! Làm ơn nhập lại!");
                return;
            }
            if (string.IsNullOrWhiteSpace(txtFirstname.Text))
            {
                MessageBox.Show("Tên không được trống! Làm ơn nhập lại!");
                return;
            }
            if (!rdoMale.Checked && !rdoFemale.Checked)
            {
                MessageBox.Show("Giới tính không được trống! Làm ơn chọn lại!");
                return;
            }
            if (string.IsNullOrWhiteSpace(txtAddress.Text))
            {
                MessageBox.Show("Địa chỉ không được trống! Làm ơn nhập lại!");
                return;
            }
            if (string.IsNullOrWhiteSpace(txtEmail.Text))
            {
                MessageBox.Show("Email không được trống! Làm ơn nhập lại!");
                return;
            }
            if (!Regex.IsMatch(txtEmail.Text.Trim(), "[a-zA-Z0-9]{1,18}[@][a-z]{1,8}[.][a-z]{1,8}"))
            {
                MessageBox.Show("Email must not contain: Unicode characters, special characters other than @ and . ; " +
                    "Allow uppercase, lowercase letters and numeric characters(0 - 9), maximum length of parts of email: " +
                    "username: 18, mail server: 8, domain: 8; max length: 34");
                return;
            }
            if (string.IsNullOrWhiteSpace(txtPhonenumber.Text))
            {
                MessageBox.Show("Số điện thoại không được trống! Làm ơn nhập lại!");
                return;
            }
            if (!Regex.IsMatch(txtPhonenumber.Text.Trim(), "^[0-9]{10}$"))
            {
                MessageBox.Show("Phone number must be 10-digit number.");
                return;
            }
            if (string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                MessageBox.Show("Mật khẩu không được trống! Làm ơn nhập lại!");
                return;
            }
            //MessageBox.Show("CustomFormat: "+dtpDOB.CustomFormat+"\nText: "+dtpDOB.Text+"\nValue: "+dtpDOB.Value.ToString());
            using (MyHotelContext context = new MyHotelContext())
            {
                //Tạo đối tượng sẽ insert
                Customer cus = new Customer
                {
                    FirstName = txtFirstname.Text.Trim(),
                    LastName = txtLastname.Text.Trim(),
                    Gender = (rdoMale.Checked ? true : false),
                    Dob = dtpDOB.Text,
                    Address = txtAddress.Text.Trim(),
                    Email = txtEmail.Text.Trim(),
                    PhoneNumber = txtPhonenumber.Text.Trim(),
                    Password = txtPassword.Text.Trim()
                };
                context.Customers.Add(cus);
                if (context.SaveChanges() > 0)
                {
                    MessageBox.Show("Insert successfully!");
                }
                loadData();
            }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtCusID.Text))
            {
                MessageBox.Show("Mã khách hàng đang bị trống! Làm ơn chọn một khách hàng bất kỳ trong danh sách ở dưới để cập nhật!");
                return;
            }
            if (!Regex.IsMatch(txtEmail.Text.Trim(), "[a-zA-Z0-9]{1,18}[@][a-z]{1,8}[.][a-z]{1,8}"))
            {
                MessageBox.Show("Email must not contain: Unicode characters, special characters other than @ and . and whitespaces; \n" +
                    "Allow uppercase, lowercase letters and numeric characters(0 - 9), max length: 25.");
                return;
            }
            if (!Regex.IsMatch(txtPhonenumber.Text.Trim(), "^[0-9]{10}$"))
            {
                MessageBox.Show("Phone number must be 10-digit number.");
                return;
            }

            using (MyHotelContext context = new MyHotelContext())
            {
                //Tìm Customer muốn update
                Customer cus = context.Customers
                    .SingleOrDefault(item => item.CusId == Convert.ToInt32(txtCusID.Text));

                //Setting lại những giá trị muốn update
                cus.FirstName = txtFirstname.Text.Trim();
                cus.LastName = txtLastname.Text.Trim();
                cus.Gender = (rdoMale.Checked ? true : false);
                cus.Dob = dtpDOB.Text;
                cus.Address = txtAddress.Text.Trim();
                cus.Email = txtEmail.Text.Trim();
                cus.PhoneNumber = txtPhonenumber.Text.Trim();
                cus.Password = txtPassword.Text.Trim();

                if (context.SaveChanges() > 0)
                {
                    MessageBox.Show("Update successfully!");
                }
                loadData();
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtCusID.Text))
            {
                MessageBox.Show("Mã khách hàng đang bị trống! Làm ơn chọn một khách hàng bất kỳ trong danh sách ở dưới để xóa!");
                return;
            }

            using (MyHotelContext context = new MyHotelContext())
            {
                //Tìm Customer sẽ delete
                Customer cus = context.Customers
                    .SingleOrDefault(item => item.CusId == Convert.ToInt32(txtCusID.Text));

                if (MessageBox.Show("Bạn có muốn xóa thông tin khách hàng này?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
                {
                    context.Customers.Remove(cus);
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
            txtCusID.Text = "";
            txtFirstname.Text = "";
            txtLastname.Text = "";
            rdoMale.Checked = false;
            rdoFemale.Checked = false;
            txtAddress.Text = "";
            dtpDOB.Value = DateTime.Parse("01/01/1900");
            txtEmail.Text = "";
            txtPhonenumber.Text = "";
            txtPassword.Text = "";
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn thoát?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
            {
                this.Close();
            }
        }

        private void btnSearchByLastname_Click(object sender, EventArgs e)
        {
            using (MyHotelContext context = new MyHotelContext())
            {
                var result = context.Customers
                    .Select(item => new
                    {
                        CusID = item.CusId,
                        LastName = item.LastName,
                        FirstName = item.FirstName,
                        Gender = (item.Gender != null ? (item.Gender == true ? "Nam" : "Nữ") : ""),
                        DOB = item.Dob,
                        Address = item.Address,
                        Email = item.Email,
                        PhoneNumber = item.PhoneNumber,
                        Password = item.Password,
                    })
                    .Where(cus => cus.LastName.ToLower().Contains(txtLastname.Text.Trim().ToLower()))
                    .ToList();
                dgCustomer.DataSource = result;
            }
        }

        private void btnSearchByFirstname_Click(object sender, EventArgs e)
        {
            using (MyHotelContext context = new MyHotelContext())
            {
                var result = context.Customers
                    .Select(item => new
                    {
                        CusID = item.CusId,
                        LastName = item.LastName,
                        FirstName = item.FirstName,
                        Gender = (item.Gender != null ? (item.Gender == true ? "Nam" : "Nữ") : ""),
                        DOB = item.Dob,
                        Address = item.Address,
                        Email = item.Email,
                        PhoneNumber = item.PhoneNumber,
                        Password = item.Password,
                    })
                    .Where(cus => cus.FirstName.ToLower().Contains(txtFirstname.Text.Trim().ToLower()))
                    .ToList();
                dgCustomer.DataSource = result;
            }
        }

        private void btnSearchByGender_Click(object sender, EventArgs e)
        {
            //MessageBox.Show("this is male/female search!");

            //validate
            if (!rdoMale.Checked && !rdoFemale.Checked)
            {
                MessageBox.Show("Làm ơn hãy chọn một giới tính trước để tìm kiếm!");
                return;
            }

            using (MyHotelContext context = new MyHotelContext())
            {
                if (rdoMale.Checked)
                {
                    var result = context.Customers
                        .Select(item => new
                        {
                            CusID = item.CusId,
                            LastName = item.LastName,
                            FirstName = item.FirstName,
                            Gender = (item.Gender != null ? (item.Gender == true ? "Nam" : "Nữ") : ""),
                            DOB = item.Dob,
                            Address = item.Address,
                            Email = item.Email,
                            PhoneNumber = item.PhoneNumber,
                            Password = item.Password,
                        })
                        .Where(cus => cus.Gender == "Nam")
                        .ToList();
                    dgCustomer.DataSource = result;
                }
                else
                {
                    var result = context.Customers
                        .Select(item => new
                        {
                            CusID = item.CusId,
                            LastName = item.LastName,
                            FirstName = item.FirstName,
                            Gender = (item.Gender != null ? (item.Gender == true ? "Nam" : "Nữ") : ""),
                            DOB = item.Dob,
                            Address = item.Address,
                            Email = item.Email,
                            PhoneNumber = item.PhoneNumber,
                            Password = item.Password,
                        })
                        .Where(cus => cus.Gender == "Nữ")
                        .ToList();
                    dgCustomer.DataSource = result;
                }
            }
        }

        private void btnSearchByDOB_Click(object sender, EventArgs e)
        {
            using (MyHotelContext context = new MyHotelContext())
            {
                var result = context.Customers
                    .AsEnumerable()
                    .Select(item => new
                    {
                        CusID = item.CusId,
                        LastName = item.LastName,
                        FirstName = item.FirstName,
                        Gender = (item.Gender != null ? (item.Gender == true ? "Nam" : "Nữ") : ""),
                        DOB = item.Dob,
                        Address = item.Address,
                        Email = item.Email,
                        PhoneNumber = item.PhoneNumber,
                        Password = item.Password,
                    })
                    .Where(cus => Convert.ToDateTime(cus.DOB) <= dtpDOB.Value)
                    .ToList();
                dgCustomer.DataSource = result;
            }
        }

        private void btnSearchByEmail_Click(object sender, EventArgs e)
        {
            using (MyHotelContext context = new MyHotelContext())
            {
                var result = context.Customers
                    .Select(item => new
                    {
                        CusID = item.CusId,
                        LastName = item.LastName,
                        FirstName = item.FirstName,
                        Gender = (item.Gender != null ? (item.Gender == true ? "Nam" : "Nữ") : ""),
                        DOB = item.Dob,
                        Address = item.Address,
                        Email = item.Email,
                        PhoneNumber = item.PhoneNumber,
                        Password = item.Password,
                    })
                    .Where(cus => cus.Email.ToLower().Contains(txtEmail.Text.Trim().ToLower()))
                    .ToList();
                dgCustomer.DataSource = result;
            }
        }

        private void btnSearchByPhonenumber_Click(object sender, EventArgs e)
        {
            using (MyHotelContext context = new MyHotelContext())
            {
                var result = context.Customers
                    .Select(item => new
                    {
                        CusID = item.CusId,
                        LastName = item.LastName,
                        FirstName = item.FirstName,
                        Gender = (item.Gender != null ? (item.Gender == true ? "Nam" : "Nữ") : ""),
                        DOB = item.Dob,
                        Address = item.Address,
                        Email = item.Email,
                        PhoneNumber = item.PhoneNumber,
                        Password = item.Password,
                    })
                    .Where(cus => cus.PhoneNumber.ToLower().Contains(txtPhonenumber.Text.Trim().ToLower()))
                    .ToList();
                dgCustomer.DataSource = result;
            }
        }

        private void btnSearchByAddress_Click(object sender, EventArgs e)
        {
            using (MyHotelContext context = new MyHotelContext())
            {
                var result = context.Customers
                    .Select(item => new
                    {
                        CusID = item.CusId,
                        LastName = item.LastName,
                        FirstName = item.FirstName,
                        Gender = (item.Gender != null ? (item.Gender == true ? "Nam" : "Nữ") : ""),
                        DOB = item.Dob,
                        Address = item.Address,
                        Email = item.Email,
                        PhoneNumber = item.PhoneNumber,
                        Password = item.Password,
                    })
                    .Where(cus => cus.Address.ToLower().Contains(txtAddress.Text.Trim().ToLower()))
                    .ToList();
                dgCustomer.DataSource = result;
            }
        }

        private void dgCustomer_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex == -1)
            {
                return;
            }
            txtCusID.Text = dgCustomer.Rows[e.RowIndex].Cells[0].FormattedValue.ToString();
            txtLastname.Text = dgCustomer.Rows[e.RowIndex].Cells[1].FormattedValue.ToString();
            txtFirstname.Text = dgCustomer.Rows[e.RowIndex].Cells[2].FormattedValue.ToString();
            rdoFemale.Checked = true;
            if (dgCustomer.Rows[e.RowIndex].Cells[3].FormattedValue.ToString() == "Nam")
            {
                rdoMale.Checked = true;
            }
            else if (dgCustomer.Rows[e.RowIndex].Cells[3].FormattedValue.ToString() == "")
            {
                rdoMale.Checked = false;
                rdoFemale.Checked = false;
            }
            dtpDOB.Value = (dgCustomer.Rows[e.RowIndex].Cells[4].FormattedValue.ToString() != "" ?
                Convert.ToDateTime(dgCustomer.Rows[e.RowIndex].Cells[4].FormattedValue.ToString()) :
                Convert.ToDateTime("01/01/1990"));
            txtAddress.Text = dgCustomer.Rows[e.RowIndex].Cells[5].FormattedValue.ToString();
            txtEmail.Text = dgCustomer.Rows[e.RowIndex].Cells[6].FormattedValue.ToString();
            txtPhonenumber.Text = dgCustomer.Rows[e.RowIndex].Cells[7].FormattedValue.ToString();
            txtPassword.Text = dgCustomer.Rows[e.RowIndex].Cells[8].FormattedValue.ToString();
        }
    }
}
