using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AssessmentWeb
{
    public partial class Register : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        //protected Boolean checkUserExist()
        //{
        //    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString2"].ConnectionString);

        //    conn.Open();
        //    String query = "select count(*) from Users where userEmail = '" + Email.Text + "'";

        //    SqlCommand command = new SqlCommand(query, conn);


        //    int userExists =Convert.ToInt32(command.ExecuteScalar().ToString());

        //    if (userExists > 0)
        //    {
        //        return true;
        //    }

        //    conn.Close();
        //    return false;
        //}

        protected void CreateUserWizard1_CreatedUser(object sender, EventArgs e)
        {
            // error when creating account
            Literal errMsg = (Literal)this.CreateUserWizardStep1.ContentTemplateContainer.FindControl("ErrorMessage");
            // UNDONE enable regex validator 
            // initialize register value
            TextBox regName = (TextBox)this.CreateUserWizardStep1.ContentTemplateContainer.FindControl("UserName");
            TextBox regEmail = (TextBox)this.CreateUserWizardStep1.ContentTemplateContainer.FindControl("Email");
            TextBox regPass = (TextBox)this.CreateUserWizardStep1.ContentTemplateContainer.FindControl("Password");
            RadioButtonList regGender = (RadioButtonList)this.CreateUserWizardStep1.ContentTemplateContainer.FindControl("Gender");
            TextBox regBirthDate = (TextBox)this.CreateUserWizardStep1.ContentTemplateContainer.FindControl("BirthDate");
            DropDownList regCourse = (DropDownList)this.CreateUserWizardStep1.ContentTemplateContainer.FindControl("Course");

            // open connection for database
            try
            {
                string str = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
                SqlConnection connection = new SqlConnection(str);
                connection.Open();

                // check if email exists
                SqlCommand cmd = new SqlCommand("select studEmail from Students where studEmail = @email", connection);
                cmd.Parameters.AddWithValue("@email", regEmail.Text);
                if (regEmail.Text == cmd.ExecuteScalar() as string)
                {
                    errMsg.Text = "This email is already been used by an account!\n";
                    throw new ArgumentException();
                }

                // count table to check table is empty
                cmd.CommandText = "select count(*) from Students";
                if (Convert.ToInt32(cmd.ExecuteScalar()) <= 0)
                {
                    // create custom id out of birthdate eg 19 00000
                    int regId = Math.Abs((Int32.Parse(regBirthDate.Text.Substring(8, 2)) * 100000) + Convert.ToInt32(cmd.ExecuteScalar()));
                    // insert unique id before insert data
                    cmd.CommandText = "SET IDENTITY_INSERT dbo.Students ON;" +
                                      "insert into Students (studId) values (@id)" +
                                      "SET IDENTITY_INSERT dbo.Students ON;";
                    // UNDONE debug needed here plsssssss
                    cmd.Parameters.AddWithValue("@id", regId);
                }

                // insert data
                cmd.CommandText = "insert into Students (studName, studEmail, studPass, studGender, studBirthdate, studGrade, courseId) " +
                                  "values (@name, @email, @pass, @gender, @birthdate, NULL, @course);";
                // pass in parameters
                cmd.Parameters.AddWithValue("@name", regName.Text);
                cmd.Parameters.AddWithValue("@email", regEmail.Text);
                cmd.Parameters.AddWithValue("@pass", regPass.Text);
                cmd.Parameters.AddWithValue("@gender", regGender.SelectedValue);
                cmd.Parameters.AddWithValue("@birthdate", regBirthDate.Text);
                cmd.Parameters.AddWithValue("@course", regCourse.SelectedValue);
                int ad = cmd.ExecuteNonQuery();
                
                // close database
                connection.Close();

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
                conn.Open();
                String query = "insert into Users (userName, userEmail, userPass, userBirthDate, userGender, userType) values" +
                    " (@userName, @userEmail, @userPass, @userBirthdate, @userGender, @userType)";

                SqlCommand command = new SqlCommand(query, conn);
                String userType = "Student";

                command.Parameters.AddWithValue("@userName", regName.Text);
                command.Parameters.AddWithValue("@userEmail", regEmail.Text);
                command.Parameters.AddWithValue("@userPass", regPass.Text);
                command.Parameters.AddWithValue("@userBirthdate", regBirthDate.Text);
                command.Parameters.AddWithValue("@userGender", regGender.SelectedValue);
                command.Parameters.AddWithValue("@userType", userType);

                command.ExecuteNonQuery();
                conn.Close();

                Response.Redirect("~/Login.aspx"); 

            }
            catch (Exception ex)
            {
                errMsg.Text += "Error occur! Reload the page and try again";
                Console.Write(ex);
            }
            /**TODO 1. force user to enter only integer in asp:textbox
                   2. set new user into database
                   3. for now only registers student, will add label to identify tutor
                   4. check from database 
                   5. either do security question or no 
                   6. if student is removed, do not remove database but add status as left**/
            // TODO recheck Register.aspx.cs
        }

        //protected void registerbtn_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        Boolean exists = checkUserExist();

        //        if (exists)
        //        {
        //            Response.Write("Username and email is already taken.Please select again");

        //        }
        //        else
        //        {
        //            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

        //            conn.Open();
        //            String query = "insert into Users (userName, userEmail, userPass, userBirthDate, userGender, userType) values" +
        //                " (@userName, @userEmail, @userPass, @userBirthdate, @userGender, @userType)";

        //            SqlCommand command = new SqlCommand(query, conn);

        //            command.Parameters.AddWithValue("@userName", UserName.Text);
        //            command.Parameters.AddWithValue("@userEmail", Email.Text);
        //            command.Parameters.AddWithValue("@userPass", ConfirmPassword.Text);
        //            command.Parameters.AddWithValue("@userBirthdate",BirthDateCalendar.SelectedDate);
        //            command.Parameters.AddWithValue("@userGender", Gender.SelectedItem.Value);
        //            command.Parameters.AddWithValue("@userType", Userrbl.SelectedItem.Value);

        //            String query2 = "insert into Studnets (studName, studEmail, studPass, studBirthDate, studGender) values" +
        //                " (@studName, @studEmail, @studPass, @studBirthDate, @studGender)";

        //            SqlCommand command2 = new SqlCommand(query2, conn);

        //            command2.Parameters.AddWithValue("@studName", UserName.Text);
        //            command2.Parameters.AddWithValue("@studEmail", Email.Text);
        //            command2.Parameters.AddWithValue("@studPass", ConfirmPassword.Text);
        //            command2.Parameters.AddWithValue("@studBirthdate", BirthDateCalendar.SelectedDate);
        //            command2.Parameters.AddWithValue("@studGender", Gender.SelectedItem.Value);

        //            command.ExecuteNonQuery();
        //            command2.ExecuteNonQuery();

        //            Response.Redirect(" "); //Homepage??

        //        }

        //    }
        //    catch (Exception ex)
        //    {
        //        //Response.Write("Error occur! Reload the page and try again");
        //        Console.Write(ex);
        //    }
        //}

        protected void BirthDateCalendar_SelectionChanged(object sender, EventArgs e)
        {
            // get values from content template container
            TextBox calTextBox = (TextBox)this.CreateUserWizardStep1.ContentTemplateContainer.FindControl("BirthDate");
            Calendar calendar = (Calendar)this.CreateUserWizardStep1.ContentTemplateContainer.FindControl("BirthDateCalendar");
            calTextBox.Text = calendar.SelectedDate.ToString("dd/MM/yyyy");
        }
    }
}