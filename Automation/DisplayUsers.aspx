<%@ Page Language="C#" AutoEventWireup="true" CodeFile="DisplayUsers.aspx.cs" Inherits="DisplayUsers" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link href="images/boostrap/css/bootstrap.css" rel="stylesheet" />
    <link href="images/css/AdminPanel.css" rel="stylesheet" />
    <link href="images/css/DisplayUsers.css" rel="stylesheet" />
    <link href="images/boostrap/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
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
                                <a href="StudentLoginPage.aspx">
                                    <li>
                                        <span class="fa fa-sign-out">  </span>  Log Out Admin Panel
                                    </li>
                                </a>
                            </ul>
                              
                        </div>
                    </div>
                </div>


         
       
        <div class="gridBox"> 
                <asp:GridView ID="datagrid" runat="server" autogeneratecolumns="false" CssClass="mydatagrid" HeaderStyle-CssClass="headerGrid" AlternatingRowStyle-CssClass="alt" GridLines="None" RowStyle-CssClass="rows" CellPadding="15" >
                    <columns>
                        
                        <asp:boundfield datafield="Name"  headertext="NameSurname"></asp:boundfield>
                        <asp:boundfield datafield="MailAddress" headertext="Mail Address"> </asp:boundfield>
                        <asp:boundfield datafield="PhoneNumber" headertext="Phone Number"> </asp:boundfield>
                        <asp:boundfield datafield="tcNo" headertext="School ID">  </asp:boundfield>
                        
                        
                    </columns>
                </asp:GridView>
            </div>

    </div>
    </form>
</body>
</html>
