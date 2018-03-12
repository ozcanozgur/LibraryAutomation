<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BookDetail.aspx.cs" Inherits="BookDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="images/css/BookDetail.css" rel="stylesheet" />
    <link href="images/boostrap/css/bootstrap.css" rel="stylesheet" />
    <link href="images/boostrap/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div class="containerBookDetail">
            <div class="header1"  runat="server" id="header1">
                <div class="logOut">
                    <asp:DataList ItemStyle-CssClass="UserDataList" ID="DataList1" runat="server" >
                            <ItemTemplate>
                                <span class="fa fa-user" style="color:black">  </span> 
                                <asp:Label style="color:black" ID="Label4" runat="server" Text='<%#  Eval("FirstName")   %>' > </asp:Label>
                                <asp:Label style="color:black" ID="Label1" runat="server" Text='<%#  Eval("LastName")   %>' > </asp:Label>
                            </ItemTemplate>
                    </asp:DataList>
                    <a href="StudentLoginPage.aspx">
                        <span class="fa fa-sign-out">  </span>  Log Out 
                    </a>   
                </div>  
            </div>

           
        </div>
    </form>
</body>
</html>
