using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangePassword : System.Web.UI.Page
{
    static string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
    SqlConnection con = new SqlConnection(cs);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            LabelError.Visible = false;

            if (Session["User"] != null)
            {
                using (con)
                {
                    SqlCommand cmdImagedata = new SqlCommand("select Imagedata from tblImages where Email=('" + Session["User"].ToString() + "')", con);
                    con.Open();
                    if (cmdImagedata.ExecuteScalar() != null)
                    {
                        byte[] bytes = (byte[])cmdImagedata.ExecuteScalar();
                        string strBase64 = Convert.ToBase64String(bytes);
                        imgProfilePic.ImageUrl = "data:Image/png;base64," + strBase64; //profile pic

                    }
                    else
                    {
                        imgProfilePic.ImageUrl = Session["ProfilePic"].ToString();

                    }
                    SqlCommand cmdUserName1 = new SqlCommand("select * from tblUsers where Email=('" + Session["User"].ToString() + "')", con);
                    SqlDataAdapter sda = new SqlDataAdapter(cmdUserName1);
                    DataTable dt = new DataTable();
                    sda.Fill(dt);
                    if (dt.Rows.Count != 0)
                    {

                     
                        LabelUsername.Text = Convert.ToString((dt.Rows[0][1])) + " " + Convert.ToString((dt.Rows[0][2]));
                    }
                }
            }
            else
            {
                Response.Redirect("~/LogIn.aspx");
            }

        }
    }

    protected void btnChangePass_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string EncryptedPass1 = FormsAuthentication.HashPasswordForStoringInConfigFile(tbOldPass.Text, "SHA1");
            string EncryptedPass2 = FormsAuthentication.HashPasswordForStoringInConfigFile(tbNewPass.Text, "SHA1");
            string EncryptedPass3 = FormsAuthentication.HashPasswordForStoringInConfigFile(tbConFirmNewPass.Text, "SHA1");
            if (EncryptedPass2 == EncryptedPass3)
            {
                using (SqlConnection con = new SqlConnection(cs))
                {
                    SqlCommand cmdCheckOldPass = new SqlCommand("select Password from tblUsers where Email='" + Session["User"].ToString() + "'", con);
                    con.Open();
                    if (EncryptedPass1  == cmdCheckOldPass.ExecuteScalar().ToString()) {
                        if(EncryptedPass1 == EncryptedPass3)
                        {
                            LabelError.Visible = true;
                            LabelError.CssClass = "text-danger";
                            LabelError.Text = "New and Old Password can't be same ✖";


                        }
                        else
                        {
                            SqlCommand cmdSetNewPass = new SqlCommand("update tblUsers set Password='" + EncryptedPass3 + "' where Email='" + Session["User"].ToString() + "' ", con);
                            cmdSetNewPass.ExecuteNonQuery();
                            LabelError.Visible = true;
                            LabelError.CssClass = "text-success";
                            LabelError.Text = "🔑 Password successfully changed.";

                        }

                    }
                    else
                    {
                        LabelError.Visible = true;
                        LabelError.CssClass = "text-danger";
                        LabelError.Text = "Sorry, Old Password is wrong! ✖";
                    }

                }
            }
            else {
                LabelError.Visible = true;
                LabelError.CssClass = "text-danger";
                LabelError.Text = "Sorry, Passwords don't match! ✖";
            }

        }
    }
}