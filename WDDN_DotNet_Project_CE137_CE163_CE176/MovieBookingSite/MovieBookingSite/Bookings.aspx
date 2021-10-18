<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Bookings.aspx.cs" Inherits="MovieBookingSite.Bookings" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Your Bookings</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <link
        rel="stylesheet"
        href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
        crossorigin="anonymous" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&family=Poppins:wght@200&family=Roboto&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="Styles/Navbar.css">
    <style>
        .table_container {
            height: 20vh;
            width: 80vw;
            font-family: 'Poppins';
            color:antiquewhite;
            
        }
        body
        {
            background-image: linear-gradient(rgba(0,0,0.4,0.8),transparent),url(Styles/images/blackbg.jfif);
            background-size: cover;
            background-position: center;
            background-attachment:fixed;
        }
        .outer_container {
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction:column;
        }

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'poppins',sans-serif;
        }

        .home_container {
            width: 100%;
            height: 100vh;
            
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

                        nav ul li a:hover::after {
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

        .nav_text:hover {
            text-decoration: none;
            color: white;
        }

        .nav_text {
            font-size: 1.3rem;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
            }
        }
        .table_text
        {
            font-size:1.5rem;
            color:white;
        }
        .table_icon
        {
             font-size:1.5rem;
            color:white;
            transition:0.3s;
        }
        .table_icon_delete
        {
            font-size:1.5rem;
            color:red;
            transition:0.3s;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
         <div class="home_container">
            <nav>
                <asp:HyperLink NavigateUrl="~/Home.aspx" ID="HyperLink1" runat="server"><img src="Styles/images/logo.png" class="nav_logo" /></asp:HyperLink>
                
                <ul>

                    <li><a>
                        <asp:LinkButton ID="Logout" CssClass="nav_text" OnClick="HandleLogout" runat="server"><i class="fas fa-sign-out-alt"></i> Logout  </asp:LinkButton></a></li>
                </ul>
            </nav>
            <div class="outer_container">
             <asp:Label ID="BookedSuccessfully" CssClass="text-success text-center" runat="server" Text=""></asp:Label>
            <asp:DataList ID="DataList1" runat="server" DataKeyField="Id" DataSourceID="SqlDataSource1">
                <HeaderTemplate>
                    <table class="table mr-5 mt-5 table_container" cellspacing="4">
                        <thead>
                            <tr class="table_text">
                                <th scope="col">Sr No</th>
                                <th scope="col">MovieName</th>
                                <th scope="col">Date</th>
                                <th scope="col">Total Ticket</th>
                                <th scope="col">Show Time</th>                                
                                <th scope="col">Ticket Type</th>
                                <th scope="col">Total Price</th>

                            </tr>
                        </thead>
                </HeaderTemplate>

                <ItemTemplate>
                    <tbody>
                        <tr class="table_text">
                            <td><%# Container.ItemIndex + 1 %></td>
                            <td><%# Eval("MovieName") %></td>
                            <td><%# Eval("BookedDate") %></td>
                            <td style="text-align:center"><%# Eval("total_tickets") %></td>
                            <td><%# Eval("showTime") %></td>
                            <td style="text-align:center"><%# Eval("ticketType") %></td>
                            <td style="text-align:center"><%# Eval("Total") %></td>
                         </tr>

                    </tbody>
                </ItemTemplate>
                <FooterTemplate></table></FooterTemplate>
            </asp:DataList>
            </div>


            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConStr %>" SelectCommand="SELECT * FROM [Bookings] WHERE ([userId] = @userId)">
                <SelectParameters>
                    <asp:SessionParameter Name="userId" SessionField="userId" Type="Int32" />
                </SelectParameters>
             </asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
