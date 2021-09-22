using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace MovieBookingSite
{
    public partial class LoggedIn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int Sid = Convert.ToInt32(Session["userId"].ToString());
            String Scontact = Session["contact"].ToString();
            String Semail = Session["email"].ToString();
            String Suname = Session["uname"].ToString();
            uname.Text = Suname;
            id.Text = Convert.ToString(Sid);
            contact.Text = Scontact;
            email.Text = Semail;
        }
    }
}