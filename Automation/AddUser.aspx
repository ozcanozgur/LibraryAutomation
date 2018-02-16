<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddUser.aspx.cs" Inherits="AddUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="images/boostrap/css/bootstrap.css" rel="stylesheet" />
    <link href="images/css/AdminPanel.css" rel="stylesheet" />
    <link href="images/css/AddUser.css" rel="stylesheet" />
    <link href="images/boostrap/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    
    
    <title></title>
</head>
<body>
    
     <div class="container1"> 
         
         <div class="side-bar">
             <div class="nav-side-menu">
                 <div class="brand">

                     <a href="AdminPanelPage.aspx">
                         <img src="images/logo.png" />
                    </a>
                 </div>
                 <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>

                 <div class="menu-list">

                     <ul>
                             <a href="AddUser.aspx">   
                                <li>
                                    <span class="fa fa-user">  </span>Add User
                                </li>
                             </a>
                                <a href="DisplayUsers.aspx">
                                    <li>
                                        <span class="fa fa-users">  </span>Display Users
                                    </li>
                                 </a>
                                <a href="AddBook.aspx">
                                    <li>
                                        <span class="fa fa-plus">  </span>Add Book
                                    </li>
                                </a>
                                <a href="BorrowBooks.aspx">
                                    <li>
                                        <span class="fa fa-book">  </span>  Borrow Books
                                    </li>
                                </a>
                                 <a href="BorrowedBooks.aspx">
                                    <li>
                                        <span class="fa fa-adjust">  </span>  Display Borrowed Books
                                    </li>
                                </a>
                                <a href="ExpiredBooks.aspx">
                                    <li>
                                        <span class="fa fa-warning">  </span>  Display Expired Books
                                    </li>
                                </a>
                                <a href="DisplayContactMessages.aspx">
                                    <li>
                                        <span class="fa fa-adjust">  </span>  Display Contact Messages
                                    </li>
                                </a>
                         <a href="index.aspx">
                                    <li>
                                        <span class="fa fa-sign-out">  </span>  Log Out Admin Panel
                                    </li>
                                </a>
                            </ul>
                 </div>
             </div>
         </div>
        <div class="containerLogin">
            <div class="row">
                <div class="col-md-12">
                    <div class="wrap">
                        <p class="form-title">
                            Add User To The Library</p>
                        <form class="login" runat="server"> 
                            <asp:TextBox ID="txtName"  runat="server" placeholder="Name"/>
                            <asp:RequiredFieldValidator  Display="Dynamic" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtName" runat="server" />

                            <asp:TextBox ID="txtLastName"  runat="server" placeholder="Surname" />
                            <asp:RequiredFieldValidator  Display="Dynamic" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtLastName" runat="server" />

                            <asp:TextBox ID="txtMailAdress"  runat="server" placeholder="Mail Adress"/>
                            <asp:RequiredFieldValidator ErrorMessage="Required" Display="Dynamic" ForeColor="Red" ControlToValidate="txtMailAdress" runat="server" />
                            <asp:RegularExpressionValidator runat="server" Display="Dynamic" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                            ControlToValidate="txtMailAdress" ForeColor="Red" ErrorMessage="Invalid email address." />

                            <asp:TextBox ID="txtPhoneNumber"  runat="server" placeholder="Phone Number"/>
                            <asp:RequiredFieldValidator  Display="Dynamic" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtName" runat="server" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2"  Display="Dynamic"
                            runat="server" ErrorMessage="Enter valid Phone number" ForeColor="Red"
                            ControlToValidate="txtPhoneNumber" 
                            ValidationExpression= "^([0-9\(\)\/\+ \-]*)$"></asp:RegularExpressionValidator>

                            <asp:TextBox ID="txtTcNo" ValidationGroup="validate" runat="server" placeholder="School ID"/>
                            <asp:RequiredFieldValidator  Display="Dynamic" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtTcNo" runat="server" />
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator9" runat="server" display="Dynamic" ValidationGroup="validate" ForeColor="Red" ControlToValidate="txtTcNo" ValidationExpression="^[0-9]{10,10}$" ErrorMessage="School ID numarası sadece sayı ve 10 haneli olmalıdır.">
                                </asp:RegularExpressionValidator>
                            


                            <asp:Button type="submit" ID="Button1" runat="server" Text="Add User" class="btn btn-success btn-sm" OnClick="btnSubmit_Click" />
                        </form>
                    </div>
                </div>
            </div>
            
        </div><!-- Container Login-->

    </div><!-- Container -->
        
</body>
</html>
