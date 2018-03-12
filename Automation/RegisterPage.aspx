<%@ Page Language="C#" AutoEventWireup="true" CodeFile="RegisterPage.aspx.cs" Inherits="RegisterPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link href="images/boostrap/css/bootstrap.css" rel="stylesheet" />
    <link href="images/css/loginPage.css" rel="stylesheet" /> 
    <title></title>
</head>
<body>
    <div class="containerLogin">
        <div class="row ">
            <div class="col-md-12">
                <div class="wrap registerLocate">
                    <p class="form-title">
                        Register</p>
                    <form class="login " runat="server"> 
                        
                        <asp:TextBox ID="txtName"  runat="server" placeholder="Name"/>
                        <asp:RequiredFieldValidator  Display="Dynamic" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtName" runat="server" />

                        <asp:TextBox ID="txtLastName"  runat="server" placeholder="Surname" />
                        <asp:RequiredFieldValidator  Display="Dynamic" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtLastName" runat="server" />

                        <asp:TextBox ID="txtPassword"  runat="server" TextMode="Password" placeholder="Password" />
                        <asp:RequiredFieldValidator  Display="Dynamic" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtPassword" runat="server" />

                        <asp:TextBox ID="txtMailAdress"  runat="server" placeholder="Mail Adress"/>
                        <asp:RequiredFieldValidator ErrorMessage="Required" Display="Dynamic" ForeColor="Red" ControlToValidate="txtMailAdress" runat="server" />
                        <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ControlToValidate="txtMailAdress" ForeColor="Red" ErrorMessage="Invalid email address." />

                        <asp:TextBox ID="txtPhoneNumber"  runat="server" placeholder="Phone Number"/>
                        <asp:RequiredFieldValidator  Display="Dynamic" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtPhoneNumber" runat="server" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2"  Display="Dynamic"
                        runat="server" ErrorMessage="Enter valid Phone number" ForeColor="Red"
                        ControlToValidate="txtPhoneNumber" 
                        ValidationExpression= "^([0-9\(\)\/\+ \-]*)$"></asp:RegularExpressionValidator>

                        <asp:TextBox ID="SchoolID"  runat="server" placeholder="School ID"/>
                        <asp:RequiredFieldValidator  Display="Dynamic" ErrorMessage="Required" ForeColor="Red" ControlToValidate="SchoolID" runat="server" />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" display="Dynamic"  ForeColor="Red" ControlToValidate="SchoolID" ValidationExpression="^[0-9]{10,10}$" ErrorMessage="School ID numarası sadece sayı ve 10 haneli olmalıdır.">
                        </asp:RegularExpressionValidator>
                            

                        <asp:Button type="submit" ID="Button1" runat="server" Text="Sign In" class="btn btn-success btn-sm" OnClick="btnSubmit_Click" />
                        <asp:Button ID="logInPageButton" ValidationGroup="Group1" class="btn btn-outline-danger locateButton1 logInPageButton" runat="server" Text="Click For Login Page"  UseSubmitBehavior="False" OnClick="LoginPageButton_Click" />
                        
                    </form>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
