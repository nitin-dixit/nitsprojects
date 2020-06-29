<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="SearchPeople.aspx.cs" Inherits="SearchPeople" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

      <div class="btn-group col-md-7 m-3">
        <asp:TextBox  ID="searchusertxt" placeholder="Search " runat="server"   CssClass="form-control col-lg-12 col-sm-1 quesearch"></asp:TextBox>

            <div class="btn  searchbtn btn-info btn-outline-info" > <asp:LinkButton ID="LinkButton1" ForeColor="Black" OnClick="usersearch_click" Text="search" runat="server"></asp:LinkButton></div>
       
</div>

    <br />

    <asp:Panel ID="user" runat="server">


    </asp:Panel>

</asp:Content>

