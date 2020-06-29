<%@ Page Title="" Language="C#" MasterPageFile="~/MainAdminMaster.master" AutoEventWireup="true" CodeFile="EditTender.aspx.cs" Inherits="EditTender" %>

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
                        <li class="breadcrumb-item active"><a href="#">Tender</a></li>
                        <li class="breadcrumb-item disabled"><a href="#">Edit Tender</a></li>
                    </ol>
                </nav>
            </div>
        </div>

    

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT * FROM [tblTender]" DeleteCommand="DELETE FROM [tblTender] WHERE [Id] = @original_Id" InsertCommand="INSERT INTO [tblTender] ([Title], [PostedDate], [Link]) VALUES (@Title, @PostedDate, @Link)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [tblTender] SET [Title] = @Title, [PostedDate] = @PostedDate, [Link] = @Link WHERE [Id] = @original_Id" FilterExpression="Title LIKE '{0}%'">
        <DeleteParameters>
            <asp:Parameter Name="original_Id" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="PostedDate" Type="String" />
            <asp:Parameter Name="Link" Type="String" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="Title" Type="String" />
            <asp:Parameter Name="PostedDate" Type="String" />
            <asp:Parameter Name="Link" Type="String" />
            <asp:Parameter Name="original_Id" Type="Int32" />
        </UpdateParameters>
        <FilterParameters>
            <asp:ControlParameter Name="Notice" ControlID="tbsearch" PropertyName="Text" />
        </FilterParameters>
    </asp:SqlDataSource>


    <div class="row">
        <div class="container-fluid">
            <div class="card">
                <h4 class="card-header"><i class="fa fa-edit"></i>Edit Tender</h4>
                <div class="card-body">
                    <div class="" style="margin-top: 3em;">
                        <div class="form-inline my-2 my-lg-0">
                            <asp:TextBox ID="tbsearch" runat="server" class="form-control mr-sm-2" type="text" placeholder="Search by title" aria-label="Search"></asp:TextBox>

                            <asp:Button ID="btnsearch" runat="server" Text="Search" class="btn btn-outline-success my-2 my-sm-0" type="submit" />

                        </div>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="Grid container-fluid text-center" DataKeyNames="Id" DataSourceID="SqlDataSource1" OnPreRender="GridView1_PreRender">
                            <AlternatingRowStyle BackColor="#F0F0F0" />
                            <Columns>
                                <asp:CommandField ShowEditButton="True">
                                    <ControlStyle></ControlStyle>
                                </asp:CommandField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this entry? This can not be undone.');">Delete</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:BoundField DataField="Id" HeaderText="Id" SortExpression="Id" InsertVisible="False" ReadOnly="True" />
                                <asp:TemplateField HeaderText="Title" SortExpression="Title">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Title") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required" Text="*" CssClass="text-danger" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("Title") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="PostedDate" SortExpression="PostedDate">
                                    <EditItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("PostedDate") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("PostedDate") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Link" SortExpression="Link">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Link") %>'></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required" Text="*" CssClass="text-danger" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <a href='<%# Eval("Link") %>'>
                                            <asp:Label ID="Label2" runat="server" Text="Download"></asp:Label></a>
                                    </ItemTemplate>
                                </asp:TemplateField>
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

