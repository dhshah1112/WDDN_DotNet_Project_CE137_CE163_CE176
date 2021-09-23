<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDashboard.aspx.cs" Inherits="MovieBookingSite.AdminDashboard" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:HyperLink ID="CreateButton" NavigateUrl="~/CreateTicket.aspx"  runat="server">Create</asp:HyperLink>
        </div>
    </form>
</body>
</html>
