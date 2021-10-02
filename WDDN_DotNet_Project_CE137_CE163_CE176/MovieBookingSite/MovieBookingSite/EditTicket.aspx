<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditTicket.aspx.cs" Inherits="MovieBookingSite.EditTicket" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="movie_name" AutoPostBack="true" OnTextChanged="movie_name_TextChanged"  runat="server"></asp:TextBox>
            <asp:TextBox ID="movie_desc" AutoPostBack="true" OnTextChanged="movie_desc_TextChanged" runat="server"></asp:TextBox>
            <asp:TextBox ID="silver_price" AutoPostBack="true"  OnTextChanged="silver_price_TextChanged" runat="server"></asp:TextBox>
            <asp:TextBox ID="gold_price" AutoPostBack="true" OnTextChanged="gold_price_TextChanged" runat="server"></asp:TextBox>
            <asp:TextBox ID="platinum_price" AutoPostBack="true" OnTextChanged="platinum_price_TextChanged" runat="server"></asp:TextBox>
            <asp:FileUpload ID="movie_poster" runat="server" />
            <asp:Button ID="Update_btn" CssClass="" OnClick="HandleUpdate" runat="server" Text="Update!" />

        </div>
    </form>
</body>
</html>
