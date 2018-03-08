<%@ Page Language="C#" AutoEventWireup="true" CodeFile="AboutUs.aspx.cs" Inherits="AboutUs" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta name="viewport" content="width=device-width, initial-scale=1"/>
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css"/>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  <link href="images/css/AboutUs.css" rel="stylesheet" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>About Us</title>
    	
</head>
<body>
    <form id="form1" runat="server">
        <div class ="containerAbout">
            <div class="header1"  runat="server" id="header1">
               
                <img id="logoId" runat="server" class="logo"  visible="true"  src ="images/logo.png" />
              

                <div class="navBar1">
                    <ul>
                    <li><asp:linkbutton runat="server" OnClick="HomeClick">Home</asp:linkbutton></li>
                    <li><asp:linkbutton runat="server" OnClick="ContactClick">Contact</asp:linkbutton></li>
                    <li><asp:linkbutton runat="server" OnClick="AboutUsClick">About Us</asp:linkbutton></li>
                    </ul>
                </div>
                </div>
                        <div id="myCarousel" class="carousel slide" data-ride="carousel" style="width:70%; margin-left:15%; margin-top:2%;">
                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                              <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
                              <li data-target="#myCarousel" data-slide-to="1"></li>
                              <li data-target="#myCarousel" data-slide-to="2"></li>
                            </ol>

                            <!-- Wrapper for slides -->
                            <div class="carousel-inner" >
                              <div class="item active">
                                <img  src="images/library1.jpg" style="height:300px;"/>
                              </div>

                              <div class="item">
                                <img  src="images/library2.jpg" style="height:300px; "/>
                              </div>
    
                              <div class="item">
                                <img  src="images/library3.jpg" style="height:300px;"/>
                              </div>
                            </div>

                            <!-- Left and right controls -->
                            <a class="left carousel-control"  href="#myCarousel" data-slide="prev">
                              <span class="glyphicon glyphicon-chevron-left"></span>
                              <span class="sr-only">Previous</span>
                            </a>
                            <a class="right carousel-control"  href="#myCarousel" data-slide="next">
                              <span class="glyphicon glyphicon-chevron-right"></span>
                              <span class="sr-only" >Next</span>
                            </a>
                          </div>
          <div class:"texts" style="width:60%; margin-left:20%">
                <h4><b>Our Vision</b></h4>

            We envision a world where enduring, abundant, equitable, and meaningful access to information serves to empower and inspire humanity.

                <h4><b>Mission</b></h4> 

            Our Libraries aspires to advance knowledge by providing a trusted foundation for the generation, dissemination, use, creative engagement with, and preservation of information, in support of our mission and so that it can be brought to bear on the world’s great challenges and in the cause of social justice.

                <h4><b>Our Values</b></h4>

            How we pursue our mission is as important as the mission itself, thus our organization supports the core values of both the profession of librarianship and our parent institution. Our values ground both our strategic decisions and our operational approach: we aim to do great things, and to find joy and meaning in our work.

            <h5>Our Libraries contribute to a better world …</h5>

            <h5>With Openness and Transparency</h5>

            <ul> <li>We foster lifelong learning and openness among our staff, our colleagues, and the communities we serve.</li></ul>
            <ul> <li>We act with integrity to buttress liberty and democracy by protecting intellectual freedom and the right to privacy.</li></ul>
            <ul> <li>We aim to conduct ourselves with transparency and authenticity in all aspects of our work and organization.</li></ul>
            <ul> <li>We aim to work with others to identify collaborative solutions to community-wide challenges.</li></ul>
            <ul> <li>We aspire to promote rigorous scholarship and many diverse ways of knowing and creating to advance human understanding and well being.</li></ul>
            <h5>Via Curiosity and Inquiry</h5>

            <ul> <li>We foster work that is creative, and that integrates mind, hand, and heart.</li></ul>
            <ul> <li>We welcome thoughtful risk taking and embrace both successes and failures as essential to learning.</li></ul>
            <ul> <li>We aim to solve hard problems and tackle grand challenges in our work and our profession.</li></ul>
            <ul> <li>We aspire to be a model for innovation and adaptation in research libraries and archives.</li></ul>
            
              <h5>By pursuing Social Justice and an Ethic of Care</h5>

            <ul> <li>We foster deep respect and understanding for human beings inside and outside our organization and the communities in which they live; we approach our work and one another from an ethic of care.</li></ul>
            <ul> <li>We aim to provide equitable service to all people, regardless of race, color, sex, sexual orientation, gender identity, religion, disability, age, genetic information, veteran status, or national or ethnic origin.</li></ul>
            <ul> <li>We place special emphasis on services that are welcoming and inclusive of members of groups who are currently and/or have historically been marginalized or denied full participation in society.</li></ul>
            <ul> <li>We strive to promote many voices, and to reflect diversity of both knowledge itself and ways of knowing in our collections, and in our approach to information management and organization.</li></ul>
            <ul> <li>We aspire to leverage the work, values, and resources of libraries and archives as forces for social justice in our communities.</li></ul>
         </div>
    </div>          
    </form>
</body>
</html>
