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
        }

        private void btnLogin_Click(object sender, EventArgs e)
        {
            using (MyHotelContext context = new MyHotelContext())
            {
                try
                {
                    string username = txtUsername.Text;
                    string password = txtPassword.Text;
                    if (taiKhoanTonTai(username, password))
                    {
                        MessageBox.Show("Đăng nhập thành công. Chào bạn đến với chương trình.", "Chào mừng đến với chương trình");
                        this.Hide();
                        MainFrm mainForm = new MainFrm();
                        DialogResult dr = mainForm.ShowDialog();
                        this.Close();
                    }
                    else
                    {

                        MessageBox.Show("Bạn nhập sai Tên truy cập hay mật khẩu. Xin vui lòng kiểm tra lại.", "Login");
                    }
                }
                catch (Exception)
                {
                    MessageBox.Show("Oh no.");
                }
            }
        }
        private bool taiKhoanTonTai(string user, string pass)
        {
            using (MyHotelContext context = new MyHotelContext())
            {
                var employee = context.Employees.AsEnumerable();
                foreach (var emp in employee)
                {
                    if (emp.Username == user && emp.Password == pass)
                    {
                        return true;
                    }
                }
                return false;
            }
        }
    }
}
