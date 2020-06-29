<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="HelperPage.aspx.cs" Inherits="HelperPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link href="css/Gridstyle.css" rel="stylesheet" />
    <link href="css/UserStyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <div class="container" style="margin-top:5em;"> 
          <div class="form-inline my-2 my-lg-0">
            <asp:TextBox ID="TextBox1" runat="server"  class="form-control mr-sm-2" type="text" placeholder="Search by name" aria-label="Search"></asp:TextBox>
            
            <asp:Button ID="Button1" runat="server" Text="Search" class="btn btn-outline-success my-2 my-sm-0" type="submit" OnClick="Button1_Click"/>   <!----------OnClick="Button1_Click"/>------------->
          
        </div>
       
        <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource3" CssClass="Grid container-fluid text-center" OnPreRender="GridView1_PreRender" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False">
            <Columns>
                 <asp:BoundField DataField="Helpername" HeaderText="Helpername" SortExpression="Helpername" />
                <asp:BoundField DataField="ItemList" HeaderText="ItemList" SortExpression="ItemList" />
               
                <asp:BoundField DataField="Desitem" HeaderText="Desitem" SortExpression="Desitem" />
                <asp:BoundField DataField="Helpercontactno" HeaderText="Helpercontactno" SortExpression="Helpercontactno" />
                <asp:BoundField DataField="Helperemail" HeaderText="Helperemail" SortExpression="Helperemail" />
                 
                
            </Columns>
             <HeaderStyle BackColor="Black" ForeColor="White" />
            <PagerStyle BackColor="Black" ForeColor="White" />
        </asp:GridView>
    
          <div class="container">
            <asp:Label ID="LabelPageDisplay" runat="server"></asp:Label>
        </div>
     </div>
    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT [Helpername], [Itemlist], [Desitem], [Helpercontactno], [Helperemail],[Imagedata] FROM [Helper] ORDER BY [Itemlist]" FilterExpression="ItemList LIKE '{0}%'">
      <FilterParameters>
            <asp:ControlParameter Name="Department" ControlID="TextBox1" PropertyName="Text" />
        </FilterParameters>
    </asp:SqlDataSource>
    
</asp:Content>

