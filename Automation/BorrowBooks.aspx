<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BorrowBooks.aspx.cs" Inherits="BorrowBooks" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="images/boostrap/css/bootstrap.css" rel="stylesheet" />
    <link href="images/css/AdminPanel.css" rel="stylesheet" />
    <link href="images/css/BorrowBooks.css" rel="stylesheet" />
    <script src="images/js/index.js"></script>
    <link href="images/boostrap/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <title></title>
</head>
<body>
    <form runat="server">
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

         <div class="borrowField">

             <asp:Image CssClass="Img" ID="Image1" runat="server" />

             

             <div class ="getBook">
                    <div class="wrap">
                        <p class="form-title">
                            Search Book By Title</p>
                        <div class="formLogin">
                            <asp:TextBox ID="txtTitle"  runat="server" placeholder="Title"/>
                            
                            
                            <asp:Button type="submit" ID="Button1" ValidationGroup="Group1" runat="server" Text="Search Book" class="btn btn-success btn-sm" OnClick="btnSubmit_Click" />
                            </div>
                    </div>
             </div>

             <div class="gridBox"> 
                <asp:GridView ID="datagrid" runat="server" autogeneratecolumns="false" autogenerateselectbutton="True" SelectedIndex="1" onselectedindexchanged="CustomersGridView_SelectedIndexChanged" CssClass="mydatagrid" HeaderStyle-CssClass="headerGrid" AlternatingRowStyle-CssClass="alt" GridLines="None" RowStyle-CssClass="rows" CellPadding="15" >
                    <columns>
                        
                        <asp:boundfield datafield="Title"  headertext="Book Stocks"></asp:boundfield>
                        <asp:boundfield datafield="bookImage" ItemStyle-CssClass="Visible" ></asp:boundfield>
                    </columns>
                </asp:GridView>
            </div>

             
             <div class="borrowBook">
                 <div class="wrap">
                        <p class="form-title">
                            Borrow Book</p>
                        <div class="formLogin">
                            <asp:TextBox ID="txtName"  runat="server" placeholder="Name"/>
                            <asp:RequiredFieldValidator ValidationGroup="Group2" Display="Dynamic" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtName" runat="server" />

                            <asp:TextBox ID="TxtID"  runat="server" placeholder="School ID"/>
                            <asp:RequiredFieldValidator ValidationGroup="Group2"  Display="Dynamic" ErrorMessage="Required" ForeColor="Red" ControlToValidate="TxtID" runat="server" />

                            <asp:TextBox ID="txtTitle2"  runat="server" placeholder="Book Title"/>
                            <asp:RequiredFieldValidator ValidationGroup="Group2"  Display="Dynamic" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtTitle2" runat="server" />

                            <asp:TextBox ID="txtDate"  runat="server" placeholder="Borrow Duration"/>
                          <!--<asp:RequiredFieldValidator ValidationGroup="Group2" Display="Dynamic" ErrorMessage="Required" ForeColor="Red" ControlToValidate="txtDate" runat="server" /> -->
                            
                           
                            <!--<asp:RegularExpressionValidator  runat="server" Display="Dynamic" ControlToValidate="txtDate"  ForeColor="Red" ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\/(0[1-9]|1[0-2])\/((19|20)\d\d))$"
    ErrorMessage="Invalid date format." ValidationGroup="Group2" />-->

                            <asp:Calendar ID="Calendar1" runat="server" style="display:none"  Format="dd/MM/yyyy" OnSelectionChanged="Calendar1_SelectionChanged"></asp:Calendar>

                            <asp:Button type="submit" ValidationGroup="Group2"  ID="Button2" runat="server" Text="Borrow Book" class="btn btn-success btn-sm" OnClick="btn2Submit_Click" />
                            </div>
             </div>
         

         </div>
            


        </div><!--container-->
    </div>
    </form>
</body>
</html>
