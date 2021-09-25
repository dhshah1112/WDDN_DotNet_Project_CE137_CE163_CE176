﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Web.Configuration;
using System.Data.SqlClient;

namespace MovieBookingSite
{
    public partial class ShowTickets : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            SqlConnection con = new SqlConnection();
            con.ConnectionString = WebConfigurationManager.ConnectionStrings["ConStr"].ConnectionString;
            try
            {
                using (con) {
                    con.Open();
                    string retrieveMovies = "select * from Ticket";
                    DataTable dt = new DataTable();
                    SqlDataAdapter da = new SqlDataAdapter(retrieveMovies, con);
                    da.Fill(dt);
                    //GridView1.DataSource = dt;
                    //GridView1.DataBind();

                    con.Close();



                }
            }
            catch(Exception err)
            {
                Response.Write(err.Message);
            }
        }

        protected void Id_Click(object sender, EventArgs e)
        {
            //Session["BookedId"]= (LinkButton)sender).Text);
            Response.Redirect("movieDetails.aspx?Id=" + ((LinkButton)sender).Text);
        }
    }
}