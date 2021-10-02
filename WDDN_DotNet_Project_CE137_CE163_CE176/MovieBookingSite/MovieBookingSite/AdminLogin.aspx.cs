using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
using System.Data;

namespace MovieBookingSite
{
    public partial class AdminLogin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Convert.ToInt32(Request.QueryString["inserted"])==1)
            {
                Admin_Actions.Text = "Username or Password is wrong";
            }
            if (Convert.ToInt32(Request.QueryString["unauth"]) == 1)
            {
                Admin_Actions.Text = "Please login first";
            }
        }

        protected void HandleAdminLogin(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;

            try
            {
                using(con)
                {
                    string uname = admin_uname.Text;
                    string pass = admin_pwd.Text;
                    string getAdmin = "Select * from Admin where userName='" + uname + "' and Password='" + pass + "'";
                    SqlDataAdapter da = new SqlDataAdapter(getAdmin, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    int rowCount = dt.Rows.Count;
                    DataRow dr = dt.Rows[0];
                    if(rowCount==1)
                    {
                        Session["AdminId"] = dr["Id"];
                        Response.Redirect("~/AdminDashboard.aspx");
                    }
                    else
                    {
                        Response.Redirect("~/AdminLogin.aspx?invalid=1");
                    }
                }
            }
            catch(Exception err)
            {

            }
        }
    }
}