using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class tblITFaculty : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_PreRender(object sender, EventArgs e)
    {
        LabelPageDisplay.Text = "Displaying Page " + (GridView1.PageIndex + 1).ToString() + " of " + GridView1.PageCount.ToString();
    }

    protected void LinkButtonInsert_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            SqlDataSource1.InsertParameters["Fname"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("tbFname")).Text;

            SqlDataSource1.InsertParameters["Email"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("tbEmail")).Text;

            SqlDataSource1.Insert();

        }

    }
}