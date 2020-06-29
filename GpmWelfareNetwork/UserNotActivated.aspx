<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserNotActivated.aspx.cs" Inherits="UserNotActivated" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        body {
            background: none;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="jumbotron-fluid">
        <div class="container">
            <h1 class="display-3 text-danger text-center" style="text-shadow: 3px 3px 2px rgba(255, 0, 0, 0.3);">Sorry!</h1>
            <p class="text-center text-danger display-4" style="font-size: xx-large;">We don't provide access without Authentication.</p>

        </div>
    </div>
    <br />
    <br />
    <div class="container">
        <div class="alert alert-danger alert-dismissible fade show" role="alert">
            <strong class="text-danger">Account not Acctivated!</strong> An E-mail has been sent to you, You should check it once  / <asp:LinkButton ID="LinkButton1" runat="server" data-toggle="collapse" href="#confirmIdentity" aria-expanded="false" aria-controls="confirmIdentity">  Resend Email?</asp:LinkButton>
  <button type="button" class="close" data-dismiss="alert" aria-label="Close">
      <span aria-hidden="true">&times;</span>
  </button>
        </div>
        <br />
        <div class="collapse"  id="confirmIdentity">
        <div class="form-inline">
            <div class="form-group">
                <asp:Label ID="lblEmail" runat="server" Text=""></asp:Label>
            </div>
            <div class="form-group mx-sm-3">
                <label for="inputPassword2" class="sr-only">Password</label>
                <asp:TextBox ID="tbPassword" runat="server" class="form-control" TextMode="Password" placeholder="Password"></asp:TextBox>
              <small><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Password is mandatory!" CssClass="text-danger" ControlToValidate="tbPassword"></asp:RequiredFieldValidator></small>  
            </div>
            <asp:Button ID="btnConfirmIdentity" runat="server" Text="Confirm identity" class="btn btn-outline-primary" OnClick="btnConfirmIdentity_Click" />
            
        </div>
        </div>


    </div>
</asp:Content>

