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

        }

        protected void handleLogin(object sender, EventArgs e)
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
                    String matchUser = "SELECT * FROM userDetails where Password='"+Password.Text+"' and userName='"+userName.Text+"'";
                    //SqlCommand cmd = new SqlCommand(matchUser, con);
                    //SqlDataReader fetchedUser = cmd.ExecuteReader();

                    SqlDataAdapter da = new SqlDataAdapter(matchUser,con);
                    da.Fill(dt);
                    dr = dt.Rows[0];

                    String id = Convert.ToString( dr[0]);
                    String uname = Convert.ToString(dr[1]);
                    String contact = Convert.ToString(dr[2]);
                    String email = Convert.ToString(dr[3]);

                    Response.Write(id+"<br>");
                    Response.Write(uname+"<br>");
                    int rowCount = dt.Rows.Count;

                    Session["userId"] = id;
                    Session["uname"] = uname;
                    Session["contact"] = contact;
                    Session["email"] = email;


                    if (rowCount>0)
                    {
                        Response.Redirect("LoggedIn.aspx");
                    }
                    else
                    {
                        Response.Write("Error");
                    }

                    con.Close();
                }
            }
            catch (Exception exception)
            {
                Response.Write("INSIDE ERROR");
                Response.Write(exception.Message);
            }
        }
    }
}