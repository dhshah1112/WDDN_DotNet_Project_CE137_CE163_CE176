<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CreateMovie.aspx.cs" Inherits="MovieBookingSite.CreateMovie" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="movie_name" runat="server"></asp:TextBox>
            <asp:FileUpload ID="movie_poster"  runat="server" />
            <asp:TextBox ID="movie_description" runat="server"></asp:TextBox>
            <asp:Button ID="Create" runat="server" OnClick="HandleCreateMovie" Text="Create" />
        </div>
    </form>
</body>
</html>
