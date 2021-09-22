<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoggedIn.aspx.cs" Inherits="MovieBookingSite.LoggedIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Logged In</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1> 
                <asp:Label ID="id" runat="server" Text="Label"></asp:Label> 
                <br />
                Welcome <asp:Label ID="uname" runat="server" Text=""></asp:Label>!!
                <br />
                <asp:Label ID="contact" runat="server" Text="Label"></asp:Label>
                <br />
                <asp:Label ID="email" runat="server" Text="Label"></asp:Label>
                <br />
            </h1>
        </div>
    </form>
</body>
</html>
