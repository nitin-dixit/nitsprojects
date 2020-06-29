<%@ Page Title="" Language="C#" MasterPageFile="~/MainAdminMaster.master" AutoEventWireup="true" CodeFile="ElecFeedback.aspx.cs" Inherits="ElecFeedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <link href="css/Gridstyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="">
        <div class="">
            <div>
                <nav aria-label="breadcrumb" role="navigation">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="MainAdminProfile.aspx">Home</a></li>
                        <li class="breadcrumb-item "><a href="#">View</a></li>
                        <li class="breadcrumb-item"><a href="#">feedback</a></li>
                        <li class="breadcrumb-item active"><a href="#">Elec</a></li>
                    </ol>
                </nav>
            </div>
        </div>



    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT * FROM [tblElecFeedback]" FilterExpression="FacultyName LIKE '{0}%'">
        <FilterParameters>
            <asp:ControlParameter Name="Notice" ControlID="tbsearch" PropertyName="Text" />
        </FilterParameters>
    </asp:SqlDataSource>

    <div class="row">
        <div class="container-fluid">
            <div class="card">
                <h4 class="card-header"><i class="fa fa-wpforms"></i> Elec Feedback</h4>
                <div class="card-body">
                    <div class="" style="margin-top: 3em;">
                        <div class="form-inline my-2 my-lg-0">
                            <asp:TextBox ID="tbsearch" runat="server" class="form-control mr-sm-2" type="text" placeholder="Search by FacultyName" aria-label="Search"></asp:TextBox>

                            <asp:Button ID="btnsearch" runat="server" Text="Search" class="btn btn-outline-success my-2 my-sm-0" type="submit" />

                        </div>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="Grid container-fluid text-center" DataKeyNames="Fid" DataSourceID="SqlDataSource1" OnPreRender="GridView1_PreRender">
                            <AlternatingRowStyle BackColor="#F0F0F0" />
                            <Columns>
                                  <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this entry? This can not be undone.');" CssClass="btn btn-outline-light text-info">Delete</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                <asp:BoundField DataField="Fid" HeaderText="Fid" InsertVisible="False" ReadOnly="True" SortExpression="Fid" />
                                <asp:BoundField DataField="Sname" HeaderText="Sname" SortExpression="Sname" />
                                <asp:BoundField DataField="SenrollNo" HeaderText="SenrollNo" SortExpression="SenrollNo" />
                                <asp:BoundField DataField="FacultyName" HeaderText="FacultyName" SortExpression="FacultyName" />
                                <asp:BoundField DataField="Q1" HeaderText="Q1" SortExpression="Q1" />
                                <asp:BoundField DataField="Q2" HeaderText="Q2" SortExpression="Q2" />
                                <asp:BoundField DataField="Q3" HeaderText="Q3" SortExpression="Q3" />
                                <asp:BoundField DataField="Q4" HeaderText="Q4" SortExpression="Q4" />
                                <asp:BoundField DataField="Q5" HeaderText="Q5" SortExpression="Q5" />
                                <asp:BoundField DataField="FeedbackText" HeaderText="FeedbackText" SortExpression="FeedbackText" />
                            </Columns>
                            <EmptyDataTemplate>
                                <div class="alert alert-danger alert-dismissible fade show" role="alert" style="border-left: 8px solid #ff6a00; border-bottom: 2px solid #ff6a00; border-top: 2px solid #ff6a00;">
                                    <div class="text-danger text-center">There is no data to display.</div>
                                    <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                </div>
                            </EmptyDataTemplate>
                            <HeaderStyle BackColor="Black" ForeColor="White" />
                            <PagerStyle BackColor="Black" ForeColor="White" />
                        </asp:GridView>
                        <div class="">
                            <asp:Label ID="LabelPageDisplay" runat="server"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
            </div>
</asp:Content>

