using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
using System.IO;



namespace MovieBookingSite
{
    public partial class EditTicket : System.Web.UI.Page
    {
        int movieId;
        string originalimagepath;
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;

            movieId = Convert.ToInt32(Request.QueryString["movieId"]);

            if (!IsPostBack)
            {
                //Fetch movie details from Movie table
                try
                {
                    string getMovieDetails = "select * from Movie where MovieId='" + movieId + "'";
                    con.Open();
                    SqlDataAdapter da = new SqlDataAdapter(getMovieDetails, con);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    DataRow dr = dt.Rows[0];
                    con.Close();
                    movie_name.Text = dr["MovieName"].ToString();
                    movie_desc.Text = dr["MovieDescription"].ToString();
                   

                }
                catch (Exception err)
                {

                }

                // Fetch TicketDetails from Ticket 

                try
                {
                    using (con)
                    {
                        string getTicketDetails = "select * from Ticket where MovieId='" + movieId + "'";
                        con.Open();
                        SqlDataAdapter da = new SqlDataAdapter(getTicketDetails, con);
                        DataTable dt2 = new DataTable();
                        da.Fill(dt2);
                        con.Close();
                        DataRow dr = dt2.Rows[0];
                        silver_price.Text = dr["SilverPrice"].ToString();
                        gold_price.Text = dr["SilverPrice"].ToString();
                        platinum_price.Text = dr["SilverPrice"].ToString();
                    }

                }
                catch (Exception err)
                {

                }
            }
        }

        protected void HandleUpdate(object sender,EventArgs e)
        {
            string oldpath = getOldPath();
            string newpath = "";
            if (movie_poster.HasFile)
            {
                movie_poster.SaveAs(Server.MapPath("~/MovieImage/") + Path.GetFileName(movie_poster.FileName));
                newpath="MovieImage/" + Path.GetFileName(movie_poster.FileName);
            }
            SqlConnection con = new SqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
            string mov_nm = movie_name.Text;
            string mov_desc = movie_desc.Text;
            if (newpath == "")
                newpath = oldpath;
            //// Update Movies table
       
            string updateMovie = "Update Movie SET MovieDescription=@MovieDesc,MoviePoster=@MoviePos,MovieName=@MovieNm where MovieId =@Movid";
            con.Open();
            using (SqlCommand cmd = new SqlCommand(updateMovie, con))
            {
                cmd.Parameters.Add(new SqlParameter("@MovieDesc", mov_desc));
                cmd.Parameters.Add(new SqlParameter("@MoviePos", newpath));
                cmd.Parameters.Add(new SqlParameter("@MovieNm", mov_nm));
                cmd.Parameters.Add(new SqlParameter("@Movid", movieId));
                cmd.ExecuteNonQuery();
            }
            con.Close();

            // Update Ticket table 

            int s_price = Convert.ToInt32(silver_price.Text);
            int g_price = Convert.ToInt32(gold_price.Text);
            int p_price = Convert.ToInt32(platinum_price.Text);


            string updateticket = "update ticket set SilverPrice=@SPrice,GoldPrice=@GPrice,PlatinumPrice=@PPrice where MovieId=@movid";
            con.Open();
            using (SqlCommand cmd2 = new SqlCommand(updateticket, con))
            {
                cmd2.Parameters.Add(new SqlParameter("@SPrice", s_price));
                cmd2.Parameters.Add(new SqlParameter("@GPrice", g_price));
                cmd2.Parameters.Add(new SqlParameter("@PPrice", p_price));
                cmd2.Parameters.Add(new SqlParameter("@movid", movieId));
                cmd2.ExecuteNonQuery();
            }
            con.Close();

            Response.Redirect("~/AdminDashboard.aspx?updated=1");

        }

        protected string getOldPath()
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
            string oldpath;

            string getRow = "Select MoviePoster from Movie where MovieId='" + movieId + "'";
            SqlDataAdapter da = new SqlDataAdapter(getRow, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            DataRow dr = dt.Rows[0];
            oldpath = dr["MoviePoster"].ToString();
            return oldpath;
        }

        protected void movie_name_TextChanged(object sender, EventArgs e)
        {
            movie_name.Text= movie_name.Text;
        }

        protected void movie_desc_TextChanged(object sender, EventArgs e)
        {
            movie_desc.Text= movie_desc.Text;
        }

        protected void silver_price_TextChanged(object sender, EventArgs e)
        {
            silver_price.Text= silver_price.Text;
        }

        protected void gold_price_TextChanged(object sender, EventArgs e)
        {
            gold_price.Text = gold_price.Text;
        }

        protected void platinum_price_TextChanged(object sender, EventArgs e)
        {
            platinum_price.Text = platinum_price.Text;
        }
    }
}