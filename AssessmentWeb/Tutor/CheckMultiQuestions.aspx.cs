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
    public partial class CheckMultiQuestions : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           // SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

           // conn.Open();

           // string insert = "Select Privacy From Exam where ExamID ='" + ddlExamID.SelectedItem.Value + "'";

           //try
           // {
           //     SqlDataReader myReader = null;
           //     SqlCommand myCommand = new SqlCommand(insert, conn);
           //     myReader = myCommand.ExecuteReader();
           //     while (myReader.Read())
           //     {
           //         privacylbl.Text = myReader["Column1"].ToString();

           //     }
           // }
           // catch (Exception ex)
           // {
                
           // }
        }

        protected void AMQbtn_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/Tutor/AddMultipleTest.aspx");
        }

    }
}