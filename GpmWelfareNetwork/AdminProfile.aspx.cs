using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminProfile : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Admin"] != null)
            {
                if (Session["Admin"].ToString() == "LA") {

                }
                else
                {
                    Response.Redirect("~/LogIn.aspx");
                }

            }
            else
            {
                Response.Redirect("~/LogIn.aspx");
            }


        }

    }

    protected void LinkButtonInsert_Click(object sender, EventArgs e)
    { if(Page.IsValid)
        { 
        SqlDataSource1.InsertParameters["Bname"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("tbBookName")).Text;

        SqlDataSource1.InsertParameters["AuthorName"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("tbAuthorName")).Text;

        SqlDataSource1.InsertParameters["Price"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("tbPrice")).Text;

        SqlDataSource1.InsertParameters["Publication"].DefaultValue = ((TextBox)GridView1.FooterRow.FindControl("tbPublication")).Text;

        SqlDataSource1.InsertParameters["Department"].DefaultValue = ((DropDownList)GridView1.FooterRow.FindControl("DropDownList2")).SelectedValue;

        SqlDataSource1.Insert();
            LabelRequiredField.Visible = false;
        }
        else
        {
            LabelRequiredField.Text = "All Fields are required !";
        }
    }

    protected void btnShowDatabase_Click(object sender, EventArgs e)
    {
        if(DepartmentDdl.SelectedValue!= "-1")
        {
            tbsearch.Text = "";
            GridView1.DataSourceID = "SqlDataSource1";
            GridView1.DataBind();
            
        }
        else
        {
            GridView1.Visible = false;
        }
    }







    protected void GridView1_PreRender(object sender, EventArgs e)
    {
        LabelPageDisplay.Text = "Displaying Page " + (GridView1.PageIndex + 1).ToString() + " of " + GridView1.PageCount.ToString();
    }
}