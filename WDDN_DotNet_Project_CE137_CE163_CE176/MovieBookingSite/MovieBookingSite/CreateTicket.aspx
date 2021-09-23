<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateTicket.aspx.cs" Inherits="MovieBookingSite.CreateTicket" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="MovieName" placeholder="Enter Movie name" runat="server"></asp:TextBox>
            <asp:TextBox ID="SilverPrice" placeholder="Silver price" runat="server"></asp:TextBox>
            <asp:TextBox ID="GoldPrice" placeholder="Gold price"  runat="server"></asp:TextBox>
            <asp:TextBox ID="PlatinumPrice" placeholder="Platinum price" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="Create" OnClick="handleCreateTicket" />

        </div>
    </form>
</body>
</html>
