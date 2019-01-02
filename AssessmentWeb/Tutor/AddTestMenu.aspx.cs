using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssessmentWeb.Tutor
{
    public partial class AddTestMenu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if(DropDownList1.SelectedItem.Value =="Multiple Question" )
            {
                string testname = TextBox1.Text ;
                Session["Tname"] = testname;

                String questionType = DropDownList1.SelectedItem.Value;
                Session["Qtype"] = questionType;

                String privacy = DropDownList2.SelectedItem.Value;
                Session["privacy"] = privacy;

                string insert = "Insert into Exam(Subject,Privacy,ExamType) VALUES " +
                "('" + TextBox1.Text + "','" + DropDownList2.SelectedItem.Value + "','" + DropDownList1.SelectedItem.Value + "')";

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

                conn.Open();

                SqlCommand cmd1 = new SqlCommand(insert, conn);
                cmd1.ExecuteNonQuery();
                conn.Close();

                Response.Redirect("~/Tutor/AddMultipleTest.aspx");
            }
            else if (DropDownList1.SelectedItem.Value == "Free Text")
            {
                string testname = TextBox1.Text;
                Session["Tname"] = testname;

                String questionType = DropDownList1.SelectedItem.Value;
                Session["Qtype"] = questionType;

                String privacy = DropDownList2.SelectedItem.Value;
                Session["privacy"] = privacy;

                string insert = "Insert into Exam(Subject,Privacy,ExamType) VALUES " +
                "('" + TextBox1.Text + "','" + DropDownList2.SelectedItem.Value + "','" + DropDownList1.SelectedItem.Value + "')";

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

                conn.Open();

                SqlCommand cmd1 = new SqlCommand(insert, conn);
                cmd1.ExecuteNonQuery();
                conn.Close();

                Response.Redirect("~/Tutor/AddFreeTest.aspx");
            }
            else
            {

            }
            
        }
    }
}