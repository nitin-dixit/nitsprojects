<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">

    <title>Contact Us</title>

    <style>
        #map {
            height: 400px;
            width: 100%;
        }
    </style>


</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   
    
    <div id="ContactUs">
         <div id="map" class="map"></div>
    <script>
        function initMap() {
            var uluru = { lat: 20.733296, lng: 77.402867 };
            var map = new google.maps.Map(document.getElementById('map'), {
                zoom: 20,
                center: uluru
            });
            var marker = new google.maps.Marker({
                position: uluru,
                map: map
            });
        }
    </script>
    <script async defer
        src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCzym3tp0gy_HrrlbykoBQ07MiQ-BhxOkQ&callback=initMap">
    </script>


        <blockquote class="blockquote text-center">
            <p class="mb-0 display-4 text-light text-center animated bounceInDown" style="font: bold;">Government Polytechnic Murtizapur</p>
            <br />
            <p class="text-center text-light" style="font-family: 'Times New Roman', Times, serif; font-size: x-large">All the Details You Need To Contact Us</p>
            <br />
        </blockquote>
        <div class="container">
             <div class="row">
            <div class="col-lg-8 form-row">
                <div class="col-lg-6">
                  <div class="form-group">
                    <asp:textbox ID="tbName" runat="server" class="form-control" placeholder="Your Name *" TextMode="SingleLine" ></asp:textbox>
                  <small> <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Name required!" CssClass="text-danger" ControlToValidate="tbName"></asp:RequiredFieldValidator></small>
                   
                  </div>
                  <div class="form-group">
                        <asp:TextBox ID="tbEmail" runat="server" class="form-control" TextMode="Email" placeholder="Your Email *"></asp:TextBox>
                  <small><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Email required" CssClass="text-danger" ControlToValidate="tbEmail"></asp:RequiredFieldValidator></small> 
                  </div>
                  <div class="form-group">
                            <asp:TextBox ID="tbPhone" runat="server" class="form-control" TextMode="Phone"  placeholder="Your phone number * (optional)"></asp:TextBox>
                 <small class="text-muted text-light">please! provide an active phone number</small>
                  </div>
                </div>
                <div class="col-lg-6">
                  <div class="form-group">
                                <asp:TextBox ID="tbMessage" runat="server" TextMode="MultiLine"  class="form-control" placeholder="Your Message *" Height="200"></asp:TextBox>
                   <small>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Message required!" CssClass="text-danger" ControlToValidate="tbMessage"></asp:RequiredFieldValidator></small>
                  </div>
                </div>
                <div class="clearfix"></div>
                <div class="col-lg-12 text-center">
               <asp:Button ID="btnSendMessage" class="btn btn-outline-light btn-xl text-uppercase" runat="server" Text="Send Message" OnClick="btnSendMessage_Click" />
                 
                    <br />
                    <br />
                    <br />
                </div>
              </div>

            
            <div class="col-lg-4">
                <div class="text-light text-center " style="border:1px dashed rgba(128, 128, 128, 0.76)" >
                      <p class="text-center text-light display-4" style="font-family: 'Times New Roman', Times, serif; font-size: x-large">Contact Details</p>
                    <p>
                        Government Polytechnic<br>
                        Hendaj, National Highway No.6,<br>
                        Amravati Road, Murtizapur<br>
                        Tq:Murtizapur-444 107<br>
                        Dist: Akola (Maharashtra)
                    </p>
                    <p>Phone:07256-207876/207877</p>
                    <p>Email:&nbsp;principalgpmzr@rediffmail.com</p>
                </div>
            </div>
        </div>
        </div>
       
</div>
    
   
    
</asp:Content>

