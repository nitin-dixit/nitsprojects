<%@ Page Title="" Language="C#" MasterPageFile="~/MainAdminMaster.master" AutoEventWireup="true" CodeFile="AddTender.aspx.cs" Inherits="AddTender" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        @media (max-width:768px) {
            .breadcrumb-item {
                font-size: medium;
            }

            a {
                font-size: medium;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <div class="">
        <div class="">
            <div>
                <nav aria-label="breadcrumb" role="navigation">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="MainAdminProfile.aspx">Home</a></li>
                        <li class="breadcrumb-item "><a href="#">Tender</a></li>
                        <li class="breadcrumb-item disabled"><a href="#">Add Tender</a></li>

                    </ol>
                </nav>
            </div>
        </div>

        <div class="row">
            <div class="container-fluid">
                <div class="card">
                    <div class="card-header display-4 bg-dark text-white" style="font-size: x-large;">
                        <i class="fa fa-plus-square"></i> Add Tender
                    </div>
                    <div class="card-body">
                        <div class="form-group row">
                            <asp:Label ID="Label1" runat="server" Text="Title" class="col-sm-2 col-form-label"></asp:Label>

                            <div class="col-sm-10">
                                <asp:TextBox ID="tbTitle" runat="server" class="form-control" placeholder="Tender Title..."></asp:TextBox>
                                <small class="text-danger">
                                    <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="Title is Required!" ControlToValidate="tbTitle"></asp:RequiredFieldValidator>
                                </small>
                            </div>
                        </div>

                        <div class="form-group row">
                            <asp:Label ID="Label2" runat="server" Text="Link" class="col-sm-2 col-form-label"></asp:Label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="tbLink" runat="server" class="form-control" placeholder="Download Link"></asp:TextBox>
                                <small class="text-danger">
                                    <asp:RequiredFieldValidator ID="rfvLink" runat="server" ErrorMessage="Link is Required!" ControlToValidate="tbLink"></asp:RequiredFieldValidator>
                                </small>
                            </div>
                        </div>

                      

                        <div class="form-group row">
                            <div class="col-sm-6">
                                <asp:Button ID="btnAddTender" runat="server" Text="Submit" class="btn btn-outline-primary" Style="border-radius: 2rem;" OnClick="btnAddTender_Click" />
                            </div>
                        </div>

                    </div>
                </div>
            </div>

        </div>
        <br />
        <div class="row">
            <div class="container-fluid">
                <div class="card">
                    <div class="card-header display-4 bg-dark text-white" style="font-size: x-large;"><i class="fa fa-list-ol"></i> Tenders</div>
                    <div class="card-body">
                        <div class="">
                            <div class="">
                                <asp:Repeater ID="rptrTender" runat="server">
                                    <HeaderTemplate>
                                        <table class="table table-hover table-bordered table-responsive-lg table-responsive-xl table-sm">
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th scope="col">#</th>
                                                     <th scope="col">Title</th>
                                                    <th scope="col">Posted Date</th>
                                                    <th scope="col">Download Link</th>
                                                 
                                                </tr>
                                            </thead>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <th scope="row">*
                                       
                                            </th>
                                            <td>
                                                <asp:Label ID="LblTitle" runat="server" Text='<%#Eval("Title") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblSubject" runat="server" Text='<%#Eval("PostedDate") %>'></asp:Label></td>
                                            <td>
                                              <a href='<%#Eval("Link") %>'> <asp:Label ID="lblNotice" runat="server" Text="Download"></asp:Label></a></td>
                                           </tr>
                                    </ItemTemplate>
                                    <FooterTemplate>
                                        </table>
                                    </FooterTemplate>
                                </asp:Repeater>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</asp:Content>

