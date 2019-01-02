using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssessmentWeb.Private
{
    public partial class AddGroupMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        protected void AddGroupbtn_Click(object sender, EventArgs e)
        {
            String GroupName = txtGroupName.Text;
            Session["GroupName"] = GroupName;

            Response.Redirect("~/Private/AddGroupDetails.aspx");
        }
    }
}