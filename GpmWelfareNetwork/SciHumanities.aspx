<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="SciHumanities.aspx.cs" Inherits="SciHumanities" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <title>Science & Humanities - GPMZR</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="container">
        <div class="col row">
            <div class="col-6">
                <h2 class="display-4 text-center">Department Of Science &amp; Humanities</h2> 
            </div>
            <div class="col-6">
                 <asp:Image runat="server" ImageUrl="~/images/humanities.jpg" class="img-fluid" alt="Computer Image" Height="200" ImageAlign="Middle" />
            </div>

        </div>
        
           
       

        <br />

        <br />
        <div id="accordion" role="tablist">
            <div class="card">
                <div class="card-header" role="tab" id="headingOne">
                    <h5 class="mb-0">
                        <a data-toggle="collapse" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">Introduction
                        </a>
                    </h5>
                </div>

                <div id="collapseOne" class="collapse show" role="tabpanel" aria-labelledby="headingOne" data-parent="#accordion">
                    <div class="card-body">
                        <div class="accordion-content default-closed clearfix text-center"><h2 class="display-4">Introduction</h2><p>Established in the year 2009, the Department of&nbsp;General Science&nbsp; &amp; Humanities&nbsp; Department&nbsp; conducts teaching –learning&nbsp; process&nbsp; in different &nbsp;subjects like Basic Physics, Basic Chemistry, Basic Mathematics, English, Applied Physics, Applied Chemistry,&nbsp; Engineering Mathematics, Communication Skills, Development of Life Skills-I, Applied Mathematics&nbsp; as a part of curriculum&nbsp; of MSBTE, Mumbai to first year students of diploma engineering .</p></div>
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
                       <div class="accordion-content default-closed clearfix"><p style="text-align: justify;"></p><div id="tablepress-12_wrapper" class="dataTables_wrapper no-footer"><div class="dataTables_length" id="tablepress-12_length"><label>Show <select name="tablepress-12_length" aria-controls="tablepress-12" class=""><option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> entries</label></div><div id="tablepress-12_filter" class="dataTables_filter"><label>Search:<input type="search" class="" placeholder="" aria-controls="tablepress-12"></label></div><table id="tablepress-12" class="table table-bordered table-hover table-responsive-md" role="grid" aria-describedby="tablepress-12_info"><thead class="thead-dark"><tr class="row-1 odd" role="row"><th class="column-1 sorting" tabindex="0" aria-controls="tablepress-12" rowspan="1" colspan="1" aria-label="SR.NO: activate to sort column ascending" style="width: 106px;">SR.NO</th><th class="column-2 sorting" tabindex="0" aria-controls="tablepress-12" rowspan="1" colspan="1" aria-label="NAME OF FACULTY: activate to sort column ascending" style="width: 281px;">NAME OF FACULTY</th><th class="column-3 sorting" tabindex="0" aria-controls="tablepress-12" rowspan="1" colspan="1" aria-label="E-MAIL ID: activate to sort column ascending" style="width: 450px;">E-MAIL ID</th><th class="column-4 sorting" tabindex="0" aria-controls="tablepress-12" rowspan="1" colspan="1" aria-label="CONTACT: activate to sort column ascending" style="width: 184px;">CONTACT</th></tr></thead><tbody class="row-hover"><tr class="row-2 even" role="row"><td class="column-1">1</td><td class="column-2">Mr. A G GURU</td><td class="column-3">guru_anandkumar@rediffmail.com</td><td class="column-4">07256-207876</td></tr><tr class="row-3 odd" role="row"><td class="column-1">2</td><td class="column-2">Mr H R SHAIKH</td><td class="column-3">hrs01@rediffmail.com</td><td class="column-4">07256-207876</td></tr><tr class="row-4 even" role="row"><td class="column-1">3</td><td class="column-2">Dr. R S SONONE</td><td class="column-3">ravisonone91@gmail.com</td><td class="column-4">07256-207876</td></tr><tr class="row-5 odd" role="row"><td class="column-1">4</td><td class="column-2">Mr Y V LAHANE</td><td class="column-3">yashwantlahane@gmail.com</td><td class="column-4">07256-207876</td></tr><tr class="row-6 even" role="row"><td class="column-1">5</td><td class="column-2">Mrs. M N GAIKWAD</td><td class="column-3"></td><td class="column-4">07256-207876</td></tr></tbody></table><div class="dataTables_info" id="tablepress-12_info" role="status" aria-live="polite">Showing 1 to 5 of 5 entries</div><div class="dataTables_paginate paging_simple" id="tablepress-12_paginate"><a class="paginate_button previous disabled" aria-controls="tablepress-12" data-dt-idx="0" tabindex="0" id="tablepress-12_previous">Previous</a><a class="paginate_button next disabled" aria-controls="tablepress-12" data-dt-idx="1" tabindex="0" id="tablepress-12_next">Next</a></div></div><p></p></div>

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
                      <div class="accordion-content default-closed clearfix"><p><strong>Adequate and well equipped laboratories, and technical manpower&nbsp;</strong></p><p>Laboratories are available with department are kept open and accessible to students to carry out practical as per time table during all working days.</p><p>he department has well equipped laboratories in the following subjects:</p><ul><li>Physics</li><li>Chemistry</li><li>Language</li></ul></div>
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

