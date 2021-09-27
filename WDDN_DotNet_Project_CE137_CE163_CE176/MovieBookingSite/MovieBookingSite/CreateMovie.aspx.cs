using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data.SqlClient;
using System.Data;
using System.Web.Configuration;
using System.Web.UI.WebControls;
using System.IO;

namespace MovieBookingSite
{
    public partial class CreateMovie : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void HandleCreateMovie(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
            DataTable dt=new DataTable();
            try
            {
                using (con)
                {
                    string mov_name = movie_name.Text;
                    string mov_desc = movie_description.Text;
                    movie_poster.SaveAs(Server.MapPath("~/MovieImage/") + Path.GetFileName(movie_poster.FileName));
                    string imgLink = "MovieImage/" + Path.GetFileName(movie_poster.FileName);
                    string toInsert = "INSERT INTO Movie(MovieName,MoviePoster,MovieDescription) VALUES ('" + mov_name + "','" + imgLink + "','" + mov_desc + "')";
                    SqlCommand cmd = new SqlCommand(toInsert, con);
                    con.Open();
                    int inserted = (int)cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    if (inserted == 1)
                    {
                        Response.Write("Created");
                    }
                    string getMovieId = "Select MovieId from Movie where MovieName='" + mov_name+"'";
                    SqlDataAdapter da = new SqlDataAdapter(getMovieId,con);
                    da.Fill(dt);
                    DataRow dr = dt.Rows[0];
                    string movieId = dr[0].ToString();
                    con.Close();
                    Response.Redirect("~/CreateTicket.aspx?movieId=" + movieId);
                }

            }
            catch(Exception err)
            {

            }

        }
    }
}