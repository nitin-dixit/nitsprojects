<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="UserProfile.aspx.cs" Inherits="UserProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css" integrity="sha384-PsH8R72JQ3SOdhVi3uxftmaW6Vc51MKb0q5P2rRUpPvrszuE4W1povHYgTpBfshb" crossorigin="anonymous">

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
    <link href="css/font-awesome.min.css" rel="stylesheet" />
    <link href="css/UserStyle.css" rel="stylesheet" />


    <!-- Favicon -->
    <link rel="shortcut icon" href="images/site-logo/site-logo.png">
    <link rel="apple-touch-icon" sizes="144x144" type="image/x-icon" href="">
    <style>
        html {
            min-height: 100%;
        }


        .card-profile {
            width: auto;
            /*margin: 50px auto;*/
            background-color: #e6e5e1;
            border-radius: 0;
            border: 0;
            -webkit-box-shadow: 1em 1em 2em rgba(0, 0, 0, 0.2);
            box-shadow: 1em 1em 2em rgba(0, 0, 0, 0.2);
        }

            .card-profile .card-img-top {
                border-radius: 0;
            }

            .card-profile .card-img-profile {
                max-width: 100%;
                border-radius: 50%;
                margin-top: -95px;
                margin-bottom: 35px;
                border: 5px solid #e6e5e1;
            }

            .card-profile .card-title {
                margin-bottom: 50px;
            }

                .card-profile .card-title small {
                    display: block;
                    font-size: .6em;
                    margin-top: .2em;
                }

           
        .card-img-top {
            height: 150px;
        }


        .card-img-profile {
            max-height: 250px;
        }

        #backgr {
            background: #8e9eab; /* fallback for old browsers */
            background: -webkit-linear-gradient(to right, #eef2f3, #8e9eab); /* Chrome 10-25, Safari 5.1-6 */
            background: linear-gradient(to right, #eef2f3, #8e9eab); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
        }

        @media (max-width:768px) {
            .card-img-top {
                height: 100px;
            }

            .card-img-profile {
                height: 150px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">



    <div class='card card-profile text-center'>


        <img alt='' class='card-img-top' src="images/background/user-profile-bg.jpg">
        <div class='card-block text-center' id="backgr">
            <asp:Image ID="Image2" runat="server" class='card-img-profile' />

            <h4 class='card-title'>
                <asp:Label ID="lblUsername" runat="server"></asp:Label>
                <small>
                    <asp:Label ID="lblName" runat="server"></asp:Label><br />
                    <asp:Label ID="lblEmail" runat="server"></asp:Label><br />
                    <asp:Label ID="lblMobileNo" runat="server"></asp:Label><br />
                    <asp:Label ID="lblEnrollmentNo" runat="server"></asp:Label><br />
                    <asp:Label ID="lblBranch" runat="server"></asp:Label><br />
                    

                </small>
            </h4>
            <%-- <div class='card-links'>
                <a class='fa fa-dribbble' href='#'></a>
                <a class='fa fa-twitter' href='#'></a>
                <a class='fa fa-facebook' href='#'></a>
            </div>--%>
        </div>
    </div>

</asp:Content>

