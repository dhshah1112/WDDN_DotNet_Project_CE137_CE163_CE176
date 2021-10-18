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
                    //Response.Write(password.Text + "<br>");
                    string sSQLCommand = "INSERT INTO userDetails (Name, userName, Email, Contact ,Password) VALUES ( '" + name.Text+ "','" + username.Text + "','" + email.Text + "','" + contact.Text + "','" + password.Text + "')";
                    SqlCommand cmd = new SqlCommand(sSQLCommand, con);
                    int inserted = cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    con.Close();
                    Response.Redirect("login.aspx?signup=1");
                }
            }
            catch(Exception err)
            {
                Label1.Text = err.Message;
            }

        }

        protected void password_validation_ServerValidate(object source, ServerValidateEventArgs args)
        {
            string inputpass = args.Value;
            args.IsValid = false;
            if (inputpass.Length < 6 || inputpass.Length > 14)
                return;
            bool uppercase = false;
            foreach(char ch in inputpass)
            {
                if(ch>='A' && ch<='Z')
                {
                    uppercase = true;
                    break;
                }
            }
            if (!uppercase)
                return;
            bool lowercase = false;
            foreach (char ch in inputpass)
            {
                if (ch >= 'a' && ch <= 'z')
                {
                    lowercase = true;
                    break;
                }
            }
            if (!lowercase)
                return;
            bool number = false;
            foreach (char ch in inputpass)
            {
                if (ch >= '0' && ch <= '9')
                {
                    number = true; break;
                }
            }
            if (!number) return;
            args.IsValid = true;
        }
    }
}