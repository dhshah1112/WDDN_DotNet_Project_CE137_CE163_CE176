using System;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Data;
namespace MovieBookingSite
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Convert.ToInt32(Request.QueryString["invalid"])==1)
            {
                User_Action.Text = "Invalid Credentials";
            }
            if (Convert.ToInt32(Request.QueryString["loggedout"]) == 1)
            {
                User_Action.Text = "Successfully logged out";
            }
            if (Convert.ToInt32(Request.QueryString["unauth"]) == 1)
            {
                User_Action.Text = "Please login first";
            }

        }

        protected void HandleLogin(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
            try
            {
                DataTable dt = new DataTable();
                DataRow dr;

                using (con)
                {
                    con.Open();
                    string matchUser = "SELECT * FROM userDetails where Password='"+Password.Text+"' and userName='"+userName.Text+"'";
                  

                    SqlDataAdapter da = new SqlDataAdapter(matchUser,con);
                    da.Fill(dt);
                    int rowCount = dt.Rows.Count;
                    if (rowCount > 0)
                    {
                      
                        dr = dt.Rows[0];
                        string id = Convert.ToString(dr[0]);
                        string uname = Convert.ToString(dr[1]);
                        string contact = Convert.ToString(dr[2]);
                        string email = Convert.ToString(dr[3]);

                        Response.Write(id + "<br>");
                        Response.Write(uname + "<br>");


                        Session["userId"] = id;
                        Session["uname"] = uname;
                        Session["contact"] = contact;
                        Session["email"] = email;
                        Response.Redirect("Home.aspx");
                    }
                    else
                    {
                        Response.Redirect("~/Login.aspx?invalid=1");
                    }

                    con.Close();
                }
            }
            catch (Exception exception)
            {
                Response.Write(exception.Message);
            }
        }
    }
}