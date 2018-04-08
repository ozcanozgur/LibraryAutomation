<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BookDetail.aspx.cs" Inherits="BookDetail" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link href="images/css/BookDetail.css" rel="stylesheet" />
    <link href="images/css/Style.css" rel="stylesheet" />
    <link href="images/boostrap/css/bootstrap.css" rel="stylesheet" />
    <link href="images/boostrap/font-awesome-4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    
    <title></title>

   
</head>
<body>

    <div class="container1">
        <form id="form1" runat="server">

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

                <div class="navBar1">
                    <ul>
                    <li><asp:linkbutton runat="server" OnClick="HomeClick">Home</asp:linkbutton></li>
                    <li><asp:linkbutton runat="server" OnClick="ContactClick">Contact</asp:linkbutton></li>
                    <li><asp:linkbutton runat="server" OnClick="AboutUsClick">About Us</asp:linkbutton></li>
                    </ul>
                </div>
            </div>

            <div class="bookDetail">
              
                <div class ="titleField">
                 <asp:Label ID="lblBookName" runat="server" Text="Label"></asp:Label>
                </div>
                <div class="ImageSide"> 
                <asp:Image cssClass="Image" ID="imgBookImage" runat="server"/>
                </div>

              
                <div class="detailSide"> 
                    <div class="Author">
                    Author : <asp:Label ID="lblBookAuthor" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="Publisher">
                    Publisher : <asp:Label ID="lblBookPublisher" runat="server" Text="Label"></asp:Label>
                    </div>
                    <div class="Rate">
                        <span id="span1"  class="fa fa-star " runat="server">  </span>  
                        <span id="span2" class="fa fa-star " runat="server">  </span>  
                        <span id="span3" class="fa fa-star " runat="server">  </span>  
                        <span id="span4" class="fa fa-star " runat="server">  </span>  
                        <span id="span5" class="fa fa-star " runat="server">  </span>  
                        <asp:Label ID="lblBookRate" runat="server" Text="Label"></asp:Label>
                    </div>
                    <asp:Label  ID="labelStock" runat="server" Text='<%#  Eval("FirstName")   %>' >  </asp:Label>
                    <asp:Button ID="btnReserve" type="submit" ValidationGroup="Group1" class="btn btn-outline-danger btnReserve" OnClick="btnReserve_OnClick" Height="28" Text="Reserve Books"  runat="server" /> 
                </div>
                
                
                
                <div class="SummarySide"> 
                    

                   <center><p>Summary</p></center>
                        
                    <asp:Label  ID="lblBookSummary" runat="server" Text="Label"></asp:Label>

                </div>  
            </div>

            <div class="bookComment">
                
                <asp:DataList ItemStyle-CssClass="CommentListClass"  ID="dlComment" runat="server" >
                    <ItemTemplate>
                <div class="CommentSide">
                    <ul>
                                <li>
                                    <span class="fa fa-user fa-lg"> </span> <asp:Label  ID="Name" runat="server"  Text='<%#Eval("Name")%>'>  </asp:Label>
                                </li>
                                <li>
                                    <asp:Label  ID="Genre" runat="server"  Text='<%# Eval("comment") %>'> </asp:Label>
                                </li>
                                <li>
                                    <span class="fa fa-star <%# (Convert.ToInt32(Eval("rate")) >= 1) ? "checked" : ""  %> ">  </span>  <asp:Label  ID="Point" runat="server"  > </asp:Label>
                                     <span class="fa fa-star <%# (Convert.ToInt32(Eval("rate")) >= 2) ? "checked" : ""  %> ">  </span>  <asp:Label  ID="Label2" runat="server"  > </asp:Label>
                                     <span class="fa fa-star <%# (Convert.ToInt32(Eval("rate")) >= 3) ? "checked" : ""  %> ">  </span>  <asp:Label  ID="Label3" runat="server"  > </asp:Label>
                                     <span class="fa fa-star <%# (Convert.ToInt32(Eval("rate")) >= 4) ? "checked" : ""  %> ">  </span>  <asp:Label  ID="Label5" runat="server"  > </asp:Label>
                                     <span class="fa fa-star <%# (Convert.ToInt32(Eval("rate")) >= 5) ? "checked" : ""  %> ">  </span>  <asp:Label  ID="Label6" runat="server"  > </asp:Label>
                                    <asp:Label  ID="Label4" runat="server" Text='<%#  Convert.ToInt32(Eval("rate"))   %>' > </asp:Label>
                                </li>
                           </ul>
                </div>
            </ItemTemplate>
                </asp:DataList>

                 <div class="commentBox">
		            <div class="status-upload">
						
                        <asp:TextBox runat="server" ID="textBox" CssClass="commentArea"  placeholder="Write your comment here!" ></asp:TextBox>

                        <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>

        <asp:UpdatePanel ID="UpdatePanel1" runat="server">
            <ContentTemplate>
                  <div class="stars">
                            <label >  Give Rate : </label>
				            <asp:LinkButton OnClick="star1_OnClick" ID="star1" runat="server"> <span id="starOne"  class="fa fa-star set fa-2x" runat="server">  </span></asp:LinkButton> 
                            <asp:LinkButton OnClick="star2_OnClick" ID="star2" runat="server"> <span id="starTwo"  class="fa fa-star set fa-2x" runat="server">  </span></asp:LinkButton> 
                            <asp:LinkButton OnClick="star3_OnClick" ID="star3" runat="server"> <span id="starThree"  class="fa fa-star set fa-2x" runat="server">  </span></asp:LinkButton> 
                            <asp:LinkButton OnClick="star4_OnClick" ID="star4" runat="server"> <span id="starFour"  class="fa fa-star set fa-2x" runat="server">  </span></asp:LinkButton> 
                            <asp:LinkButton OnClick="star5_OnClick" ID="star5" runat="server"> <span id="starFive"  class="fa fa-star set fa-2x" runat="server">  </span></asp:LinkButton> 
                            <asp:Label ID="rate" runat="server"></asp:Label>
                        </div>
                
                <asp:Button id="btnComment" runat="server" onclick="btnComment_OnClick" type="submit" Text="Comment" class="btn btn-success green btnComment" />
                <asp:Image id="imgTik" CssClass="tik" ImageUrl="images/success.png" Visible="false" runat="server"/>
            </ContentTemplate>
 
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="star1" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="star2" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="star3" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="star4" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="star5" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="btnComment" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
                		
		            </div>
                     <div>
                    
                </div>
		        </div><!-- CommentBox -->	
             </div><!-- bookComment -->   
            
        </form>
    </div>

</body>
</html>
