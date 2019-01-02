using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssessmentWeb.Tutor
{
    public partial class ViewGroupDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            groupIDlbl.Text = Request.QueryString["GroupID"].ToString();
            groupNamelbl.Text = Request.QueryString["GroupName"].ToString();

           
        }

        
    }
}