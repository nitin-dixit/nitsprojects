<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="SendBookRequest.aspx.cs" Inherits="SendBookRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style>
        .centerbuybook{
            
      margin:auto;
         box-shadow:0px 7px 110px 0px;
                
        }

        .flexsearch--wrapper {
	height: auto;
	width: auto;
	max-width: 70%;
	overflow: hidden;
	background: transparent;
	margin: auto;
	position: static;
}
	
.flexsearch--form {
	overflow: hidden;
	position: relative;
}
	
.flexsearch--input-wrapper {
	padding: 0 66px 0 0; /* Right padding for submit button width */
	overflow: hidden;
}

.flexsearch--input {
  width: 100%;
}

/***********************
 * Configurable Styles *
 ***********************/
.flexsearch {
 
 /* Padding for other horizontal elements */
}

.flexsearch--input {
  -webkit-box-sizing: content-box;
	-moz-box-sizing: content-box;
	box-sizing: content-box;
 	height: 60px;
  padding: 0 46px 0 10px;
	border-color: #888;
  border-radius: 35px; /* (height/2) + border-width */
  border-style: solid;
	border-width: 5px;
  margin-top: 15px;
  color: #333;
  font-family: 'Helvetica', sans-serif;
	font-size: 26px;
	-webkit-appearance: none;
	-moz-appearance: none;
}
	
.flexsearch--submit {
 position: absolute;
	right: 0;
	top: 0;
	display: block;
	width: 60px;
	height: 60px;
  padding: 0;
  border: none;
	margin-top: 20px; /* margin-top + border-width */
  margin-right: auto; /* border-width */
	background: transparent;
  color: #888;
  font-family: 'Helvetica', sans-serif;
  font-size: 40px;
  line-height: 60px;
}

.flexsearch--input:focus {
  outline: none;
  border-color: #333;
}

.flexsearch--input:focus.flexsearch--submit {
 	color: #333; 
}

.flexsearch--submit:hover {
  color: #333;
  cursor: pointer;
}

::-webkit-input-placeholder {
	color: #888;  
}

input:-moz-placeholder {
  color: #888
}


/****************
 * Pretify demo *
 ****************/
.h1 {
  float: left;
  margin: 25px;
  color: #333;
  font-family: 'Helvetica', sans-serif;
  font-size: 45px;
  font-weight: bold;
  line-height: 45px;
  text-align: center;
}
        .lablefont { font-size:large;
            font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif   
                
        }
        .color{
            color:black;
        }
        .color1{
            color:white;
        }
        .header{

            border-bottom-color:white;
        }
        .seller{
            border-color:white;
            border-bottom-style:solid;
            border-top-style:solid;
            border-radius:20px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <br /><br /><br />
    
       <div  class="text-light row">
          <div class="container ">
                    <div class="centerbuybook border-dark">

                        
                    <asp:Panel ID="Panel6" CssClass="align-content-lg-center " BackImageUrl="~/images/4.jpg" runat="server">

                        <div class="">
                        <div class="card-header border-dark header">
                            <asp:ImageButton ID="userimgselleq" runat="server" Width="50" CssClass="rounded-circle" ImageUrl="~/images/background/swirl_pattern.png" />
               
                            <asp:Label ID="USERNAME" runat="server" CssClass="font-weight-bold color1 "> session USER NAME</asp:Label>
                    <asp:Label ID="usenameidimg" runat="server" Text=""></asp:Label>
                              </div>
                        
                        <div class="card-body">
                            <div class="">
                                <br />
                                <div class="seller">
                                    <br />
                                <asp:Label ID="sellerinfolbl" CssClass="lablefont color1" runat="server" >Seller information</asp:Label>
                              <br />
                                <asp:ImageButton ID="sellreqimg" runat="server" Width="50" CssClass=" rounded-circle" ImageUrl="~/images/background/swirl_pattern.png" /> 
                                <asp:Label ID="sellerName" CssClass="lablefont color1" runat="server" >NAME FROM DATABASE</asp:Label>
                                <br />
                                
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  <asp:Label ID="BOOKS2" CssClass="lablefont color1" runat="server">BOOKS FROM DATABASE</asp:Label>
                                <br /> 
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                
                                 <asp:Label ID="sellercontactno" CssClass="lablefont color1" runat="server" >CONtact no from database </asp:Label>
                                <br />
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               
                                 <asp:Label ID="selleremail" CssClass="lablefont color1" runat="server">Email FROM DATABASE</asp:Label>
                              </div>  <br /><hr /> 
                              <h5 class="color">  your information : </h5> <hr />
                               
                                <asp:TextBox ID="yourContactno" runat="server" placeholder="Enter your contact no" CssClass="color form-control" TextMode="Number"> </asp:TextBox> 
                           <br />
                                <asp:TextBox ID="emailtxt" runat="server" placeholder="Enter your email" CssClass="color form-control" TextMode="Email"> </asp:TextBox> 
                            <hr />

                              <h5 class="color"> Additional message :</h5> 
                                <asp:TextBox ID="addmsg" runat="server" placeholder="Enter a additional message" CssClass=" color form-control" Height="100"> </asp:TextBox>

                            </div>
                        </div>

                        <div class="card-footer"> 
                            <asp:Button ID="sendbtn" runat="server" CssClass="btn-success  btn  btn-block  "  Text="SEND" OnClick="sendbtn_Click" />
                        <br />
                            <asp:Label ID="lblstatus" CssClass="alert-danger" runat="server" > </asp:Label>
                        </div>
</div>
                    </asp:Panel>
                  </div>
                    </div>

           </div>

</asp:Content>

