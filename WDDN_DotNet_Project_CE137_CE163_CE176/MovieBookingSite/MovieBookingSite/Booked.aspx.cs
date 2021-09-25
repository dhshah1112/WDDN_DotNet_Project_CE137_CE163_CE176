using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieBookingSite
{
    public partial class Booked : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            bookedId.Text = Request.QueryString["Id"];

            int movieId = Convert.ToInt32(Request.QueryString["Id"]);
            int uid = Convert.ToInt32(Session["userId"].ToString());

        }
    }
}