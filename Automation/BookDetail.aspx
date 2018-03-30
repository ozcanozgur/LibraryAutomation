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

    <div>
        <form id="form1" runat="server">

            <asp:Image ID="imgBookImage" runat="server"  Width="250px"  />

            <asp:Label ID="lblBookName" runat="server" Text="Label"></asp:Label>

            <asp:Label ID="lblBookAuthor" runat="server" Text="Label"></asp:Label>
        </form>
    </div>

</body>
</html>
