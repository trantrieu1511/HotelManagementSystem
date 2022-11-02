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
    public partial class EmployeeFrm : Form
    {
        public EmployeeFrm()
        {
            InitializeComponent();
            txtEmpID.Enabled = false;
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
                    .Select(item => new
                    {
                        EmpID = item.EmpId,
                        FirstName = item.FirstName,
                        LastName = item.LastName,
                        Gender = item.Gender,
                        DOB = item.Dob,
                        HireDate = item.HireDate,
                        Address = item.Address,
                        Email = item.Email,
                        PhoneNumber = item.PhoneNumber,
                        Username = item.Username,
                        Password = item.Password,
                        ReportsTo = item.ReportsTo
                    })
                    .ToList();
                dgEmployee.DataSource = dataDg;
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
            //MessageBox.Show("CustomFormat: "+dtpDOB.CustomFormat+"\nText: "+dtpDOB.Text+"\nValue: "+dtpDOB.Value.ToString());
            using (MyHotelContext context = new MyHotelContext())
            {
                //Tạo đối tượng sẽ insert
                Employee emp = new Employee
                {
                    FirstName = txtFirstname.Text,
                    LastName = txtLastname.Text,
                    Gender = (rdoMale.Checked ? true : false),
                    Dob = dtpDOB.Text,
                    HireDate = dtpHireDate.Text,
                    Address = txtAddress.Text,
                    Email = txtEmail.Text,
                    PhoneNumber = txtPhonenumber.Text,
                    Username = txtUsername.Text,
                    Password = txtPassword.Text,
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
            using (MyHotelContext context = new MyHotelContext())
            {
                //Tìm Employee muốn update
                Employee emp = context.Employees
                    .SingleOrDefault(item => item.EmpId == Convert.ToInt32(txtEmpID.Text));

                //Setting lại những giá trị muốn update
                emp.FirstName = txtFirstname.Text;
                emp.LastName = txtLastname.Text;
                emp.Gender = (rdoMale.Checked ? true : false);
                emp.Dob = dtpDOB.Text;
                emp.HireDate = dtpHireDate.Text;
                emp.Address = txtAddress.Text;
                emp.Email = txtEmail.Text;
                emp.PhoneNumber = txtPhonenumber.Text;
                emp.Username = txtUsername.Text;
                emp.Password = txtPassword.Text;
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
            cboReportsTo.Text = "";
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
                        break;
                    }
                case "lastname":
                    {
                        //MessageBox.Show("this is lastname search!");
                        break;
                    }
                case "male":
                    {
                        //MessageBox.Show("this is male search!");
                        break;
                    }
                case "female":
                    {
                        //MessageBox.Show("this is female search!");
                        break;
                    }
                case "address":
                    {
                        //MessageBox.Show("this is address search!");
                        break;
                    }
                case "dob":
                    {
                        //MessageBox.Show("this is dob search!");
                        using (MyHotelContext context = new MyHotelContext())
                        {
                            var result = context.Employees
                                .AsEnumerable()
                                .Select(item => new
                                {
                                    EmpID = item.EmpId,
                                    FirstName = item.FirstName,
                                    LastName = item.LastName,
                                    Gender = item.Gender,
                                    DOB = item.Dob,
                                    HireDate = item.HireDate,
                                    Address = item.Address,
                                    Email = item.Email,
                                    PhoneNumber = item.PhoneNumber,
                                    Username = item.Username,
                                    Password = item.Password,
                                    ReportsTo = item.ReportsTo
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
                        break;
                    }
                case "email":
                    {
                        //MessageBox.Show("this is email search!");
                        break;
                    }
                case "phonenumber":
                    {
                        //MessageBox.Show("this is phonenumber search!");
                        break;
                    }
                case "username":
                    {
                        //MessageBox.Show("this is username search!");
                        break;
                    }
                case "reportsto":
                    {
                        //MessageBox.Show("this is reportsto search!");
                        break;
                    }
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
            txtFirstname.Text = dgEmployee.Rows[e.RowIndex].Cells[1].FormattedValue.ToString();
            txtLastname.Text = dgEmployee.Rows[e.RowIndex].Cells[2].FormattedValue.ToString();
            rdoFemale.Checked = true;
            if (dgEmployee.Rows[e.RowIndex].Cells[3].FormattedValue.ToString() == "true")
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
            cboReportsTo.SelectedValue = Convert.ToInt32(dgEmployee.Rows[e.RowIndex].Cells[11].Value);
        }
    }
}
