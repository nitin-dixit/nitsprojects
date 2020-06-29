<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ElecEng.aspx.cs" Inherits="ElecEng" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Electrical Engineering - GPMZR</title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="container">
        <h2 class="display-4">Electrical Engineering :
            <asp:Image runat="server" ImageUrl="~/images/Electrical.png" class="img-fluid" alt="Computer Image" Height="200" ImageAlign="Middle" />
        </h2>

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
                        <div class="accordion-content default-closed clearfix">
                            <p class="text-center">
                                <strong class="display-4 ">Department Vision </strong>
                                <br />
                                <p class="text-center">
                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;To provide quality technical education in Electrical Engineering and produce dynamic &amp; competent diploma engineers with high human values as per need of industry and society.
                                </p>
                            </p>
                            <br />
                            <p class="text-center">
                                <strong class="display-4 ">Departmental Mission </strong>
                                <br />
                                <p class="text-center">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; To produce diploma Engineers possessing sound knowledge of Electrical Engineering.To create technically and ethically skilled human resources, contributing towards societal developments.</p>
                                <p>&nbsp;</p>
                            </p>
                            <br />
                            <p class="text-center">
                                <strong class="display-4 ">Program Educational Objectives </strong>
                                <br />
                                <p><strong>&nbsp;</strong><strong>PEO1.</strong> To produce supervisory competent diploma Engineers.</p>
                                <p><strong>PEO2</strong>. To encourage students to gain knowledge of new and diversified field of Electrical engineering through continuous learning.</p>
                                <p><strong>PEO3</strong>. To boost students to Shoulder ethics and responsibilities as an entrepreneur to meet the societal needs</p>
                            </p>
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
                            <p style="text-align: justify;"></p>
                            <div id="tablepress-13_wrapper" class="dataTables_wrapper no-footer">
                                <div class="dataTables_length" id="tablepress-13_length">
                                    <label>Show
                                        <select name="tablepress-13_length" aria-controls="tablepress-13" class="">
                                            <option value="10">10</option>
                                            <option value="25">25</option>
                                            <option value="50">50</option>
                                            <option value="100">100</option>
                                        </select>
                                        entries</label></div>
                                <div id="tablepress-13_filter" class="dataTables_filter">
                                    <label>Search:<input type="search" class="" placeholder="" aria-controls="tablepress-13"></label></div>
                                <table id="tablepress-13" class="table table-bordered table-hover table-responsive-md" role="grid" aria-describedby="tablepress-13_info">
                                    <thead class="thead-dark">
                                        <tr class="row-1 odd" role="row">
                                            <th class="column-1 sorting" tabindex="0" aria-controls="tablepress-13" rowspan="1" colspan="1" aria-label="SR.NO: activate to sort column ascending" style="width: 0px;">SR.NO</th>
                                            <th class="column-2 sorting" tabindex="0" aria-controls="tablepress-13" rowspan="1" colspan="1" aria-label="NAME OF FACULTY: activate to sort column ascending" style="width: 0px;">NAME OF FACULTY</th>
                                            <th class="column-3 sorting" tabindex="0" aria-controls="tablepress-13" rowspan="1" colspan="1" aria-label="E-MAIL ID: activate to sort column ascending" style="width: 0px;">E-MAIL ID</th>
                                            <th class="column-4 sorting" tabindex="0" aria-controls="tablepress-13" rowspan="1" colspan="1" aria-label="CONTACT: activate to sort column ascending" style="width: 0px;">CONTACT</th>
                                        </tr>
                                    </thead>
                                    <tbody class="row-hover">
                                        <tr class="row-2 even" role="row">
                                            <td class="column-1">1</td>
                                            <td class="column-2">Mr D B Jagtap</td>
                                            <td class="column-3">dbjagtap@gmail.com</td>
                                            <td class="column-4">07256-207876</td>
                                        </tr>
                                        <tr class="row-3 odd" role="row">
                                            <td class="column-1">2</td>
                                            <td class="column-2">Mrs M P Chatur</td>
                                            <td class="column-3">mpchatur@rediffmail.com</td>
                                            <td class="column-4">07256-207876</td>
                                        </tr>
                                        <tr class="row-4 even" role="row">
                                            <td class="column-1">3</td>
                                            <td class="column-2">Mr V N Bobade</td>
                                            <td class="column-3">vnbobade1@rediffmail.com</td>
                                            <td class="column-4">07256-207876</td>
                                        </tr>
                                        <tr class="row-5 odd" role="row">
                                            <td class="column-1">4</td>
                                            <td class="column-2">Mr N S Morey</td>
                                            <td class="column-3">nilesh243@rediffmail.com</td>
                                            <td class="column-4">07256-207876</td>
                                        </tr>
                                        <tr class="row-6 even" role="row">
                                            <td class="column-1">5</td>
                                            <td class="column-2">Mr.A S Waychal</td>
                                            <td class="column-3">aswaychal58@gmail.com</td>
                                            <td class="column-4">07256-207876</td>
                                        </tr>
                                        <tr class="row-7 odd" role="row">
                                            <td class="column-1">6</td>
                                            <td class="column-2">Mr V A Rahate</td>
                                            <td class="column-3"></td>
                                            <td class="column-4">07256-207876</td>
                                        </tr>
                                        <tr class="row-8 even" role="row">
                                            <td class="column-1">7</td>
                                            <td class="column-2">Mr V R Phate</td>
                                            <td class="column-3">vrphate@gmail.com</td>
                                            <td class="column-4">07256-207876</td>
                                        </tr>
                                    </tbody>
                                </table>
                                <div class="dataTables_info" id="tablepress-13_info" role="status" aria-live="polite">Showing 1 to 7 of 7 entries</div>
                                <div class="dataTables_paginate paging_simple" id="tablepress-13_paginate"><a class="paginate_button previous disabled" aria-controls="tablepress-13" data-dt-idx="0" tabindex="0" id="tablepress-13_previous">Previous</a><a class="paginate_button next disabled" aria-controls="tablepress-13" data-dt-idx="1" tabindex="0" id="tablepress-13_next">Next</a></div>
                            </div>
                            <p></p>
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
                            <p style="text-align: justify;"></p>
                            <table id="tablepress-16" class="table table-bordered table-hover table-responsive-md">
                                <thead class="thead-dark">
                                    <tr class="row-1 odd">
                                        <th class="column-1">S.N.</th>
                                        <th class="column-2">Name of Laboratory</th>
                                        <th class="column-3">No.of students per batch</th>
                                        <th class="column-4">Name of major equipment</th>
                                        <th class="column-5">Weekly utilization status</th>
                                        <th class="column-6">Technical Manpower in support</th>
                                        <th class="column-7">&nbsp;</th>
                                        <th class="column-8">&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody class="row-hover">
                                    <tr class="row-2 even">
                                        <td class="column-1"></td>
                                        <td class="column-2"></td>
                                        <td class="column-3"></td>
                                        <td class="column-4"></td>
                                        <td class="column-5"></td>
                                        <td class="column-6">Name of Technical Staff</td>
                                        <td class="column-7">Designation</td>
                                        <td class="column-8">Qualification</td>
                                    </tr>
                                    <tr class="row-3 odd">
                                        <td class="column-1">1</td>
                                        <td class="column-2">Electrical Machine Lab</td>
                                        <td class="column-3">20</td>
                                        <td class="column-4">Rectifier unit<br>
                                            3 ph Induction motor with mechanical load<br>
                                            M-G Set<br>
                                            3 phase transformer<br>
                                            DC series motor<br>
                                            Dc shunt motor<br>
                                            Single phase induction motor<br>
                                            Cut section model of pump<br>
                                            Analog tachometer<br>
                                            Oil testing set<br>
                                        </td>
                                        <td class="column-5">18 hours per week</td>
                                        <td class="column-6">D N Ingalkar</td>
                                        <td class="column-7">electrician</td>
                                        <td class="column-8">ITI (Electrician)</td>
                                    </tr>
                                    <tr class="row-4 even">
                                        <td class="column-1">2</td>
                                        <td class="column-2">Basic Electrical Lab</td>
                                        <td class="column-3">20</td>
                                        <td class="column-4">KCL &amp; KVL kit<br>
                                            CRO<br>
                                            Single phase load<br>
                                            Single phase autotransformer<br>
                                            Analog multimeter<br>
                                            Energy meter<br>
                                            Capacitive load<br>
                                            Inductive load<br>
                                            Resistive load<br>
                                            Regulated power supply<br>
                                            Potential transformer
                                            <br>
                                            Current transformer<br>
                                            Fixed capacitor<br>
                                            Stop watch<br>
                                        </td>
                                        <td class="column-5">18 hours per week</td>
                                        <td class="column-6">S V Deshmukh</td>
                                        <td class="column-7">Tech. Lab Asstt</td>
                                        <td class="column-8">B.E.(Instrumentation)</td>
                                    </tr>
                                    <tr class="row-5 odd">
                                        <td class="column-1">3</td>
                                        <td class="column-2">Electrical circuits &amp; Network Lab</td>
                                        <td class="column-3">20</td>
                                        <td class="column-4">Thevenins kit<br>
                                            Norton kit<br>
                                            Maximum power transfer theorem kit<br>
                                            Superposition kit<br>
                                            Wattmeter<br>
                                            Rheostat<br>
                                            Regulated power supply<br>
                                        </td>
                                        <td class="column-5">12 hours per week</td>
                                        <td class="column-6">S V Deshmukh</td>
                                        <td class="column-7">Tech. Lab Asstt</td>
                                        <td class="column-8">B.E.(Instrumentation)</td>
                                    </tr>
                                    <tr class="row-6 even">
                                        <td class="column-1">4</td>
                                        <td class="column-2">Electrical Measurement Lab</td>
                                        <td class="column-3">20</td>
                                        <td class="column-4">Clip on meter<br>
                                            Megger<br>
                                            Kelvin double bridge<br>
                                            Power factor meter<br>
                                            LCR meter<br>
                                            Loading rheostat
                                            <br>
                                            Function generator<br>
                                            Earth tester<br>
                                            Loading inductor<br>
                                            Regulated power supply<br>
                                            Tong tester<br>
                                            LVDT trainer<br>
                                            Strain guage trainer<br>
                                            Temperature transducer<br>
                                            Traffic light simulation trainer<br>
                                            Relay control trainer<br>
                                        </td>
                                        <td class="column-5">12 hours per week</td>
                                        <td class="column-6">S V Deshmukh</td>
                                        <td class="column-7">Tech. Lab Asstt</td>
                                        <td class="column-8">B.E.(Instrumentation)</td>
                                    </tr>
                                    <tr class="row-7 odd">
                                        <td class="column-1">5</td>
                                        <td class="column-2">Basic Electrical workshop Lab</td>
                                        <td class="column-3">20</td>
                                        <td class="column-4">Electric press<br>
                                            Battery charger<br>
                                            Tap key standard<br>
                                            Emergency light<br>
                                            Mixer ISI mark<br>
                                            Steam Electrical iron<br>
                                        </td>
                                        <td class="column-5">06 hours per week</td>
                                        <td class="column-6">D N Ingalkar</td>
                                        <td class="column-7">Electrician</td>
                                        <td class="column-8">ITI (Electrician)</td>
                                    </tr>
                                    <tr class="row-8 even">
                                        <td class="column-1">6</td>
                                        <td class="column-2">Basic Electronics Lab</td>
                                        <td class="column-3">20</td>
                                        <td class="column-4">8086 microprocessor kit<br>
                                            8085 microprocessor kit<br>
                                            LVDT Trainer<br>
                                            Strain guage trainer<br>
                                            Temperature transducer<br>
                                            Digital lab trainer<br>
                                            Analog oscilloscope
                                            <br>
                                            Analog lab trainer<br>
                                            PUT characteristic<br>
                                            SCR triggering CKT<br>
                                            SCR triggering CKT using UJT<br>
                                            UJT relaxation Oscillator<br>
                                            Module of analog Lab<br>
                                        </td>
                                        <td class="column-5">20 hours per week</td>
                                        <td class="column-6">S V Deshmukh</td>
                                        <td class="column-7">Tech. Lab Asstt</td>
                                        <td class="column-8">B.E.(Instrumentation)</td>
                                    </tr>
                                </tbody>
                            </table>
                            <p></p>
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
                       <div class="accordion-content default-closed clearfix"><div id="tablepress-19_wrapper" class="dataTables_wrapper no-footer"><div class="dataTables_length" id="tablepress-19_length"><label>Show <select name="tablepress-19_length" aria-controls="tablepress-19" class=""><option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> entries</label></div><div id="tablepress-19_filter" class="dataTables_filter"><label>Search:<input type="search" class="" placeholder="" aria-controls="tablepress-19"></label></div><table id="tablepress-19" class="table table-bordered table-hover table-responsive-md" role="grid" aria-describedby="tablepress-19_info"><thead class="thead-dark"><tr class="row-1 odd" role="row"><th class="column-1 sorting" tabindex="0" aria-controls="tablepress-19" rowspan="1" colspan="1" aria-label="Sr. No: activate to sort column ascending" style="width: 0px;">Sr. No</th><th class="column-2 sorting" tabindex="0" aria-controls="tablepress-19" rowspan="1" colspan="1" aria-label="Name of Event: activate to sort column ascending" style="width: 0px;">Name of Event</th><th class="column-3 sorting" tabindex="0" aria-controls="tablepress-19" rowspan="1" colspan="1" aria-label="Name Of Institute: activate to sort column ascending" style="width: 0px;">Name Of Institute</th><th class="column-4 sorting" tabindex="0" aria-controls="tablepress-19" rowspan="1" colspan="1" aria-label="Participants Name: activate to sort column ascending" style="width: 0px;">Participants Name</th><th class="column-5 sorting" tabindex="0" aria-controls="tablepress-19" rowspan="1" colspan="1" aria-label="Level: activate to sort column ascending" style="width: 0px;">Level</th><th class="column-6 sorting" tabindex="0" aria-controls="tablepress-19" rowspan="1" colspan="1" aria-label="Result: activate to sort column ascending" style="width: 0px;">Result</th></tr></thead><tbody class="row-hover"><tr class="row-2 even" role="row"><td class="column-1">1</td><td class="column-2">Paper presentation Competition</td><td class="column-3">Babasaheb naik polytechnic,Pusad</td><td class="column-4">1. Ashish Tarhale <br></td><td class="column-5">State</td><td class="column-6">First Prize of Rs.3000/- along with momento</td></tr><tr class="row-3 odd" role="row"><td class="column-1">2</td><td class="column-2">Paper presentation Competition</td><td class="column-3">Dadasaheb Gawai Polytechnic,Darapur</td><td class="column-4">1.A V Kadu<br>
