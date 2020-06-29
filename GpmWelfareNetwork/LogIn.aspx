<%@ Page Language="C#" AutoEventWireup="true" CodeFile="LogIn.aspx.cs" Inherits="LogIn" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Sign In</title>

    <!-- Meta Tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Welcome to Government Polytechnic, Murtizapur!">
    <meta name="author" content="Nitin Dixit, Raj Patil, Sachin Rokade, Nikhil Devkar">
    <meta name="url" content="http://www.yourdomainname.com">
    <meta name="copyright" content="GPMZR">
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
     function hideURLbar(){ window.scrollTo(0,1); } </script>
    <style type="text/css">
        .navbar-brand {
    color: #fed136;
    font-family: 'Kaushan Script', 'Helvetica Neue', Helvetica, Arial, cursive; }
   .navbar-brand.active, .navbar-brand:active, .navbar-brand:focus, .navbar-brand:hover {
      color: #fec503; }
        .dropdown:hover > .dropdown-menu {
            display: block;
        }
        @media(max-width:768px) {
            #site-logo {
                width: 40px;
                height: 40px;
            }

            #site-name {
                font-size: medium;
            }

            .navbar {
                min-height: 10px;
            }

        }

        #navbarheader {
            border-bottom: 3px solid #0094ff;
            opacity: 0.9;
            background: url(../images/background/wz-background.gif) no-repeat;
            background-size: initial;
        }
    </style>
       <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

    <!-- //Meta Tags -->
    <!-- Font-Awesome-CSS -->
    <link href="css/font-awesome.css" rel="stylesheet">
    <!--// Font-Awesome-CSS -->
    <!-- Required Css -->
    <link href="css/loginstyle.css" rel='stylesheet' type='text/css' />
     <link href="css/offcanvas.css" rel="stylesheet" />
    <!--// Required Css -->
    <!--fonts-->
    <link href="//fonts.googleapis.com/css?family=Montserrat:300,400,500,600" rel="stylesheet">
    <!--//fonts-->
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <!-- Favicon -->
    <link rel="shortcut icon" href="images/site-logo/site-logo.png">
    <link rel="apple-touch-icon" sizes="144x144" type="image/x-icon" href="">
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <!--------------------------------------------------navbar header start-------------------------------------------------------->
         
             <header class="navbar navbar-expand-md navbar-dark fixed-top bg-dark " id="navbarheader">

                <a class="navbar-brand mr-0 mr-md-2 " href="LandingPage.aspx" aria-label="BrandName">
                    <img src="images/site-logo/site-logo.png" height="70" width="70" id="site-logo" />
                    GPM Welfare Network</a>
                <button class="navbar-toggler  p-0 border-0" type="button" data-toggle="offcanvas" data-target="#mynavbar" aria-controls="mynavbar" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon active"></span>
                </button>

                <div class="navbar-collapse offcanvas-collapse" id="mynavbar">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item">
                            <a class="nav-link" href="LandingPage.aspx"><i class="fa fa-home fa-fw" aria-hidden="true"></i>Home<span class="sr-only">home</span></a>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-item nav-link dropdown-toggle mr-md-2" href="#" id="AboutDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">About
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="AboutDropdown">
                                <a class="dropdown-item" href="AboutUs.aspx">About Us</a>
                                <a class="dropdown-item" href="PrincipalProfile.aspx">Principal’s Profile</a>
                                <a class="dropdown-item" href="Developer.aspx">The Developers</a>
                            </div>
                        </li>
                        <li class="nav-item dropdown">
                            <a class="nav-item nav-link dropdown-toggle mr-md-2" href="#" id="DepartmentDropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Departments
                            </a>
                            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="DepartmentDropdown">
                                <a class="dropdown-item" href="Comp.aspx">Computer Engineering</a>
                                <a class="dropdown-item" href="InformationTechnology.aspx">Information Technology</a>
                                <a class="dropdown-item" href="MechEng.aspx">Mechanical Engineering</a>
                                <a class="dropdown-item" href="ElecEng.aspx">Electrical Engineering</a>
                                <a class="dropdown-item" href="SciHumanities.aspx">Science &#038; Humanities</a>
                            </div>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="NoticeBoard.aspx">Notice</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="Tender.aspx">Tenders</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="RTIOfficers.aspx">RTI</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="ContactUs.aspx">Contact Us</a>
                           
                        </li>

                    </ul>

                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item active" style="border-right: 1px solid #808080">
                            <a class="nav-link" href="LogIn.aspx" id="SignIn" aria-haspopup="true" aria-expanded="false">Sign In
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="SignUp.aspx" id="SignUp" aria-haspopup="true" aria-expanded="false">Sign Up
                            </a>
                        </li>
                    </ul>
                </div>


            </header>
            <!--------------------------------------------------navbar header end-------------------------------------------------------->

           <%-- <!-------------------------------- modal---------------------------->
            <div id="myModal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModal" aria-hidden="true">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <h5 class="modal-title text-danger" id="myModalLable">Account not activated.</h5>
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                        <div class="modal-body">
                            <p>
                                Please activate your <strong>Account</strong> first !<br />
                                Account activation link has been sent to your Email.
                            </p>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>

                        </div>
                    </div>
                </div>
            </div>

            <!-------------------------------- modal end---------------------------->--%>

            <!-- Main-Content -->
            <div class="main-w3layouts-form">
                <h2>Sign In to your account</h2>
              
                <div class="fields-w3-agileits">
                    <span class="fa fa-user-circle " aria-hidden="true"></span>
                    <asp:TextBox ID="tbemail" type="text" name="mail" runat="server" placeholder="Email" required=""></asp:TextBox>

                </div>
                <asp:RequiredFieldValidator ID="EmailRequiredFieldValidator" runat="server" ErrorMessage="Email Field is required!" ControlToValidate="tbemail" CssClass="text-danger"></asp:RequiredFieldValidator>
                <div class="fields-w3-agileits">
                    <span class="fa fa-key" aria-hidden="true"></span>
                    <asp:TextBox ID="tbpassword" runat="server" type="password" name="Password" required="" placeholder="Password" TextMode="Password"></asp:TextBox>

                </div>
                <asp:RequiredFieldValidator ID="PasswordRequiredFieldValidator" runat="server" ErrorMessage="Password Field is required!" ControlToValidate="tbpassword" CssClass="text-danger"> </asp:RequiredFieldValidator>
                <div class="remember-section-wthree">
                    <ul>
                        <li>
                            <label class="anim">
                                <asp:CheckBox ID="cbxRememberMe" runat="server" Text="Remember me ?" type="checkbox" class="checkbox" />


                            </label>
                        </li>
                        <li>
                            <asp:LinkButton ID="lbtnForgotPassword" runat="server" OnClick="lbtnForgotPassword_Click">Forgot Password ?</asp:LinkButton>
                    </ul>
                    <asp:Label ID="lblSigninError" runat="server" CssClass="text-danger"></asp:Label>
                    <div class="clear"></div>
                </div>
                <asp:Button ID="Button2" runat="server" Text="Log In" class="btn btn-outline-primary btn-block" OnClick="Button2_Click" />


              
                <!-- Social icons -->
                <%--<div class="footer_grid-w3ls">
			<h5 class="sub-hdg-w3l">or login with your social profile</h5>
			<ul class="social-icons-agileits-w3layouts">
				<li><a href="#" class="fa fa-facebook"></a></li>
				<li><a href="#" class="fa fa-twitter"></a></li>
				<li><a href="#" class="fa fa-google-plus"></a></li>
			</ul>
		</div>--%>
                <!--// Social icons -->
            </div>
            <!--// Main-Content-->
            <!-- copyright -->
            <footer class="">
            <div class="copyright-w3-agile container">
                <p class="float-right"><a href="#">Back to top <i class="fa fa-hand-o-up " aria-hidden="true"></i></a></p>
                <p>&copy; <asp:Label ID="lblYear" runat="server" Text="Label"></asp:Label> GPMZR, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>

            </div>
                </footer>
            <!--// copyright -->
            <!--//background-->




        </div>
    </form>
    <!--------------------------------------------------Neccesary javascript reference------------------------------------------------------->
   <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="js/offcanvas.js"></script>
</body>
</html>
