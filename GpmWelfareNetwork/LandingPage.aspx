<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="LandingPage.aspx.cs" Inherits="LandingPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/carousel.css" rel="stylesheet" />
  <style type="text/css">
      body, html {
          background: url(/images/symphony.png);
      }
      h1, h2, h3, h4, h5, h6 {
          font-family: "Playfair Display", Georgia, "Times New Roman", serif;
      }
  
.display-4 {
  font-size: 2.5rem;
}
@media (min-width: 768px) {
  .display-4 {
    font-size: 3rem;
  }
}

.card-img-right {
  height: 100%;
  border-radius: 0 3px 3px 0;
}

.flex-auto {
  -ms-flex: 0 0 auto;
  -webkit-box-flex: 0;
  flex: 0 0 auto;
}

.h-250 { height: 250px; }
@media (min-width: 768px) {
  .h-md-250 { height: 250px; }
}

.border-top { border-top: 1px solid #e5e5e5; }
.border-bottom { border-bottom: 1px solid #e5e5e5; }

.box-shadow { box-shadow: 0 .25rem .75rem rgba(0, 0, 0, .05); }

 
  </style>
   
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <!----------------------------------------------------carousal start------------------------------------------------------------>
    <main role="main">

        <div id="mycarousel" class="carousel slide" data-ride="carousel">
            <ol class="carousel-indicators">
                <li data-target="#mycarousel" data-slide-to="0" class="active"></li>
                <li data-target="#mycarousel" data-slide-to="1"></li>
                <li data-target="#mycarousel" data-slide-to="2"></li>
                 <li data-target="#mycarousel" data-slide-to="3"></li>
                 <li data-target="#mycarousel" data-slide-to="4"></li>
                 <li data-target="#mycarousel" data-slide-to="5"></li>
            </ol>
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-100" src="images/carousel/2.jpg" alt="First slide" height="400" />
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="images/carousel/1.jpg" alt="Second slide" height="400" />
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="images/carousel/115.jpg" alt="Third slide" height="400" />
                </div>
                <div class="carousel-item">
                    <img class="d-block w-100" src="images/carousel/lab-photos-4.jpg" alt="Fourth slide" height="400" />
                </div>
                  <div class="carousel-item">
                    <img class="d-block w-100" src="images/carousel/IMG-20180203-WA0003.jpg" alt="Fifth slide" height="400" />
                </div>
                  <div class="carousel-item">
                    <img class="d-block w-100" src="images/carousel/IMG-20180203-WA0008.jpg" alt="Six slide" height="400" />
                </div>
            </div>
            <a class="carousel-control-prev" href="#mycarousel" role="button" data-slide="prev">
                <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="carousel-control-next" href="#mycarousel" role="button" data-slide="next">
                <span class="carousel-control-next-icon" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>

        <div />

    </main>
    <!----------------------------------------------------carousal end------------------------------------------------------------>
     <%-- Departments --%>
    <br />
    <div class="container text-center">
      <h4 class="display-4"><i class="fa fa-mortar-board"></i> Departments</h4>
    </div>
    <br />
     <div class="row mb-2">
        <div class="col-md-6">
          <div class="card flex-md-row mb-4 box-shadow h-md-250">
            <div class="card-body d-flex flex-column align-items-start">
                 <strong class="d-inline-block mb-2 text-primary"><i class="fa fa-code"></i> Computer</strong>
              <h3 class="mb-0">
                <a class="text-dark" href="Comp.aspx">Computer Engineering<i class=""></i></a>
              </h3> 
                <br />
              <p class="card-text mb-auto">Established in the year 2009, the Department of Computer...</p>
              <a href="Comp.aspx">Continue reading...</a>
            </div>
            <img class="card-img-right flex-auto d-none d-md-block" alt="Card image cap" src="images/computer_pc_PNG7719.png">
          </div>
        </div>
        <div class="col-md-6">
          <div class="card flex-md-row mb-4 box-shadow h-md-250">
            <div class="card-body d-flex flex-column align-items-start">
              <strong class="d-inline-block mb-2 text-success"><i class="fa fa-cogs"></i> Mechanical</strong>
              <h3 class="mb-0">
                <a class="text-dark" href="MechEng.aspx">Mechanical Engineering</a>
              </h3> 
                <br />
              <p class="card-text mb-auto">Established in the year 2009, the Department of Mechanical...</p>
              <a href="MechEng.aspx">Continue reading...</a>
            </div>
            <img class="card-img-right flex-auto d-none d-md-block" src="images/Mechanical.png" alt="Card image cap">
          </div>
        </div>
      </div>
    <br />
     <div class="row mb-2">
        <div class="col-md-6">
          <div class="card flex-md-row mb-4 box-shadow h-md-250">
            <div class="card-body d-flex flex-column align-items-start">
              <strong class="d-inline-block mb-2 text-primary"><i class="fa fa-desktop"></i> IT</strong>
              <h3 class="mb-0">
                <a class="text-dark" href="InformationTechnology.aspx">Information Technology<i class=""></i></a>
              </h3> 
                <br />
              <p class="card-text mb-auto">Established in the year 2009, the Department of IT...</p>
              <a href="InformationTechnology.aspx">Continue reading...</a>
            </div>
            <img class="card-img-right flex-auto d-none d-md-block" src="images/thom-527.jpg" alt="Card image cap">
          </div>
        </div>
        <div class="col-md-6">
          <div class="card flex-md-row mb-4 box-shadow h-md-250">
            <div class="card-body d-flex flex-column align-items-start">
              <strong class="d-inline-block mb-2 text-success"><i class="fa fa-flash"></i> Electrical</strong>
              <h3 class="mb-0">
                <a class="text-dark" href="ElecEng.aspx">Electrical Engineering</a>
              </h3> 
                <br />
              <p class="card-text mb-auto">Established in the year 2009, the Department of Electrical...</p>
              <a href="ElecEng.aspx">Continue reading...</a>
            </div>
            <img class="card-img-right flex-auto d-none d-md-block"  src="images/Electrical.png" alt="Card image cap">
          </div>
        </div>
      </div>
</asp:Content>

 