2. Sagar Lute <br>
<br></td><td class="column-5">National</td><td class="column-6">Third Prize of Rs.1000/- along with momento</td></tr><tr class="row-4 even" role="row"><td class="column-1">3</td><td class="column-2">Mobile movie making</td><td class="column-3">G H Raisoni Polytechnic,Amravati</td><td class="column-4">1. Roshan Mankar</td><td class="column-5">State</td><td class="column-6">First Prize of Rs.1000/- along with momento</td></tr></tbody></table><div class="dataTables_info" id="tablepress-19_info" role="status" aria-live="polite">Showing 1 to 3 of 3 entries</div><div class="dataTables_paginate paging_simple" id="tablepress-19_paginate"><a class="paginate_button previous disabled" aria-controls="tablepress-19" data-dt-idx="0" tabindex="0" id="tablepress-19_previous">Previous</a><a class="paginate_button next disabled" aria-controls="tablepress-19" data-dt-idx="1" tabindex="0" id="tablepress-19_next">Next</a></div></div><h3><strong>&nbsp;</strong></h3><p>&nbsp;</p></div>
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
                       <div class="accordion-content default-closed clearfix"><p style="text-align: justify;"></p><div id="tablepress-17_wrapper" class="dataTables_wrapper no-footer"><div class="dataTables_length" id="tablepress-17_length"><label>Show <select name="tablepress-17_length" aria-controls="tablepress-17" class=""><option value="10">10</option><option value="25">25</option><option value="50">50</option><option value="100">100</option></select> entries</label></div><div id="tablepress-17_filter" class="dataTables_filter"><label>Search:<input type="search" class="" placeholder="" aria-controls="tablepress-17"></label></div><table id="tablepress-17" class="table table-bordered table-hover table-responsive-md" role="grid" aria-describedby="tablepress-17_info"><thead class="thead-dark"><tr class="row-1 odd" role="row"><th class="column-1 sorting" tabindex="0" aria-controls="tablepress-17" rowspan="1" colspan="1" aria-label="Sr. No.: activate to sort column ascending" style="width: 0px;">Sr. No.</th><th class="column-2 sorting" tabindex="0" aria-controls="tablepress-17" rowspan="1" colspan="1" aria-label="Name of Topic: activate to sort column ascending" style="width: 0px;">Name of Topic</th><th class="column-3 sorting" tabindex="0" aria-controls="tablepress-17" rowspan="1" colspan="1" aria-label="Details: activate to sort column ascending" style="width: 0px;">Details</th><th class="column-4 sorting" tabindex="0" aria-controls="tablepress-17" rowspan="1" colspan="1" aria-label="Date: activate to sort column ascending" style="width: 0px;">Date</th></tr></thead><tbody class="row-hover"><tr class="row-2 even" role="row"><td class="column-1">1</td><td class="column-2">Industrial visit at Dev Polymers,MIDC,murtizapur</td><td class="column-3">Nylon string and rope manufacturing</td><td class="column-4">22/08/2014</td></tr><tr class="row-3 odd" role="row"><td class="column-1">2</td><td class="column-2">Industrial visit at B-cool,Murtizapur</td><td class="column-3">Ice making water filtration plant<br></td><td class="column-4">22/08/2014</td></tr><tr class="row-4 even" role="row"><td class="column-1">3</td><td class="column-2">Industrial visit at 33/11 kV,sirsol substation,Murtizapur</td><td class="column-3">Substation visit</td><td class="column-4">25/09/2014</td></tr><tr class="row-5 odd" role="row"><td class="column-1">4</td><td class="column-2">Visit at control panel,GP campus,Murtizapur</td><td class="column-3">Panel details<br></td><td class="column-4">09/03/2015</td></tr><tr class="row-6 even" role="row"><td class="column-1">5</td><td class="column-2">Expert lecture on ‘Role of Diploma Engineers in Industry’</td><td class="column-3">VLC session<br></td><td class="column-4">16/09/2014</td></tr><tr class="row-7 odd" role="row"><td class="column-1">6</td><td class="column-2">Expert lecture on ‘Personality Development’</td><td class="column-3">Smita Kamble,Manager,Community development<br></td><td class="column-4">08/01/2015</td></tr><tr class="row-8 even" role="row"><td class="column-1">7</td><td class="column-2">Expert lecture on’Introduction to PCB Making</td><td class="column-3">Mr Akash Diwate,Spartans Group,Amravati<br></td><td class="column-4">27/01/2015</td></tr></tbody></table><div class="dataTables_info" id="tablepress-17_info" role="status" aria-live="polite">Showing 1 to 7 of 7 entries</div><div class="dataTables_paginate paging_simple" id="tablepress-17_paginate"><a class="paginate_button previous disabled" aria-controls="tablepress-17" data-dt-idx="0" tabindex="0" id="tablepress-17_previous">Previous</a><a class="paginate_button next disabled" aria-controls="tablepress-17" data-dt-idx="1" tabindex="0" id="tablepress-17_next">Next</a></div></div><p></p></div>
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

