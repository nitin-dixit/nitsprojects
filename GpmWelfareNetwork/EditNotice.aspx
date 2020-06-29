<%@ Page Title="" Language="C#" MasterPageFile="~/MainAdminMaster.master" AutoEventWireup="true" CodeFile="EditNotice.aspx.cs" Inherits="EditNotice" %>

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
                <li class="breadcrumb-item active"><a href="#">Notice Board</a></li>
                <li class="breadcrumb-item disabled"><a href="#">Edit Notice</a></li>
            </ol>
        </nav>
            </div>
    </div>
           
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT * FROM [tblNoticeBoard]" DeleteCommand="DELETE FROM [tblNoticeBoard] WHERE [NoticeId] = @original_NoticeId" InsertCommand="INSERT INTO [tblNoticeBoard] ([NoticeTitle], [NoticeSubject], [Notice], [PostedDateTime]) VALUES (@NoticeTitle, @NoticeSubject, @Notice, @PostedDateTime)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [tblNoticeBoard] SET [NoticeTitle] = @NoticeTitle, [NoticeSubject] = @NoticeSubject, [Notice] = @Notice, [PostedDateTime] = @PostedDateTime WHERE [NoticeId] = @original_NoticeId" FilterExpression="NoticeTitle LIKE '{0}%'">
        <DeleteParameters>
            <asp:Parameter Name="original_NoticeId" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="NoticeTitle" Type="String" />
            <asp:Parameter Name="NoticeSubject" Type="String" />
            <asp:Parameter Name="Notice" Type="String" />
            <asp:Parameter Name="PostedDateTime" Type="DateTime" />
        </InsertParameters>
        <UpdateParameters>
            <asp:Parameter Name="NoticeTitle" Type="String" />
            <asp:Parameter Name="NoticeSubject" Type="String" />
            <asp:Parameter Name="Notice" Type="String" />
            <asp:Parameter Name="PostedDateTime" Type="DateTime" />
            <asp:Parameter Name="original_NoticeId" Type="Int32" />
        </UpdateParameters>
        <FilterParameters>
            <asp:ControlParameter Name="Notice" ControlID="tbsearch" PropertyName="Text" />
        </FilterParameters>
    </asp:SqlDataSource>


    <div class="row">
        <div class="container-fluid">
            <div class="card">
                <h4 class="card-header"><i class="fa fa-edit"></i>Edit Notice</h4>
                <div class="card-body">
                    <div class="" style="margin-top: 3em;">
                        <div class="form-inline my-2 my-lg-0">
                            <asp:TextBox ID="tbsearch" runat="server" class="form-control mr-sm-2" type="text" placeholder="Search by title" aria-label="Search"></asp:TextBox>

                            <asp:Button ID="btnsearch" runat="server" Text="Search" class="btn btn-outline-success my-2 my-sm-0" type="submit" />

                        </div>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="Grid container-fluid text-center" DataKeyNames="NoticeId" DataSourceID="SqlDataSource1" OnPreRender="GridView1_PreRender">
                            <AlternatingRowStyle BackColor="#F0F0F0" />
                            <Columns>
                                <asp:CommandField ShowEditButton="True">
                                    <ControlStyle></ControlStyle>
                                </asp:CommandField>
                                <asp:TemplateField ShowHeader="False">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this entry? This can not be undone.');" >Delete</asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                               
                                <asp:TemplateField HeaderText="Title" SortExpression="NoticeTitle">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("NoticeTitle") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label1" runat="server" Text='<%# Bind("NoticeTitle") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Subject" SortExpression="NoticeSubject">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("NoticeSubject") %>'></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("NoticeSubject") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Notice" SortExpression="Notice">
                                    <EditItemTemplate>
                                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Notice") %>' TextMode="MultiLine" Height="300px"></asp:TextBox>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Notice") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="Posted Date&amp;Time" InsertVisible="False" SortExpression="PostedDateTime">
                                    <EditItemTemplate>
                                        <asp:Label ID="Labels" runat="server" Text='<%# Bind("PostedDateTime") %>'></asp:Label>
                                    </EditItemTemplate>
                                    <ItemTemplate>
                                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("PostedDateTime") %>'></asp:Label>
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

