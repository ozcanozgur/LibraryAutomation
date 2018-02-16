<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AddBook.aspx.cs" Inherits="AddBook" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="images/boostrap/css/bootstrap.css" rel="stylesheet" />
    <link href="images/css/AdminPanel.css" rel="stylesheet" />
    <link href="images/css/AddBook.css" rel="stylesheet" />
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
                            <asp:TextBox ID="txtTitle"  runat="server" placeholder="Title"/>
                            <asp:RequiredFieldValidator  Display="Dynamic" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtTitle" runat="server" />

                            <asp:TextBox ID="txtGenre"  runat="server" placeholder="Genre" />
                            <asp:RequiredFieldValidator  Display="Dynamic" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtGenre" runat="server" />

                            <asp:TextBox ID="txtAuthor"  runat="server" placeholder="Author"/>
                            <asp:RequiredFieldValidator ErrorMessage="Required" Display="Dynamic" ForeColor="Red" ControlToValidate="txtAuthor" runat="server" />
                        
                            <asp:TextBox ID="txtPublisher"  runat="server" placeholder="Publisher"/>
                            <asp:RequiredFieldValidator  Display="Dynamic" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtPublisher" runat="server" />

                            
                            <asp:FileUpload ID="FileUpload1"  runat="server" BackColor="Transparent" ForeColor="Black" />
                           
                            <label class=" control-label" for="message">Book Summary</label>
                                        
                             <asp:TextBox class="form-control" name="message" ID="TextBox2" runat="server" TextMode="MultiLine"  placeholder="Please enter Book Summary here..." rows="5"></asp:TextBox>

                            <asp:Button type="submit" ID="Button1" runat="server" Text="Add User" class="btn btn-success btn-sm" OnClick="btnSubmit_Click" />
                        </form>
                    </div>
                </div>
            </div>
            
        </div><!-- Container Login-->

            </div>

    
</body>
</html>
