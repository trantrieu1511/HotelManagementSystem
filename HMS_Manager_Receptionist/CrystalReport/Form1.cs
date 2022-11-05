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
    public partial class Form1 : Form
    {
        private DataTable dtRp;

        public Form1(DataTable dtRp)
        {
            this.dtRp = dtRp;
            InitializeComponent();
        }

        private void crystalReportViewer1_Load(object sender, EventArgs e)
        {
            CrystalReport1 crystalReport1 = new CrystalReport1();
            crystalReport1.SetDataSource(dtRp);
            crystalReportViewer1.ReportSource = crystalReport1;
        }
    }
}
