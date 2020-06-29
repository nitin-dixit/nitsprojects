<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditUserProfile.aspx.cs" Inherits="EditUserProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <title>Welcome!</title>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="Welcome to Government Polytechnic, Murtizapur!">
    <meta name="author" content="Nitin Dixit, Raj Patil, Sachin Rokade, Nikhil Devkar">
    <meta name="url" content="http://www.yourdomainname.com">
    <meta name="copyright" content="GPMZR">
    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <link href="css/MyStyle.css" rel="stylesheet" />
    <link href="css/offcanvas.css" rel="stylesheet" />
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <link href="css/lineiconstyle.css" rel="stylesheet" />
    <link href="css/material-icons.css" rel="stylesheet" />
    <link href="css/typicons.min.css" rel="stylesheet" />
    <link href="css/entypo.css" rel="stylesheet" />

    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>


    <link href="css/UserStyle.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        body, html {
            background-image: none;
        }
    .colorgraph {
  height: 5px;
  border-top: 0;
  background: #c4e17f;
  border-radius: 5px;
  background-image: -webkit-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: -moz-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: -o-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
  background-image: linear-gradient(to right, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
}

        #sidebar {
            overflow: hidden;
            z-index: 3;
            color: #13baba;
        }

            #sidebar .list-group {
                min-width: 400px;
                background-color: #333;
                min-height: 100vh;
            }

            #sidebar i {
                margin-right: 6px;
            }

            #sidebar .list-group-item {
                border-radius: 0;
                background-color: #333;
                color: #ccc;
                border-left: 0;
                border-right: 0;
                border-color: #2c2c2c;
                white-space: nowrap;
            }

                /* highlight active menu */
                #sidebar .list-group-item:not(.collapsed) {
                    background-color: #222;
                }

            /* closed state */
            #sidebar .list-group .list-group-item[aria-expanded="false"]::after {
                content: " \f0d7";
                font-family: FontAwesome;
                display: inline;
                text-align: right;
                padding-left: 5px;
            }

            /* open state */
            #sidebar .list-group .list-group-item[aria-expanded="true"] {
                background-color: #222;
            }

                #sidebar .list-group .list-group-item[aria-expanded="true"]::after {
                    content: " \f0da";
                    font-family: FontAwesome;
                    display: inline;
                    text-align: right;
                    padding-left: 5px;
                }

            /* level 1*/
            #sidebar .list-group .collapse .list-group-item,
            #sidebar .list-group .collapsing .list-group-item {
                padding-left: 20px;
            }

            /* level 2*/
            #sidebar .list-group .collapse > .collapse .list-group-item,
            #sidebar .list-group .collapse > .collapsing .list-group-item {
                padding-left: 30px;
            }

            /* level 3*/
            #sidebar .list-group .collapse > .collapse > .collapse .list-group-item {
                padding-left: 40px;
            }

        @media (max-width:768px) {
            #sidebar {
                min-width: 35px;
                max-width: 40px;
                overflow-y: auto;
                overflow-x: visible;
                transition: all 0.25s ease;
                transform: translateX(-45px);
                position: static;
            }

                #sidebar.show {
                    transform: translateX(0);
                }

                #sidebar::-webkit-scrollbar {
                    width: 0px;
                }

                #sidebar, #sidebar .list-group {
                    min-width: 35px;
                    overflow: visible;
                }
                    /* overlay sub levels on small screens */
                    #sidebar .list-group .collapse.show, #sidebar .list-group .collapsing {
                        position: relative;
                        z-index: 1;
                        width: 190px;
                        top: 0;
                    }

                    #sidebar .list-group > .list-group-item {
                        text-align: center;
                        padding: .75rem .5rem;
                    }
                        /* hide caret icons of top level when collapsed */
                        #sidebar .list-group > .list-group-item[aria-expanded="true"]::after,
                        #sidebar .list-group > .list-group-item[aria-expanded="false"]::after {
                            display: none;
                        }
        }

        .collapse.show {
            visibility: visible;
        }

        .collapsing {
            visibility: visible;
            height: 0;
            -webkit-transition-property: height, visibility;
            transition-property: height, visibility;
            -webkit-transition-timing-function: ease-out;
            transition-timing-function: ease-out;
        }

            .collapsing.width {
                -webkit-transition-property: width, visibility;
                transition-property: width, visibility;
                width: 0;
                height: 100%;
                -webkit-transition-timing-function: ease-out;
                transition-timing-function: ease-out;
            }
    </style>
    <!-- Favicon -->
    <link rel="shortcut icon" href="images/site-logo/site-logo.png">
    <link rel="apple-touch-icon" sizes="144x144" type="image/x-icon" href="">
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <div>
                <!--------------------------------------------------navbar header start-------------------------------------------------------->
                <header class="navbar navbar-expand-md navbar-dark fixed-top bg-dark " id="navbarheader">

                    <a class="navbar-brand mr-0 mr-md-2 " href="UserProfile.aspx" aria-label="GPMZR">
                        <img src="images/site-logo/site-logo.png" height="70" width="70" id="site-logo" />
                        GPM Welfare Network</a>
                    <button class="navbar-toggler p-0 border-0" type="button" data-toggle="offcanvas" data-target="#mynavbar" aria-controls="mynavbar" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon active"></span>
                    </button>

                    <div class="navbar-collapse offcanvas-collapse" id="mynavbar">
                        <ul class="navbar-nav mr-auto">
                            <li class="nav-item">
                                <a class="nav-link" href="UserProfile.aspx"><i class="fa fa-home fa-fw" aria-hidden="true"></i>Home<span class="sr-only">(current)</span></a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Feedback.aspx">Feedback</a>
                            </li>
                            <li class="nav-item dropdown">
                                <a class="nav-link nav-item dropdown-toggle mr-md-2 " href="#" id="BuyAndSelldropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Buy/Sell Books</a>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="BuyAndSelldropdown">
                                    <a class="dropdown-item" href="BuyBook.aspx">Buy BOOK</a>
                                    <a class="dropdown-item" href="SellBook.aspx">SELL BOOK</a>
                                    <a class="dropdown-item" href="BookRequest.aspx">REQUEST
            &nbsp;&nbsp;&nbsp;<asp:Label runat="server" Font-Bold="true" ForeColor="Red" ID="request" Text="">
            </asp:Label>
                                    </a>
                                </div>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="Questions.aspx">Query Forum</a>
                            </li>

                            <li class="nav-item">
                                <a class="nav-link" href="Library.aspx">Library</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="/">Lost-&-Found/Help</a>
                            </li>
                        </ul>

                        <ul class="navbar-nav">
                            <li class="nav-item dropdown active">
                                <a class="nav-item nav-link dropdown-toggle mr-md-2" href="#" id="UserDropDown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                    <asp:Image ID="navbarUserImage" runat="server" class="rounded-circle" Width="40" Height="40" />
                                    <asp:Label ID="lblUserDropdownName" runat="server"></asp:Label>
                                </a>
                                <div class="dropdown-menu dropdown-menu-right" aria-labelledby="UserDropDown">
                                    <ul>
                                        <a class="nav-item nav-link dropdown-item text-dark" href="UserProfile.aspx"><i class="fa fa-user fa-fw"></i>User Profile</a>

                                        <li class="dropdown-divider"></li>
                                        <asp:LinkButton ID="btnSignout" runat="server" OnClick="btnSignout_Click" CssClass="nav-item nav-link dropdown-item text-dark"><i class="fa fa-sign-out fa-fw"></i>Logout</asp:LinkButton>

                                    </ul>
                                </div>
                            </li>
                        </ul>
                    </div>


                </header>

                <!--------------------------------------------------navbar header end-------------------------------------------------------->
            </div>
            <!--user page start--------------------------------------------------------------------------------------------------------->



            <div class="container-fluid">
                <div class="row  d-flex d-md-block flex-nowrap wrapper">
                     <div class="col-md-2 float-left col-1 pl-0 pr-0 collapse width show" id="sidebar">
                        <div class="list-group border-0 card text-center text-md-left">
                            <a href="ProfilePage.aspx" class="list-group-item d-inline-block collapsed" title="User Profile" data-parent="#sidebar"><i class="fa fa-id-badge" ></i><span class="d-none d-md-inline">Profile</span></a>
                                                   <a href="SearchPeople.aspx" class="list-group-item d-inline-block collapsed" title="search" data-parent="#sidebar"><i class="fa fa-search" title="search"></i><span class="d-none d-md-inline">Search Friends</span></a>
                                 <a href="Feedback.aspx" class="list-group-item d-inline-block collapsed" title="Feedback" data-parent="#sidebar"><i class="fa fa-pencil" title="Feedback"></i><span class="d-none d-md-inline">Feedback</span></a>
                            <a href="#BuySell" class="list-group-item d-inline-block collapsed" title="Buy/Sell Book" data-toggle="collapse" data-parent="#sidebar" aria-expanded="false"><i class="fa fa-rupee"></i><span class="d-none d-md-inline">Buy/Sell Books</span> </a>
                            
                            <div class="collapse" id="BuySell">
                                <a href="BuyBook.aspx" class="list-group-item" data-parent="#BuySell">Buy Book</a>
                                <a href="SellBook.aspx" class="list-group-item" data-parent="#BuySell">Sell Book</a>
                                <a href="BookRequest.aspx" class="list-group-item" data-parent="#BuySell">Request</a>
                            </div>
                            <a href="Questions.aspx" class="list-group-item d-inline-block collapsed" title="Question/Answer" data-parent="#sidebar"><i class="fa fa-question"></i><span class="d-none d-md-inline">Query Forum</span></a>
                            <a href="Library.aspx" class="list-group-item d-inline-block collapsed " title="Library" data-parent="#sidebar"><i class="fa fa-book"></i><span class="d-none d-md-inline">Library</span></a>
                            <a href="#LostFound" class="list-group-item d-inline-block collapsed " title="Lost-&-Found" data-toggle="collapse" data-parent="#sidebar" aria-expanded="false"><i class="fa fa-map-marker"></i><span class="d-none d-md-inline">Lost-&-Found/Help</span> </a>

                            <div class="collapse" id="LostFound">
                                <a href="Lost.aspx" class="list-group-item" data-parent="#LostFound">Lost and Found Reg.</a>
                                <a href="Found.aspx" class="list-group-item" data-parent="#LostFound">Lost Items</a>
                                  <a href="MyLostedItem.aspx" class="list-group-item" data-parent="#LostFound">MyLost Items</a>
                                <a href="HelperPage.aspx" class="list-group-item" data-parent="#LostFound">Founded Items</a>
                                 <a href="SendHelp.aspx" class="list-group-item" data-parent="#LostFound">Helper's Request</a>
                            </div>
                            <a href="#Settings" class="list-group-item d-inline-block collapsed " title="Settings" data-toggle="collapse" data-parent="#sidebar" aria-expanded="false"><i class="fa fa-wrench"></i><span class="d-none d-md-inline">Settings</span> </a>

                            <div class="collapse" id="Settings">
                                <a href="#Account" class="list-group-item" data-toggle="collapse" aria-expanded="false">Account</a>
                                <div class="collapse" id="Account">
                                    <a href="EditUserProfile.aspx" class="list-group-item" data-parent="#Account">Edit Profile</a>

                                </div>
                                <a href="#Privacy" class="list-group-item" data-toggle="collapse" aria-expanded="false">Privacy</a>
                                <div class="collapse" id="Privacy">
                                    <a href="ChangePassword.aspx" class="list-group-item" data-parent="#Privacy">Change Password</a>

                                </div>
                            </div>


                            <%--   <a href="#menu1" class="list-group-item d-inline-block collapsed" data-toggle="collapse" data-parent="#sidebar" aria-expanded="false"><i class="fa fa-dashboard"></i><span class="d-none d-md-inline">User Profile</span> </a>
                        <div class="collapse" id="menu1">
                            <a href="#menu1sub1" class="list-group-item" data-toggle="collapse" aria-expanded="false">Subitem 1 </a>
                            <div class="collapse" id="menu1sub1">
                                <a href="#" class="list-group-item" data-parent="#menu1sub1">Subitem 1 a</a>
                                <a href="#" class="list-group-item" data-parent="#menu1sub1">Subitem 2 b</a>
                                <a href="#menu1sub1sub1" class="list-group-item" data-toggle="collapse" aria-expanded="false">Subitem 3 c </a>
                                <div class="collapse" id="menu1sub1sub1">
                                    <a href="#" class="list-group-item" data-parent="#menu1sub1sub1">Subitem 3 c.1</a>
                                    <a href="#" class="list-group-item" data-parent="#menu1sub1sub1">Subitem 3 c.2</a>
                                </div>
                                <a href="#" class="list-group-item" data-parent="#menu1sub1">Subitem 4 d</a>
                                <a href="#menu1sub1sub2" class="list-group-item" data-toggle="collapse" aria-expanded="false">Subitem 5 e </a>
                                <div class="collapse" id="menu1sub1sub2">
                                    <a href="#" class="list-group-item" data-parent="#menu1sub1sub2">Subitem 5 e.1</a>
                                    <a href="#" class="list-group-item" data-parent="#menu1sub1sub2">Subitem 5 e.2</a>
                                </div>
                            </div>
                            <a href="#" class="list-group-item" data-parent="#menu1">Subitem 2</a>
                            <a href="#" class="list-group-item" data-parent="#menu1">Subitem 3</a>
                        </div>
                        <a href="#" class="list-group-item d-inline-block collapsed" data-parent="#sidebar"><i class="fa fa-film"></i><span class="d-none d-md-inline">Item 2</span></a>
                        <a href="#menu3" class="list-group-item d-inline-block collapsed" data-toggle="collapse" data-parent="#sidebar" aria-expanded="false"><i class="fa fa-book"></i><span class="d-none d-md-inline">Item 3 </span></a>
                        <div class="collapse" id="menu3">
                            <a href="#" class="list-group-item" data-parent="#menu3">3.1</a>
                            <a href="#menu3sub2" class="list-group-item" data-toggle="collapse" aria-expanded="false">3.2 </a>
                            <div class="collapse" id="menu3sub2">
                                <a href="#" class="list-group-item" data-parent="#menu3sub2">3.2 a</a>
                                <a href="#" class="list-group-item" data-parent="#menu3sub2">3.2 b</a>
                                <a href="#" class="list-group-item" data-parent="#menu3sub2">3.2 c</a>
                            </div>
                            <a href="#" class="list-group-item" data-parent="#menu3">3.3</a>
                        </div>--%>
                            <%--  <a href="#" class="list-group-item d-inline-block collapsed" data-parent="#sidebar"><i class="fa fa-heart"></i><span class="d-none d-md-inline">Item 4</span></a>
                            <a href="#" class="list-group-item d-inline-block collapsed" data-parent="#sidebar"><i class="fa fa-list"></i><span class="d-none d-md-inline">Item 5</span></a>
                            <a href="#" class="list-group-item d-inline-block collapsed" data-parent="#sidebar"><i class="fa fa-clock-o"></i><span class="d-none d-md-inline">Link</span></a>
                            <a href="#" class="list-group-item d-inline-block collapsed" data-parent="#sidebar"><i class="fa fa-th"></i><span class="d-none d-md-inline">Link</span></a>
                            <a href="#" class="list-group-item d-inline-block collapsed" data-parent="#sidebar"><i class="fa fa-gear"></i><span class="d-none d-md-inline">Link</span></a>
                            <a href="#" class="list-group-item d-inline-block collapsed" data-parent="#sidebar"><i class="fa fa-calendar"></i><span class="d-none d-md-inline">Link</span></a>
                            <a href="#" class="list-group-item d-inline-block collapsed" data-parent="#sidebar"><i class="fa fa-envelope"></i><span class="d-none d-md-inline">Link</span></a>
                            <a href="#" class="list-group-item d-inline-block collapsed" data-parent="#sidebar"><i class="fa fa-bar-chart-o"></i><span class="d-none d-md-inline">Link</span></a>
                            <a href="#" class="list-group-item d-inline-block collapsed" data-parent="#sidebar"><i class="fa fa-star"></i><span class="d-none d-md-inline">Link</span></a>
                            --%>
                        </div>
                    </div>

                    <div class="">
                        <div class="row">

                            <div class="container">
                                <div class="alert alert-info alert-dismissible fade show container" role="alert" style="margin-top: 3em; border-left: 8px solid #1f80aa; border-bottom: 2px solid #1f80aa; border-top: 2px solid #1f80aa;">
                                    <strong>Note :</strong> Please provide a <strong>unique Username</strong>.
                                    <strong class="text-danger">Profile picture must be less than 5mb.</strong>
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                                <br>
                                <br>
                                <div class="row" id="main">
                                    <div class="col-md-3 well" id="leftPanel">
                                        <div class="row">
                                            <div class="col-md-12">
                                                <div>
                                                    <asp:Image ID="imgProfilePic" runat="server" alt="profile pic" class="img-thumbnail rounded-circle" />

                                                    <h2 class="text-dark container">
                                                        <asp:Label ID="LabelUsername" runat="server"></asp:Label></h2>
                                                    <div class="container">
                                                        <h6 class="m-t-2">Upload a different photo</h6>
                                                        <asp:FileUpload ID="picupload" runat="server" />
                                                        <asp:Label ID="LabelPicError" runat="server" CssClass="text-danger"></asp:Label>
                                                    </div>

                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-md-9 well" id="rightPanel">
                                        <div class="row">
                                            <div class="col-md-12">

                                                <h2><i class="li_pen"></i> Edit your profile.<small> It's always easy</small></h2>
                                                <hr class="colorgraph">
                                                <div class="row">
                                                    <div class="col-xs-12 col-sm-6 col-md-6">
                                                        <div class="form-group">
                                                            <asp:TextBox ID="tbFName" runat="server" class="form-control input-lg" placeholder="First Name" TabIndex="1" TextMode="SingleLine"></asp:TextBox>
                                                            <small class="text-danger">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorFName" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="tbFName" Text="First Name is required."></asp:RequiredFieldValidator></small>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-6 col-md-6">
                                                        <div class="form-group">
                                                            <asp:TextBox ID="tbLName" runat="server" class="form-control input-lg" placeholder="Last Name" TabIndex="2" TextMode="SingleLine"></asp:TextBox>
                                                            <small class="text-danger">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorLName" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="tbLName" Text="Last Name is required."></asp:RequiredFieldValidator></small>

                                                        </div>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <div class="col-xs-12 col-sm-6 col-md-6">
                                                        <div class="form-group">
                                                            <asp:TextBox ID="tbUsername" runat="server" class="form-control input-lg" placeholder="Username" TabIndex="3" TextMode="SingleLine" onchange="UsernameChecking()"></asp:TextBox>
                                                            <small> 
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorUname" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="tbUsername" Text="Username is required." CssClass="text-danger"></asp:RequiredFieldValidator>

                                                            </small>
                                                        </div>
                                                    </div>
                                                    <div class="col-xs-12 col-sm-6 col-md-6">
                                                        <div class="form-group">
                                                            <asp:Label ID="lblCheckUname" runat="server"></asp:Label>
                                                        </div>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-xs-12 col-sm-6 col-md-6">
                                                        <div class="form-group">
                                                            <asp:TextBox ID="tbPass" runat="server" class="form-control input-lg" placeholder="Password" TabIndex="5" TextMode="Password"></asp:TextBox>
                                                            <small class="text-danger">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="tbPass" Text="Password is required."></asp:RequiredFieldValidator></small>

                                                        </div>
                                                    </div>

                                                    <div class="col-xs-12 col-sm-6 col-md-6">
                                                        <div class="form-group">
                                                            <asp:TextBox ID="tbConfirmPass" runat="server" class="form-control input-lg" placeholder="Confirm Password" TabIndex="6" TextMode="Password"></asp:TextBox>
                                                            <small class="text-danger">
                                                                <asp:RequiredFieldValidator ID="RequiredFieldValidatorConfirmPass" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="tbConfirmPass" Text="Confirm Password is required."></asp:RequiredFieldValidator></small>

                                                        </div>
                                                    </div>
                                                    <div class="container">
                                                        <asp:Label ID="LabelError" runat="server" CssClass="text-danger"></asp:Label>
                                                    </div>

                                                </div>
                                                <hr class="colorgraph">
                                                <div class="row">
                                                    <div class="col-xs-12 col-md-6"></div>
                                                    <div class="col-xs-12 col-md-6">
                                                        <asp:Button ID="btnSave" runat="server" Text="Save" class="btn btn-success btn-block btn-lg" OnClick="btnSave_Click" />


                                                    </div>
                                                </div>

                                            </div>
                                        </div> 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                </div>

            </div>


            <!--user page end--------------------------------------------------------------------------------------------------------->

            <!----------------------------------------------------- FOOTER start---------------------------------------------------------->


            <div class="container">
                <hr class="container" />
                <footer class="container">
                    <p class="float-right"><a href="#">Back to top <i class="fa fa-hand-o-up " aria-hidden="true"></i></a></p>
                    <p>
                        &copy;
                        <asp:Label ID="lblYear" runat="server" Text="Label"></asp:Label>
                        GPMZR, Inc. &middot; <a href="#">Privacy</a> &middot; <a href="#">Terms</a>
                    </p>
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
                    msg1.style.color = "green";
                    msg1.innerHTML = "Username available 👍";
                    break;
            }
        }
         
    </script> 
      <!--------------------------------------------------Neccesary javascript reference------------------------------------------------------->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
    <script src="js/offcanvas.js"></script>

</body>
</html>
