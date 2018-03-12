<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="index"  EnableEventValidation="false"%>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    <link href="images/boostrap/css/bootstrap.css" rel="stylesheet" />
    <link href="images/css/Style.css" rel="stylesheet" />
    <link href="images/boostrap/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    <title></title>
    
</head>
<body>
    <form id="form1" runat="server">
        <div class ="containerIndex">
            <div class="header1"  runat="server" id="header1">

                <!--<asp:Button ID="adminPanelButton"  class="btn btn-outline-danger locateButton1" runat="server" Text="Click For Admin Panel"  UseSubmitBehavior="False" OnClick="adminPanelButton_Click" />-->
                <img id="logoId" runat="server" class="logo"  visible="true"  src ="images/logo.png" />
              
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

                <div class="navBar1">
                    <ul>
                    <li><asp:linkbutton runat="server" OnClick="HomeClick">Home</asp:linkbutton></li>
                    <li><asp:linkbutton runat="server" OnClick="ContactClick">Contact</asp:linkbutton></li>
                    <li><asp:linkbutton runat="server" OnClick="AboutUsClick">About Us</asp:linkbutton></li>
                    </ul>
                </div>
                  
            </div>

            <div class="filter">

                
                <asp:TextBox ID="TextBox2" OnTextChanged="TextBox2_TextChanged"  runat="server"></asp:TextBox>

                <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem>Filter By Genre</asp:ListItem>
                    <asp:ListItem>History</asp:ListItem>
                    <asp:ListItem>Romance</asp:ListItem>
                    <asp:ListItem>Poetry</asp:ListItem>
                    <asp:ListItem>Science</asp:ListItem>
                    <asp:ListItem>Fiction</asp:ListItem>
                    <asp:ListItem>Diet & Health</asp:ListItem>
                    <asp:ListItem>Kids</asp:ListItem>
                    <asp:ListItem>Thriller</asp:ListItem>
                    <asp:ListItem>Comics</asp:ListItem>
                    <asp:ListItem>Biography</asp:ListItem>
                    <asp:ListItem>Sport</asp:ListItem>
                    <asp:ListItem>Travel</asp:ListItem>
                </asp:DropDownList>


                <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
                    <asp:ListItem>Sort</asp:ListItem>
                    <asp:ListItem>A-Z</asp:ListItem>
                    <asp:ListItem>Z-A</asp:ListItem>
                </asp:DropDownList>


            </div>

            <div class="BookViewer">
                
                <asp:DataList ItemStyle-CssClass="DataListClass" ID="dlCourses" runat="server" onitemcommand="DataListCommand">
                    <ItemTemplate>
               
                        
                            <div  class="booksTable"> 
                                
                                <asp:Image class="imgBooks"  
                                ImageUrl='<%#"images/Books Images/"+ Eval("BookImage") %>'  runat="server" />
                                    
                                 <asp:Button CommandArgument='<%#Eval("BookID")%>' class="btn btn-outline-danger btnDetail" Height="28"
                                         Text="Book Details"  runat="server" /> 
                            <ul>
                                <li>
                                    Title : <asp:Label  ID="Title" runat="server"  Text='<%#Eval("Title") %>'>  </asp:Label>
                                </li>
                                <li>
                                    Genre : <asp:Label  ID="Genre" runat="server"  Text='<%# Eval("Genre") %>'></asp:Label>
                                </li>
                                <li>
                                    Author : <asp:Label  ID="Author" runat="server"  Text='<%# Eval("Author") %>'> </asp:Label>
                                </li>
                                <li>
                                    <span class="fa fa-star <%# (Convert.ToInt32(Eval("BookRate")) >= 1) ? "checked" : ""  %> ">  </span>  <asp:Label  ID="Point" runat="server"  > </asp:Label>
                                     <span class="fa fa-star <%# (Convert.ToInt32(Eval("BookRate")) >= 2) ? "checked" : ""  %> ">  </span>  <asp:Label  ID="Label2" runat="server"  > </asp:Label>
                                     <span class="fa fa-star <%# (Convert.ToInt32(Eval("BookRate")) >= 3) ? "checked" : ""  %> ">  </span>  <asp:Label  ID="Label3" runat="server"  > </asp:Label>
                                     <span class="fa fa-star <%# (Convert.ToInt32(Eval("BookRate")) >= 4) ? "checked" : ""  %> ">  </span>  <asp:Label  ID="Label5" runat="server"  > </asp:Label>
                                     <span class="fa fa-star <%# (Convert.ToInt32(Eval("BookRate")) >= 5) ? "checked" : ""  %> ">  </span>  <asp:Label  ID="Label6" runat="server"  > </asp:Label>
                                    <asp:Label  ID="Label4" runat="server" Text='<%#  Convert.ToInt32(Eval("BookRate"))   %>' > </asp:Label>
                                </li>
                           </ul>
                                   
                        </div> 
                            
                    </ItemTemplate>
                </asp:DataList>

                
            </div>

            
			<div class="RightPanel"  id="DetailPanel" runat="server" visible="false">
                    
                <ul>
                    <li>
                        <asp:Image ID="imgBookImage" runat="server"  Width="250px"  />
                    </li>
                    <li>    
                        <asp:Label ID="lblTitle" runat="server" Text="Label"></asp:Label>
                    </li>                  
                    <li>
                        <asp:Label ID="lblAuthor" runat="server" Text="Label"></asp:Label>
                    </li>
                </ul>    
                    <div class="lblSummaryCss">
                    <asp:Label ID="lblSummary"  runat="server" Text="Label"></asp:Label>
                    </div>

			</div>
				               

            

        </div>
    </form>
</body>
</html>
