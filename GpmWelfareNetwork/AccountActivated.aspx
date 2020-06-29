<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AccountActivated.aspx.cs" Inherits="AccountActivated" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Account Activated</title>
    <meta http-equiv="refresh" content="5;url=LogIn.aspx" />
    <style type="text/css">
        body,html{
            background:none;
            background-image:none;
        }
        
       
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server"> 
      <div class="jumbotron jumbotron-fluid" id="jumbotron1">
  <div class="container">
  <blockquote class="blockquote text-center">
  <p class="mb-0 display-4 text-light" style="font-size:larger;">Congratulations!<br /> Account Successfully activated...</p>
      </blockquote>
       <div class="mb-0 display-4 text-center text-light" style="font-size:medium;">You will now be redirected to SignIn Page in 5 seconds...</div>
        
    </div>
      </div>
    <asp:Label ID="lblUnactiveUserMsg" runat="server" Text="" CssClass="text-center text-danger align-items-center"></asp:Label>
       
</asp:Content>

