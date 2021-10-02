using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace MovieBookingSite
{
    public partial class AdminDashboard : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Convert.ToInt32(Request.QueryString["inserted"])==1)
            {
                Admin_Action.Text = "Movie and Ticket inserted successfully";
            }
            else if (Convert.ToInt32(Request.QueryString["deleted"]) == 1)
            {
                Admin_Action.Text = "Deleted Movie and Ticket successfully";
            }
            else if (Convert.ToInt32(Request.QueryString["updated"]) == 1)
            {
                Admin_Action.Text = "Updated Ticket and Movie successfully";
            }

            if (Session["AdminId"] == null)
            {
                Response.Redirect("~/AdminLogin.aspx?unauth=1");
            }
            string adminid = Session["AdminId"].ToString();
        }

        protected void HandleDelete(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
            LinkButton btn = (LinkButton)sender;
            int movieId = Convert.ToInt32(btn.CommandArgument);

            // Delete Movie from Movie Table

            using (con)
            {
                string deleteqry = "delete from Movie where MovieId='" + movieId + "'";
                con.Open();
                SqlCommand cmd = new SqlCommand(deleteqry, con);
                cmd.ExecuteNonQuery();
                con.Close();
                Response.Redirect("~/AdminDashboard.aspx?deleted=1");
               
            }
        }
        protected void HandleEdit(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int movieId = Convert.ToInt32(btn.CommandArgument);
            Response.Redirect("~/EditTicket.aspx?movieId="+movieId);
        }

        protected void HandleLogout(object sender, EventArgs e)
        {
            if(Session["AdminId"]!=null)
            {
                Session.Remove("AdminId");
                Response.Redirect("~/Login.aspx?loggedout=1");
            }
        }
    }
}