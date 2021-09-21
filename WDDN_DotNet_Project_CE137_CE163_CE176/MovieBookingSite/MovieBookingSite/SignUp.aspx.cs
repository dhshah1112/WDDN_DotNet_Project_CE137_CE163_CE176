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

        protected void completeRegistration(object sender, EventArgs e)
        {
            //String Name = name.Text;
            //String userName = username.Text;
            //String Contact = contact.Text;
            //String Email = email.Text;
            //String Password = password.Text;

            //Label1.Text = uname;
            Console.WriteLine("hi");
            SqlConnection con = new SqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
            try
            {
                using (con)
                {
                    con.Open();

                    String sSQLCommand = "INSERT INTO userDetails (Name, userName, Email, Contact ,Password) VALUES ( ' " + name.Text+ " ',' " + username.Text + " ',' " + email.Text + " ',' " + contact.Text + " ',' " + password.Text + " ')";
                    SqlCommand cmd = new SqlCommand(sSQLCommand, con);
                    int inserted = cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    con.Close();
                    //String insertCommand  = "insert into User values('" + Name + "','" + userName + "','" + Email + "','" + Contact + "','" + Password + "')";
                    //SqlCommand cmd = new SqlCommand(insertCommand, con);
                    //con.Open();
                    //int inserted = cmd.ExecuteNonQuery();
                    //con.Close();
                    //Label1.Text = inserted.ToString();


                }
            }
            catch(Exception err)
            {
                Label1.Text = err.Message;

            }

        }
    }
}