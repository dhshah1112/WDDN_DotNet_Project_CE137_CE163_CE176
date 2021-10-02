<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MovieBookingSite.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <link
        rel="stylesheet"
        href="https://pro.fontawesome.com/releases/v5.10.0/css/all.css"
        integrity="sha384-AYmEC3Yw5cVb3ZcuHtOA93w35dYTsvhLPVnYs9eStHfGJvOvKxVfELGroGkvsg+p"
        crossorigin="anonymous" />
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300&family=Poppins:wght@200&family=Roboto&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <style>
        body {
            background-image: url(Styles/images/loginbg.jpg);
            background-repeat: no-repeat;
            background-attachment: fixed;
            background-position: center;
            background-size: cover;
            width: 100%;
            height: 100vh;
            font-family: 'Poppins';
            font-weight: 400;
        }

        .login_container {
            width: 100%;
            height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .login_box {
            width: 35vw;
            height: 80vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            transition: 0.3s;
            background-color: #1f2029;
            border-radius: 7px;
        }

            .login_box:hover {
                transform: scale(1.1);
                transition: 0.3s;
            }

        .text_input {
            background-color: #303245;
            color: white;
            border-radius: 2%;
            width: 25vw;
            border: none;
            padding: 3vw;
            margin-top: 4vh;
            height: 3vh;
            font-size: 1.5rem;
        }

            .text_input:focus {
                outline: none;
                border: none;
            }

        .create_title {
            font-size: 2.5rem;
            margin-top: 3vh;
            color: white;
        }

        .link_buttons {
            display: flex;
            justify-content: space-between;
            align-items: center;
            width:60%;
        }

        .lower_buttons {
            width: 120px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="login_container">
            <div class="login_box">
                <h1 class="create_title">Login</h1>
                <asp:TextBox CssClass="text_input" ID="userName" placeholder="Enter Username ..." runat="server"></asp:TextBox>
                <asp:TextBox CssClass="text_input" ID="Password" placeholder="Enter password..." TextMode="Password" runat="server"></asp:TextBox>
                <asp:Button runat="server" Text="Login!" CssClass="btn w-25 p-3 mt-5 btn-primary" OnClick="HandleLogin" />
                <asp:Label ID="User_Action" runat="server" CssClass=" mt-3 text-danger" Text="" />
                <div class="link_buttons mt-3">
                    <asp:HyperLink NavigateUrl="~/AdminLogin.aspx" CssClass="btn btn-warning lower_buttons text-center  p-3" ID="HyperLink1" runat="server">Admin Panel</asp:HyperLink>
                    <asp:HyperLink NavigateUrl="~/Signup.aspx" ID="HyperLink2" CssClass="btn lower_buttons btn-success text-center  p-3" runat="server">Signup</asp:HyperLink>
                </div>
            </div>
        </div>
    </form>
</body>
</html>

