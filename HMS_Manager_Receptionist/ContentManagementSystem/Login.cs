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
    public partial class Login : Form
    {
        public Login()
        {
            InitializeComponent();
            txtPassword.PasswordChar = '*';
            btnShowpassword.BackgroundImage = Properties.Resources.Eye_Icon_Show93;
        }

        bool isRememberme = false;
        bool isManager = false;
        private void btnLogin_Click(object sender, EventArgs e)
        {
            using (MyHotelContext context = new MyHotelContext())
            {
                try
                {
                    string username = txtUsername.Text.Trim();
                    string password = txtPassword.Text.Trim();
                    if (taiKhoanTonTai(username, password))
                    {
                        MessageBox.Show("Đăng nhập thành công. Chào bạn đến với chương trình.", "Chào mừng đến với chương trình");
                        this.Hide();
                        MainFrm mainForm = new MainFrm(isManager, username);
                        DialogResult dr = mainForm.ShowDialog();
                        if (!isRememberme)
                        {
                            txtPassword.Text = "";
                        }
                        txtPassword.PasswordChar = '*';
                        btnShowpassword.BackgroundImage = Properties.Resources.Eye_Icon_Show93;
                        this.Show();
                    }
                    else
                    {
                        MessageBox.Show("Bạn nhập sai Tên truy cập hay mật khẩu. Xin vui lòng kiểm tra lại.", "Login");
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message);
                }
            }
        }

        private bool taiKhoanTonTai(string user, string pass)
        {
            using (MyHotelContext context = new MyHotelContext())
            {
                var employee = context.Employees.ToList();
                foreach (var emp in employee)
                {
                    if (emp.Username == user && emp.Password == pass)
                    {
                        if (emp.ReportsTo == null)
                        {
                            isManager = true;
                        }
                        else
                        {
                            isManager = false;
                        }
                        return true;
                    }
                }
                return false;
            }
        }

        private void btnShowpassword_Click(object sender, EventArgs e)
        {
            if (txtPassword.PasswordChar == '\0')
            {
                btnShowpassword.BackgroundImage = Properties.Resources.Eye_Icon_Show93;
                txtPassword.PasswordChar = '*';
            }
            else
            {
                btnShowpassword.BackgroundImage = Properties.Resources.hide_512;
                txtPassword.PasswordChar = '\0';
            }
        }

        private void btnExit_Click(object sender, EventArgs e)
        {
            if (MessageBox.Show("Bạn có muốn thoát?", "Thông báo", MessageBoxButtons.OKCancel, MessageBoxIcon.Question) == DialogResult.OK)
            {
                this.Close();
            }
        }

        private void chkRememberme_CheckedChanged(object sender, EventArgs e)
        {
            if (isRememberme)
            {
                isRememberme = false;
            }
            else
            {
                isRememberme = true;
            }
        }
    }
}
