<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateTicket.aspx.cs" Inherits="MovieBookingSite.CreateTicket" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server" enctype="multipart/form-data">
        <div>
            <asp:TextBox ID="MovieName" placeholder="Enter Movie name" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:TextBox ID="SilverPrice" placeholder="Silver price" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:TextBox ID="GoldPrice" placeholder="Gold price"  runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:TextBox ID="PlatinumPrice" placeholder="Platinum price" runat="server"></asp:TextBox>
            <br />
            <br />
            <asp:TextBox ID="Desc" runat="server" placeholder="Description" ></asp:TextBox>
            <br />
            <br />
            <asp:FileUpload ID="FileUpload1" runat="server" />
            <br />
            <br />
            <asp:Button ID="Button1" runat="server" Text="Create" OnClick="Button1_Click" />
        </div>
    </form>
</body>
</html>
