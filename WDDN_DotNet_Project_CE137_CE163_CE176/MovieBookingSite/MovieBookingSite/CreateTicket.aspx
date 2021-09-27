<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateTicket.aspx.cs" Inherits="MovieBookingSite.CreateTicket" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div>
            <asp:TextBox ID="silver_price" placeholder="Silver Price" runat="server"></asp:TextBox>
            <asp:TextBox ID="gold_price" placeholder="Gold Price" runat="server"></asp:TextBox>
            <asp:TextBox ID="platinum_price" placeholder="Platinum Price" runat="server"></asp:TextBox>
            <asp:TextBox ID="max_silver_tickets" placeholder="Max Silver Tickets" runat="server"></asp:TextBox>
            <asp:TextBox ID="max_gold_tickets" placeholder="Max Gold Tickets" runat="server"></asp:TextBox>
            <asp:TextBox ID="max_platinum_tickets" placeholder="Max Platinum Tickets" runat="server"></asp:TextBox>
            <asp:TextBox ID="Show_Start_Date" placeholder="Starting Date of Show" TextMode="Date" runat="server"></asp:TextBox>
            <asp:Button ID="Create_Ticket" runat="server" Text="Create" OnClick="HandleCreateTicket" />
        </div>
    </form>
</body>
</html>
