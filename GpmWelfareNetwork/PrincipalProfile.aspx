<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="PrincipalProfile.aspx.cs" Inherits="PrincipalProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Principal's Profile</title>
    <style>
        html {
            min-height: 100%;
        }

        body {
            background-color: transparent;
        }

        .card-profile {
            width: 50%;
            margin: 50px auto;
            background-color: #e6e5e1;
            border-radius: 0;
            border: 0;
            -webkit-box-shadow: 1em 1em 2em rgba(0, 0, 0, 0.2);
            box-shadow: 1em 1em 2em rgba(0, 0, 0, 0.2);
        }

            .card-profile .card-img-top {
                border-radius: 0;
                height:250px;
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

            .card-profile .card-links {
                margin-bottom: 25px;
            }

                .card-profile .card-links .fa {
                    margin: 0 1em;
                    font-size: 1.6em;
                }

                    .card-profile .card-links .fa:focus, .card-profile .card-links .fa:hover {
                        text-decoration: none;
                    }

                    .card-profile .card-links .fa.fa-dribbble {
                        color: #ea4b89;
                        font-weight: bold;
                    }

                        .card-profile .card-links .fa.fa-dribbble:hover {
                            color: #e51d6b;
                        }

                    .card-profile .card-links .fa.fa-twitter {
                        color: #68aade;
                    }

                        .card-profile .card-links .fa.fa-twitter:hover {
                            color: #3e92d5;
                        }

                    .card-profile .card-links .fa.fa-facebook {
                        color: #3b5999;
                    }

                        .card-profile .card-links .fa.fa-facebook:hover {
                            color: #2d4474;
                        }

        @media (max-width:768px) {
            .card-profile{
                width:340px;
            }
        }
         @media (max-width:533px) {
            .card-profile{
                width:300px;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    <div class="jumbotron jumbotron-fluid" id="jumbotronPrinci">
        <p class="mb-0 display-4 text-info text-center animated bounceInDown">Principal's Profile</p>
        <div class='card card-profile animated rollIn rounded'>
            <img alt='' class='card-img-top' src="images/background/rcBWkO.png">
            <div class='card-block text-center'>
                <img alt='' class='card-img-profile' src="images/princi.jpg">
                <h4 class='card-title text-center'>Dr. A.A.Gulhane
                 <small class="text-center">Principal</small>
                </h4>
                <p class="container">
                    
                    <span style="color: #3366ff;"><strong>Dob</strong>:</span> 09/01/1963 (Ninth January Nineteen Sixty Three)<br>
                    <span style="color: #3366ff;"><strong>Educational Qualification</strong>:</span> B.E. M.Tech(Machine Tools Engg.) Ph.D.(Mech.Engg)<br>
                    <span style="color: #3366ff;"><strong>Work Experience</strong> :</span> 29 Years<br>
                    <span style="color: #3366ff;"><strong>Phone No</strong>:</span> 07256207876<br>
                    <span style="color: #3366ff;"><strong>E-Mail</strong>:</span> Principalgpmzr@Gmail.Com
                </p>

               
            </div>
        </div>


    </div>







    <!-- /.row -->

</asp:Content>

