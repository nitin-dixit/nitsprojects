<%@ Page Culture="en-IN" Title="" Language="C#" MasterPageFile="~/AdminMaster.master" AutoEventWireup="true" CodeFile="AdminProfile.aspx.cs" Inherits="AdminProfile" %>

<asp:content id="Content1" contentplaceholderid="head" runat="Server">
    <link href="css/Gridstyle.css" rel="stylesheet" />
    <style type="text/css">
        @media screen (max-width: 768px) 
        {
            .gridview {
               width:400px;
                overflow-x:scroll;
                overflow-y:scroll;
            }
        }
    </style>
</asp:content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="Server">
    <div class="container" style="margin-top: 6em;">
        <div class="form-row container">
            <label class="col-sm-2 col-form-label">Department :</label>
            <div class="form-group col-md-7 mr-auto">
                <asp:DropDownList ID="DepartmentDdl" runat="server" CssClass="custom-select form-control">
                    <asp:ListItem>Computer Engineering</asp:ListItem>
                    <asp:ListItem>Mechanical Engineering</asp:ListItem>
                    <asp:ListItem>Electrical Engineering</asp:ListItem>
                    <asp:ListItem>Information Technology</asp:ListItem>
                </asp:DropDownList>

                <div class="form-group" style="margin-top: 2em;">
                    <asp:Button ID="btnShowDatabase" runat="server" Text="Show Database" CssClass="btn btn-outline-success text-center" OnClick="btnShowDatabase_Click" />
                </div>
                <br />
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT * FROM [tblLibraryBooks] WHERE ([Department] = @Department)" DeleteCommand="DELETE FROM [tblLibraryBooks] WHERE [Bid] = @original_Bid" InsertCommand="INSERT INTO [tblLibraryBooks] ([Bname], [AuthorName], [Price], [Publication], [Department]) VALUES (@Bname, @AuthorName, @Price, @Publication, @Department)" OldValuesParameterFormatString="original_{0}" UpdateCommand="UPDATE [tblLibraryBooks] SET [Bname] = @Bname, [AuthorName] = @AuthorName, [Price] = @Price, [Publication] = @Publication, [Department] = @Department WHERE [Bid] = @original_Bid" FilterExpression="Bname LIKE '{0}%'">
        <DeleteParameters>
            <asp:Parameter Name="original_Bid" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="Bname" Type="String" />
            <asp:Parameter Name="AuthorName" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="Publication" Type="String" />
            <asp:Parameter Name="Department" Type="String" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="DepartmentDdl" Name="Department" PropertyName="SelectedValue" Type="String" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="Bname" Type="String" />
            <asp:Parameter Name="AuthorName" Type="String" />
            <asp:Parameter Name="Price" Type="Decimal" />
            <asp:Parameter Name="Publication" Type="String" />
            <asp:Parameter Name="Department" Type="String" />
            <asp:Parameter Name="original_Bid" Type="Int32" />
        </UpdateParameters>
          <FilterParameters>
            <asp:ControlParameter Name="Department" ControlID="tbsearch" PropertyName="Text" />
        </FilterParameters>
    </asp:SqlDataSource>

    <div class="container" style="margin-top: 3em;">
        <div class="form-inline my-2 my-lg-0">
            <asp:TextBox ID="tbsearch" runat="server"  class="form-control mr-sm-2" type="text" placeholder="Search by name" aria-label="Search"></asp:TextBox>
            
            <asp:Button ID="btnsearch" runat="server" Text="Search" class="btn btn-outline-success my-2 my-sm-0" type="submit"/>
          
        </div>
        <div class="gridview">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="Bid" DataSourceID="SqlDataSource1" CssClass="Grid container-fluid text-center" ShowFooter="True" AllowPaging="True" AllowSorting="True" OnPreRender="GridView1_PreRender">
            <AlternatingRowStyle BackColor="#F0F0F0" />
            <Columns>
                <asp:CommandField ShowEditButton="True" />
                <asp:TemplateField ShowHeader="False">
                    <ItemTemplate>
                        <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this entry? This can not be undone.');">Delete</asp:LinkButton>
                        
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Book Id" InsertVisible="False" SortExpression="Bid">
                    <EditItemTemplate>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("Bid") %>'></asp:Label>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label2" runat="server" Text='<%# Bind("Bid") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:LinkButton ID="LinkButtonInsert" runat="server" OnClick="LinkButtonInsert_Click" ValidationGroup="Insert">Insert</asp:LinkButton>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Book Name" SortExpression="Bname">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Bname") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEditBname" runat="server" ErrorMessage="Required" Text="*" ForeColor="Red" ControlToValidate="TextBox1"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label3" runat="server" Text='<%# Bind("Bname") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tbBookName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Insert" ID="RequiredFieldValidatorInsertBname" runat="server" ErrorMessage="Required" Text="*" ForeColor="Red" ControlToValidate="tbBookName"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Author Name" SortExpression="AuthorName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("AuthorName") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEditAuthorName" runat="server" ErrorMessage="Required" Text="*" ForeColor="Red" ControlToValidate="TextBox2"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label4" runat="server" Text='<%# Bind("AuthorName") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tbAuthorName" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Insert" ID="RequiredFieldValidatorInsertAuthorName" runat="server" ErrorMessage="Required" Text="*" ForeColor="Red" ControlToValidate="tbAuthorName"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Price" SortExpression="Price">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Price") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEditPrice" runat="server" ErrorMessage="Required" Text="*" ForeColor="Red" ControlToValidate="TextBox3"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label5" runat="server" Text='<%# Bind("Price") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tbPrice" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Insert" ID="RequiredFieldValidatorInsertPrice" runat="server" ErrorMessage="Required" Text="*" ForeColor="Red" ControlToValidate="tbPrice"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Publication" SortExpression="Publication">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("Publication") %>'></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEditPublication" runat="server" ErrorMessage="Required" Text="*" ForeColor="Red" ControlToValidate="TextBox4"></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <asp:Label ID="Label6" runat="server" Text='<%# Bind("Publication") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:TextBox ID="tbPublication" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ValidationGroup="Insert" ID="RequiredFieldValidatorInsertPublication" runat="server" ErrorMessage="Required" Text="*" ForeColor="Red" ControlToValidate="tbPublication"></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Department" SortExpression="Department">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DropDownList3" runat="server" SelectedValue='<%# Bind("Department") %>'>
                            <asp:ListItem>Select Department...</asp:ListItem>
                            <asp:ListItem>Computer Engineering</asp:ListItem>
                            <asp:ListItem>Mechanical Engineering</asp:ListItem>
                            <asp:ListItem>Electrical Engineering</asp:ListItem>
                            <asp:ListItem>Information Technology</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEditDepartment" runat="server" ErrorMessage="Required" Text="*" ForeColor="Red" ControlToValidate="DropDownList3" InitialValue="Select Department..."></asp:RequiredFieldValidator>
                    </EditItemTemplate>
                    <ItemTemplate> 
                        <asp:Label ID="Label7" runat="server" Text='<%# Bind("Department") %>'></asp:Label>
                    </ItemTemplate>
                    <FooterTemplate>
                        <asp:DropDownList ID="DropDownList2" runat="server">
                            <asp:ListItem>Select Department...</asp:ListItem>
                            <asp:ListItem>Computer Engineering</asp:ListItem>
                            <asp:ListItem>Mechanical Engineering</asp:ListItem>
                            <asp:ListItem>Electrical Engineering</asp:ListItem>
                            <asp:ListItem>Information Technology</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ValidationGroup="Insert" ID="RequiredFieldValidatorInsertDepartment" runat="server" ErrorMessage="Required" Text="*" ForeColor="Red" ControlToValidate="DropDownList2" InitialValue="Select Department..."></asp:RequiredFieldValidator>
                    </FooterTemplate>
                </asp:TemplateField>
                
            </Columns>
            <EmptyDataTemplate>
                <div class="alert alert-danger alert-dismissible fade show" role="alert" style=" border-left: 8px solid #ff6a00; border-bottom: 2px solid #ff6a00; border-top: 2px solid #ff6a00;">
                    <div class="text-danger text-center">There is no data to display.</div>
                      <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                          <span aria-hidden="true">&times;</span>
                      </button>
                </div>
            </EmptyDataTemplate>
            <HeaderStyle BackColor="Black" ForeColor="White" />
            <PagerStyle BackColor="Black" ForeColor="White" />
        </asp:GridView>
        <div class="container">
            <asp:Label ID="LabelPageDisplay" runat="server"></asp:Label>
        </div>
        <div class="container text-center text-danger">
            <asp:Label ID="LabelRequiredField" runat="server"></asp:Label>
        </div>
        </div>

    </div>

</asp:content>

