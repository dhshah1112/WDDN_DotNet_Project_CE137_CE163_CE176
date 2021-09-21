﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="MovieBookingSite.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SignUp</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="name" placeholder ="Name" runat="server"></asp:TextBox>
            <br />
            <asp:TextBox ID="username" placeholder ="Username" runat="server"></asp:TextBox>
            <br />
            <asp:TextBox ID="email" placeholder ="Email" runat="server"></asp:TextBox>
            <br />
            <asp:TextBox ID="contact" placeholder ="Mobile number" runat="server"></asp:TextBox>
            <br />
            <asp:TextBox ID="password" placeholder ="Password" runat="server"></asp:TextBox>
            <br />
            <asp:TextBox ID="confirmPassword" placeholder ="Confirm password" runat="server"></asp:TextBox>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Submit" onclick ="completeRegistration"/>
            <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
            
        </div>
    </form>
</body>
</html>
