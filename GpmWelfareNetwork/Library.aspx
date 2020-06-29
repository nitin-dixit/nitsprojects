<%@ Page Culture="en-IN" Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="Library.aspx.cs" Inherits="Library" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>GPM's Library</title>
    <link href="css/carousel.css" rel="stylesheet" />
    <link href="css/Gridstyle.css" rel="stylesheet" />
    <link href="css/UserStyle.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="">
         <div class=""> 
           <div class="">
    <!----------------------------------------carousel------------------------------------------------------->
    <div id="myCarousel" class="carousel slide row" data-ride="carousel">
        <ol class="carousel-indicators">
            <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
            <li data-target="#myCarousel" data-slide-to="1"></li>
            <li data-target="#myCarousel" data-slide-to="2"></li>
        </ol>
        <div class="carousel-inner">
            <div class="carousel-item active">
                <img class="first-slide" src="images/library/Carousel---Community-Book-Drive.jpg" alt="First slide" height="450" style="position: absolute; top: 0; left: 0; width: 100%;">
            </div>
            <div class="carousel-item">
                <img class="second-slide" src="images/library/d.jpg" alt="Second slide" height="450" style="position: absolute; top: 0; left: 0; width: 100%;">
            </div>
            <div class="carousel-item">
                <img class="third-slide" src="images/library/IMG_1000_crop.jpg" alt="Third slide" height="450" style="position: absolute; top: 0; left: 0; width: 100%;">
            </div>
        </div>
        <a class="carousel-control-prev" href="#myCarousel" role="button" data-slide="prev">
            <span class="carousel-control-prev-icon" aria-hidden="true"></span>
            <span class="sr-only">Previous</span>
        </a>
        <a class="carousel-control-next" href="#myCarousel" role="button" data-slide="next">
            <span class="carousel-control-next-icon" aria-hidden="true"></span>
            <span class="sr-only">Next</span>
        </a>
    </div>
    <!----------------------------------------carousel end------------------------------------------------------->

    <section class=" text-light" id="librarysection">
        <div>
            <div class="container">
                <h1 class="display-4 text-center">GPM's Library <i class="fa fa-book"></i></h1>
                <p class="text-center">
                    The GPM's Library is a hub of academic and research activities. The library has a rich collection of modern and                     technical books, archival records, valuable reference books, important journals, for the use of                     students, staff members and Faculties.
                </p>

            </div>
        </div>
    </section>
    <!-------------------------------------------------------------Einstein sayings----------------------------------------------------->
    <div class="row featurette container">
        <div class="col-md-8 order-md-2">
            <blockquote class="blockquote text-center">
                <p class="mb-0" style="margin-top: 4em;"><i class="fa  fa-quote-left " aria-hidden="true"></i>The only thing you absolutely have to know, is the location of <strong>Library.</strong> <i class="fa  fa-quote-right " aria-hidden="true"></i></p>
                <footer class="blockquote-footer"><cite title="">Albert Einstein</cite></footer>
            </blockquote>
        </div>
        <div class="col-md-4 order-md-1">
            <img src="images/library/BrwEaC3CcAAGBI_.jpg" class="featurette-image img-fluid mx-auto rounded-circle" data-src="holder.js/500x500/auto" alt="Generic placeholder image" style="height: 270px;">
        </div>

    </div>
    <!-------------------------------------------------------------Einstein sayings end----------------------------------------------------->

    <div class="alert alert-warning alert-dismissible fade show container" role="alert" style="margin-top: 3em; border-left: 8px solid #ff6a00; border-bottom: 2px solid #ff6a00; border-top: 2px solid #ff6a00;">
        <strong>Note!</strong> Below list of books are from the department you belong.
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
  </button>
    </div>
    <div class="container" style="margin-top:5em;">
        <div class="form-inline my-2 my-lg-0 row">
            <asp:TextBox ID="TextBox1" runat="server"  class="form-control mr-sm-2" type="text" placeholder="Search by name" aria-label="Search"></asp:TextBox>
            
            <asp:Button ID="Button1" runat="server" Text="Search" class="btn btn-outline-success my-2 my-sm-0" type="submit" OnClick="Button1_Click"/>
          
        </div>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="Grid container-fluid text-center" OnPreRender="GridView1_PreRender">
            <AlternatingRowStyle BackColor="#F0F0F0" />
            <Columns>
                <asp:BoundField DataField="Bname" HeaderText="Bname" SortExpression="Bname" />
                <asp:BoundField DataField="AuthorName" HeaderText="AuthorName" SortExpression="AuthorName" />
                <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" DataFormatString="{0:c}"/>
                <asp:BoundField DataField="Publication" HeaderText="Publication" SortExpression="Publication" />
                <asp:BoundField DataField="Department" Visible="false" HeaderText="Department" SortExpression="Department" />
            </Columns>
            <HeaderStyle BackColor="Black" ForeColor="White" />
            <PagerStyle BackColor="Black" ForeColor="White" />
        </asp:GridView>
          <div class="container">
            <asp:Label ID="LabelPageDisplay" runat="server"></asp:Label>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MyDatabaseConnectionString %>" SelectCommand="SELECT [Bname], [AuthorName], [Price], [Publication], [Department] FROM [tblLibraryBooks] WHERE ([Department] = @Department)" FilterExpression="Bname LIKE '{0}%'">
        <SelectParameters>
            <asp:SessionParameter Name="Department" SessionField="Branch" Type="String" />
        </SelectParameters>
        <FilterParameters>
            <asp:ControlParameter Name="Department" ControlID="TextBox1" PropertyName="Text" />
        </FilterParameters>
    </asp:SqlDataSource>

        </div>
        </div>

    </div>
   
</asp:Content>

