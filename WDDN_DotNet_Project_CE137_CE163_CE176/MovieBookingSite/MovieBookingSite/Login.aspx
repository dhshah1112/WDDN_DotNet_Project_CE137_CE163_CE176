<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="MovieBookingSite.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="userName" placeholder="Enter Username ..." runat ="server"></asp:TextBox>
            <asp:TextBox ID="Password" placeholder="Enter password..." TextMode="Password" runat="server"></asp:TextBox>
            <asp:Button runat="server" Text="Login!" OnClick="handleLogin"/>
        </div>
    </form>
</body>
</html>

