using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssessmentWeb.Student
{
    public partial class QuestionMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView3_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gv = GridView3.SelectedRow;
            Response.Redirect("~/Assessment/StartAssessment.aspx?ExamID3=" + gv.Cells[1].Text + "&Subject3=" + gv.Cells[2].Text + "&ExamType3=" + gv.Cells[3].Text);

        }

        protected void GridView4_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gv = GridView4.SelectedRow;
            Response.Redirect("~/Assessment/StartAssessment.aspx?ExamID3=" + gv.Cells[1].Text + "&Subject3=" + gv.Cells[2].Text + "&ExamType3=" + gv.Cells[3].Text);

        }


    }
}