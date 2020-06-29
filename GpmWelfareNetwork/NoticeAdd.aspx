<%@ Page Title="" Language="C#" MasterPageFile="~/MainAdminMaster.master" AutoEventWireup="true" CodeFile="NoticeAdd.aspx.cs" Inherits="NoticeAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="">
        <div class="">
            <div>
                <nav aria-label="breadcrumb" role="navigation">
                    <ol class="breadcrumb">
                        <li class="breadcrumb-item"><a href="MainAdminProfile.aspx">Home</a></li>
                        <li class="breadcrumb-item "><a href="#">Notice Board</a></li>
                        <li class="breadcrumb-item disabled"><a href="#">Add Notice</a></li>

                    </ol>
                </nav>
            </div>
        </div>

        <div class="row">
            <div class="container-fluid">
                <div class="card">
                    <div class="card-header display-4 bg-dark text-white" style="font-size: x-large;">
                        <i class="fa fa-plus-square"></i> Add Notice
                    </div>
                    <div class="card-body">
                        <div class="form-group row">
                            <asp:Label ID="Label1" runat="server" Text="Title" class="col-sm-2 col-form-label"></asp:Label>

                            <div class="col-sm-10">
                                <asp:TextBox ID="tbTitle" runat="server" class="form-control" placeholder="Notice Title..."></asp:TextBox>
                                <small class="text-danger">
                                    <asp:RequiredFieldValidator ID="rfvTitle" runat="server" ErrorMessage="Title is Required!" ControlToValidate="tbTitle"></asp:RequiredFieldValidator>
                                </small>
                            </div>
                        </div>

                        <div class="form-group row">
                            <asp:Label ID="Label2" runat="server" Text="Subject" class="col-sm-2 col-form-label"></asp:Label>
                            <div class="col-sm-10">
                                <asp:TextBox ID="tbSubject" runat="server" class="form-control" placeholder="Notice Subject..."></asp:TextBox>
                                <small class="text-danger">
                                    <asp:RequiredFieldValidator ID="rfvSubject" runat="server" ErrorMessage="Subject is Required!" ControlToValidate="tbSubject"></asp:RequiredFieldValidator>
                                </small>
                            </div>
                        </div>

                        <div class="form-group row">
                            <asp:Label ID="Label3" runat="server" Text="Notice" class="col-sm-2 col-form-label"></asp:Label>

                            <div class="col-sm-10">
                                <asp:TextBox ID="tbNotice" runat="server" CssClass="form-control" placeholder="Notice..." TextMode="MultiLine"></asp:TextBox>
                                <small class="text-danger">
                                    <asp:RequiredFieldValidator ID="rfvNotice" runat="server" ErrorMessage="Notice is Required!" ControlToValidate="tbNotice"></asp:RequiredFieldValidator>
                                </small>
                            </div>
                        </div>

                        <div class="form-group row">
                            <div class="col-sm-6">
                                <asp:Button ID="btnAddNotice" runat="server" Text="Submit" class="btn btn-outline-primary" OnClick="btnAddNotice_Click" Style="border-radius: 2rem;" />
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
                    <div class="card-header display-4 bg-dark text-white" style="font-size: x-large;"><i class="fa fa-list-ol"></i> Notices</div>
                    <div class="card-body">
                        <div class="">
                            <div class="">
                                <asp:Repeater ID="rptrNotices" runat="server">
                                    <HeaderTemplate>
                                        <table class="table table-hover table-bordered table-responsive-lg table-responsive-xl table-sm">
                                            <thead class="thead-dark">
                                                <tr>
                                                    <th scope="col">#</th>
                                                    <th scope="col">Title</th>
                                                    <th scope="col">Subject</th>
                                                    <th scope="col">Notice</th>
                                                    <th scope="col">Posted Date & Time</th>
                                                </tr>
                                            </thead>
                                    </HeaderTemplate>
                                    <ItemTemplate>
                                        <tr>
                                            <th scope="row">*
                                       
                                            </th>
                                            <td>
                                                <asp:Label ID="LblTitle" runat="server" Text='<%#Eval("NoticeTitle") %>'></asp:Label>
                                            </td>
                                            <td>
                                                <asp:Label ID="lblSubject" runat="server" Text='<%#Eval("NoticeSubject") %>'></asp:Label></td>
                                            <td>
                                               <asp:Label ID="lblNotice" runat="server" Text='<%#Eval("Notice") %>'></asp:Label></td>
                                            <td>
                                                <asp:Label ID="lblDateTime" runat="server" Text='<%#Eval("PostedDateTime") %>'></asp:Label></td>
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

