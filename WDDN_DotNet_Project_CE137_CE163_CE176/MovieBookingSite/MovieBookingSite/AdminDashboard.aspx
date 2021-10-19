<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="MovieBookingSite.AdminDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Panel</title>
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
            width: 40vw;
            font-family: 'Poppins';
            color:antiquewhite;
            
        }

        .outer_container {
            display: flex;
            align-items: center;
            justify-content: center;
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
            background-image: linear-gradient(rgba(0,0,0.4,0.8),transparent),url(Styles/images/blackbg.jfif);
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
                <img src="Styles/images/logo.png" class="nav_logo" />
                <ul>

                    <li><a>
                        <asp:LinkButton ID="Logout" CssClass="nav_text" OnClick="HandleLogout" runat="server"><i class="fas fa-sign-out-alt"></i> Logout  </asp:LinkButton></a></li>
                </ul>
            </nav>
            <div class="outer_container">
            <asp:DataList ID="DataList1" RepeatLayout="Table" RepeatDirection="Vertical" runat="server" DataKeyField="MovieId" DataSourceID="SqlDataSource1">
                <HeaderTemplate>
                    <table class="table mr-5 mt-5 table_container" cellspacing="4">
                        <thead>
                            <tr class="table_text">
                                <th scope="col">Sr No</th>
                                <th scope="col">MovieName</th>
                                <th scope="col">Delete</th>
                                <th scope="col">Edit</th>
                            </tr>
                        </thead>
                </HeaderTemplate>

                <ItemTemplate>
                    <tbody>
                        <tr class="table_text">
                            <td><%# Container.ItemIndex + 1 %></td>
                            <td><%# Eval("MovieName") %></td>
                            <td>
                                <asp:LinkButton OnClick="HandleDelete" CssClass="table_icon_delete"  CommandArgument='<%# Eval("MovieId")%>'  ID="LinkButton1" runat="server"><i class="fas fa-trash-alt"></i></asp:LinkButton></td>
                            <td>
                                <asp:LinkButton OnClick="HandleEdit"  CssClass="table_icon" CommandArgument='<%# Eval("MovieId") %>'  ID="LinkButton2" runat="server"><i class="fas fa-edit"></i></asp:LinkButton></td>
                        </tr>
                    </tbody>
                </ItemTemplate>
                <FooterTemplate></table></FooterTemplate>
            </asp:DataList>
            <asp:HyperLink CssClass="btn btn-outline-primary ml-5" ID="CreateButton" NavigateUrl="~/CreateMovie.aspx" runat="server">Create movie ticket</asp:HyperLink>
            <asp:Label ID="Admin_Action" CssClass="table_text ml-3" runat="server" Text=""></asp:Label>

            </div>


            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConStr %>" SelectCommand="SELECT * FROM [Movie]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
