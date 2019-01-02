using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssessmentWeb.Private
{
    public partial class AssignTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Request.QueryString["ExamID3"].ToString();
            Label2.Text = Request.QueryString["Subject3"].ToString();
            Label3.Text = Request.QueryString["ExamType3"].ToString();
        }

        protected void assignbtn_Click(object sender, EventArgs e)
        {
            string str = ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString;

            string studentID = GridView1.SelectedRow.Cells[1].Text;

            string groupName = Session["GroupName"].ToString();

            using (SqlConnection con = new SqlConnection(str))
            {

                con.Open();
                foreach (GridViewRow row in GridView1.Rows)
                {
                    CheckBox myCheckBox = row.FindControl("chkSelect") as CheckBox;
                    if (myCheckBox.Checked)
                    {
                        using (SqlCommand cmd = new SqlCommand("INSERT INTO Groups(GroupName, Subject, TestType, ExamID, StudentID ) Values(@GroupName, @Subject, @TestType, @ExamID, @StudentID)", con))
                        {
                            //cmd.Parameters.AddWithValue("PersonId", Convert.ToInt32(GridViewConsNames.DataKeys[row.RowIndex].Value));
                            cmd.Parameters.AddWithValue("@GroupName", groupName);
                            cmd.Parameters.AddWithValue("@Subject", Label2.Text);
                            cmd.Parameters.AddWithValue("@TestType", Label3.Text);
                            cmd.Parameters.AddWithValue("@ExamID", Convert.ToInt32(Label1.Text));

                            cmd.Parameters.AddWithValue("@StudentID", studentID);
                        }
                    }
                }
            }

            Response.Redirect("~/Private/AssignTestPart2.aspx");


        }
    }
}