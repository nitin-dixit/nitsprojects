<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RecoverPass.aspx.cs" Inherits="RecoverPass" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Recover Password ! </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container Signin-page">
          <h2 class="display-4"> &nbsp Reset Password </h2>
            <hr />
        <asp:Label ID="lblunauthenticatedUserMsg" runat="server" CssClass="col-md-7 text-danger" Font-Size="XX-Large"></asp:Label>
          
        <br />
        <br />
        <br />
             <div class="form-group ">
                
                    
                       <div class="container">
                     
                        <div class="col-md-7">
                             <asp:Label ID="lblNewPass" runat="server" Text="Enter A New Password:" Visible="False"></asp:Label>
                        <br />
                        
         
                    <asp:TextBox ID="tbNewPass" runat="server" CssClass="form-control " placeholder="New Password" TextMode="Password" Visible="False"></asp:TextBox>
                     <asp:RequiredFieldValidator ID="RequiredFieldValidatorNewPass" runat="server" ErrorMessage="Password field is required !" CssClass="text-danger" ControlToValidate="tbNewPass" Visible="False"></asp:RequiredFieldValidator>
                        <br />
                            <br />
                       
                            
                             <asp:Label ID="lblConfirmNewPass" runat="server" Text="Confirm New Password:" Visible="False"></asp:Label>
                        <br />
                             <asp:TextBox ID="tbConfirmNewPass" runat="server" CssClass="form-control " placeholder="Confirm Password " TextMode="Password" Visible="False"></asp:TextBox>
                      
                           
                      
                          
                            <asp:CompareValidator ID="CompareValidatorPass" runat="server" ErrorMessage="Passwords don't match!" CssClass="text-danger" ControlToCompare="tbNewPass" ControlToValidate="tbConfirmNewPass"></asp:CompareValidator>
                        <br />
                            <br />
                       
                        <asp:Button ID="btnResetPass" runat="server" Text="Reset Password" CssClass="btn btn-info " Visible="False" OnClick="btnResetPass_Click"  />
                 &nbsp;&nbsp;
                           
                             
                 </div>
                        </div>
                        
                 </div>
        
         
              
     
        
       
         
        </div>

</asp:Content>

