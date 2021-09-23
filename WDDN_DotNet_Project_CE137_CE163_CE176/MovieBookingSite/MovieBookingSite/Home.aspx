<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="MovieBookingSite.Home" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <%--<asp:Button ID="Button1" runat="server" Text="Show all tickets available" onClick = "Show" />--%>
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/ShowTickets.aspx">ShowTickets</asp:HyperLink>
        </div>
    </form>
</body>
</html>
