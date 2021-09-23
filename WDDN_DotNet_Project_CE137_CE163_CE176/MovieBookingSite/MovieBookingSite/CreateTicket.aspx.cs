using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace MovieBookingSite
{
    public partial class CreateTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void handleCreateTicket(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
            try
            {
                using(con)
                {
                    String moviename = MovieName.Text;
                    String silver = SilverPrice.Text;
                    String gold = GoldPrice.Text;
                    String platinum = PlatinumPrice.Text;

                    String insertTicket = "Insert into Ticket (MovieName,SilverPrice,GoldPrice,PlatinumPrice)values('"+moviename+"','"+silver+"','"+gold+"','"+platinum+"')";
                    SqlCommand cmd = new SqlCommand(insertTicket, con);
                    con.Open();
                    int inserted = (int)cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    con.Close();
                    if(inserted==1)
                    {
                        Response.Write("Created");
                    }

                }
            }
            catch(Exception err)
            {

            }

        }
    }
}