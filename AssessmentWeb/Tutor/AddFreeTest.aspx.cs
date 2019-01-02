using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssessmentWeb.Tutor
{
    public partial class AddFreeTest : System.Web.UI.Page
    {
        static int Q = 1;

        protected void Page_Load(object sender, EventArgs e)
        {
            string str = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

            using (SqlConnection con = new SqlConnection(str))
            {
                SqlCommand cmd = new SqlCommand("SELECT MAX (ExamID) FROM Exam ", con);
                cmd.CommandType = CommandType.Text;
                con.Open();
                ExamIDtxt.Text = cmd.ExecuteScalar().ToString();
            }

            TestNametxt.Text = (String)Session["Tname"];
            QTNametxt.Text = (String)Session["Qtype"];
            Privacytxt.Text = (String)Session["privacy"];

            QuestionNolbl.Text = Convert.ToString(Q);
            //string insert = "insert into Exam(Subject,Privacy,ExamType) VALUES " +
            //    "('" + TestNametxt.Text + "','" + QTNametxt.Text + "','" + Privacytxt.Text + "')";

            //SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            //conn.Open();

            //SqlCommand cmd1 = new SqlCommand(insert, conn);
            //cmd1.ExecuteNonQuery();
            //conn.Close();

        }

        protected void btnAddQuestion_Click(object sender, EventArgs e)
        {
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

            conn.Open();

            //  SqlCommand cmd1 = new SqlCommand("Select max(QuestionOrder) as QuesOrder from MultiQuestion where ExamID='" + ExamIDtxt.Text + "'", conn);


            int eachmarks = Convert.ToInt32(resulttxt.Text);
            string insert2 = "insert into FreeTestQuestion(ftQuestionDesc,QuestionOrder,ExamID,EachMarks) values " +
                "('" + txtTitle.Text + "','" + Q  + "','" + ExamIDtxt.Text + "','" + eachmarks + "')";

            SqlCommand cmd2 = new SqlCommand(insert2, conn);
            cmd2.ExecuteNonQuery();
            conn.Close();
            Q++;
            Response.Redirect("~/Tutor/AddFreeTest.aspx");
        }

        protected void RTMbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Tutor/CheckFreeTestQuetions.aspx");
        }

        protected void reset_Click(object sender, EventArgs e)
        {

        }
    }
}