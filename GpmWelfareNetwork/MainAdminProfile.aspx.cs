using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MainAdminProfile : System.Web.UI.Page
{
    static string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
    SqlConnection con = new SqlConnection(cs);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Admin"] != null)
            {
                if (Session["Admin"].ToString() == "A")
                {
                    countUser();
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

    protected void countUser()
    {
        using (con)
        {
            SqlCommand cmdCountUser = new SqlCommand("select count(Uid) from tblUsers", con);
            SqlCommand cmdCountMaleUser = new SqlCommand("select count(Uid) from tblUsers where Gender='Male'", con);
            SqlCommand cmdCountFemaleUser = new SqlCommand("select count(Uid) from tblUsers where Gender='Female'", con);
            SqlCommand cmdCountOtherUser = new SqlCommand("select count(Uid) from tblUsers where Gender='Other'", con);
            con.Open();
            lblUserCount.Text= cmdCountUser.ExecuteScalar().ToString();
            lblMaleCount.Text = cmdCountMaleUser.ExecuteScalar().ToString();
            lblFemaleCount.Text = cmdCountFemaleUser.ExecuteScalar().ToString();
            lblOtherCount.Text = cmdCountOtherUser.ExecuteScalar().ToString();


        }

    }
}