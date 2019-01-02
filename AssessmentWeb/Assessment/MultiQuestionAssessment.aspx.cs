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
    public partial class MultiQuestionAssessment : System.Web.UI.Page
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
                    RadioButton A = items.FindControl("AnswerA") as RadioButton;
                    RadioButton B = items.FindControl("AnswerB") as RadioButton;
                    RadioButton C = items.FindControl("AnswerC") as RadioButton;
                    RadioButton D = items.FindControl("AnswerD") as RadioButton;

                    // get correct answer from database
                    con.Open();
                    SqlCommand cmd = new SqlCommand("select CorrectAnswer from MultiQuestion where QuestionID = @qID and ExamID = @id2 ", con);
                    cmd.Parameters.AddWithValue("@qID", Convert.ToInt32(qID.Text));
                    cmd.Parameters.AddWithValue("@id2", Convert.ToInt32(CurrentIDlbl.Text));
                    correctAnswer = cmd.ExecuteScalar().ToString();
                    cmd.Parameters.Clear();

                    // get radio value
                    if (A.Checked)
                        answer = "A";
                    else if (B.Checked)
                        answer = "B";
                    else if (C.Checked)
                        answer = "C";
                    else if (D.Checked)
                        answer = "D";


                    // if correct then set marks, else it will be 0
                    if (correctAnswer.Equals(answer)) {
                        score = Convert.ToInt32(marks.Text);
                    }
                    else
                    {
                        score = 0;
                    }
                        

                    string userID = Session["user"].ToString();
                    

                    // set into student assessment with answer provided
                    cmd.CommandText = "insert into StudentAssessments(stasScore, stasAnswerGiven, QuestionID, QuestionType, ExamID, StudentID) values (@score, @ans, @QID, @QuestionType,  @ExamID, @studID)";
                    cmd.Parameters.AddWithValue("@score", score);
                    cmd.Parameters.AddWithValue("@ans", answer);
                    cmd.Parameters.AddWithValue("@QID", Convert.ToInt32(qID.Text));
                    cmd.Parameters.AddWithValue("@QuestionType", CurrentTypelbl.Text);
                    cmd.Parameters.AddWithValue("@ExamID", Convert.ToInt32(CurrentIDlbl.Text));
                    cmd.Parameters.AddWithValue("@studID", userID);
                    cmd.ExecuteNonQuery();
                    cmd.Parameters.Clear();

                    // update total score
                    totalScore += score;
                    totalQuestion += Convert.ToInt32(marks.Text); 
                }
            }

            // update score
            Response.Redirect("~/Assessment/EndQuestionAssessment.aspx?result=" + UpdateScore(totalScore, totalQuestion));
        }

        private double UpdateScore(int tScore, int tQuestion)
        {
            // set total score and update into Assessment
            double percent = 100 * tScore / tQuestion;
            string userID = Session["user"].ToString();
            string type=  Session["type2"].ToString();

            using (SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString))
            {
                con.Open();

                //SqlCommand cmd = new SqlCommand("update Assessments set asTotalMarks = @Percent where asID = @asID and studID = @studID", con);
                //cmd.Parameters.AddWithValue("@Percent", percent);
                //cmd.Parameters.AddWithValue("@asID", Convert.ToInt32(CurrentIDlbl.Text));
                //cmd.Parameters.AddWithValue("@studID", userID);
                //cmd.ExecuteNonQuery();
                //cmd.Parameters.Clear();

                SqlCommand cmd = new SqlCommand("insert into Assessments(asName, asQuestionType, asTotalMarks, studID, examID) values (@asName,  @QuaestionType, @TotalMarks, @studID, @ExamID)", con);
                //cmd.Parameters.AddWithValue("@Percent", percent);


                cmd.Parameters.AddWithValue("@asName", CurrentTestlbl.Text);
                cmd.Parameters.AddWithValue("@QuaestionType", type);
                cmd.Parameters.AddWithValue("@TotalMarks", percent);
                cmd.Parameters.AddWithValue("@studID", userID);
                cmd.Parameters.AddWithValue("@ExamID", Convert.ToInt32(CurrentIDlbl.Text));

                cmd.ExecuteNonQuery();
                cmd.Parameters.Clear();
            }
            return percent;
        }
    }
}