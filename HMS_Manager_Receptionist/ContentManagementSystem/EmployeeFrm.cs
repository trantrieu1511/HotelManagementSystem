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
    public partial class EmployeeFrm : Form
    {
        public EmployeeFrm()
        {
            InitializeComponent();
            txtEmpID.Enabled = false;
            cboReportsTo.Enabled = false;
        }

        private void EmployeeFrm_Load(object sender, EventArgs e)
        {
            loadData();
        }

        private void loadData()
        {
            using (MyHotelContext context = new MyHotelContext())
            {
                var dataDg = context.Employees
                    .Where(emp => emp.ReportsTo != null)
                    .Select(item => new
                    {
                        EmpID = item.EmpId,
                        LastName = item.LastName,
                        FirstName = item.FirstName,
                        Gender = (item.Gender == true ? "Nam" : "Nữ"),
                        DOB = item.Dob,
                        HireDate = item.HireDate,
                        Address = item.Address,
                        Email = item.Email,
                        PhoneNumber = item.PhoneNumber,
                        Username = item.Username,
                        Password = item.Password,
                    })
                    .ToList();
                dgEmployee.DataSource = dataDg;
                dgEmployee.Columns["EmpID"].HeaderText = "Mã nhân viên";
                dgEmployee.Columns["FirstName"].HeaderText = "Tên";
                dgEmployee.Columns["LastName"].HeaderText = "Họ";
                dgEmployee.Columns["Gender"].HeaderText = "Giới tính";
                dgEmployee.Columns["DOB"].HeaderText = "Ngày sinh";
                dgEmployee.Columns["HireDate"].HeaderText = "Ngày được thuê vào làm việc";
                dgEmployee.Columns["Address"].HeaderText = "Địa chỉ";
                dgEmployee.Columns["PhoneNumber"].HeaderText = "SĐT";
                dgEmployee.Columns["Username"].HeaderText = "Tên người dùng";
                dgEmployee.Columns["Password"].HeaderText = "Mật khẩu";
                var dataCboReportsTo = context.Employees
                    .Select(item => new
                    {
                        EmpID = item.EmpId,
                        FullName = item.LastName + " " + item.FirstName,
                        ReportsTo = item.ReportsTo
                    })
                    .Where(emp => emp.ReportsTo == null)
                    .ToList();
                cboReportsTo.DataSource = dataCboReportsTo;
                cboReportsTo.DisplayMember = "FullName";
                cboReportsTo.ValueMember = "EmpID";
            }
        }

        private void btnAdd_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtFirstname.Text))
            {
                MessageBox.Show("Tên không được trống! Làm ơn nhập lại!");
                return;
            }
            if (string.IsNullOrWhiteSpace(txtLastname.Text))
            {
                MessageBox.Show("Họ không được trống! Làm ơn nhập lại!");
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
                MessageBox.Show("Email must not contain: Unicode characters, special characters other than @ and . and whitespaces; \n" +
                    "Allow uppercase, lowercase letters and numeric characters(0 - 9), max length: 25.");
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
            if (string.IsNullOrWhiteSpace(txtUsername.Text))
            {
                MessageBox.Show("Tên người dùng không được trống! Làm ơn nhập lại!");
                return;
            }
            if (string.IsNullOrWhiteSpace(txtPassword.Text))
            {
                MessageBox.Show("Mật khẩu không được trống! Làm ơn nhập lại!");
                return;
            }
            if (string.IsNullOrWhiteSpace(cboReportsTo.Text))
            {
                MessageBox.Show("Báo cáo tới không được trống! Làm ơn chọn lại!");
                return;
            }
            //MessageBox.Show("CustomFormat: "+dtpDOB.CustomFormat+"\nText: "+dtpDOB.Text+"\nValue: "+dtpDOB.Value.ToString());
            using (MyHotelContext context = new MyHotelContext())
            {
                //Tạo đối tượng sẽ insert
                Employee emp = new Employee
                {
                    FirstName = txtFirstname.Text.Trim(),
                    LastName = txtLastname.Text.Trim(),
                    Gender = (rdoMale.Checked ? true : false),
                    Dob = dtpDOB.Text,
                    HireDate = dtpHireDate.Text,
                    Address = txtAddress.Text.Trim(),
                    Email = txtEmail.Text.Trim(),
                    PhoneNumber = txtPhonenumber.Text.Trim(),
                    Username = txtUsername.Text.Trim(),
                    Password = txtPassword.Text.Trim(),
                    ReportsTo = Convert.ToInt32(cboReportsTo.SelectedValue)
                };
                context.Employees.Add(emp);
                if (context.SaveChanges() > 0)
                {
                    MessageBox.Show("Insert successfully!");
                }
                loadData();
            }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtEmpID.Text))
            {
                MessageBox.Show("Mã nhân viên đang bị trống! Làm ơn chọn một nhân viên bất kỳ trong danh sách ở dưới để cập nhật!");
                return;
            }
            if (!Regex.IsMatch(txtEmail.Text.Trim(), "[a-zA-Z0-9]{1,18}[@][a-z]{1,8}[.][a-z]{1,8}"))
            {
                MessageBox.Show("Email must not contain: Unicode characters, special characters other than @ and . ; " +
                    "Allow uppercase, lowercase letters and numeric characters(0 - 9), maximum length of parts of email: " +
                    "username: 18, mail server: 8, domain: 8; max length: 34");
                return;
            }
            if (!Regex.IsMatch(txtPhonenumber.Text.Trim(), "^[0-9]{10}$"))
            {
                MessageBox.Show("Phone number must be 10-digit number.");
                return;
            }

            using (MyHotelContext context = new MyHotelContext())
            {
                //Tìm Employee muốn update
                Employee emp = context.Employees
                    .SingleOrDefault(item => item.EmpId == Convert.ToInt32(txtEmpID.Text));

                //Setting lại những giá trị muốn update
                emp.FirstName = txtFirstname.Text.Trim();
                emp.LastName = txtLastname.Text.Trim();
                emp.Gender = (rdoMale.Checked ? true : false);
                emp.Dob = dtpDOB.Text;
                emp.HireDate = dtpHireDate.Text;
                emp.Address = txtAddress.Text.Trim();
                emp.Email = txtEmail.Text.Trim();
                emp.PhoneNumber = txtPhonenumber.Text.Trim();
                emp.Username = txtUsername.Text.Trim();
                emp.Password = txtPassword.Text.Trim();
                emp.ReportsTo = Convert.ToInt32(cboReportsTo.SelectedValue);

                if (context.SaveChanges() > 0)
                {
                    MessageBox.Show("Update successfully!");
                }
                loadData();
            }
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            if (string.IsNullOrWhiteSpace(txtEmpID.Text))
            {
                MessageBox.Show("Mã nhân viên đang bị trống! Làm ơn chọn một nhân viên bất kỳ trong danh sách ở dưới để xóa!");
                return;
            }

            using (MyHotelContext context = new MyHotelContext())
            {
                //Tìm Employee sẽ delete
                Employee emp = context.Employees
                    .SingleOrDefault(item => item.EmpId == Convert.ToInt32(txtEmpID.Text));

                if (MessageBox.Show("Bạn có muốn xóa thông tin nhân viên này?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
                {
                    context.Employees.Remove(emp);
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
            txtEmpID.Text = "";
            txtFirstname.Text = "";
            txtLastname.Text = "";
            rdoMale.Checked = false;
            rdoFemale.Checked = false;
            txtAddress.Text = "";
            dtpDOB.Value = DateTime.Parse("01/01/1900");
            dtpHireDate.Value = DateTime.Now;
            txtEmail.Text = "";
            txtPhonenumber.Text = "";
            txtUsername.Text = "";
            txtPassword.Text = "";
            //cboReportsTo.Text = "";
            cboSearchBy.Text = "";
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn thoát?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
            {
                this.Close();
            }
        }

        private void btnSearch_Click(object sender, EventArgs e)
        {
            string option = cboSearchBy.Text.Trim().ToLower();
            //MessageBox.Show(option);
            switch (option)
            {
                case "firstname":
                    {
                        //MessageBox.Show("this is firstname search!");
                        using (MyHotelContext context = new MyHotelContext())
                        {
                            var result = context.Employees
                                .Where(emp => emp.ReportsTo != null)
                                .Select(item => new
                                {
                                    EmpID = item.EmpId,
                                    LastName = item.LastName,
                                    FirstName = item.FirstName,
                                    Gender = (item.Gender == true ? "Nam" : "Nữ"),
                                    DOB = item.Dob,
                                    HireDate = item.HireDate,
                                    Address = item.Address,
                                    Email = item.Email,
                                    PhoneNumber = item.PhoneNumber,
                                    Username = item.Username,
                                    Password = item.Password,
                                })
                                .Where(emp => emp.FirstName.ToLower().Contains(txtFirstname.Text.Trim().ToLower()))
                                .ToList();
                            dgEmployee.DataSource = result;
                        }
                        break;
                    }
                case "lastname":
                    {
                        //MessageBox.Show("this is lastname search!");
                        using (MyHotelContext context = new MyHotelContext())
                        {
                            var result = context.Employees
                                .Where(emp => emp.ReportsTo != null)
                                .Select(item => new
                                {
                                    EmpID = item.EmpId,
                                    LastName = item.LastName,
                                    FirstName = item.FirstName,
                                    Gender = (item.Gender == true ? "Nam" : "Nữ"),
                                    DOB = item.Dob,
                                    HireDate = item.HireDate,
                                    Address = item.Address,
                                    Email = item.Email,
                                    PhoneNumber = item.PhoneNumber,
                                    Username = item.Username,
                                    Password = item.Password,
                                })
                                .Where(emp => emp.LastName.ToLower().Contains(txtLastname.Text.Trim().ToLower()))
                                .ToList();
                            dgEmployee.DataSource = result;
                        }
                        break;
                    }
                case "gender":
                    {
                        if (!rdoMale.Checked && !rdoFemale.Checked)
                        {
                            MessageBox.Show("Làm ơn hãy chọn một giới tính trước để tìm kiếm!");
                            return;
                        }
                        //MessageBox.Show("this is male/female search!");
                        using (MyHotelContext context = new MyHotelContext())
                        {
                            if (rdoMale.Checked)
                            {
                                var result = context.Employees
                                    .Where(emp => emp.ReportsTo != null)
                                    .Select(item => new
                                    {
                                        EmpID = item.EmpId,
                                        LastName = item.LastName,
                                        FirstName = item.FirstName,
                                        Gender = (item.Gender == true ? "Nam" : "Nữ"),
                                        DOB = item.Dob,
                                        HireDate = item.HireDate,
                                        Address = item.Address,
                                        Email = item.Email,
                                        PhoneNumber = item.PhoneNumber,
                                        Username = item.Username,
                                        Password = item.Password,
                                    })
                                    .Where(emp => emp.Gender == "Nam")
                                    .ToList();
                                dgEmployee.DataSource = result;
                            }
                            else
                            {
                                var result = context.Employees
                                    .Where(emp => emp.ReportsTo != null)
                                    .Select(item => new
                                    {
                                        EmpID = item.EmpId,
                                        LastName = item.LastName,
                                        FirstName = item.FirstName,
                                        Gender = (item.Gender == true ? "Nam" : "Nữ"),
                                        DOB = item.Dob,
                                        HireDate = item.HireDate,
                                        Address = item.Address,
                                        Email = item.Email,
                                        PhoneNumber = item.PhoneNumber,
                                        Username = item.Username,
                                        Password = item.Password,
                                    })
                                    .Where(emp => emp.Gender == "Nữ")
                                    .ToList();
                                dgEmployee.DataSource = result;
                            }
                        }
                        break;
                    }
                case "address":
                    {
                        //MessageBox.Show("this is address search!");
                        using (MyHotelContext context = new MyHotelContext())
                        {
                            var result = context.Employees
                                .Where(emp => emp.ReportsTo != null)
                                .Select(item => new
                                {
                                    EmpID = item.EmpId,
                                    LastName = item.LastName,
                                    FirstName = item.FirstName,
                                    Gender = (item.Gender == true ? "Nam" : "Nữ"),
                                    DOB = item.Dob,
                                    HireDate = item.HireDate,
                                    Address = item.Address,
                                    Email = item.Email,
                                    PhoneNumber = item.PhoneNumber,
                                    Username = item.Username,
                                    Password = item.Password,
                                })
                                .Where(emp => emp.Address.ToLower().Contains(txtAddress.Text.Trim().ToLower()))
                                .ToList();
                            dgEmployee.DataSource = result;
                        }
                        break;
                    }
                case "dob":
                    {
                        //MessageBox.Show("this is dob search!");
                        using (MyHotelContext context = new MyHotelContext())
                        {
                            var result = context.Employees
                                .AsEnumerable()
                                .Where(emp => emp.ReportsTo != null)
                                .Select(item => new
                                {
                                    EmpID = item.EmpId,
                                    LastName = item.LastName,
                                    FirstName = item.FirstName,
                                    Gender = (item.Gender == true ? "Nam" : "Nữ"),
                                    DOB = item.Dob,
                                    HireDate = item.HireDate,
                                    Address = item.Address,
                                    Email = item.Email,
                                    PhoneNumber = item.PhoneNumber,
                                    Username = item.Username,
                                    Password = item.Password,
                                })
                                .Where(emp => Convert.ToDateTime(emp.DOB) <= dtpDOB.Value)
                                .ToList();
                            dgEmployee.DataSource = result;
                        }
                        break;
                    }
                case "hiredate":
                    {
                        //MessageBox.Show("this is hiredate search!");
                        using (MyHotelContext context = new MyHotelContext())
                        {
                            var result = context.Employees
                                .Where(emp => emp.ReportsTo != null)
                                .AsEnumerable()
                                .Select(item => new
                                {
                                    EmpID = item.EmpId,
                                    LastName = item.LastName,
                                    FirstName = item.FirstName,
                                    Gender = (item.Gender == true ? "Nam" : "Nữ"),
                                    DOB = item.Dob,
                                    HireDate = item.HireDate,
                                    Address = item.Address,
                                    Email = item.Email,
                                    PhoneNumber = item.PhoneNumber,
                                    Username = item.Username,
                                    Password = item.Password,
                                })
                                .Where(emp => Convert.ToDateTime(emp.HireDate) <= dtpHireDate.Value)
                                .ToList();
                            dgEmployee.DataSource = result;
                        }
                        break;
                    }
                case "email":
                    {
                        //MessageBox.Show("this is email search!");
                        using (MyHotelContext context = new MyHotelContext())
                        {
                            var result = context.Employees
                                .Where(emp => emp.ReportsTo != null)
                                .Select(item => new
                                {
                                    EmpID = item.EmpId,
                                    LastName = item.LastName,
                                    FirstName = item.FirstName,
                                    Gender = (item.Gender == true ? "Nam" : "Nữ"),
                                    DOB = item.Dob,
                                    HireDate = item.HireDate,
                                    Address = item.Address,
                                    Email = item.Email,
                                    PhoneNumber = item.PhoneNumber,
                                    Username = item.Username,
                                    Password = item.Password,
                                })
                                .Where(emp => emp.Email.ToLower().Contains(txtEmail.Text.Trim().ToLower()))
                                .ToList();
                            dgEmployee.DataSource = result;
                        }
                        break;
                    }
                case "phonenumber":
                    {
                        //MessageBox.Show("this is phonenumber search!");
                        using (MyHotelContext context = new MyHotelContext())
                        {
                            var result = context.Employees
                                .Where(emp => emp.ReportsTo != null)
                                .Select(item => new
                                {
                                    EmpID = item.EmpId,
                                    LastName = item.LastName,
                                    FirstName = item.FirstName,
                                    Gender = (item.Gender == true ? "Nam" : "Nữ"),
                                    DOB = item.Dob,
                                    HireDate = item.HireDate,
                                    Address = item.Address,
                                    Email = item.Email,
                                    PhoneNumber = item.PhoneNumber,
                                    Username = item.Username,
                                    Password = item.Password,
                                })
                                .Where(emp => emp.PhoneNumber.ToLower().Contains(txtPhonenumber.Text.Trim().ToLower()))
                                .ToList();
                            dgEmployee.DataSource = result;
                        }
                        break;
                    }
                case "username":
                    {
                        //MessageBox.Show("this is username search!");
                        using (MyHotelContext context = new MyHotelContext())
                        {
                            var result = context.Employees
                                .Where(emp => emp.ReportsTo != null)
                                .Select(item => new
                                {
                                    EmpID = item.EmpId,
                                    LastName = item.LastName,
                                    FirstName = item.FirstName,
                                    Gender = (item.Gender == true ? "Nam" : "Nữ"),
                                    DOB = item.Dob,
                                    HireDate = item.HireDate,
                                    Address = item.Address,
                                    Email = item.Email,
                                    PhoneNumber = item.PhoneNumber,
                                    Username = item.Username,
                                    Password = item.Password,
                                })
                                .Where(emp => emp.Username.ToLower().Contains(txtUsername.Text.Trim().ToLower()))
                                .ToList();
                            dgEmployee.DataSource = result;
                        }
                        break;
                    }
                /*case "reportsto":
                    {
                        //MessageBox.Show("this is reportsto search!");
                        break;
                    }*/
                default:
                    MessageBox.Show("Xin hãy nhập hoặc chọn giá trị hợp lệ trong danh sách tìm kiếm!");
                    return;
            }
        }

        private void dgEmployee_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex == -1)
            {
                return;
            }
            txtEmpID.Text = dgEmployee.Rows[e.RowIndex].Cells[0].FormattedValue.ToString();
            txtLastname.Text = dgEmployee.Rows[e.RowIndex].Cells[1].FormattedValue.ToString();
            txtFirstname.Text = dgEmployee.Rows[e.RowIndex].Cells[2].FormattedValue.ToString();
            rdoFemale.Checked = true;
            if (dgEmployee.Rows[e.RowIndex].Cells[3].FormattedValue.ToString() == "Nam")
            {
                rdoMale.Checked = true;
            }
            else if (dgEmployee.Rows[e.RowIndex].Cells[3].FormattedValue.ToString() == "")
            {
                rdoMale.Checked = false;
                rdoFemale.Checked = false;
            }
            /*dtpDOB.Value = Convert.ToDateTime(dgEmployee.Rows[e.RowIndex].Cells[5].FormattedValue.ToString());
            dtpHireDate.Value = Convert.ToDateTime(dgEmployee.Rows[e.RowIndex].Cells[6].FormattedValue.ToString());*/
            dtpDOB.Value = (dgEmployee.Rows[e.RowIndex].Cells[4].FormattedValue.ToString() != "" ?
                Convert.ToDateTime(dgEmployee.Rows[e.RowIndex].Cells[4].FormattedValue.ToString()) :
                Convert.ToDateTime("01/01/1990"));
            dtpHireDate.Value = (dgEmployee.Rows[e.RowIndex].Cells[5].FormattedValue.ToString() != "" ?
                Convert.ToDateTime(dgEmployee.Rows[e.RowIndex].Cells[5].FormattedValue.ToString()) :
                Convert.ToDateTime("01/01/1990"));
            txtAddress.Text = dgEmployee.Rows[e.RowIndex].Cells[6].FormattedValue.ToString();
            txtEmail.Text = dgEmployee.Rows[e.RowIndex].Cells[7].FormattedValue.ToString();
            txtPhonenumber.Text = dgEmployee.Rows[e.RowIndex].Cells[8].FormattedValue.ToString();
            txtUsername.Text = dgEmployee.Rows[e.RowIndex].Cells[9].FormattedValue.ToString();
            txtPassword.Text = dgEmployee.Rows[e.RowIndex].Cells[10].FormattedValue.ToString();
            /*cboReportsTo.SelectedValue = Convert.ToInt32(dgEmployee.Rows[e.RowIndex].Cells[11].Value);*/
        }
    }
}
