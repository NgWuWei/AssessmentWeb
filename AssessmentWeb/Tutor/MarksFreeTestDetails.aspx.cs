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
    public partial class MarksFreeTestDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Text = Request.QueryString["ExamID"].ToString();
            Label2.Text = Request.QueryString["Subject"].ToString();
            Label3.Text = Request.QueryString["StudentID"].ToString();
            Label4.Text = Request.QueryString["ExamType"].ToString();

        }

        protected void submitbtn_Click(object sender, EventArgs e)
        {
            int totalQuestion = 0, score = 0, totalScore = 0;
            string answer = " ", correctAnswer = " ";

            foreach (DataListItem items in DataList1.Items)
            {
                // reset answer to blank
                answer = correctAnswer = " ";

                // open database
                using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
                {
                    // update question index
                    score = 0;

                    // get all controls from each datalist items
                    Label qID = items.FindControl("lblID") as Label;
                    Label marks = items.FindControl("EachMarksLabel") as Label;
                    Label QNo = items.FindControl("QNolbl") as Label;

                    TextBox confirmMark = items.FindControl("EachConfirmMarks") as TextBox;
                    

                    // convert the string into integer
                    score = Convert.ToInt32(confirmMark.Text);

                    // update total score
                    totalScore += score;
                    totalQuestion += Convert.ToInt32(marks.Text);
                }
            }

            // update score
            Response.Redirect("~/Tutor/CompleteMarks.aspx?result=" + UpdateScore(totalScore, totalQuestion));
        }

        private double UpdateScore(int tScore, int tQuestion)
        {
            // set total score and update into Assessment
            double percent = 100 * tScore / tQuestion;

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                con.Open();
                SqlCommand cmd = new SqlCommand("insert into Assessments(asName, asQuestionType, asTotalMarks, studID, examID) values (@asName,  @QuaestionType, @TotalMarks, @studID, @ExamID)", con);

                cmd.Parameters.AddWithValue("@asName", Label2.Text);
                cmd.Parameters.AddWithValue("@QuaestionType", Label4.Text);
                cmd.Parameters.AddWithValue("@TotalMarks", percent);
                cmd.Parameters.AddWithValue("@studID", Convert.ToInt32(Label3.Text));
                cmd.Parameters.AddWithValue("@ExamID", Convert.ToInt32(Label1.Text));

                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
            }
            return percent;
        }
    }
}

