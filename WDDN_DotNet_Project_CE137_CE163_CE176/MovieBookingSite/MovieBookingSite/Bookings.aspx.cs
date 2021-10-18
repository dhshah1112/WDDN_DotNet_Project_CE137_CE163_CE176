using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieBookingSite
{
    public partial class Bookings : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Convert.ToInt32(Request.QueryString["booked"])==1)
            {
                BookedSuccessfully.Text = "Tickets booked successfully";
            }
        }
        protected void HandleLogout(object sender, EventArgs e)
        {
            if (Session["userId"] != null)
            {
                Session.Remove("userId");
                Session.Remove("uname");
                Session.Remove("contact");
                Session.Remove("email");
                Response.Redirect("~/Login.aspx?loggedout=1");

            }
        }
    }
}