<%@ Page Title="" Language="C#" MasterPageFile="~/MainAdminMaster.master" AutoEventWireup="true" CodeFile="MainAdminProfile.aspx.cs" Inherits="MainAdminProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style>
        @media (max-width:768px) {
            .card-title {
                font-size: medium;
            }

            .card-body {
                font-size: medium;
            }
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
   
    <div class="">
        <div class="card " style="border-top: none;">
            <div class="card-heading bg-dark">
                <h3 class="card-title text-light text-center display-4"><i class="fa fa-dashboard fa-lg"></i> Dashboard</h3>
            </div>
            <div class="card-body">
                <div class="">
                    <div class="row">
                        <div class="col-md-3">
                            <div class="text-center card border border-dark bg-light">
                                <h2><i class="fa fa-users" aria-hidden="true" ></i>
                                    <asp:Label ID="lblUserCount" runat="server" Text=""></asp:Label>
                                </h2>
                                <h4>Total Users</h4>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="text-center card border border-dark  bg-light">
                                <h2><span class="fa fa-male" aria-hidden="true"></span>
                                    <asp:Label ID="lblMaleCount" runat="server" Text="Label"></asp:Label></h2>
                                <h4>Male</h4>
                            </div>
                        </div>
                        <div class="col-md-3">
                            <div class="text-center card border border-dark  bg-light">
                                <h2><span class="fa fa-female" aria-hidden="true"></span>
                                    <asp:Label ID="lblFemaleCount" runat="server" Text="Label"></asp:Label></h2>
                                <h4>Female</h4>
                            </div>
                        </div>
                        <div class="col-md-3 ">
                            <div class="text-center card border border-dark  bg-light">
                                <h2><span class="li li_user" aria-hidden="true"></span>
                                    <asp:Label ID="lblOtherCount" runat="server" Text="Label"></asp:Label></h2>
                                <h4>Other</h4>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>


    <%--   <div class="row">
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-sm-3">
                                    <i class="fa fa-comments fa-5x"></i>
                                </div>
                                <div class="col-sm-9 text-right">
                                    <div class="huge">26</div>
                                    <div>New Comments!</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-green">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-sm-3">
                                    <i class="fa fa-tasks fa-5x"></i>
                                </div>
                                <div class="col-sm-9 text-right">
                                    <div class="huge">12</div>
                                    <div>New Tasks!</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-yellow">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-sm-3">
                                    <i class="fa fa-shopping-cart fa-5x"></i>
                                </div>
                                <div class="col-sm-9 text-right">
                                    <div class="huge">124</div>
                                    <div>New Orders!</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6">
                    <div class="panel panel-red">
                        <div class="panel-heading">
                            <div class="row">
                                <div class="col-sm-3">
                                    <i class="fa fa-support fa-5x"></i>
                                </div>
                                <div class="col-sm-9 text-right">
                                    <div class="huge">13</div>
                                    <div>Support Tickets!</div>
                                </div>
                            </div>
                        </div>
                        <a href="#">
                            <div class="panel-footer">
                                <span class="pull-left">View Details</span>
                                <span class="pull-right"><i class="fa fa-arrow-circle-right"></i></span>
                                <div class="clearfix"></div>
                            </div>
                        </a>
                    </div>
                </div>
            </div>
            <!-- /.row -->
            <div class="row">--%>
</asp:Content>

