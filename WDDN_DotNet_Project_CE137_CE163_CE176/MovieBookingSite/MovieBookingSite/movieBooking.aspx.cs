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
            Error.Text = "";
            //Response.Write("COMPUTE TOTAL CALLED");
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
                Total_Price.Text = "Please Enter No of tickets";
            }

        }
        protected void Number_of_tickets_TextChanged(object sender, EventArgs e)
        {
            //Response.Write("INSIDE NUMBER OF TICKETS CHANGED");
            computeTotal();
            if (Convert.ToInt32(Number_of_tickets.Text) != 0)
            {
                string tickettype = Ticket_type.SelectedValue.ToString();
                //Response.Write("tickettype : " + tickettype);
                if (tickettype == "Silver")
                {
                    //Response.Write("INSIDE IF OF SILVER");

                    //Response.Write("TICKETS LEFT : " + ticketsLeft);
                    var isvalid = Int32.TryParse(silverT.Text, out int result);
                    //Response.Write("Silver text : " + silverT.Text);
                    //Response.Write("Is valid : " + isvalid);
                    if (isvalid)
                    {
                        //Response.Write("Number of tickets : " + Number_of_tickets.Text);
                        //Response.Write("Silver text : " + silverT.Text);
                        if (Convert.ToInt32(Number_of_tickets.Text) <= Convert.ToInt32(silverT.Text))
                        {
                            //Response.Write("INSIDE INNER IF OF SILVER");
                            ticketsLeft = Convert.ToInt32(silverT.Text) - Convert.ToInt32(Number_of_tickets.Text);
                            //Response.Write("TICKETS LEFT : " + ticketsLeft);
                            computeTotal();
                            validTransaction = true;
                        }
                        else
                        {
                            Error.Text = "Not Enough seats, " + silverT.Text + " silver seats left.";
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
                            Error.Text = "Not Enough seats, " + goldT.Text + " gold seats left.";
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
                            Error.Text = "Not Enough seats, " + platT.Text + " platinum seats left.";
                        }
                    }

                }
            }
            fetchMaxTickets();
        }

        protected void ShowDates_SelectedIndexChanged(object sender, EventArgs e)
        {
                dateSelected = ShowDates.SelectedItem.Value;
                Error.Text = "";
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
        protected void Confirm_Booking_Click(object sender, EventArgs e)
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

                        string getMovieName = "Select MovieName from Movie where MovieId='" + movieId + "'";
                        DataTable dt_movie = new DataTable();
                        SqlDataAdapter sqlmoviename = new SqlDataAdapter(getMovieName, con);
                        sqlmoviename.Fill(dt_movie);
                        DataRow dr_movie = dt_movie.Rows[0];
                        string moviename = dr_movie[0].ToString();


                        string insertcmd = "insert into Bookings(userId,Total,ticketId,showTime,ticketType,total_tickets,MovieId,BookedDate,MovieName)values('" + userId + "','" + total + "','" + ticketId + "','" + movie_timings + "','" + ticket_type + "','" + total_tickets + "','" + movieId + "','" + dateSelected + "','"+moviename+"')";
                        SqlCommand cmd = new SqlCommand(insertcmd, con);
                        int inserted = cmd.ExecuteNonQuery();

                        //---updating ticket---
                        string updateMaxSeats;
                       
                        //Response.Write("tickets left: " + ticketsLeft + "<br/>");
                    if (ticket_type == "Silver")
                    {
                        ticketsLeft = Convert.ToInt32(silverT.Text) - Convert.ToInt32(Number_of_tickets.Text);
                        updateMaxSeats = "Update AvailableTickets set MaxSilverTickets=" + ticketsLeft + "where ShowDate='" + dateSelected + "'";
                    }
                    else if (ticket_type == "Gold")
                    {
                        ticketsLeft = Convert.ToInt32(goldT.Text) - Convert.ToInt32(Number_of_tickets.Text);
                        updateMaxSeats = "Update AvailableTickets set MaxGoldTickets=" + ticketsLeft + "where ShowDate='" + dateSelected + "'";
                    }
                    else
                    {
                        ticketsLeft = Convert.ToInt32(platT.Text) - Convert.ToInt32(Number_of_tickets.Text);
                        updateMaxSeats = "Update AvailableTickets set MaxPlatinumTickets=" + ticketsLeft + "where ShowDate='" + dateSelected + "'";
                    }
                        SqlCommand cmd1 = new SqlCommand(updateMaxSeats, con);
                        int rowsInserted = cmd1.ExecuteNonQuery();

                        fetchMaxTickets();

                        con.Close();

                        if (inserted == 1)
                        {
                            Response.Redirect("Bookings.aspx?booked=1");
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
       
        protected void Ticket_type_SelectedIndexChanged(object sender, EventArgs e)
        {
            computeTotal();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["userId"] == null)
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
                        //Movie_Description.Text = dr["MovieDescription"].ToString();
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