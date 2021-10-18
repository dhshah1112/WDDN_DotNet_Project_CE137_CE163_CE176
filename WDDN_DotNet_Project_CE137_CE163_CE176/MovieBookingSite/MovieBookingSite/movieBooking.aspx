<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="movieBooking.aspx.cs" Inherits="MovieBookingSite.movieBooking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&family=Poppins:wght@200&family=Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <style>
        body {
            font-family: 'Montserrat';
             background-image:url(Styles/images/bg2.jpg);
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position:center;
            background-size:cover;
        }
        .nav_text:hover {
            text-decoration: none;
            color: dimgrey;
        }

        .nav_text {
            font-size: 1.3rem;
            color: dimgrey;
        }

        .nav_logo {
            width: 120px;
            margin: 1.3%;
            color: dimgrey;
            cursor: pointer;
           
        }

            .nav_logo:hover {
                transform: scale(1.1);
            }

        nav {
            display: flex;
            width: 100%;
            align-items: center;
            flex-wrap: wrap;
            padding: 5px 0;
            position: sticky;
        }

            nav ul {
                flex: 1;
                text-align: right;
                padding-right: 30px;
            }

                nav ul li {
                    display: inline-block;
                    list-style: none;
                    margin: 10px 30px;
                }

                    nav ul li a {
                        text-decoration: none;
                        position: relative;
                        color: dimgrey;
                    }

                        nav ul li a::after {
                            content: '';
                            width: 0;
                            height: 3px;
                            position: absolute;
                            bottom: -5px;
                            left: 50%;
                            transform: translateX(-50%);
                            color: dimgrey;
                            transition: width 0.3s;
                        }

                        nav ul li a:hover::after {
                            width: 100%;
                        }
        .booking_container {
            height: 100vh;
            width: 100vw;
            display: flex;
            align-items: center;
            flex-direction:column;
            justify-content: center;
        }

        .inner_container {
            height: 78vh;
            width: 60vw;
            display: flex;
            
        }

        .booking_img {
            height: 100%;
            width: 20vw;
        }

        .left_container {
            display: flex;
            flex-direction: column;
            width: 100%;
            background-color: black;
        }

        .movie_title {
            font-size: 2rem;
            color: white;
            margin-top:10px;
            text-align: center;
        }

        .my_dropdown {
            width: 40%;
            background-color: gray;
            margin: 3%;
            color: white;
            border-radius: 5%;
        }

            .my_dropdown:focus {
                outline: none;
                border: none;
            }

        .dropdown_container {
            width: 100%;
            display: flex;
            align-items: center;
            flex-direction: column;
        }

        .price_label {
            color: white;
            font-size: 1.3rem;
        }

        .prices {
            display: flex;
            justify-content: space-evenly;
            margin-top:5px;
        }

        .ticket_input {
            width: 50%;
        }

        .booking_ticket_input_container {
            margin-top: 10px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .confirm_button
        {
            display:flex;
            align-items:center;
            justify-content:center;
        }
        .total_price_label
        {
            margin:3%;
            font-size:1.3rem;
            color:white;
            text-align:center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">

        <div class="booking_container">
             <nav>
                <asp:HyperLink NavigateUrl="~/Home.aspx" ID="HyperLink1" runat="server"><img src="Styles/images/logodark.png" class="nav_logo" /></asp:HyperLink>
                <ul>
                    <li><a href="#">
                        <asp:HyperLink CssClass="nav_text" NavigateUrl="~/Bookings.aspx" runat="server"> <i class="fas fa-ticket-alt"></i> Bookings</asp:HyperLink></a></li>
                    <li><a>
                        <asp:LinkButton ID="Logout" CssClass="nav_text" OnClick="HandleLogout" runat="server"><i class="fas fa-sign-out-alt"></i> Logout  </asp:LinkButton></a></li>
                </ul>
            </nav>
            <div class="inner_container">
                <div>
                    <asp:Image CssClass="booking_img" ID="MoviePoster" runat="server" />
                </div>
                <div class="left_container">
                    <div class="movie_title">
                        <asp:Label ID="Movie_Name" runat="server" Text=""></asp:Label>
                    </div>
                    <div class="dropdown_container">
                        <asp:DropDownList CssClass="my_dropdown" AutoPostBack="true" OnSelectedIndexChanged="Ticket_type_SelectedIndexChanged" ID="Ticket_type" runat="server">
                            <asp:ListItem Text="Select ticket type" />
                            <asp:ListItem Value="Silver" />
                            <asp:ListItem Value="Gold" />
                            <asp:ListItem Value="Platinum" />
                        </asp:DropDownList>
                        <asp:DropDownList CssClass="my_dropdown" ID="ShowDates" AutoPostBack="True" AppendDataBoundItems="True" runat="server" OnSelectedIndexChanged="ShowDates_SelectedIndexChanged" DataSourceID="SqlDataSource1" DataTextField="ShowDate" DataValueField="ShowDate">
                            <asp:ListItem Text="Select Date" />
                        </asp:DropDownList>
                        <asp:DropDownList CssClass="my_dropdown" ID="Movie_Timings" runat="server">
                            <asp:ListItem Text="Select Timings" />
                            <asp:ListItem Value="9AM-12PM" />
                            <asp:ListItem Value="12PM-3PM" />
                            <asp:ListItem Value="3PM-6PM" />
                            <asp:ListItem Value="6PM-9PM" />
                            <asp:ListItem Value="9PM-12PM" />
                        </asp:DropDownList>
                    </div>
                    <div class="prices">
                        <div class="price_label">
                            Silver : ₹ 
                        <asp:Label ID="silver_Price" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="price_label">
                            Gold : ₹ 
                        <asp:Label ID="gold_Price" runat="server" Text=""></asp:Label>
                        </div>
                        <div class="price_label">
                            Platinum : ₹ 
                        <asp:Label ID="platinum_Price" runat="server" Text=""></asp:Label>
                        </div>
                    </div>
                    <div class="prices">
                        <div class="price_label">
                         Max Silver : 
                        <asp:Label ID="silverT" runat="server" Text="-"></asp:Label>
                        </div>
                        <div class="price_label">
                           Max Gold : 
                        <asp:Label ID="goldT" runat="server" Text="-"></asp:Label>
                        </div>
                        <div class="price_label">
                        Max Platinum : 
                        <asp:Label ID="platT" runat="server" Text="-"></asp:Label>
                        </div>
                    </div>
                    <div class="booking_ticket_input_container">
                        <span class="price_label mr-3">Tickets :  </span> 
                        <asp:TextBox ID="Number_of_tickets" CssClass="form-control ticket_input" AutoPostBack="true" Text="0" OnTextChanged="Number_of_tickets_TextChanged" runat="server"></asp:TextBox>
                    </div>
                    
                    <div class="total_price_label">   
                        Total Price : <asp:Label ID="Total_Price" runat="server" Text="0"></asp:Label>
                     </div>
                    <asp:Label ID="Error" CssClass="text-danger mb-3 text-center" runat="server" Text=""></asp:Label>
                    <div class="confirm_button">
                    <asp:Button CssClass="btn btn-primary " ID="Confirm_Booking" OnClick="Confirm_Booking_Click" type="submit" runat="server" Text="Confirm Booking!" />
                    </div>
                </div>
            </div>
        </div>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConStr %>" SelectCommand="SELECT [ShowDate] FROM [AvailableTickets] WHERE ([MovieId] = @MovieId)">
            <SelectParameters>
                <asp:QueryStringParameter Name="MovieId" QueryStringField="movieId" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>


        <%--<div>    
            <div class="card" style="width: 18rem;">
                <div class="card-body">
                    <asp:Label ID="Movie_Name" CssClass="card-text" runat="server" Text=""></asp:Label>
                    <asp:Label ID="Movie_Description" CssClass="card-text" runat="server" Text=""></asp:Label>
                </div>
                <asp:Image CssClass="card-img-top"  ID="MoviePoster" runat="server" />
            </div>
            <br />
            <asp:DropDownList AutoPostBack="true"  OnSelectedIndexChanged="Ticket_type_SelectedIndexChanged" ID="Ticket_type" runat="server">
                <asp:ListItem Text="Select ticket type" />
                <asp:ListItem Value="Silver" />
                <asp:ListItem Value="Gold" />
                <asp:ListItem Value="Platinum" />
            </asp:DropDownList>
            <br />

            <asp:DropDownList ID="ShowDates" AutoPostBack="True" AppendDataBoundItems="True" runat="server" OnSelectedIndexChanged="ShowDates_SelectedIndexChanged" DataSourceID="SqlDataSource1" DataTextField="ShowDate" DataValueField="ShowDate">
                <asp:ListItem Text="select Date" />
            </asp:DropDownList>
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConStr %>" SelectCommand="SELECT [ShowDate] FROM [AvailableTickets] WHERE ([MovieId] = @MovieId)">
                <SelectParameters>
                    <asp:QueryStringParameter Name="MovieId" QueryStringField="movieId" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
            
            <asp:Label runat="server" Id="silver_Price" Text=""></asp:Label>
            <asp:Label runat="server" Id="gold_Price" Text=""></asp:Label>
            <asp:Label runat="server" Id="platinum_Price"  Text=""></asp:Label>
            <br />
            
            <asp:DropDownList ID="Movie_Timings" runat="server">
                <asp:ListItem Text="Select Timings"/>
                <asp:ListItem Value="9AM-12PM" />
                <asp:ListItem Value="12PM-3PM" />
                <asp:ListItem Value="3PM-6PM" />
                <asp:ListItem Value="6PM-9PM" />
                <asp:ListItem Value="9PM-12PM" />
            </asp:DropDownList>
            <br />
            
            Silver ticket: <asp:Label ID="silverT" runat="server" Text=""></asp:Label>
            Gold ticket: <asp:Label ID="goldT" runat="server" Text=""></asp:Label>
            Plat ticket: <asp:Label ID="platT" runat="server" Text=""></asp:Label>
            <br />

            <asp:TextBox ID="Number_of_tickets" AutoPostBack="true" Text="" OnTextChanged="Number_of_tickets_TextChanged" runat="server"></asp:TextBox>
            <asp:Label ID="Total_Price" runat="server" Text="0"></asp:Label>
            <br />
            <asp:Label ID="Error" CssClass="alert-danger" runat="server" Text=""></asp:Label>
            <br />

            <asp:Button ID="Confirm_Booking" OnClick="Confirm_Booking_Click" type="submit" runat="server" Text="Confirm Booking!" />
          

        </div>--%>
    </form>
</body>
</html>
