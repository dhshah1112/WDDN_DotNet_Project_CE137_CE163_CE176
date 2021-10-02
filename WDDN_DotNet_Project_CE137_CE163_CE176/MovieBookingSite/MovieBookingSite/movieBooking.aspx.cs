using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace MovieBookingSite
{
    
    public class maxTicketPerDay
    {
        public string date { get; set; }
        public string gmax { get; set; }
        public string smax { get; set; }

        public string pmax { get; set; }
    }
    public partial class movieBooking : System.Web.UI.Page
    {
        SqlDataAdapter da3;
        DataTable dt3;
        int silverprice, goldprice, platinumprice, totalprice=0,movieId;
        List<maxTicketPerDay>  maxDays = new List<maxTicketPerDay>();
        string dateSelected;
        int ticketsLeft;
        bool validTransaction = false;
        protected void fetchMaxTickets()
        {
            maxDays.Clear();

            SqlConnection con = new SqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
            con.Open();
            string retrieveAvailableTickets = "select distinct * from AvailableTickets where MovieId='" + movieId + "'";
            da3 = new SqlDataAdapter(retrieveAvailableTickets, con);
            con.Close();
            dt3 = new DataTable();
            da3.Fill(dt3);
            foreach (DataRow dr2 in dt3.Rows)
            {
                //ShowDates.Items.Add(dr2["ShowDate"].ToString());
                maxDays.Add(new maxTicketPerDay()
                {
                    date = dr2["ShowDate"].ToString(),
                    gmax = dr2["MaxGoldTickets"].ToString(),
                    smax = dr2["MaxSilverTickets"].ToString(),
                    pmax = dr2["MaxPlatinumTickets"].ToString(),
                });
            }

        }
        protected void computeTotal()
        {
            string tickettype = Ticket_type.SelectedValue.ToString();
            int numberoftickets = 0;
            if (Number_of_tickets.Text != "")
            {
                numberoftickets = Convert.ToInt32(Number_of_tickets.Text);
                if (tickettype == "Silver")
                    totalprice = numberoftickets * silverprice;
                else if (tickettype == "Gold")
                    totalprice = numberoftickets * goldprice;
                else if (tickettype == "Platinum")
                    totalprice = numberoftickets * platinumprice;
                Total_Price.Text = totalprice.ToString();   
            }
            else
            {
                Total_Price.Text = "Please Enter No of tickets.";
            }

        }

        protected void ShowDates_SelectedIndexChanged(object sender, EventArgs e)
        {
                dateSelected = ShowDates.SelectedItem.Value;
                foreach(maxTicketPerDay d in maxDays)
                {
                        if (d.date == dateSelected)
                        {
                            silverT.Text = d.smax;
                            goldT.Text = d.gmax;
                            platT.Text = d.pmax;
                            break;
                        }
                }
        }

        protected void Confirm_Booking_Click(object sender, EventArgs e)
        {
            if (validTransaction)
            {
                SqlConnection con = new SqlConnection();
                con.ConnectionString = WebConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
                try
                {
                    using (con)
                    {
                        Error.Text = "";
                        //---Testing---
                        dateSelected = ShowDates.SelectedItem.Value;
                        Response.Write(dateSelected + "   asaxaca<br />");
                        con.Open();
                        //---get ticket id---
                        string getTickedId = " Select Id from Ticket where MovieId=" + movieId;
                        DataTable dtt = new DataTable();
                        SqlDataAdapter sqlda = new SqlDataAdapter(getTickedId, con);
                        sqlda.Fill(dtt);
                        DataRow drr = dtt.Rows[0];
                        int ticketId = Convert.ToInt32(drr["Id"]);

                        //-- insert to booking ---
                        int userId = Convert.ToInt32(Session["userId"]);
                        string movie_timings = Movie_Timings.SelectedItem.Text;
                        int total_tickets = Convert.ToInt32(Number_of_tickets.Text);
                        int total = Convert.ToInt32(Total_Price.Text);
                        string ticket_type = Ticket_type.SelectedItem.Text;

                        string insertcmd = "insert into Bookings(userId,Total,ticketId,showTime,ticketType,total_tickets,MovieId,BookedDate)values('" + userId + "','" + total + "','" + ticketId + "','" + movie_timings + "','" + ticket_type + "','" + total_tickets + "','" + movieId + "','" + dateSelected + "')";
                        SqlCommand cmd = new SqlCommand(insertcmd, con);
                        int inserted = cmd.ExecuteNonQuery();

                        //---updating ticket---
                        string updateMaxSeats;

                        Response.Write("tickets left: " + ticketsLeft + "<br/>");
                        if (ticket_type == "Silver")
                            updateMaxSeats = "Update AvailableTickets set MaxSilverTickets=" + ticketsLeft + "where ShowDate='" + dateSelected + "'";
                        else if (ticket_type == "Gold")
                            updateMaxSeats = "Update AvailableTickets set MaxGoldTickets=" + ticketsLeft + "where ShowDate='" + dateSelected + "'";
                        else
                            updateMaxSeats = "Update AvailableTickets set MaxPlatinumTickets=" + ticketsLeft + "where ShowDate='" + dateSelected + "'";

                        SqlCommand cmd1 = new SqlCommand(updateMaxSeats, con);
                        int rowsInserted = cmd1.ExecuteNonQuery();

                        fetchMaxTickets();

                        con.Close();

                        if (inserted == 1)
                        {
                            Response.Write("inserted");
                        }
                        else
                        {
                            Response.Write("Error");
                        }

                    }
                }
                catch (Exception err)
                {
                    Response.Write(err.Message);
                }
            }
            else
            {
                string message = "Please enter valid info";
                System.Text.StringBuilder sb = new System.Text.StringBuilder();
                sb.Append("<script type = 'text/javascript'>");
                sb.Append("window.onload=function(){");
                sb.Append("alert('");
                sb.Append(message);
                sb.Append("')};");
                sb.Append("</script>");
                ClientScript.RegisterClientScriptBlock(this.GetType(), "alert", sb.ToString());
            }

        }
        protected void Number_of_tickets_TextChanged(object sender, EventArgs e)
        {
            if (Convert.ToInt32(Number_of_tickets.Text) != 0)
            {

                string tickettype = Ticket_type.SelectedValue.ToString();
                if (tickettype == "Silver")
                {
                    var isvalid = Int32.TryParse(silverT.Text, out int result);
                    if (isvalid)
                    {
                        if (Convert.ToInt32(Number_of_tickets.Text) <= Convert.ToInt32(silverT.Text))
                        {
                            ticketsLeft = Convert.ToInt32(silverT.Text) - Convert.ToInt32(Number_of_tickets.Text);
                            computeTotal();
                            validTransaction = true;
                        }
                        else
                        {
                            Error.Text = "Not Enough seats, " + silverT.Text + "silver seats left.";
                        }
                    }

                }
                else if (tickettype == "Gold")
                {
                    var isvalid = Int32.TryParse(goldT.Text, out int result);
                    if (isvalid)
                    {
                        if (Convert.ToInt32(Number_of_tickets.Text) <= Convert.ToInt32(goldT.Text))
                        {
                            ticketsLeft = Convert.ToInt32(goldT.Text) - Convert.ToInt32(Number_of_tickets.Text);
                            computeTotal();
                            validTransaction = true;
                        }
                        else
                        {
                            Error.Text = "Not Enough seats, " + goldT.Text + "gold seats left.";
                        }
                    }

                }
                else if (tickettype == "Platinum")
                {
                    var isvalid = Int32.TryParse(silverT.Text, out int result);
                    if (isvalid)
                    {
                        if (Convert.ToInt32(Number_of_tickets.Text) <= Convert.ToInt32(platT.Text))
                        {
                            ticketsLeft = Convert.ToInt32(platT.Text) - Convert.ToInt32(Number_of_tickets.Text);
                            computeTotal();
                            validTransaction = true;

                        }
                        else
                        {
                            Error.Text = "Not Enough seats, " + platT.Text + "plat seats left.";
                        }
                    }

                }
            }
            fetchMaxTickets();
        }

        protected void Ticket_type_SelectedIndexChanged(object sender, EventArgs e)
        {
            computeTotal();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Session["userId"]==null)
            {
                Response.Redirect("~/Login.aspx?unauth=1");
            }
            else
            {
                movieId = Convert.ToInt32(Request.QueryString["movieId"]);
                SqlConnection con = new SqlConnection();
                con.ConnectionString = WebConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
                try
                {
                    using (con)
                    {
                        con.Open();
                        string retrieveMovie = "select * from Movie where MovieId='" + movieId + "'";
                        DataTable dt1 = new DataTable();
                        SqlDataAdapter da = new SqlDataAdapter(retrieveMovie, con);
                        da.Fill(dt1);
                        DataRow dr = dt1.Rows[0];
                        Movie_Name.Text = dr["MovieName"].ToString();
                        Movie_Description.Text = dr["MovieDescription"].ToString();
                        MoviePoster.ImageUrl = dr["MoviePoster"].ToString();
                        string retrieveTickets = "select * from Ticket where MovieId='" + movieId + "'";
                        SqlDataAdapter da2 = new SqlDataAdapter(retrieveTickets, con);
                        DataTable dt2 = new DataTable();
                        da2.Fill(dt2);
                        dr = dt2.Rows[0];
                        silver_Price.Text = dr["SilverPrice"].ToString();
                        platinum_Price.Text = dr["PlatinumPrice"].ToString();
                        gold_Price.Text = dr["GoldPrice"].ToString();

                        silverprice = Convert.ToInt32(dr["SilverPrice"]);
                        platinumprice = Convert.ToInt32(dr["PlatinumPrice"]);
                        goldprice = Convert.ToInt32(dr["GoldPrice"]);
                        con.Close();
                        fetchMaxTickets();
                    }
                }
                catch (Exception err)
                {
                    Response.Write(err.Message);
                }
            }
        }
    }
}