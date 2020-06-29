using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AdminMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Admin"] != null)
        {
            lblYear.Text = DateTime.Now.Year.ToString(); 
        }
        else
        {
            Response.Redirect("~/LogIn.aspx");
        }

    }

    protected void btnSignout_Click(object sender, EventArgs e)
    {
        Session["User"] = null;
        Session["Admin"] = null;
        Response.Redirect("~/LandingPage.aspx");
    }
}
