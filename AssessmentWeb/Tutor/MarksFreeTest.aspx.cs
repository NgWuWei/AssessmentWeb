using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssessmentWeb.Tutor
{
    public partial class MarksFreeTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gv = GridView1.SelectedRow;

            Response.Redirect("~/Tutor/MarksFreeTestDetails.aspx?ExamID=" + gv.Cells[1].Text + "&Subject=" + gv.Cells[2].Text + "&StudentID=" + gv.Cells[3].Text + "&ExamType=" + gv.Cells[4].Text);

        }
    }
}