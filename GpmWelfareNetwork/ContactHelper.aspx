<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="ContactHelper.aspx.cs" Inherits="ContactHelper" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style>
        .centerContactHelper{
            
      margin:auto;
         box-shadow:0px 7px 110px 0px;
                
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

    
         <%--    <div class="flexsearch row">
		<div class="flexsearch--wrapper">
		
				<div class="flexsearch--input-wrapper btn-group-lg">
                    
					<asp:TextBox ID="txtsearch"  CssClass="flexsearch--input" runat="server" ></asp:TextBox>
                      
                       
			
            <asp:Button ID="search" CssClass="float-right btn-info" Text="search" runat="server" />
			</div>	
			
		</div>
</div>--%>
        <br /> 
    <div class="row">
          <div class="container ">
                    <div class="centerContactHelper border-dark">

                        
                    <asp:Panel ID="Panel6" CssClass="align-content-lg-center " BackImageUrl="~/images/background/cool.jpg" runat="server">

                        <div class="">
                        <div class="card-header border-dark header">
                            <asp:ImageButton ID="userimgvictim" runat="server" Width="50" CssClass="rounded-circle" ImageUrl="~/images/background/swirl_pattern.png" />
               
                            <asp:Label ID="USERNAME" runat="server" CssClass="font-weight-bold color "> session USER NAME</asp:Label>
                    <asp:Label ID="usenameidimg" runat="server" Text=""></asp:Label>
                              </div>
                        
                        <div class="card-body">
                            <div class="">
                                <br />
                                <div class="seller">
                                    <br />
                                <asp:Label ID="victiminfolbl" CssClass="lablefont color" runat="server" >Victim information</asp:Label>
                              <br />
                                <asp:ImageButton ID="vicreqimg" runat="server" Width="50" CssClass=" rounded-circle" ImageUrl="~/images/background/swirl_pattern.png" /> 
                                <asp:Label ID="VictimName" CssClass="lablefont color " runat="server" >NAME FROM DATABASE</asp:Label>
                                <br />
                                
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                  <asp:Label ID="ITEM" CssClass="lablefont color" runat="server">BOOKS FROM DATABASE</asp:Label>
                                <br /> 
                              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                
                                 <asp:Label ID="victimcontactno" CssClass="lablefont color" runat="server">CONtact no from database </asp:Label>
                                <br />
                               &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                               
                                 <asp:Label ID="victimemail" CssClass="lablefont color" runat="server">Email FROM DATABASE</asp:Label>
                              </div>  <br /><hr /> 
                              <h5 class="color">  your information : </h5> <hr />
                               
                                <asp:TextBox ID="yourContactno" runat="server" placeholder="Enter your contact no" CssClass="color form-control"> </asp:TextBox> 
                           <br />
                                <asp:TextBox ID="emailtxt" runat="server" placeholder="Enter your email" CssClass="color form-control"> </asp:TextBox> 
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

