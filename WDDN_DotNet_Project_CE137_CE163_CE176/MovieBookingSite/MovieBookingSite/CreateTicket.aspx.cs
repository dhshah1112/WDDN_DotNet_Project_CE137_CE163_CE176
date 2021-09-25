using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Configuration;
using System.Data.SqlClient;
using System.IO;

namespace MovieBookingSite
{
    public partial class CreateTicket : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
           
            SqlConnection con = new SqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
            try
            {
                using (con)
                {
                    String moviename = MovieName.Text;
                    String silver = SilverPrice.Text;
                    String gold = GoldPrice.Text;
                    String platinum = PlatinumPrice.Text;
                    String desc = Desc.Text;
                    FileUpload1.SaveAs(Server.MapPath("~/MovieImage/") + Path.GetFileName(FileUpload1.FileName));
                    String imgLink = "MovieImage/" + Path.GetFileName(FileUpload1.FileName);

                    Response.Write(imgLink + "<br />");
                    //string imgLink = "";
                    //String insertTicket = "Insert into Ticket (MovieName,SilverPrice,GoldPrice,PlatinumPrice,Description,Image)"+" values ( '" + moviename + "','" + silver + "','" + gold + "','" + platinum + "','" + desc + "','" + imgLink + "')";
                    String toInsert = "INSERT INTO Ticket(MovieName,SilverPrice,GoldPrice,PlatinumPrice,Description,Image) VALUES ('" + moviename + "','" + silver + "','" + gold + "','" + platinum + "','" + desc + "','" + imgLink + "')";
                    SqlCommand cmd = new SqlCommand(toInsert, con);
                    con.Open();
                    int inserted = (int)cmd.ExecuteNonQuery();
                    cmd.Dispose();
                    con.Close();
                    if (inserted == 1)
                    {
                        Response.Write("Created");
                    }

                }
            }
            catch (Exception err)
            {
                Response.Write("Erros is :" +err.Message);
            }

        }
    }
}