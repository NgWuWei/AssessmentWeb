using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssessmentWeb.Private
{
    public partial class AddGroupDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            groupNamelbl.Text = (String)Session["GroupName"];
        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gv = GridView1.SelectedRow;
            Response.Redirect("~/Private/AssignTest.aspx?ExamID3=" + gv.Cells[1].Text + "&Subject3=" + gv.Cells[2].Text + "&ExamType3=" + gv.Cells[3].Text);
        }
    }
}