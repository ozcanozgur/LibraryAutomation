<%@ Page Language="C#" AutoEventWireup="true" CodeFile="StudentLoginPage.aspx.cs" Inherits="StudentLoginPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   
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
                        Student Log In</p>
                    <form class="login" runat="server"> 
                        <asp:TextBox ID="txtSchoolID"  runat="server" placeholder="School ID"/>
                        <asp:RequiredFieldValidator  Display="Dynamic" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtSchoolID" runat="server" />

                        <asp:TextBox ID="txtPassword"  runat="server" TextMode="Password" placeholder="Password" />
                        <asp:RequiredFieldValidator  Display="Dynamic" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtPassword" runat="server" />

                        <asp:Button type="submit" ID="Button1" runat="server" Text="Sign In" class="btn btn-success btn-sm" OnClick="btnSubmit_Click" />
                        <asp:Button ID="adminPanelButton" ValidationGroup="Group2"  class="btn btn-outline-danger locateButton1" runat="server" Text="Click For Admin Panel"  UseSubmitBehavior="False" OnClick="adminPanelButton_Click" />
                        <asp:Button ID="registerButton"  class="btn btn-outline-danger locateButton2" runat="server" Text="Register"  UseSubmitBehavior="False" OnClick="registerButton_Click" />
                   
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
