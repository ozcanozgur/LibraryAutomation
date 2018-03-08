<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Contact.aspx.cs" Inherits="Contact" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    
    
    <link href="images/css/ContactStyle.css" rel="stylesheet" />
    <link href="images/boostrap/css/bootstrap.min.css" rel="stylesheet" />
    
    <title>Contact</title>
</head>
<body>
        <form class="form-horizontal" runat="server">
        <div class="ContainerContact">

            
                        <div class="navBar2">
                            <ul>
                                <li><asp:linkbutton runat="server" OnClick="HomeClick">Home</asp:linkbutton></li>
                                <li><asp:linkbutton runat="server" OnClick="ContactClick">Contact</asp:linkbutton></li>
                                <li><asp:linkbutton runat="server" OnClick="AboutUsClick">About Us</asp:linkbutton></li>
                            </ul>
                        </div>
            
                       <div class="contactPage">
                                                <div class="form1">
	                                                    <div class="row">
                                                          <div class="col-6">
                                                            <div class="well well-sm">
                                                              
                                                              <fieldset>
                                                                <legend class="text-center">Contact us</legend>
    
                                                                <!-- Name input-->
                                                                <div class="form-group">
                                                                  <label class="col-md-3 control-label" for="name">Name</label>
                                                                  <div class="col-md-9">
                                                                      <asp:TextBox ID="txtName"  runat="server" placeholder="Your Name" class="form-control"/>
                                            
                                                                  </div>
                                                                </div>
    
                                                                <!-- Email input-->
                                                                <div class="form-group">
                                                                  <label class="col-md-3 control-label" for="email">E-mail</label>
                                                                  <div class="col-md-9">
                                                                      <asp:TextBox ID="txtEmail"  runat="server" placeholder="Your E-mail" class="form-control"/>
                                                                  </div>
                                                                </div>
    
                                                                <!-- Message body -->
                                                                <div class="form-group">
                                                                  <label class="col-md-3 control-label" for="message">Message</label>
                                                                    <div class="col-md-9">
                                                                        <asp:TextBox class="form-control" name="message" ID="TextBox2" runat="server" TextMode="MultiLine"  placeholder="Please Enter Your Message Here..." rows="5"></asp:TextBox>
                                                            
                                                                  </div>
                                                                </div>
    
                                                                <!-- Form actions -->
                                                                <div class="form-group">
                                                                  <div class="col-md-12 text-right">
                                                                    <asp:Button ID="adminPanelButton" type="submit"  class="btn btn-success" runat="server" Text="Submit" OnClick="SubmitButton_Click" />
                                                                  </div>
                                                                </div>
                                                              </fieldset>
                                                             
                                                            </div>
                                                          </div>
                                                           
	                                                </div>
                                                 </div>
                                 <div class="col-4">
                                    <div class="rightSide">
                                        
                                        <p class="title">Phone</p>
                                        <p class="info"> (0212) 498 41 41 </p>
                                        <br />
                                        <p class="title">E-Mail</p>
                                        <p class="info">1401020055@iku.stu.edu.tr  1401020024@iku.stu.edu.tr </p>
                                        <br />
                                        <p class="title">Fax</p>
                                        <p class="info">(0212) 498 43 06 </p>
                                        <br />
                                     
                                    </div>
                                     <div class="map">
                                            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3011.5504367492845!2d28.829991950264937!3d40.991324028316626!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x14caa35ee1fdc1b1%3A0x658a212e6b4359b5!2zVC5DLiDEsHN0YW5idWwgS8O8bHTDvHIgw5xuaXZlcnNpdGVzaQ!5e0!3m2!1str!2str!4v1511533332944" frameborder="0" style="border:0; width:350px; height:250px;  float:right; margin-right:10px; margin-top:40px;" allowfullscreen></iframe>
                                     </div>
                                </div>
                         </div>
        </div>
       
    </form>
</body>
</html>
