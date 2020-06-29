using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


public partial class AccountActivated : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
    String GUIDvalue;
    DataTable dt = new DataTable();
    int Uid;
    protected void Page_Load(object sender, EventArgs e)
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            GUIDvalue = Request.QueryString["Uid"];
            if (GUIDvalue != null)
            {
                SqlCommand cmd = new SqlCommand("select * from tblUserActivation where id='" + GUIDvalue + "'", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);
                if (dt.Rows.Count != 0)
                {
                    Uid = Convert.ToInt32(dt.Rows[0][1]);
                    SqlCommand cmd1 = new SqlCommand("delete from tblUserActivation where Uid='" + Uid + "' ", con);
                    cmd1.ExecuteNonQuery();
                }
                else
                {
                    lblUnactiveUserMsg.Text = "Your Account Activation Link has Expired or Invalid";

                }

            }
            else
            {
                Response.Redirect("~/LandingPage.aspx");
            }

        }
       
    }
}