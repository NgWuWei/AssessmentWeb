using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssessmentWeb.Tutor
{
    public partial class ViewGroup : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {
            GridViewRow gv = GridView1.SelectedRow;
            Response.Redirect("~/Tutor/ViewGroupDetails.aspx?GroupID=" + gv.Cells[1].Text + "&GroupName=" + gv.Cells[2].Text);
        }
    }
}