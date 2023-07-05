using System;
using System.Data.SqlClient;
using System.Data;
using System.Web.UI.WebControls;

namespace InschoolProject_ASP_AI_New_
{
    public partial class LoginPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            txtpassword.TextMode = TextBoxMode.Password;
            erreurMessage.Visible = false;
            
        }

        protected  void btnLogin_Click(object sender, EventArgs e)
        {

            using (SqlConnection sqlcon = new SqlConnection(@"Data Source = DESKTOP-SAL-D8P\SQLEXPRESS;Initial Catalog = Inshooldb;Integrated Security = True;"))

            {
                sqlcon.Open();
                string query = "SELECT COUNT(1) FROM Admin WHERE Email = @Email AND PassWord = @PassWord";

                SqlCommand sqlcmd = new SqlCommand(query, sqlcon);
                sqlcmd.Parameters.AddWithValue("@Email", txtemail.Text.Trim());
                sqlcmd.Parameters.AddWithValue("@PassWord", txtpassword.Text.Trim());
                int count = Convert.ToInt32(sqlcmd.ExecuteScalar());
                if(count == 1)
                {
                    Session["Email"] = txtemail.Text.Trim();
                    Response.Redirect("Index.aspx");
                }
                else {  erreurMessage.Visible = true;}

            }


        }

  

    }
}