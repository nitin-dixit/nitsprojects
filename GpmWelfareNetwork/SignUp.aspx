<%@ Page Language="C#" AutoEventWireup="true" CodeFile="SignUp.aspx.cs" Inherits="SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    <title>Sign Up</title>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Welcome to Government Polytechnic, Murtizapur!">
    <meta name="author" content="Nitin Dixit, Raj Patil, Sachin Rokade, Nikhil Devkar">
    <meta name="url" content="http://www.yourdomainname.com">

    <meta name="copyright" content="GPMZR">
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/MyStyle.css" rel="stylesheet" />
      <link href="css/offcanvas.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />   
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

    <style type="text/css">
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

        body {
	 
	font-size: 100%;
	background: url(images/bg.jpg);
	background-size: cover;
	
	background-attachment: fixed;
   
}
    </style>
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
                        <li class="nav-item" style="border-right: 1px solid #808080">
                            <a class="nav-link" href="LogIn.aspx" id="SignIn" aria-haspopup="true" aria-expanded="false">Sign In
                            </a>
                        </li>
                        <li class="nav-item active">
                            <a class="nav-link" href="SignUp.aspx" id="SignUp" aria-haspopup="true" aria-expanded="false">Sign Up
                            </a>
                        </li>
                    </ul>
                </div>


            </header>
            <!--------------------------------------------------navbar header end-------------------------------------------------------->



            <!----------------------------------------------------Signup form start------------------------------------------------------------>
            <div class="container text-light">
                <div class="center-page">


                    <div class="regform">
                        <h1 class="display-4 text-center">Sign Up</h1>
                        <br />
                        <br />
                        <br />
                        <br />
                        <div class="form-row container">

                            <label class="col-sm-2 col-form-label">First name:</label>


                            <div class="form-group col-md-7 mr-auto">
                                <asp:TextBox ID="tbfirstname" runat="server" CssClass="form-control" placeholder="First Name"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-row container">
                            <label class="col-sm-2 col-form-label">Last name:</label>
                            <div class="form-group col-md-7 mr-auto">
                                <asp:TextBox ID="tblastname" runat="server" CssClass="form-control" placeholder="Last Name"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-row container">
                            <label class="col-sm-2 col-form-label">Gender:</label>
                            <div class="form-group col mr-auto">
                                <asp:RadioButtonList ID="rbtnGenderList" runat="server" RepeatDirection="Horizontal" CellPadding="5" CellSpacing="5">
                                    <asp:ListItem>Male</asp:ListItem>
                                    <asp:ListItem>Female</asp:ListItem>
                                    <asp:ListItem>Other</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>
                        <div class="form-row container">
                            <label class="col-sm-2 col-form-label">Username :</label>
                            <div class="form-group col-md-7 mr-auto">
                                <asp:TextBox ID="tbUsername" runat="server" CssClass="form-control" placeholder="Username" TextMode="SingleLine" onchange="UsernameChecking()"></asp:TextBox>
                            </div>

                            <asp:Label ID="lblCheckUname" runat="server" class="col col-form-label"></asp:Label>
                        </div>

                        <div class="form-row container">
                            <label class="col-sm-2 col-form-label">E-mail :</label>
                            <div class="form-group col-md-7 mr-auto">
                                <asp:TextBox ID="tbEmail" runat="server" CssClass="form-control" placeholder="E-mail" TextMode="Email" onchange="EmailChecking()"></asp:TextBox>
                                <small id="emailHelp" class="form-text text-light">Enter your active Email. This will be used in case you Forgot Password. We won't share your Email with anyone.</small>
                            </div>

                            <asp:Label ID="lblCheckEmail" runat="server" class="col col-form-label"></asp:Label>
                        </div>

                        <div class="form-row container">
                            <label class="col-sm-2 col-form-label">Mobile Number :</label>
                            <div class="form-group col-md-7 mr-auto">
                                <asp:TextBox ID="tbMobileNumber" runat="server" CssClass="form-control" placeholder="Mobile Number" TextMode="Phone" MaxLength="10"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-row container">
                            <label class="col-sm-2 col-form-label">Enrollment No. :</label>
                            <div class="form-group col-md-7 mr-auto">
                                <asp:TextBox ID="tbEnrollmentNo" runat="server" CssClass="form-control" placeholder="Enrollment No." TextMode="SingleLine" MaxLength="10"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-row container">
                            <label class="col-sm-2 col-form-label">Branch :</label>
                            <div class="form-group col-md-7 mr-auto">
                                <asp:RadioButtonList ID="rbtnBranchList" runat="server" RepeatDirection="Vertical" CellPadding="5" CellSpacing="5">
                                    <asp:ListItem>Computer Engineering</asp:ListItem>
                                    <asp:ListItem>Mechanical Engineering</asp:ListItem>
                                    <asp:ListItem>Electrical Engineering</asp:ListItem>
                                    <asp:ListItem>Information Technology</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>

                        <div class="form-row container">
                            <label class="col-sm-2 col-form-label">Current Year :</label>
                            <div class="form-group col mr-auto">
                                <asp:RadioButtonList ID="rbtnYearList" runat="server" AutoPostBack="true" RepeatDirection="Horizontal" CellPadding="10" CellSpacing="5" OnSelectedIndexChanged="rbtnYearList_SelectedIndexChanged">
                                    <asp:ListItem>First Year</asp:ListItem>
                                    <asp:ListItem>Second Year</asp:ListItem>
                                    <asp:ListItem>Third Year</asp:ListItem>
                                </asp:RadioButtonList>
                            </div>
                        </div>

                        <div class="form-row container">
                            <label class="col-sm-2 col-form-label">Current Semester :</label>
                            <div class="form-group col-md-7 mr-auto">
                                <asp:DropDownList ID="semesterDdl" runat="server" CssClass="custom-select form-control">
                                </asp:DropDownList>

                            </div>
                        </div>

                        <div class="form-row container">
                            <label class="col-sm-2 col-form-label">Upload a profile pic :</label>
                            <div class="form-group col-md-7 mr-auto">
                                <asp:FileUpload ID="picupload" runat="server" />
                            </div>
                        </div>

                        <div class="form-row container">
                            <asp:Label ID="picuploadlbl" runat="server" class="col-sm-2 col-form-label"></asp:Label>
                        </div>

                        <div class="form-row container">
                            <label class="col-sm-2 col-form-label">Password :</label>
                            <div class="form-group col-md-7 mr-auto">
                                <asp:TextBox ID="tbPassword" runat="server" CssClass="form-control" placeholder="Password" TextMode="Password"></asp:TextBox>
                                <small id="passHelp" class="form-text text-light">Password must be greater than or equal to 4 characters</small>
                            </div>
                        </div>

                        <div class="form-row container">
                            <label class="col-sm-2 col-form-label">Confirm Password :</label>
                            <div class="form-group col-md-7 mr-auto">
                                <asp:TextBox ID="tbConfirmPassword" runat="server" CssClass="form-control" placeholder="Confirm Password" TextMode="Password"></asp:TextBox>
                            </div>
                        </div>

                        <div class="form-row container ">
                            <div class="form-group col-md-9">
                                <asp:Button ID="btnsignup" runat="server" Text="Sign Up" CssClass="btn btn-outline-success btn-block text-center" OnClick="btnsignup_Click" />
                            </div>
                            <br />



                        </div>
                        <asp:Label ID="signuplbl" runat="server" CssClass="text-center container"></asp:Label>
                    </div>
                </div>

            </div>
            <!----------------------------------------------------Signup form end------------------------------------------------------------>



            <!----------------------------------------------------- FOOTER start---------------------------------------------------------->


            <div class="container">
                <hr class="container" />
                <footer class="container">
                    <p class="float-right"><a href="#">Back to top <i class="fa fa-hand-o-up " aria-hidden="true"></i></a></p>
                    <p class="text-light">&copy; <asp:Label ID="lblYear" runat="server" Text="Label"></asp:Label> GPMZR, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a></p>
                </footer>
            </div>
            <!----------------------------------------------------- FOOTER end---------------------------------------------------------->

        </div>
    </form>
    <script src="Scripts/jquery-1.7.1.min.js"></script>

    <script type="text/javascript">
        function UsernameChecking() { //This function call on text change.    
            $.ajax({
                type: "POST",
                url: "SignUp.aspx/CheckUsername", // this for calling the web method function in cs code.
                data: '{user: "' + $("#<%=tbUsername.ClientID%>")[0].value + '" }',// user name or email value
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess1,
                failure: function (response) {
                    alert(response);
                }
                });
        }

        //$("#tbUsername").keyup(function () 
        //{  var userName = $(this).val();})
        // function OnSuccess
        function OnSuccess1(response) {
            var msg1 = $("#<%=lblCheckUname.ClientID%>")[0];
            switch (response.d) {
                case "true":
                    msg1.style.display = "block";
                    msg1.style.color = "red";
                    msg1.innerHTML = "Username already exists. 👎";
                    break;
                case "false":
                    msg1.style.display = "block";
                    msg1.style.color = "lightgreen";
                    msg1.innerHTML = "Username available 👍";
                    break;
            }
        }


        function EmailChecking() { //This function call on text change.    
            $.ajax({
                type: "POST",
                url: "SignUp.aspx/CheckEmail", // this for calling the web method function in cs code.
                data: '{email: "' + $("#<%=tbEmail.ClientID%>")[0].value + '" }',//  email value
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: OnSuccess2,
                failure: function (response) {
                    alert(response);
                }
                });
        }


        function OnSuccess2(response) {
            var msg2 = $("#<%=lblCheckEmail.ClientID%>")[0];
              switch (response.d) {
                  case "true":
                      msg2.style.display = "block";
                      msg2.style.color = "red";
                      msg2.innerHTML = "✖ Email already registered! Forgot Password?";
                      break;
                  case "false":
                      msg2.style.display = "block";
                      msg2.style.color = "lightgreen";
                      msg2.innerHTML = "email available 👍";
                      break;
              }
          }

    </script>
     <!--------------------------------------------------Neccesary javascript reference------------------------------------------------------->
  <%-- <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>--%>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="js/offcanvas.js"></script>
</body>
</html>
