using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ElecFeedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void GridView1_PreRender(object sender, EventArgs e)
    {
        LabelPageDisplay.Text = "Displaying Page " + (GridView1.PageIndex + 1).ToString() + " of " + GridView1.PageCount.ToString();
    }
}