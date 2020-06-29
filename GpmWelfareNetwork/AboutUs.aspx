<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AboutUs.aspx.cs" Inherits="AboutUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>About US</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="jumbotron jumbotron-fluid" id="jumbotron1">
  <div class="container">
  <blockquote class="blockquote text-center animated bounceInUp">
  <p class="mb-0 display-1 text-light animated bounceInDown">Vision &amp; Mission</p>
      <br />
      
<footer class="display-4 text-light" style="font-size:xx-large;">Clear Goals Help Achieve Target In Less Time</footer>
</blockquote>
  </div>
</div>
    <div class="jumbotron jumbotron-fluid" id="jumbotron2">
  <div class="container text-left">
       <asp:Image  runat="server" ImageUrl="~/images/Vision.png"  alt="Vision Image" height="200" ImageAlign="Right" />
    <h5 class="display-3">Vision </h5>
      
    <p class="text-justify text-left">To develop the institution as a centre of excellence by producing cost <br />effective competent Technical Human Resource catering to the needs<br /> of Industry and Society.</p>
      
  </div>
</div>
    <div class="jumbotron jumbotron-fluid" id="jumbotron3">
  <div class="container text-light text-center">
       <asp:Image  runat="server" ImageUrl="~/images/Mission.png"  class="img-fluid" alt="Vision Image" height="200" ImageAlign="Left" />
    <h1 class="display-3 text-center">Mission </h1>
      
         
          <p class="text-center text-justify ">To become a competent National Level Institute imparting value and need based,<br /> advanced, quality programmes and service,for society and Industrial Environment.</p>
      
    
  </div>
</div>
</asp:Content>

