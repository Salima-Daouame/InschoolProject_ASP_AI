using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace InschoolProject_ASP_AI_New_
{
    
    public partial class Index : System.Web.UI.Page
       {
       
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con1 = new SqlConnection("Data Source=DESKTOP-SAL-D8P\\SQLEXPRESS;Initial Catalog=Inshooldb;Integrated Security=True");
            con1.Open();
            SqlCommand cmd1 = new SqlCommand("Select count(*) From Etudiant", con1);
            var count1 = cmd1.ExecuteScalar();
            Label01.Text = count1.ToString();
            con1.Close();
        }
    }
}