<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowMovies.aspx.cs" Inherits="MovieBookingSite.ShowMovies" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous" />

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:DataList ID="DataList1" runat="server" DataKeyField="MovieId" DataSourceID="SqlDataSource1">
                <ItemTemplate>
                    <div class="card" style="width: 18rem;">
                        <asp:Image ImageUrl=<%#Eval("MoviePoster") %> CssClass="card-img-top" ID="Movie_Poster" runat="server" />
                        <div class="card-body">
                            <asp:Label ID="Movie_name" CssClass="card-text" runat="server" Text=<%#Eval("MovieName") %>></asp:Label>
                            <asp:Label ID="Movie_description" CssClass="card-text" runat="server" Text=<%#Eval("MovieDescription") %>></asp:Label>
                            <asp:LinkButton ID="LinkButton1" CommandArgument=<%#Eval("MovieId") %>  OnClick="ShowDetail" runat="server">Show details!!</asp:LinkButton>
                        </div>
                    </div>
                    <br />
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConStr %>" SelectCommand="SELECT * FROM [Movie]"></asp:SqlDataSource>
        </div>
    </form>
</body>
</html>
