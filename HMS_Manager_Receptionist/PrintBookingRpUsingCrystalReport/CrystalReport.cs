using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace PrintBookingRpUsingCrystalReport
{
    public partial class CrystalReport : Form
    {
        private DataTable dtReport = null;

        public CrystalReport()
        {
            InitializeComponent();
            //this.dtReport = dtReport;
        }

        private void CrystalReport_Load(object sender, EventArgs e)
        {
            CrystalReport2 crystalReport2 = new CrystalReport2();
            crystalReport2.SetDataSource(dtReport);
            crystalReportViewer1.ReportSource = crystalReport2;
            crystalReportViewer1.Refresh();
        }

        /*private void CrystalReport_FormClosed(object sender, FormClosedEventArgs e)
        {
            crystalReportViewer1.CloseView(dtReport);
        }*/
    }
}
