<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="movieDetails.aspx.cs" Inherits="MovieBookingSite.movieDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView  AutoGenerateColumns="false" ID="GridView1" runat="server">
                <AlternatingRowStyle BackColor="White" />  
                    <columns>  
                        <asp:TemplateField HeaderText="ID">  
                            <ItemTemplate>  
                                <asp:LinkButton ID="Id" runat="server"   Text='<%#Bind("Id") %>'></asp:LinkButton>  
                            </ItemTemplate>  
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="MovieName">  
                            <ItemTemplate>  
                                <asp:Label ID="MovieName" runat="server" Text='<%#Bind("MovieName") %>'></asp:Label>  
                            </ItemTemplate>  
                        </asp:TemplateField>      
                        <asp:TemplateField HeaderText="Silver Price">  
                            <ItemTemplate>  
                                <asp:Label ID="SilverPrice" runat="server" Text='<%#Bind("SilverPrice") %>'></asp:Label>  
                            </ItemTemplate>  
                        </asp:TemplateField>  
                        <asp:TemplateField HeaderText="Gold Price">  
                            <ItemTemplate>  
                                <asp:Label ID="GoldPrice" runat="server" Text='<%#Bind("GoldPrice") %>'></asp:Label>  
                            </ItemTemplate>  
                        </asp:TemplateField>  
                        <asp:TemplateField HeaderText="Plat Price">  
                            <ItemTemplate>  
                                <asp:Label ID="PlatPrice" runat="server" Text='<%#Bind("PlatinumPrice") %>'></asp:Label>  
                            </ItemTemplate>  
                        </asp:TemplateField>
                    </columns>  
                    <EditRowStyle BackColor="#2461BF" />  
                    <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />  
                    <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />  
                    <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />  
                    <RowStyle BackColor="#EFF3FB" />  
                    <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />  
                    <SortedAscendingCellStyle BackColor="#F5F7FB" />  
                    <SortedAscendingHeaderStyle BackColor="#6D95E1" />  
                    <SortedDescendingCellStyle BackColor="#E9EBEF" />  
                    <SortedDescendingHeaderStyle BackColor="#4870BE" />  
            </asp:GridView>
        </div>
    </form>
</body>
</html>
