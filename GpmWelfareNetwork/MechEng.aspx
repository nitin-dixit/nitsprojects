<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MechEng.aspx.cs" Inherits="MechEng" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Mechanical Engineering - GPMZR</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <h2 class="display-4">Mechanical Engineering :
            <asp:Image runat="server" ImageUrl="~/images/Mechanical.png" class="img-fluid" alt="Computer Image" Height="200" ImageAlign="Middle" />
        </h2>

        <br />

        <br />
        <div id="accordion" role="tablist">
            <div class="card">
                <div class="card-header" role="tab" id="headingOne">
                    <h5 class="mb-0">
                        <a data-toggle="collapse" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">Introduction
                        </a>
                    </h5>
                </div>

                <div id="collapseOne" class="collapse" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion">
                    <div class="card-body">
                        <div class="accordion-content default-closed clearfix">
                            <p style="text-align: justify;">Write your College/School Introduction…….</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" role="tab" id="headingTwo">
                    <h5 class="mb-0">
                        <a class="collapsed" data-toggle="collapse" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">Staff Profile	
                        </a>
                    </h5>

                </div>
                <div id="collapseTwo" class="collapse" role="tabpanel" aria-labelledby="headingTwo" data-parent="#accordion">
                    <div class="card-body">
                        <div class="accordion-content default-closed clearfix">
                            <p style="text-align: justify;">Write your College/School Staff Profile…….</p>
                        </div>

                    </div>

                </div>
            </div>
            <div class="card">
                <div class="card-header" role="tab" id="headingThree">
                    <h5 class="mb-0">
                        <a class="collapsed" data-toggle="collapse" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">Lab Details
                        </a>
                    </h5>
                </div>
                <div id="collapseThree" class="collapse" role="tabpanel" aria-labelledby="headingThree" data-parent="#accordion">
                    <div class="card-body">
                        <div class="accordion-content default-closed clearfix">
                            <p style="text-align: justify;">Write your College/School Lab Details......</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" role="tab" id="headingFour">
                    <h5 class="mb-0">
                        <a data-toggle="collapse" href="#collapseFour" aria-expanded="false" aria-controls="collapseFour">Achievements
                        </a>
                    </h5>
                </div>

                <div id="collapseFour" class="collapse" role="tabpanel" aria-labelledby="headingFour" data-parent="#accordion">
                    <div class="card-body">
                        <div class="accordion-content default-closed clearfix">
                            <p style="text-align: justify;">Write your College/School Achievements…….</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" role="tab" id="headingFive">
                    <h5 class="mb-0">
                        <a class="collapsed" data-toggle="collapse" href="#collapseFive" aria-expanded="false" aria-controls="collapseFive">Activities
                        </a>
                    </h5>
                </div>
                <div id="collapseFive" class="collapse" role="tabpanel" aria-labelledby="headingFive" data-parent="#accordion">
                    <div class="card-body">
                        <div class="accordion-content default-closed clearfix">
                            <p style="text-align: justify;">Write your College/School Activities…….</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" role="tab" id="headingSix">
                    <h5 class="mb-0">
                        <a class="collapsed" data-toggle="collapse" href="#collapseSix" aria-expanded="false" aria-controls="collapseSix">Industrial Visit
                        </a>
                    </h5>
                </div>
                <div id="collapseSix" class="collapse" role="tabpanel" aria-labelledby="headingSix" data-parent="#accordion">
                    <div class="card-body">
                        <div class="accordion-content default-closed clearfix">
                            <p style="text-align: justify;">Write your College/School Industrial Visit…….</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" role="tab" id="headingSeven">
                    <h5 class="mb-0">
                        <a class="collapsed" data-toggle="collapse" href="#collapseSeven" aria-expanded="false" aria-controls="collapseSeven">Events
                        </a>
                    </h5>
                </div>
                <div id="collapseSeven" class="collapse" role="tabpanel" aria-labelledby="headingSeven" data-parent="#accordion">
                    <div class="card-body">
                        <div class="accordion-content default-closed clearfix">
                            <p style="text-align: justify;">To be added....</p>
                        </div>
                    </div>
                </div>
            </div>
            <div class="card">
                <div class="card-header" role="tab" id="headingEight">
                    <h5 class="mb-0">
                        <a class="collapsed" data-toggle="collapse" href="#collapseEight" aria-expanded="false" aria-controls="collapseEight">Syllabus
                        </a>
                    </h5>
                </div>
                <div id="collapseEight" class="collapse" role="tabpanel" aria-labelledby="headingEight" data-parent="#accordion">
                    <div class="card-body">
                        <div class="accordion-content default-closed clearfix">
                            <p style="text-align: justify;">To be added....</p>
                        </div>
                    </div>


                </div>
            </div>
            <div class="card">
                <div class="card-header" role="tab" id="headingNine">
                    <h5 class="mb-0">
                        <a class="collapsed" data-toggle="collapse" href="#collapseNine" aria-expanded="false" aria-controls="collapseNine">Notes
                        </a>
                    </h5>
                </div>
                <div id="collapseNine" class="collapse" role="tabpanel" aria-labelledby="headingNine" data-parent="#accordion">
                    <div class="card-body">
                        <div class="accordion-content default-closed clearfix">
                            <p style="text-align: justify;">To be added....</p>
                        </div>
                    </div>


                </div>
            </div>
        </div>
    </div>
</asp:Content>

