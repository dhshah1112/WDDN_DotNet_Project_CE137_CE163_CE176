using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Data;

namespace MovieBookingSite
{
    public partial class CreateTicket : System.Web.UI.Page
    {
        int movieId;
        protected void Page_Load(object sender, EventArgs e)
        {
            movieId = Convert.ToInt32(Request.QueryString["movieId"]);
        }

        protected void HandleCreateTicket(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
            con.Open();
            string selected_date = Show_Start_Date.Text;
            int silverprice = Convert.ToInt32(silver_price.Text);
            int goldprice = Convert.ToInt32(gold_price.Text);
            int platinumprice = Convert.ToInt32(platinum_price.Text);
            string insertqry = "Insert into Ticket(MovieId,SilverPrice,GoldPrice,PlatinumPrice)values('"+movieId+"','"+silverprice+"','"+goldprice+"','"+platinumprice+"')";

            SqlCommand cmd = new SqlCommand(insertqry, con);
            int inserted = cmd.ExecuteNonQuery();

            string getticketId = "Select Id from Ticket where MovieId='" + movieId + "'";
            DataTable dt = new DataTable();

            SqlDataAdapter da = new SqlDataAdapter(getticketId, con);
            da.Fill(dt);
            DataRow dr = dt.Rows[0];
            int ticketid = Convert.ToInt32(dr[0]);

            int max_silver_ticket = Convert.ToInt32(max_silver_tickets.Text);
            int max_gold_ticket = Convert.ToInt32(max_gold_tickets.Text);
            int max_platinum_ticket = Convert.ToInt32(max_platinum_tickets.Text);
            DateTime startdate = Convert.ToDateTime(selected_date);

                       
            for(int i=0;i<7;i++)
            {
                string startdt = startdate.ToString("MM/dd/yyyy");
                string insertcmd = "Insert into AvailableTickets(MovieId,TicketId,ShowDate,MaxSilverTickets,MaxGoldTickets,MaxPlatinumTickets)values('" + movieId + "','" + ticketid + "','" + startdt + "','" + max_silver_ticket + "','" + max_gold_ticket + "','" + max_platinum_ticket + "')";
                SqlCommand sqlcmd = new SqlCommand(insertcmd, con);
                sqlcmd.ExecuteNonQuery();
                startdate = startdate.AddDays(1.0);
            }
            Response.Redirect("~/AdminDashboard.aspx?inserted=1");
            con.Close();
        }
    }
}