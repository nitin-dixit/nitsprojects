<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="Feedback.aspx.cs" Inherits="Feedback" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <title>Feedback</title>
  
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div id="feedback" class="text-light row">
   
         <br />
    <br />



    <div class="container">
        <div class="display-4 text-center">Feedback Form <i class="fa fa-wpforms"></i></div>
        <br />
        <br />
        <br />
        <br />

        <div class="form-row">
            <asp:Label ID="Label1" runat="server" Text="Your Name : " class="col-sm-2 col-form-label"></asp:Label>

            <div class="form-group col">
                <asp:TextBox ID="TextBox1" runat="server" class="form-control" placeholder="First name"></asp:TextBox>
            </div>

            <div class="form-group col">
                <asp:TextBox ID="TextBox2" runat="server" class="form-control" placeholder="Last name"></asp:TextBox>
            </div>

        </div>
        <br />

        <div class="form-row">

            <asp:Label ID="lblSelectFaculty" runat="server" Text="Select Faculty : " class="col-sm-2 col-form-label"></asp:Label>
            <div class="form-group col">
                <asp:DropDownList ID="ddlFacultyName" runat="server" class="custom-select mb-2 mr-sm-2 mb-sm-0 form-control">
                   <asp:ListItem Text="Select faculty..." Value="-1"></asp:ListItem>
                </asp:DropDownList>
            </div>
        </div>
        <br />

        <h6>1. Knowledge of the teacher on the subject :</h6>
        <div class="form-row">
            <div class="form-check form-check-inline form-group col">
                <asp:RadioButtonList ID="rbtnlist1" runat="server" RepeatDirection="Horizontal" CausesValidation="True" Width="240px">
                    <asp:ListItem Value="1"> Excellent </asp:ListItem>
                    <asp:ListItem Value="2"> Good </asp:ListItem>
                    <asp:ListItem Value="3"> Fair </asp:ListItem>
                    <asp:ListItem Value="4"> Poor </asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>
        <br />


        <h6>2. Clarity and understanding of teacher's explaination :</h6>
        <div class="form-row">
            <div class="form-check form-check-inline form-group col">
                <asp:RadioButtonList ID="rbtnlist2" runat="server" RepeatDirection="Horizontal" CausesValidation="True" Width="240px">
                    <asp:ListItem Value="1"> Excellent </asp:ListItem>
                    <asp:ListItem Value="2"> Good </asp:ListItem>
                    <asp:ListItem Value="3"> Fair </asp:ListItem>
                    <asp:ListItem Value="4"> Poor </asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>
        <br />

        <h6>3. Approximate percentage of classes not engaged by the teacher in the subject :</h6>
        <div class="form-row">
            <div class="form-check form-check-inline form-group col">
                <asp:RadioButtonList ID="rbtnlist3" runat="server" RepeatDirection="Vertical" CausesValidation="True">
                    <asp:ListItem Value="1"> Less than 10% </asp:ListItem>
                    <asp:ListItem Value="2"> 10% to 25% </asp:ListItem>
                    <asp:ListItem Value="3"> more than 25% </asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>
        <br />

        <h6>4. Behaviour of the teacher :</h6>
        <div class="form-row">
            <div class="form-check form-check-inline form-group col">
                <asp:RadioButtonList ID="rbtnlist4" runat="server" RepeatDirection="Horizontal" CausesValidation="True" Width="290px">
                    <asp:ListItem Value="1"> Pleasant </asp:ListItem>
                    <asp:ListItem Value="2"> Indifferent</asp:ListItem>
                    <asp:ListItem Value="3"> Unpleasant</asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>
        <br />

        <h6>5. Overall teaching effectiveness of the teacher :</h6>
        <div class="form-row">
            <div class="form-check form-check-inline form-group col">
                <asp:RadioButtonList ID="rbtnlist5" runat="server" RepeatDirection="Horizontal" CausesValidation="True" Width="240px">
                    <asp:ListItem Value="1"> Excellent </asp:ListItem>
                    <asp:ListItem Value="2"> Good </asp:ListItem>
                    <asp:ListItem Value="3"> Fair </asp:ListItem>
                    <asp:ListItem Value="4"> Poor </asp:ListItem>
                </asp:RadioButtonList>
            </div>
        </div>
        <br />

        <h6>6. Any other relevant information :</h6>
        <div class="form-row">
            <div class=" form-group col">
                <asp:TextBox ID="tbfeedback" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
                <small id="tbfeedbackhelp" class="form-text text-light">Strength and Weaknesses of teacher / Suggestions.</small>
            </div>
        </div>
        <div class="form-row">
             <div class="form-check form-check-inline form-group col">
                 <asp:Button ID="btnSendFeedback" runat="server" Text="Send Feedback" CssClass="btn btn-outline-light " OnClick="btnSendFeedback_Click" />
                 </div>
            <asp:Label ID="lblFeedbackerrormsg" runat="server"></asp:Label>
        </div>
    </div>
        </iv>
</asp:Content>

