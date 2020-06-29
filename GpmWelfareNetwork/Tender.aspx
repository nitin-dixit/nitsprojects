<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Tender.aspx.cs" Inherits="Tender" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Tender</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="" id="jumbotron2">
  <blockquote class="blockquote ">
  <p class="mb-0 display-2 text-info text-center animated bounceInDown">Tenders</p>
      <br /> 
      <p class="text-center" style="font-family:'Times New Roman', Times, serif; font-size:xx-large">Find All Tenders Instantly</p>
       <br />  <br />
     </blockquote>
<div class="container">
 


       <div class="" style="margin-top:5em;">
        <div class="form-inline my-2 my-lg-0 row">
            <asp:TextBox ID="TextBox1" runat="server"  class="form-control  my-2 mr-sm-2" type="text" placeholder="Search by title" aria-label="Search"></asp:TextBox>
            
            <asp:Button ID="Button1" runat="server" Text="Search 🔍" class="btn btn-outline-success my-2 my-sm-0" type="submit"/>
          
        </div>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT * FROM [tblTender] ORDER BY [PostedDate] DESC" FilterExpression="Title LIKE '{0}%'" >
               <FilterParameters>
            <asp:ControlParameter Name="Notice" ControlID="TextBox1" PropertyName="Text" />
        </FilterParameters>
         </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="Grid container-fluid text-center" OnPreRender="GridView1_PreRender" DataKeyNames="Id">
            <AlternatingRowStyle BackColor="#F0F0F0" />
            <Columns>
               
                <asp:TemplateField HeaderText="Title" SortExpression="Title">
                   
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Posted Date" SortExpression="PostedDate">
                  
                    <ItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("PostedDate") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Download Link" SortExpression="Link">
                   
                    <ItemTemplate>
                        <a href='<%# Eval("Link") %>'><asp:Label ID="Label2" runat="server" Text="Download"></asp:Label></a>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <HeaderStyle BackColor="Black" ForeColor="White" />
            <PagerStyle BackColor="Black" ForeColor="White" />
        </asp:GridView>
          <div class="container">
            <asp:Label ID="LabelPageDisplay" runat="server"></asp:Label>
        </div>
    </div>
	</div>
     </div>

    
        
      
     
     
</asp:Content>

