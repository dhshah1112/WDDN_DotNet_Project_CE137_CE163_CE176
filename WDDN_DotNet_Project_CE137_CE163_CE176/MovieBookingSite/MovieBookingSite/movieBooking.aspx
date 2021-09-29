<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="movieBooking.aspx.cs" Inherits="MovieBookingSite.movieBooking" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div class="card" style="width: 18rem;">
                <asp:Image CssClass="card-img-top"  ID="MoviePoster" runat="server" />
                <div class="card-body">
                    <asp:Label ID="Movie_Name" CssClass="card-text" runat="server" Text=""></asp:Label>
                    <asp:Label ID="Movie_Description" CssClass="card-text" runat="server" Text=""></asp:Label>
                </div>
            </div>
            <asp:DropDownList AutoPostBack="true" OnSelectedIndexChanged="Ticket_type_SelectedIndexChanged" ID="Ticket_type" runat="server">
                <asp:ListItem Text="Select ticket type" />
                <asp:ListItem Value="Silver" />
                <asp:ListItem Value="Gold" />
                <asp:ListItem Value="Platinum" />
            </asp:DropDownList>
            <asp:DropDownList ID="ShowDates" runat="server">
                
            </asp:DropDownList>
            <asp:Label runat="server" Id="silver_Price" Text=""></asp:Label>
            <asp:Label runat="server" Id="gold_Price" Text=""></asp:Label>
            <asp:Label runat="server" Id="platinum_Price"  Text=""></asp:Label>

            <asp:DropDownList ID="Movie_Timings" runat="server">

                <asp:ListItem Text="Select Timings"/>
                <asp:ListItem Value="9AM-12PM" />
                <asp:ListItem Value="12PM-3PM" />
                <asp:ListItem Value="3PM-6PM" />
                <asp:ListItem Value="6PM-9PM" />
                <asp:ListItem Value="9PM-12PM" />
            </asp:DropDownList>
            <asp:TextBox ID="Number_of_tickets" AutoPostBack="true" Text="" OnTextChanged="Number_of_tickets_TextChanged" runat="server"></asp:TextBox>
            <asp:Label ID="Total_Price" runat="server" Text="0"></asp:Label>
            <asp:Button ID="Confirm_Booking" OnClick="Confirm_Booking_Click" type="submit" runat="server" Text="Confirm Booking!" />
        </div>
    </form>
</body>
</html>
