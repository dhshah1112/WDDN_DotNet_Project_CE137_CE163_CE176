<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowMovies.aspx.cs" Inherits="MovieBookingSite.ShowMovies" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Show Movies</title>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link rel="stylesheet" href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css" integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p" crossorigin="anonymous" />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&family=Poppins:wght@200&family=Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <link rel="stylesheet" href="Styles/Navbar.css">
    <link rel="stylesheet" href="Styles/MovieCard.css">
    <style>
        body {
            background-image:url(Styles/images/ticketbg.jpg);
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position:center;
            background-size:cover;
             width: 100%;
            height: 100vh;
        }

        .home_container {
            width: 100%;
            height: 100vh;
        }

        .nav_text:hover {
            text-decoration: none;
            color: white;
        }

        .nav_text {
            font-size: 1.3rem;
        }

        .nav_logo {
            width: 120px;
            margin: 1.3%;
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
                        color: #fff;
                    }

                        nav ul li a::after {
                            content: '';
                            width: 0;
                            height: 3px;
                            position: absolute;
                            bottom: -5px;
                            left: 50%;
                            transform: translateX(-50%);
                            background: #fff;
                            transition: width 0.3s;
                        }

                        nav ul li a:hover::after {
                            width: 100%;
                        }
    </style>

</head>
<body>
    <form id="form1" runat="server">

        <div class="home_container">
            <nav>
                <asp:HyperLink NavigateUrl="~/Home.aspx" ID="HyperLink1" runat="server"><img src="Styles/images/logo.png" class="nav_logo" /></asp:HyperLink>
                <ul>
                    <li><a href="#">
                        <asp:HyperLink CssClass="nav_text" NavigateUrl="~/Bookings.aspx" runat="server"> <i class="fas fa-ticket-alt"></i> Bookings</asp:HyperLink></a></li>
                    <li><a>
                        <asp:LinkButton ID="Logout" CssClass="nav_text" OnClick="HandleLogout" runat="server"><i class="fas fa-sign-out-alt"></i> Logout  </asp:LinkButton></a></li>
                </ul>
            </nav>
            <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" RepeatColumns="2" DataKeyField="MovieId" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div class="movie_card">
                        <asp:Image ImageUrl='<%#Eval("MoviePoster") %>' CssClass="movie_card_poster_img" ID="Movie_Poster" runat="server" />
                        <div class="movie_card_info">
                            <asp:Label ID="Movie_name" CssClass="movie_title" runat="server" Text='<%#Eval("MovieName") %>'></asp:Label>
                            <asp:Label ID="Movie_description" CssClass="movie_description" runat="server" Text='<%#Eval("MovieDescription") %>'></asp:Label>
                            <button class="buy_tickets_button">
                                <asp:LinkButton ID="LinkButton1" Font-Underline="false" CommandArgument='<%#Eval("MovieId") %>' OnClick="ShowDetail" runat="server">Buy Tickets</asp:LinkButton>
                            </button>
                        </div>
                    </div>
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConStr %>" SelectCommand="SELECT * FROM [Movie]"></asp:SqlDataSource>

        </div>
        <%--<div>
            <nav class="nav_container">
                <div class="nav_logo">
                    <img class="nav_img_logo" src="https://mir-s3-cdn-cf.behance.net/project_modules/1400/82bfdd12043305.562b3915845d6.png" />
                </div>
                <div class="nav_menu">
                        <asp:HyperLink CssClass="nav_links" NavigateUrl="~/ShowMovies.aspx" runat="server"> <i class="fas fa-film"></i> Movies</asp:HyperLink>
                        <asp:HyperLink CssClass="nav_links" NavigateUrl="~/ShowMovies.aspx" runat="server"> <i class="fas fa-ticket-alt"></i> Bookings</asp:HyperLink>                        
                        <asp:LinkButton ID="Logout" CssClass="btn nav_links btn-primary" OnClick="HandleLogout" runat="server"><i class="fas fa-sign-out-alt"></i> Logout  </asp:LinkButton>
                                          
                </div>
            </nav>
            <asp:DataList ID="DataList1" runat="server" RepeatDirection="Horizontal" RepeatColumns="2" DataKeyField="MovieId" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div class="movie_card">
                        <asp:Image ImageUrl='<%#Eval("MoviePoster") %>' CssClass="movie_card_poster_img" ID="Movie_Poster" runat="server" />
                        <div class="movie_card_info">
                            <asp:Label ID="Movie_name" CssClass="movie_title" runat="server" Text='<%#Eval("MovieName") %>'></asp:Label>
                            <asp:Label ID="Movie_description" CssClass="movie_description" runat="server" Text='<%#Eval("MovieDescription") %>'></asp:Label>
                            <button class="buy_tickets_button">
                                <asp:LinkButton ID="LinkButton1" Font-Underline="false" CommandArgument='<%#Eval("MovieId") %>' OnClick="ShowDetail" runat="server">Buy Tickets</asp:LinkButton>
                            </button>
                        </div>
                    </div>
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConStr %>" SelectCommand="SELECT * FROM [Movie]"></asp:SqlDataSource>
        </div>--%>
    </form>
</body>
</html>
