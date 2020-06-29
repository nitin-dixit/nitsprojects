<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="Answer.aspx.cs" Inherits="Answer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link href="css/QnaCss.css" rel="stylesheet" />
    <link href="https://getbootstrap.com/docs/3.3/components/" />
    
    <style>
        .panel5 {
        margin:auto;
        width:75%;

        }
        .p{
            box-shadow:10px 10px 66px 10px;
        }
       .m{
           margin-right:100px;
       }
    </style>
</asp:Content>

<asp:Content ID="Content2"  ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
         <div  class="text-light row"> 
    <div class="container ">
   <div class="  ">
   
            <asp:Panel ID="ansquepanel" CssClass="btn-block  questionslist form-control " runat="server" >
                <table class="w-100">
                    <tr>
                        <td>
                       
    <%--  asp:Button ID="plusbtn" Text="+"  OnClick="Plus_Click"  runat="server"  />
                       
                               <asp:Label ID="lblcount" ForeColor="White" runat="server" Text="29"></asp:Label>
                        <asp:Button ID="minbtm" Text="-" OnClick="min_Click" runat="server" CssClass="plusmin" />
                            --%>
                     
                               </td>
                        <td>
                            <div class="border ">
                                <div class="lbldescans">&nbsp;Question:</div> 
                            <asp:Label ID="lblque" runat="server" CssClass="quelabel" Text="WHAT IS .............">

                            </asp:Label>
                                <br />
                              <div class="lbldescans">Description:</div>  
                                    <asp:Label ID="lbldesc" runat="server" CssClass="desclbl" Text="description abou questions.........">

                                    </asp:Label>
                            </div>
                                </td>
                           
                    </tr>

                </table>
                <table class="imgname">
                    <tr>
                        <td>
  <asp:Label ID="ansusernamelbl" runat="server" CssClass="float-right" ForeColor="White" Text="firstname +lastname"></asp:Label>
            
                        </td>
                        <td>
                                 <asp:ImageButton ID="ansuserimage"  runat="server"  width="55" BackColor="Black" BorderColor="Black" CssClass="  float-right" />
          
                        </td>
                    </tr>
                </table>

                </asp:Panel>
        
           
        <div>
            <asp:Label ID="lblcountans" runat="server" Text=" answers">

            </asp:Label>
        </div>
        <asp:Panel ID="Answerlist" runat="server" >

        </asp:Panel>
        <asp:Panel ID="PostedAnswer" CssClass="postedanswer" runat="server"> </asp:Panel>
         
       <div class="pos " >
            <div>
    <input id="Answertxt" class="col-sm-12 bg-dark color" runat="server" type="text" />

       
                <span class="highlight"></span>
      <span class="bar"></span>
      <label>write a answer</label>     

            </div>

              <asp:Button ID="anssubmitbtn" OnClick="Post_Click" CssClass=" btn ansbtnpos btn-outline-success"    runat="server" Text="Post" />
   

       </div>
       </div>
        </div>
             </div>
</asp:Content>

