<%@ Page Title="" Language="C#" MasterPageFile="~/UserMaster.master" AutoEventWireup="true" CodeFile="Found.aspx.cs" Inherits="Found" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">

     <style>
        .centerFound{
            
      margin:auto;
         
                
        }

        .flexsearch--wrapper {
	height: auto;
	width: auto;
	max-width: 70%;
	overflow: hidden;
	background: transparent;
	margin: auto;
	position: static;
}
	
.flexsearch--form {
	overflow: hidden;
	position: relative;
}
	
.flexsearch--input-wrapper {
	padding: 0 66px 0 0; /* Right padding for submit button width */
	overflow: hidden;
}

.flexsearch--input {
  width: 100%;
}

/***********************
 * Configurable Styles *
 ***********************/
.flexsearch {
 
 /* Padding for other horizontal elements */
}

.flexsearch--input {
  -webkit-box-sizing: content-box;
	-moz-box-sizing: content-box;
	box-sizing: content-box;
 	height: 60px;
  padding: 0 46px 0 10px;
	border-color: #888;
  border-radius: 35px; /* (height/2) + border-width */
  border-style: solid;
	border-width: 5px;
  margin-top: 15px;
  color: #333;
  font-family: 'Helvetica', sans-serif;
	font-size: 26px;
	-webkit-appearance: none;
	-moz-appearance: none;
}
	
.flexsearch--submit {
 position: absolute;
	right: 0;
	top: 0;
	display: block;
	width: 60px;
	height: 60px;
  padding: 0;
  border: none;
	margin-top: 20px; /* margin-top + border-width */
  margin-right: auto; /* border-width */
	background: transparent;
  color: #888;
  font-family: 'Helvetica', sans-serif;
  font-size: 40px;
  line-height: 60px;
}

.flexsearch--input:focus {
  outline: none;
  border-color: #333;
}

.flexsearch--input:focus.flexsearch--submit {
 	color: #333; 
}

.flexsearch--submit:hover {
  color: #333;
  cursor: pointer;
}

::-webkit-input-placeholder {
	color: #888;  
}

input:-moz-placeholder {
  color: #888
}


/****************
 * Pretify demo *
 ****************/
.h1 {
  float: left;
  margin: 25px;
  color: #333;
  font-family: 'Helvetica', sans-serif;
  font-size: 45px;
  font-weight: bold;
  line-height: 45px;
  text-align: center;
}

    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div id="found" class ="">
            <div class="btn-group col-md-7 m-3">
        <asp:TextBox  ID="txtsearch" placeholder="Search " runat="server"   CssClass="form-control  col-lg-12 col-sm-1 quesearch"></asp:TextBox>

         <div class="btn  searchbtn btn-info btn-outline-info" > <asp:LinkButton ID="LinkButton1" ForeColor="Black" OnClick="search_Click" Text="search" runat="server"></asp:LinkButton></div>
       
</div>
        <br /><br /><br />
  
    <asp:Panel ID="Panel3" runat="server"  >

                   </asp:Panel>
         <br />
        <br /><br />
        <asp:MultiView ID="multiview1" runat="server">
            <asp:View ID="View1" runat="server">

            </asp:View>
             
        </asp:MultiView>
          <br /><br />
</div>
</asp:Content>

