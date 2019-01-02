using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssessmentWeb.Assessment
{
    public partial class StartAssessment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Request.QueryString["ExamID3"].ToString();
            Label2.Text = Request.QueryString["Subject3"].ToString();
            Label3.Text = Request.QueryString["ExamType3"].ToString();

           
        }

        protected void startButton_Click(object sender, EventArgs e)
        {
            if(Label3.Text == "Multiple Question")
            {
                string testid = Label1.Text;
                Session["id2"] = testid;

                string testname = Label2.Text;
                Session["name2"] = testname;

                String type = Label3.Text;
                Session["type2"] = type;

                Response.Redirect("~/Assessment/MultiQuestionAssessment.aspx");
            }
            else if(Label3.Text == "Free Text")
            {
                string testid = Label1.Text;
                Session["id2"] = testid;

                string testname = Label2.Text;
                Session["name2"] = testname;

                String type = Label3.Text;
                Session["type2"] = type;

                Response.Redirect("~/Assessment/FreeTestAssessment.aspx");
            }
        }
    }
}