using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data.SqlTypes;
using System.Data;
using System.Web.Configuration;


namespace MovieBookingSite
{
    public partial class SignUp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void handleRegistration(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
            try
            {
                using (con)
                {
                    con.Open();
                    Response.Write(name.Text+"<br>");
                    Response.Write(username.Text+ "<br>");
                    Response.Write(email.Text + "<br>");
                    Response.Write(contact.Text + "<br>");
                    Response.Write(password.Text + "<br>");
                    string sSQLCommand = "INSERT INTO userDetails (Name, userName, Email, Contact ,Password) VALUES ( '" + name.Text+ "','" + username.Text + "','" + email.Text + "','" + contact.Text + "','" + password.Text + "')";
                    SqlCommand cmd = new SqlCommand(sSQLCommand, con);
                    int inserted = cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    con.Close();
                }
            }
            catch(Exception err)
            {
                Label1.Text = err.Message;
            }

        }
    }
}