<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="NoticeBoard.aspx.cs" Inherits="NoticeBoard" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Notice Board</title>
      <link href="css/Gridstyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="NoticeBoard">
         <div class=" jumbotron-fluid">
        <div>
            <blockquote class="blockquote ">
                <p class="mb-0 display-2 text-info text-center animated bounceInDown">Notice Board</p>
                <br />
                <p class="text-center" style="font-family: 'Times New Roman', Times, serif; font-size: xx-large">See All Notices...</p>
                <br />
                <br />
                <div class="container">
                    <div class="row">
                        <div class="col-sm-6">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">Technical Quiz Competition</h4>
                                    <p class="card-text">State Level Technical Quiz Competition(Mechanical Engg. Group)</p>
                                    <a href="https://1drv.ms/b/s!Aon8YmRKRELqeP6P6m1mS5YHpWk" class="btn btn-block btn-info">Go</a>
                                </div>
                            </div>
                        </div>
                        <div class="col-sm-6">
                            <div class="card">
                                <div class="card-body">
                                    <h4 class="card-title">List of candidates</h4>
                                    <p class="card-text">List of Shortlisted candidates for interview at TATA MOTORS</p>
                                    <a href="http://gpmzr.ac.in/wp-content/uploads/2017/02/ASDF-909x1024.jpg" class="btn btn-block btn-info">Go</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </blockquote>
        </div>
    </div>
     <div class="container" style="margin-top:5em;">
        <div class="form-inline my-2 my-lg-0 row">
            <asp:TextBox ID="TextBox1" runat="server"  class="form-control mr-sm-2" type="text" placeholder="Search by name" aria-label="Search"></asp:TextBox>
            
            <asp:Button ID="Button1" runat="server" Text="Search 🔍" class="btn btn-outline-success my-2 my-sm-0" type="submit"/>
          
        </div>
         <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT [NoticeTitle], [NoticeSubject], [Notice], [PostedDateTime] FROM [tblNoticeBoard] ORDER BY [PostedDateTime] DESC" FilterExpression="NoticeTitle LIKE '{0}%'" >
               <FilterParameters>
            <asp:ControlParameter Name="Notice" ControlID="TextBox1" PropertyName="Text" />
        </FilterParameters>
         </asp:SqlDataSource>
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="Grid container-fluid text-center" OnPreRender="GridView1_PreRender">
            <AlternatingRowStyle BackColor="#F0F0F0" />
            <Columns>
                <asp:BoundField DataField="NoticeTitle" HeaderText="Notice Title" SortExpression="NoticeTitle" />
                <asp:BoundField DataField="NoticeSubject" HeaderText="Notice Subject" SortExpression="NoticeSubject" />
                <asp:BoundField DataField="Notice" HeaderText="Notice" SortExpression="Notice"/>
                <asp:BoundField DataField="PostedDateTime" HeaderText="Posted Date&Time" SortExpression="PostedDateTime" DataFormatString="{0:g}"/>
            </Columns>
            <HeaderStyle BackColor="Black" ForeColor="White" />
            <PagerStyle BackColor="Black" ForeColor="White" />
        </asp:GridView>
          <div class="container">
            <asp:Label ID="LabelPageDisplay" runat="server"></asp:Label>
        </div>
    </div>
    </div>
   
</asp:Content>

