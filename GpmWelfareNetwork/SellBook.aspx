<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="SellBook.aspx.cs" Inherits="SellBook" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <style type="text/css">
        .centermargin {
    
              margin:auto;
            
        }

        .panel{
            box-shadow:3px 5px 100px 7px;
        }
        .color{
            color:white;
        }
        .font
        {
            font-size:30px;

        }
        #Panel4{
            background:rgba(23, 21, 21, 0.68);
        }
         .background {
              background-image:url(~/images/background/stamp.2e015244.png);
         }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <br /><br /><br />
      <div class="centermargin col-lg-4  ">
               <div class=" form-label font-weight-bold font  text-center ">Sell  Book</div>  
                   <asp:Panel ID="Panel4"   runat="server"  cssclass="rounded float-md-none panel  "      HorizontalAlign="Center" style=" background-color: #100606;  margin-bottom: 119px">

                       <br /><br /><br />
                
                   <div class="container  "> 
                       <div class=" ">

                           <div  class="card-header bg-light border-dark   " >
                               <asp:ImageButton ID="userimgsell" runat="server" CssClass="float-left rounded-circle " Width="50" ImageUrl="" />


                              <asp:Label ID="usernamesell" runat="server" CssClass="font-italic ">session username</asp:Label>
                                <br /><br />
                           </div>

                    
                 <div class="card-body  ">
                     <br />
                 <asp:Label ID="semlbl"  runat="server" CssClass="float-left color">Semester :</asp:Label>       
                     
                      <br />
                   <asp:DropDownList ID="DropDownList1" CssClass="form-control"    runat="server" >
                                  </asp:DropDownList>
                  
                 
                                           <br />
                     
                 
                     <div class=" form-control-label float-left color "> Books :</div><br />

                      <asp:TextBox ID="booksselltxt" placeholder="enter a list of book " runat="server" OnTextChanged="TextBox1_TextChanged" CssClass="form-control" ></asp:TextBox>
                      <br />
                      <div class="form-control-label float-left color"> Price :</div>
                      <br />
                      <asp:TextBox ID="priceselltxt" placeholder="Price " CssClass="form-control"  runat="server" OnTextChanged="priceselltxt_TextChanged"  TextMode="Number"></asp:TextBox>
                      
                       <br />
                       <div class="float-left form-control-label color">Contact NO:</div>
                       <br />
                      <asp:TextBox ID="contacttxt" placeholder="contact No" runat="server" CssClass="form-control" OnTextChanged="contacttxt_TextChanged" TextMode="Number"></asp:TextBox>
                       <br />
                      <div class="form-control-label float-left color">Email :</div>
                     <br />
                     <asp:Label ID="sellemailsession" runat="server" Font-Size="X-Large" CssClass="font-weight-bold color " ></asp:Label>                   <br />
                      </div>



                       <div class="card-footer   ">
                          <asp:Button ID="Button4" CssClass="active btn btn-block btn-secondary btn-outline-success" runat="server" OnClick="Button4_Click1" Text="SELL" />
                        <asp:Label ID="lblSellStatus" runat="server" CssClass="disabled" ></asp:Label>
                           
                            </div>
                  </div>
                           <br />
                        
                      
                     </div>

                       </asp:Panel>


</div>


</asp:Content>

