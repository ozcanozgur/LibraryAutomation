<%@ Page Language="C#" AutoEventWireup="true" CodeFile="loginPage.aspx.cs" Inherits="loginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="images/css/Style.css" rel="stylesheet" />
    <link href="images/boostrap/css/bootstrap.css" rel="stylesheet" />
    <link href="images/css/loginPage.css" rel="stylesheet" />     
    <title></title>
</head>
<body>
    
    

    <div class="containerLogin">
    <div class="row">
        <div class="col-md-12">
            <div class="wrap">
                <p class="form-title">
                    Sign In</p>
                <form class="login" runat="server"> 
                    <asp:TextBox ID="txtUsername"  runat="server" placeholder="Username"/>
                    <asp:TextBox ID="txtPassword"  runat="server" TextMode="Password" placeholder="Password" />
                    <asp:Button type="submit" ID="Button1" runat="server" Text="Sign In" class="btn btn-success btn-sm" OnClick="btnSubmit_Click" />
                    
                </form>
            </div>
        </div>
    </div>
</div>

    
</body>
</html>
