using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


public partial class HelperPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_PreRender(object sender, EventArgs e)
    {
        LabelPageDisplay.Text = "Displaying Page " + (GridView1.PageIndex + 1).ToString() + " of " + GridView1.PageCount.ToString();

    }


    protected void Button1_Click(object sender, EventArgs e)
    {

    }
}