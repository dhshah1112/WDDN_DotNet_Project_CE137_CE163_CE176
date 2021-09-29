using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieBookingSite
{
    public partial class ShowMovies : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ShowDetail(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            int movieId = Convert.ToInt32(btn.CommandArgument);
            Response.Redirect("~/movieBooking.aspx?movieId="+movieId);
             
        }
    }
}