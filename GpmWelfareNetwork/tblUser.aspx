<%@ Page Title="" Language="C#" MasterPageFile="~/MainAdminMaster.master" AutoEventWireup="true" CodeFile="tblUser.aspx.cs" Inherits="tblUser" %>

<asp:content id="Content1" contentplaceholderid="head" runat="Server">
      <link href="css/Gridstyle.css" rel="stylesheet" />
    <style type="text/css">
        @media screen (max-width: 768px){
           #GridView1{
               overflow-x:scroll;
               overflow-y:scroll;
               width:200px;
           }
        }
    </style>
</asp:content>
<asp:content id="Content2" contentplaceholderid="ContentPlaceHolder1" runat="Server">
      <div class="">
          <div class="">
              <div style="width:auto;">
                    <nav aria-label="breadcrumb" role="navigation">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="MainAdminProfile.aspx">Home</a></li>
                <li class="breadcrumb-item "><a href="#">View</a></li>
                <li class="breadcrumb-item"><a href="#">Table</a></li>
                <li class="breadcrumb-item active"><a href="#">tblUser</a></li>
            </ol>
        </nav>
              </div>
          </div>
      
   

      <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DBCS %>" SelectCommand="SELECT * FROM [tblUsers]" FilterExpression="EnrollmentNumber LIKE '{0}%'" DeleteCommand="DELETE FROM [tblUsers] WHERE [Uid] = @Uid" InsertCommand="INSERT INTO [tblUsers] ([FirstName], [LastName], [Gender], [Username], [Email], [MobileNumber], [EnrollmentNumber], [Branch], [CurrentYear], [CurrentSemester], [Password], [UserType], [CreatedDate]) VALUES (@FirstName, @LastName, @Gender, @Username, @Email, @MobileNumber, @EnrollmentNumber, @Branch, @CurrentYear, @CurrentSemester, @Password, @UserType, @CreatedDate)" UpdateCommand="UPDATE [tblUsers] SET [FirstName] = @FirstName, [LastName] = @LastName, [Gender] = @Gender, [Username] = @Username, [Email] = @Email, [MobileNumber] = @MobileNumber, [EnrollmentNumber] = @EnrollmentNumber, [Branch] = @Branch, [CurrentYear] = @CurrentYear, [CurrentSemester] = @CurrentSemester, [Password] = @Password, [UserType] = @UserType, [CreatedDate] = @CreatedDate WHERE [Uid] = @Uid">
          <DeleteParameters>
              <asp:Parameter Name="Uid" Type="Int32" />
          </DeleteParameters>
        <FilterParameters>
            <asp:ControlParameter Name="Notice" ControlID="tbsearch" PropertyName="Text" />
        </FilterParameters>

      

    </asp:SqlDataSource>

    <div class="row">
        <div class="container-fluid">
            <div class="card">
                <h4 class="card-header"><i class="fa fa-table"></i> tblUsers</h4>
                <div class="card-body">
                    <div class="" >
                        <div class="form-inline my-2 my-lg-0">
                            <asp:TextBox ID="tbsearch" runat="server" class="form-control mr-sm-2" type="text" placeholder="Search by EnrollmentNo" aria-label="Search"></asp:TextBox>

                            <asp:Button ID="btnsearch" runat="server" Text="Search" class="btn btn-outline-success my-2 my-sm-0" />

                        </div>
                        <asp:GridView ID="GridView1" runat="server" AllowPaging="True"  AllowSorting="True" AutoGenerateColumns="False" CssClass="Grid container-fluid text-center" DataKeyNames="Uid" DataSourceID="SqlDataSource1" OnPreRender="GridView1_PreRender" Width="300px" >
                            <AlternatingRowStyle BackColor="#F0F0F0" />
                            <Columns>
                                  <asp:TemplateField ShowHeader="False">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Delete" OnClientClick="return confirm('Are you sure you want to delete this entry? This can not be undone.');">Delete</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                <asp:BoundField DataField="Uid" HeaderText="Uid" InsertVisible="False" ReadOnly="True" SortExpression="Uid" />
                                <asp:BoundField DataField="FirstName" HeaderText="FName" SortExpression="FirstName" />
                                <asp:BoundField DataField="LastName" HeaderText="LName" SortExpression="LastName" />
                                <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                                <asp:BoundField DataField="Username" HeaderText="UName" SortExpression="Username" />
                                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="Email" />
                                <asp:BoundField DataField="MobileNumber" HeaderText="Mobile" SortExpression="MobileNumber" />
                                <asp:BoundField DataField="EnrollmentNumber" HeaderText="EnrollNumber" SortExpression="EnrollmentNumber" />
                                <asp:BoundField DataField="Branch" HeaderText="Branch" SortExpression="Branch" />
                                <asp:BoundField DataField="CurrentYear" HeaderText="CurrentYear" SortExpression="CurrentYear" />
                                <asp:BoundField DataField="CurrentSemester" HeaderText="CurrentSem" SortExpression="CurrentSemester" />
                               
                             
                               
                                <asp:BoundField DataField="CreatedDate" HeaderText="CreatedDate" SortExpression="CreatedDate" />
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
</asp:content>

