<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="Questions.aspx.cs" Inherits="Questions" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
        <link href="css/QnaCss.css" rel="stylesheet" />
    <style>
        .panel5 {
        margin:auto;
        width:75%;

        }
        .p{
            box-shadow:10px 10px 66px 10px;
        }
       .quesearch
{
margin:auto;
  border-bottom-left-radius:20px;
  border-top-left-radius:20px;
  height:40px;

  
  border-color:black;
}
       .searchbtn{
           border-color:black;
            border-bottom-right-radius:20px;
            border-top-right-radius:20px;
            float:right;
            
       }
       .searchlgpos
       {
           margin:auto;
       }
       .color{
           color:white;
       }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   <br />
    <div class="">
     <div>
         <div class="card-header askdiv col-lg-7   ">
            <a href="#" title="click here">  <div data-toggle="collapse" href="#POSTQUESTIONS"  class="btn-block askaquestionlabel" aria-controls="POSTQUESTIONS">
             ASK A QUESTIONS  ?
                </div> </a> 
        </div>
          
        

        <div class="card-body collapse col-sm-1 col-lg-12 col-md-1  " id="POSTQUESTIONS">

           
            
<asp:Panel ID="mainpanel" runat="server" CssClass="alert-dark bg-dark   mainpanel col-lg-6 col-sm-12 ">
    <div class="group ">
        
        <asp:ImageButton ID="Qnauserimage" CssClass=" bg-dark " Width="70" runat="server" ImageUrl="~/images/background/swirl_pattern.png" />
        <asp:Label ID="Qnausernamelbl" CssClass="Userlabel" ForeColor="White" runat="server" Text="First NAME + LAST NAME"></asp:Label>
   

    </div>

      <div>
  <div class="group">      
     
    <input id="txtquestions" class="col-sm-12 bg-dark color"  runat="server" type="text" required="required" />
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>questions</label>
    </div>
        
            <div class="group">      
     
    <input id="Descriptiontxt" class="col-sm-12 bg-dark color" runat="server" type="text" required="required" />
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>description</label>
    </div>

            
            <div class="group">      
     
    <input id="Tagxtxt" class="col-sm-12 bg-dark color" runat="server" type="text" required="required" />
      <span class="highlight"></span>
      <span class="bar"></span>
      <label>Tags</label>
    </div>
        <br /><br />
           </div>
    <br />
     
        <div class="card-footer bg-dark">
              <asp:Button ID="postquestionbtn" OnClick=" postquestionbtn_Click" CssClass=" btn-outline-success  float-right" ForeColor="White" runat="server" Text="POST" />
  <br /><br />
                </div>
                 

     
</asp:Panel>

        </div>



</div>
        <br />
         <div class="btn-group col-md-7 m-3">
        <asp:TextBox  ID="searchquetxt" placeholder="Search " runat="server"   CssClass="form-control col-lg-12 col-sm-1 quesearch"></asp:TextBox>

            <div class="btn  searchbtn btn-info btn-outline-info" > <asp:LinkButton ID="LinkButton1" ForeColor="Black" OnClick="quesearch_click" Text="search" runat="server"></asp:LinkButton></div>
       
</div><br />
        <div>
            <asp:Panel ID="Questionspanel" CssClass="quelistmargin col-lg-7 col-sm-12"  runat="server">
                <br />

     
            </asp:Panel>
        </div>
        </div>
</asp:Content>

