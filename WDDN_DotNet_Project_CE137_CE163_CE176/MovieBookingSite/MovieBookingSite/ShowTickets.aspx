<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ShowTickets.aspx.cs" Inherits="MovieBookingSite.ShowTickets" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
    <style type="text/css" >
        .CardZZZ{
            display:flex;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <h1>Movie Details</h1>
            <br />
                <asp:DataList ID="DataList1" runat="server" CellPadding="4" DataKeyField="Id" DataSourceID="SqlDataSource1" ForeColor="#333333" HorizontalAlign="Center" RepeatColumns="3" RepeatDirection="Horizontal">
                        <ItemTemplate> 
                            
                            <div class="row">
                                <div class="col-3">
                                    <div class="card" style="width: 18rem;">
                                      <img class="card-img-top" src="<%# Eval("Image") %>" alt="Card image cap">
                                      <div class="card-body">
                                          <asp:Label  ID="Label1" runat="server" Text=<%# Eval("Id") %>></asp:Label>
                                        <h5 class="card-title"><%# Eval("MovieName") %></h5>
                                        <p class="card-text"> <%# Eval("Description") %> </p>  
                                          <asp:LinkButton CssClass="btn-danger" CommandArgument=<%#Eval("Id")%> ID="LinkButton1" OnClick="handleBooking" runat="server">Book</asp:LinkButton>
                                    </div>
                                </div>
                             </div>
                           </div>
                        </ItemTemplate>
                    <SelectedItemStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                </asp:DataList>
             </div>
            
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConStr %>" SelectCommand="SELECT [Id], [MovieName], [SilverPrice], [GoldPrice], [PlatinumPrice],[Description],[Image] FROM [Ticket]"></asp:SqlDataSource>
    </form>
</body>
</html>
