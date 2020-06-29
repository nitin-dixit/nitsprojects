<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="Lost.aspx.cs" Inherits="Lost" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <!------------  <style>
        .centermargin {
            margin: auto;
        }

        .panel {
            box-shadow: 15px 5px 100px 10px;
        }

        .color {
            color: red;
        }

        .font {
            font-size: 20px;
        }
    </style>------------------------>
      <link href="css/Gridstyle.css" rel="stylesheet" />
    <link href="css/UserStyle.css" rel="stylesheet" />


</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

  

    <div class="container" style="margin-top:5em;">
        <h1 class="display-4 text-center">GPM's Lost and Found System <i class="fa fa-mobile-phone" aria-hidden="true"></i></h1>
        <p class="text-center">
            The GPM's Lost & Found System allows students to post a report of the items lost in the campus. If any student find any missing item then they can also help the lost items owner to get it back just simply by giving details. It's for the betterment of students.
                   
        </p>
             
                      <br/> 
         <br/>
        <div class="row">

              

              <!-----------------------------------------REGISTER COMPLAIENT-------->
            <div class="leftmargin col-lg-4  " style="margin-right:250px;">

                <div class=" form-label font-weight-bold font">REGISTER COMPLAINT </div>



                <asp:Panel ID="Panel4" BackColor="" runat="server" CssClass="rounded float-md-none panel  " BackImageUrl="~/images/background/1954541.jpg" HorizontalAlign="Center" Style="margin-bottom: 119px">

                    <br />
            <br />
                 

                    <div class="container  ">
                        <div class=" ">

                            <div class="card-header bg-light border-dark  ">
                                <asp:ImageButton ID="userimgsell" runat="server" CssClass="float-left rounded-circle " Width="50" ImageUrl="" />


                                <asp:Label ID="usernamesell" runat="server" CssClass="font-italic ">session username</asp:Label>
                               <br/>
                                <br/>
                               
              
                            </div>
                            
                               

                            <div class="card-body  ">
                              
                                <asp:Label ID="semlbl" runat="server" CssClass="float-left color">Item Name :</asp:Label>
                                <asp:TextBox ID="lostitemtxt" placeholder="enter a specific item name " runat="server" OnTextChanged="TextBox1_TextChanged" CssClass="form-control"></asp:TextBox>
                             
                                <br />

                            

                                <div class=" form-control-label float-left color ">Discription :</div>
                                <br />

                                <asp:TextBox ID="discriptiontxt" placeholder="Discription " CssClass="form-control" runat="server" OnTextChanged="discriptiontxt_TextChanged" TextMode="MultiLine"></asp:TextBox>

                    
                          
                                 <!------------------------------------------------>
                                <div class="float-left form-control-label color">Contact NO:</div>
                               
                                <asp:TextBox ID="contacttxt" placeholder="contact No" runat="server" CssClass="form-control" TextMode="Number" Columns="10" MaxLength="10" Rows="10"  ></asp:TextBox>
                                <br />
                                <div class="form-control-label float-left color">Email :</div>
                              
                                <asp:Label ID="lostemailsession" runat="server" Font-Size="X-Large" CssClass="font-weight-bold color "></asp:Label>
                             
                            </div>



                            <div class="card-footer   ">
                                <asp:Button ID="Button4" CssClass="active btn btn-block btn-secondary btn-outline-success" runat="server" OnClick="Button4_Click1" Text="SUBMIT" />
                                <asp:Label ID="lblSellStatus" runat="server" CssClass="disabled"></asp:Label>

                            </div>

                        </div>

                    

                        
                    </div>

                </asp:Panel>


            </div>

            <!-----------------------------------------found somthing? tell us-------->

            <div class=" col-lg-4" ">
                 <div class="">

                <div class=" form-label font-weight-bold font">FOUND SOMETHING? Tell us! </div>



                <asp:Panel ID="Panel1" BackColor="" runat="server" CssClass="rounded float-md-none panel  " BackImageUrl="~/images/background/1954541.jpg" HorizontalAlign="Right" Style="margin-bottom: 119px">

                  
                  <br/>
                    <br>
                    <div class="container  ">
                        <div class=" ">

                            <div class="card-header bg-light border-dark  ">
                                <asp:ImageButton ID="ImageButton1" runat="server" CssClass="float-left rounded-circle " Width="50" ImageUrl="" />


                                <asp:Label ID="username" runat="server" CssClass="font-italic ">session username</asp:Label>
                                <br/>
                                  <br />
                              
                            </div>
                           

                            <div class="card-body  ">
                                <br />
                                <asp:Label ID="itemlbl" runat="server" CssClass="float-left color">Item Name :</asp:Label>
                                <asp:TextBox ID="ItemList" placeholder="enter a specific item name " runat="server" OnTextChanged="TextBox1_TextChanged" CssClass="form-control"></asp:TextBox>
                                <br />


                         

                                <div class=" form-control-label float-left color ">Discription :</div>
                                <br />

                                <asp:TextBox ID="DisItem" placeholder="Discription " CssClass="form-control" runat="server" OnTextChanged="discriptiontxt_TextChanged" TextMode="MultiLine"></asp:TextBox>

                            

               <div class="float-left form-control-label color">Contact NO:</div>
                                
                                <asp:TextBox ID="VictimCon" placeholder="contact No" runat="server" CssClass="form-control" OnTextChanged="contacttxt_TextChanged" TextMode="Number"></asp:TextBox>
                            
                                <div class="form-control-label float-left color">Email :</div>
                               
                                <asp:Label ID="Helperemail" runat="server" Font-Size="X-Large" CssClass="font-weight-bold color "></asp:Label>
                                <br />
                            </div>



                            <div class="card-footer   ">
                                <asp:Button ID="Btnsubmit" CssClass="active btn btn-block btn-secondary btn-outline-success" runat="server" OnClick="Btnsubmit_Click" Text="SUBMIT" />
                                <asp:Label ID="lblstatus" runat="server" CssClass="disabled"></asp:Label>

                            </div>

                        </div>

                  


                    </div>

                </asp:Panel>


            </div>
            </div>

            
            <!-----------------------------------------HELPER DETAIL-------->



           
            <!------------------------------>
         
                </div>
               
          
        <!------------ROW END------>
      
    </div>
    
 
    
    
</asp:Content>
