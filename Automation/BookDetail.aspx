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
                    <asp:Button  class="btn btn-outline-danger btnReserve" OnClick="btnReserve_OnClick" Height="28" Text="Reserve Books"  runat="server" /> 
                </div>
                
                
                
                <div class="SummarySide">
                    

                   <center><p>Summary</p></center>
                        
                    <asp:Label  ID="lblBookSummary" runat="server" Text="Label"></asp:Label>

                </div>  
                
                <div class="CommentSide">

                    
					
                </div>

                 <div class="commentBox">
		            <div class="status-upload">
						
                
				        <textarea class="commentArea" placeholder="What are you doing right now?" ></textarea>

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
            </ContentTemplate>
 
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="star1" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="star2" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="star3" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="star4" EventName="Click" />
                <asp:AsyncPostBackTrigger ControlID="star5" EventName="Click" />
            </Triggers>
        </asp:UpdatePanel>
                
                        

                        

				        <button type="submit" class="btn btn-success green"><i class="fa fa-share"></i> Share</button>
									
		            </div>
		        </div><!-- CommentBox -->				
            </div><!-- book detail -->
        </form>
    </div>

</body>
</html>
