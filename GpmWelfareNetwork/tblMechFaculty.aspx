<%@ Page Title="" Language="C#" MasterPageFile="~/MainAdminMaster.master" AutoEventWireup="true" CodeFile="tblMechFaculty.aspx.cs" Inherits="tblMechFaculty" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
     <link href="css/Gridstyle.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="">
        <div class="">
            <div>
                <nav aria-label="breadcrumb" role="navigation">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="MainAdminProfile.aspx">Home</a></li>
                        <li class="breadcrumb-item "><a href="#">Manage</a></li>
                        <li class="breadcrumb-item"><a href="#">Table</a></li>
                        <li class="breadcrumb-item active"><a href="#">tblMechFaculty</a></li>
                    </ol>
                </nav>
            </div>
        </div>



        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT * FROM [tblMechFaculty]" FilterExpression="Fname LIKE '{0}%'" DeleteCommand="DELETE FROM [tblMechFaculty] WHERE [Fid] = @Fid" InsertCommand="INSERT INTO [tblMechFaculty] ([Fname], [Email]) VALUES (@Fname, @Email)" UpdateCommand="UPDATE [tblMechFaculty] SET [Fname] = @Fname, [Email] = @Email WHERE [Fid] = @Fid">
            <DeleteParameters>
                <asp:Parameter Name="Fid" Type="Int32" />
            </DeleteParameters>
            <FilterParameters>
                <asp:ControlParameter Name="Notice" ControlID="tbsearch" PropertyName="Text" />
            </FilterParameters>
            <InsertParameters>
                <asp:Parameter Name="Fname" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="Fname" Type="String" />
                <asp:Parameter Name="Email" Type="String" />
                <asp:Parameter Name="Fid" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

        <div class="row">
            <div class="container-fluid">
                <div class="card">
                    <h4 class="card-header"><i class="fa fa-table"></i>tblMechFaculty</h4>
                    <div class="card-body">
                        <div class="" style="margin-top: 3em;">
                            <div class="form-inline my-2 my-lg-0">
                                <asp:TextBox ID="tbsearch" runat="server" class="form-control mr-sm-2" type="text" placeholder="Search by Fname" aria-label="Search"></asp:TextBox>

                                <asp:Button ID="btnsearch" runat="server" Text="Search" class="btn btn-outline-success my-2 my-sm-0" type="submit" />

                            </div>
                            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" ShowFooter="True" AllowSorting="True" AutoGenerateColumns="False" CssClass="Grid container-fluid text-center" DataKeyNames="Fid" DataSourceID="SqlDataSource1" OnPreRender="GridView1_PreRender">
                                <AlternatingRowStyle BackColor="#F0F0F0" />
                                <Columns>
                                    <asp:CommandField   ShowEditButton="True" />
                                      <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this entry? This can not be undone.');">Delete</asp:LinkButton>

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Fid" InsertVisible="False" SortExpression="Fid">
                                        
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Fid") %>'></asp:Label>
                                        </ItemTemplate>
                                         <FooterTemplate>
                                            <asp:LinkButton ID="LinkButtonInsert" runat="server" OnClick="LinkButtonInsert_Click" ValidationGroup="Insert">Insert</asp:LinkButton>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Fname" SortExpression="Fname">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Fname") %>'></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidatoreditFname" runat="server" ErrorMessage="Required" Text="*" ForeColor="Red" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Fname") %>'></asp:Label>
                                        </ItemTemplate>
                                        <FooterTemplate> 
                                            <asp:TextBox ID="tbFname" runat="server"></asp:TextBox>
                                            <asp:RequiredFieldValidator ValidationGroup="Insert" ID="RequiredFieldValidatorInsertFname" runat="server" ErrorMessage="Required" Text="*" ForeColor="Red" ControlToValidate="tbFname"></asp:RequiredFieldValidator>
                                        </FooterTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Email" SortExpression="Email">
                                        <EditItemTemplate>
                                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Email") %>'></asp:TextBox>
                                             <asp:RequiredFieldValidator ID="RequiredFieldValidatorEditEmail" runat="server" ErrorMessage="Required" Text="*" ForeColor="Red" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                                        </EditItemTemplate>
                                        <ItemTemplate>
                                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("Email") %>'></asp:Label>
                                        </ItemTemplate>
                                          <FooterTemplate>
                                            <asp:TextBox ID="tbEmail" runat="server" TextMode="Email"></asp:TextBox>
                                            <asp:RequiredFieldValidator ValidationGroup="Insert" ID="RequiredFieldValidatorInsertEmail" runat="server" ErrorMessage="Required" Text="*" ForeColor="Red" ControlToValidate="tbEmail"></asp:RequiredFieldValidator>
                                        </FooterTemplate>
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

