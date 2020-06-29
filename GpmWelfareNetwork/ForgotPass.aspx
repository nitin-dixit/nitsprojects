<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ForgotPass.aspx.cs" Inherits="ForgotPass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Forgot Password!</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <div class="container Signin-page">
          <h2 class="display-4"> &nbsp Recover Password </h2>
            <hr />
       
          
        <br />
        <br />
        <br />
             <div class="form-group ">
                
                    <div class="form-group mx-sm-3">
                       

                        <div class="col-md-7">
                             <asp:Label ID="lblemail" runat="server" Text="Your E-mail :"></asp:Label>
                        <br />
                        
         
                    <asp:TextBox ID="tbEmailId" runat="server" CssClass="form-control " placeholder="Enter email" TextMode="Email"></asp:TextBox>
                        <small id="emailHelp" class="form-text text-muted">Please enter your E-mail address, we will send you the instructions to reset your password.</small>
                           
                        <br />
                           
                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorRecoverEmail" runat="server" ErrorMessage="E-mail field is required !" CssClass="text-danger" ControlToValidate="tbEmailId"></asp:RequiredFieldValidator>
                        <br />
                        <br />
                        <asp:Button ID="SendEmail" runat="server" Text="Send" CssClass="btn btn-info " OnClick="SendEmail_Click" />
                 &nbsp;&nbsp;
                             <asp:Label ID="lblRecoverPass" runat="server"></asp:Label>
                 </div>
                        </div>
                        
                 </div>
        
         
              
     
        
       
            </div>
  

</asp:Content>

