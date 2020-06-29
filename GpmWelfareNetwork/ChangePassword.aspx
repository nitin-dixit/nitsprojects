<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="ChangePassword.aspx.cs" Inherits="ChangePassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .colorgraph {
            height: 5px;
            border-top: 0;
            background: #c4e17f;
            border-radius: 5px;
            background-image: -webkit-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
            background-image: -moz-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
            background-image: -o-linear-gradient(left, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
            background-image: linear-gradient(to right, #c4e17f, #c4e17f 12.5%, #f7fdca 12.5%, #f7fdca 25%, #fecf71 25%, #fecf71 37.5%, #f0776c 37.5%, #f0776c 50%, #db9dbe 50%, #db9dbe 62.5%, #c49cde 62.5%, #c49cde 75%, #669ae1 75%, #669ae1 87.5%, #62c2e4 87.5%, #62c2e4);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <div class="">
            <br />
            <br />
            <div class="row" id="main">

                <div class="col-md-3 well" id="leftPanel">
                    <div class="row">
                        <div class="col-md-12">
                            <div>
                                <asp:Image ID="imgProfilePic" runat="server" alt="profile pic" class="img-thumbnail" />

                                <h2 class="text-dark container">
                                    <asp:Label ID="LabelUsername" runat="server"></asp:Label></h2>

                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-md-9 well" id="rightPanel">
                    <div class="row">
                        <div class="col-md-12">

                            <h2><i class="li_key"></i> Change Password</h2>
                            <hr class="colorgraph">
                            <div class="row">
                                <div class="col-xs-12 col-sm-6 col-md-6">
                                    <div class="form-group">
                                        <asp:TextBox ID="tbOldPass" runat="server" class="form-control input-lg" placeholder="Old Password" TabIndex="1" TextMode="Password"></asp:TextBox>
                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6">
                                    <div class="form-group">

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatortbOldPass" runat="server" CssClass="text-danger" ErrorMessage="RequiredFieldValidator" ControlToValidate="tbOldPass" Text="Old Password is required."></asp:RequiredFieldValidator></small>
                                    </div>
                                </div>

                            </div>
                            <div class="row">
                                <div class="col-xs-12 col-sm-6 col-md-6">
                                    <div class="form-group">
                                        <asp:TextBox ID="tbNewPass" runat="server" class="form-control input-lg" placeholder="New Password" TabIndex="3" TextMode="Password"></asp:TextBox>

                                    </div>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-6">
                                    <div class="form-group">

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatortbNewPass" runat="server" CssClass="text-danger" ErrorMessage="RequiredFieldValidator" ControlToValidate="tbNewPass" Text="New Password is required."></asp:RequiredFieldValidator>


                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-12 col-sm-6 col-md-6">
                                    <div class="form-group">
                                        <asp:TextBox ID="tbConFirmNewPass" runat="server" class="form-control input-lg" placeholder="Confirm New Password" TabIndex="5" TextMode="Password"></asp:TextBox>

                                    </div>
                                </div>

                                <div class="col-xs-12 col-sm-6 col-md-6">
                                    <div class="form-group">

                                        <asp:RequiredFieldValidator ID="RequiredFieldValidatortbConFirmNewPass" CssClass="text-danger" runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="tbConFirmNewPass" Text="Confirm New Password is required."></asp:RequiredFieldValidator></small>

                                    </div>
                                </div>
                                <div class="container">
                                    <asp:Label ID="LabelError" runat="server" ></asp:Label>
                                </div>
                            </div>
                            <hr class="colorgraph">
                            <div class="row">
                                <div class="col-xs-12 col-md-6"></div>
                                <div class="col-xs-12 col-md-6">
                                    <asp:Button ID="btnChangePass" runat="server" Text="Change Password" class="btn btn-success btn-block btn-lg" OnClick="btnChangePass_Click" />


                                </div>
                            </div>

                        </div>
                    </div>
                </div>
            </div>

        </div>

    </div>


</asp:Content>

