using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssessmentWeb.Assessment
{
    public partial class FreeTestAssessment : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            CurrentTestlbl.Text = (String)Session["name2"];
            CurrentIDlbl.Text = (String)Session["id2"];
            CurrentTypelbl.Text = (String)Session["type2"];
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

                    TextBox Anstxt = items.FindControl("TextBox1") as TextBox;


                    // get correct answer from database
                    con.Open();
  
                    SqlCommand cmd = new SqlCommand("insert into StudentAssessments( stasAnswerGiven, QuestionID, QuestionType, ExamID, StudentID) values( @ans, @QID, @QuestionType, @ExamID, @studID)", con);

                    string userID = Session["user"].ToString();

                    // set into student assessment with answer provided
                    // cmd.Parameters.AddWithValue("@score", score);
                    cmd.Parameters.AddWithValue("@ans", answer);
                    cmd.Parameters.AddWithValue("@QID", Convert.ToInt32(qID.Text));
                    cmd.Parameters.AddWithValue("@QuestionType", CurrentTypelbl.Text);
                    cmd.Parameters.AddWithValue("@ExamID", Convert.ToInt32(CurrentIDlbl.Text));
                    cmd.Parameters.AddWithValue("@studID", userID);
                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();
                }
            }

            // update score
            Response.Redirect("~/Assessment/EndQuestionAssessment.aspx?");

        }

       
    }
}