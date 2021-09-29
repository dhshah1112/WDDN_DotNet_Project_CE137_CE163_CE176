using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace MovieBookingSite
{
    public partial class movieBooking : System.Web.UI.Page
    {
        int silverprice, goldprice, platinumprice, totalprice=0,movieId;

        protected void computeTotal()
        {
            string tickettype = Ticket_type.SelectedValue.ToString();
            int numberoftickets = 0;
            if (Number_of_tickets.Text != "")
                numberoftickets = Convert.ToInt32(Number_of_tickets.Text);

            if (tickettype == "Silver")
                totalprice = numberoftickets * silverprice;
            else if (tickettype == "Gold")
                totalprice = numberoftickets * goldprice;
            else if (tickettype == "Platinum")
                totalprice = numberoftickets * platinumprice;
            Total_Price.Text = totalprice.ToString();
        }

        protected void Confirm_Booking_Click(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;

            try
            {
                using(con)
                {
                    con.Open();
                    int userId = Convert.ToInt32(Session["userId"]);
                    string movie_timings = Movie_Timings.SelectedItem.Text;
                    int total_tickets = Convert.ToInt32(Number_of_tickets.Text);
                    int total = Convert.ToInt32(Total_Price.Text);
                    string ticket_type = Ticket_type.SelectedItem.Text;
                    string insertcmd = "insert into Bookings(userId,Total,ticketId,showTime,ticketType,total_tickets)values('" + userId + "','" + total + "','" + movieId + "','" + movie_timings + "','" + ticket_type + "','" + total_tickets + "')";
                    SqlCommand cmd = new SqlCommand(insertcmd, con);
                    int inserted = cmd.ExecuteNonQuery();
                    con.Close();
                    if(inserted==1)
                    {
                        Response.Write("inserted");
                    }
                    else
                    {
                        Response.Write("Error");
                    }
                        
                }
            }
            catch(Exception err)
            {

            }

        }

        protected void Number_of_tickets_TextChanged(object sender, EventArgs e)
        {
            computeTotal();
        }

        protected void Ticket_type_SelectedIndexChanged(object sender, EventArgs e)
        {
            computeTotal();
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            movieId = Convert.ToInt32(Request.QueryString["movieId"]);
            SqlConnection con = new SqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
            try
            {
                using (con)
                {
                    con.Open();
                    string retrieveMovie = "select * from Movie where MovieId='"+movieId+"'";
                    DataTable dt1 = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(retrieveMovie,con);
                    da.Fill(dt1);
                    DataRow dr = dt1.Rows[0];
                    Movie_Name.Text = dr["MovieName"].ToString();
                    Movie_Description.Text = dr["MovieDescription"].ToString();
                    MoviePoster.ImageUrl = dr["MoviePoster"].ToString();
                    string retrieveTickets = "select * from Ticket where MovieId='" + movieId + "'";
                    SqlDataAdapter da2 = new SqlDataAdapter(retrieveTickets,con);
                    DataTable dt2 = new DataTable();
                    da2.Fill(dt2);
                    dr = dt2.Rows[0];
                    silver_Price.Text = dr["SilverPrice"].ToString();
                    platinum_Price.Text = dr["PlatinumPrice"].ToString();
                    gold_Price.Text = dr["GoldPrice"].ToString();
                    string retrieveAvailableTickets = "select * from AvailableTickets where MovieId='" + movieId + "'";
                    SqlDataAdapter da3 = new SqlDataAdapter(retrieveAvailableTickets,con);
                    DataTable dt3 = new DataTable();
                    da3.Fill(dt3);
                    ShowDates.Items.Clear();
                    foreach(DataRow dr2 in dt3.Rows)
                    {
                        ShowDates.Items.Add(dr2["ShowDate"].ToString());

                    }
                    con.Close();
                }
            }
            catch (Exception err)
            {
                Response.Write(err.Message);
            }
        }
    }
}