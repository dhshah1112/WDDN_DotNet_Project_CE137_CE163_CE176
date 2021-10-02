<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="MovieBookingSite.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <link
        rel="stylesheet"
        href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
        crossorigin="anonymous" />
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&family=Poppins:wght@200&family=Roboto&display=swap" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <title></title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'poppins',sans-serif;
        }

        .home_container {
            width: 100%;
            height: 100vh;
            background-image: linear-gradient(rgba(0,0,0.4,0.8),transparent),url(Styles/images/ticketbg.jpg);
            background-size: cover;
            background-position: center;
            padding: 0 8%;
            position: relative;
        }

        .nav_logo {
            width: 120px;
            cursor: pointer;
        }

        nav {
            display: flex;
            width: 100%;
            align-items: center;
            flex-wrap: wrap;
            padding: 5px 0;
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

        nav ul li a:hover::after
        {
            width: 100%;
        }

        .siteName {
            color: white;
            position: absolute;
            bottom: 9%;
            left: 4%;
        }

        .siteName h3 {
            font-size: 20px;
            font-weight: 200;

        }

        .siteName h1 {
           font-size: 150px;
           font-weight: 200;
           color: white;
           animation: fadeIn 1s infinite alternate;
        }
        .nav_text:hover
        {
            text-decoration:none;
            color:white;
        }
        .nav_text
        {
            font-size:1.3rem;
        }
        @keyframes fadeIn {
            from {
                opacity: 0;
            }
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="home_container">
            <nav>
                <img src="Styles/images/logo.png" class="nav_logo" />
                <ul>
                    <li><a href="#"><asp:HyperLink CssClass="nav_text" NavigateUrl="~/ShowMovies.aspx" runat="server"> <i class="fas fa-film"></i> Movies</asp:HyperLink></a></li>
                    <li><a href="#"><asp:HyperLink CssClass="nav_text" NavigateUrl="~/ShowMovies.aspx" runat="server"> <i class="fas fa-ticket-alt"></i> Bookings</asp:HyperLink></a></li>
                    <li><a><asp:LinkButton ID="Logout" CssClass="nav_text" OnClick="HandleLogout" runat="server"><i class="fas fa-sign-out-alt"></i> Logout  </asp:LinkButton></a></li>
                </ul>
            </nav>

            <div class="siteName">
                <h1>Light's Out</h1>
                <h3>We make sure you don't miss on your favourite movies</h3>
            </div>
        </div>
        <%--<div class="home_container">
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
            <div class="container_poster">
                <p class="home_title">Light's Out</p>
            </div>
        </div>--%>
    </form>
</body>
</html>
