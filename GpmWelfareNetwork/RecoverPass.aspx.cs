using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Web.Security;

public partial class RecoverPass : System.Web.UI.Page
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
            if(GUIDvalue!=null)
            {
                SqlCommand cmd = new SqlCommand("select * from ForgotPassRequest where id='" + GUIDvalue + "'", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                sda.Fill(dt);
                if(dt.Rows.Count!=0)
                {
                    Uid = Convert.ToInt32(dt.Rows[0][1]);
                }
                else
                {
                    lblunauthenticatedUserMsg.Text = "Your Password Link has Expired or Invalid";

                }
                
            }
            else
            {
                Response.Redirect("~/LandingPage.aspx");
            }

        }


        if (dt.Rows.Count != 0)
        {

            lblNewPass.Visible = true;
            lblConfirmNewPass.Visible = true;
            tbConfirmNewPass.Visible = true;
            tbNewPass.Visible = true;
            btnResetPass.Visible = true;
            RequiredFieldValidatorNewPass.Visible = true;

        }
        else
        {
            lblunauthenticatedUserMsg.Text = "Your Password Link has Expired or Invalid";

            lblNewPass.Visible = false;
            lblConfirmNewPass.Visible = false;
            tbConfirmNewPass.Visible = false;
            tbNewPass.Visible = false;
            btnResetPass.Visible = false;
            RequiredFieldValidatorNewPass.Visible = false;
        }


    }

    protected void btnResetPass_Click(object sender, EventArgs e)
    {
        string EncryptedPass1 = FormsAuthentication.HashPasswordForStoringInConfigFile(tbNewPass.Text, "SHA1");
        string EncryptedPass2 = FormsAuthentication.HashPasswordForStoringInConfigFile(tbConfirmNewPass.Text, "SHA1");
        if (EncryptedPass1 != "" && EncryptedPass2 != "" && EncryptedPass1 == EncryptedPass2)
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("update tblUsers set Password='" + EncryptedPass2 + "' where Uid='" + Uid + "' ", con);
                con.Open();
                cmd.ExecuteNonQuery();

                SqlCommand cmd1 = new SqlCommand("delete from ForgotPassRequest where Uid='" + Uid + "' ", con);
                cmd1.ExecuteNonQuery();
                Response.Redirect("~/LogIn.aspx");

            }

        }

    }
}