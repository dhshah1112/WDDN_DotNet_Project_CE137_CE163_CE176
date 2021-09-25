using System;
using System.Data;
using System.Data.SqlClient;
using System.Web.Configuration;

namespace MovieBookingSite
{
    public partial class movieDetails : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            int movieId = Convert.ToInt32(Request.QueryString["Id"]);
            SqlConnection con = new SqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
            try
            {
                using (con)
                {
                    con.Open();
                    string retrieveMovies = "select * from Ticket as t where t.Id='"+movieId+"'";
                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(retrieveMovies, con);
                    da.Fill(dt);
                    GridView1.DataSource = dt;
                    GridView1.DataBind();
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