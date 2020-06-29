<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Developer.aspx.cs" Inherits="Developer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Meet The Developers</title>
    <link href="css/DeveloperStyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body {
            font-size: 100%;
            background:url(images/background/rcBWkO.png);
                 /*url(../images/background/rcBWkO.png);*/
            background-size: cover;
         
            background-attachment: fixed;
            
        }

        .one {
            visibility: hidden;
        }
        h4{
            padding-top:1em;
        }
        p,h4,h3,h2{
           color:#ffffff;

        }
        @media (max-width:768px)
        { .display-4{
              font-size:x-large;
          }
         

        }

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <h4 class="display-4 text-center"><i class="fa fa-code"></i> <strong>The Developers </strong><i class="fa fa-code"></i></h4>
    <br />
    <br />  <br />
    <br />
    <section>
        <div class="container">
            <div class="row flex-center sm-no-flex">

                <div class="pull-right sm-no-float col-md-8">
                    <ul class="team-members">
                        <!-- single member row starts -->
                        <li class="clearfix">
                            <div class="member-details one">
                                <div class="one">
                                    <img src="" alt="UI Designer" class="one">
                                    <div class="member-info">
                                        <h3>1</h3>
                                        <p>UI Designer</p>
                                    </div>
                                </div>
                            </div>

                            <div class="member-details">
                                <div>
                                    <img src="images/developers/Raj.jpg" alt="Raj U. Patil">
                                    <div class="member-info">
                                        <h3>Raj U. Patil</h3>
                                        <p>Roll No: 11</p>
                                    </div>
                                </div>
                            </div>

                            <div class="member-details">
                                <div>
                                    <img src="images/developers/PicsArt_1451132000827 (2).jpg" alt="Nitin A. Dixit" >
                                    <div class="member-info">
                                        <h3>Nitin A. Dixit</h3>
                                        <p>Roll No: 37</p>
                                    </div>
                                </div>
                            </div>
                        </li>
                        <!-- /single member row ends -->

                        <!-- single member row starts -->
                        <li class="clearfix">
                            <div class="member-details">
                                <div>
                                    <img src="images/developers/PicsArt_03-11-11.08.32.jpg" alt="Nikhil R. Devakar">
                                    <div class="member-info">
                                        <h3>Nikhil R. Devkar</h3>
                                        <p>Roll No: 36</p>
                                    </div>
                                </div>
                            </div>

                            <div class="member-details">
                                <div>
                                    <img src="images/developers/Screenshot_2018-03-11-23-43-56-1-1-1.png" alt="Sachin R. Rokade">
                                    <div class="member-info">
                                        <h3>Sachin R. Rokade</h3>
                                        <p>Roll No: 31</p>
                                    </div>
                                </div>
                            </div>

                        

                        <!-- single member row starts -->
                        <li class="clearfix">
                   
                  

                            		<div class="member-details one">
							<div>
								<img src="" alt="UI Designer">
								<div class="member-info">
									<h3>9</h3>
									<p>UI Designer</p>
								</div>
							</div>
						</div>
                        </li>
                        <!-- /single member row ends -->

                    </ul>
                    <!-- /end team-photos -->
                </div>
                <!-- /end col-md-8 -->

                <div class="pull-left col-md-4 sm-text-center">
                    <div class="team-overview">
                        <h2>Who Are We?</h2>
                        <a href="#">Meet the Entire Team</a>
                        <p>
                            We are the Final Year Students of Computer Engineering in Government Polytechnic, Murtizapur.
                            This website is designed and built by us.<br />
                            Our Team :-<br />
                            1. Nitin A. Dixit<br />
                            2. Raj U. Patil<br />
                            3. Sachin R. Rokade<br />
                            4. Nikhil R. Devkar<br />
                        </p>
                    </div>
                </div>
                <!-- /end col-md-4 -->
            </div>
            <!-- /end row -->
        </div>
        <!-- /end container -->
    </section>

</asp:Content>

