<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="MovieBookingSite.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SignUp</title>
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

        .create_title {
            font-size: 2.5rem;
            margin-top: 3vh;
            color: white;
        }

        .login_box {
            width: 35vw;
            height: 94vh;
            display: flex;
            flex-direction: column;
            align-items: center;
            transition: 0.3s;
            background-color: #1f2029;
            border-radius: 7px;
        }

            .login_box:hover {
                transform: scale(1.01);
                transition: 0.3s;
            }

        .text_input {
            background-color: #303245;
            color: white;
            border-radius: 2%;
            width: 25vw;
            border: none;
            padding: 4%;
            margin-top: 1.4vh;
            height: 30px;
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
            width: 60%;
        }

        .lower_buttons {
            width: 120px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="login_container">
                <div class="login_box">
                    <h1 class="create_title">Signup</h1>
                    <asp:TextBox ID="name" CssClass="text_input" placeholder="Name" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="Name_Required" runat="server" CssClass="text-danger" ControlToValidate="name" ErrorMessage="Name is required"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="username" CssClass="text_input" placeholder="Username" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="username_required" runat="server" CssClass="text-danger" ControlToValidate="username" ErrorMessage="Userame is required"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="email" CssClass="text_input" placeholder="Email" runat="server"></asp:TextBox>
                    <asp:RegularExpressionValidator CssClass="text-danger"
                        ID="RegularExpressionValidator2" runat="server"
                        ControlToValidate="email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ErrorMessage="Please enter valid email"></asp:RegularExpressionValidator>
                    <asp:TextBox ID="contact" CssClass="text_input" placeholder="Mobile number" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="contact_required" runat="server" CssClass="text-danger" ControlToValidate="contact" ErrorMessage="Contact is required"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="password" CssClass="text_input" TextMode="Password" placeholder="Password" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="password_required" runat="server" ControlToValidate="password" CssClass="text-danger" ErrorMessage="Password is required"></asp:RequiredFieldValidator>
                    <asp:TextBox ID="confirmPassword" CssClass="text_input" TextMode="Password" placeholder="Confirm password" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="confirm_pass_required" runat="server" CssClass="text-danger" ControlToValidate="confirmPassword" ErrorMessage="Confirm Password is required"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="compare_pass" ControlToValidate="password" CssClass="text-danger" ControlToCompare="confirmPassword" runat="server" ErrorMessage="Password and confirm password must match"></asp:CompareValidator>
                    <asp:CustomValidator ID="password_validation" ControlToValidate="password" OnServerValidate="password_validation_ServerValidate" runat="server" ErrorMessage="Password must be combination of 6-14 length,1 lowercase,1 uppercase and 1 digit"></asp:CustomValidator>
                    <asp:Button ID="Button1" CssClass="btn w-25 p-2 btn-primary" runat="server" Text="Submit" OnClick="handleRegistration" />
                    
                    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
