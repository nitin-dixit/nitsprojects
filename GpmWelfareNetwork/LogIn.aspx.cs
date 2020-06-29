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

public partial class LogIn : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblYear.Text = DateTime.Now.Year.ToString();
            if (Request.Cookies["Email"] != null && Request.Cookies["Password"] != null)
            {
                tbemail.Text = Request.Cookies["Email"].Value;
                tbpassword.Attributes["value"] = Request.Cookies["Password"].Value;
                cbxRememberMe.Checked = true;
            }
        }



    }
    protected void Button2_Click(object sender, EventArgs e)
    {

       
        if (tbemail.Text != "" && tbpassword.Text != "")
        {
            using (SqlConnection con = new SqlConnection(cs))
            {
                string EncryptedPass = FormsAuthentication.HashPasswordForStoringInConfigFile(tbpassword.Text, "SHA1");
                SqlCommand cmd = new SqlCommand("select * from tblUsers where Email='" + tbemail.Text + "' and Password='" + EncryptedPass + "' ", con);
                con.Open();
                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                sda.Fill(dt);

                if (dt.Rows.Count != 0)
                {
                    if (cbxRememberMe.Checked)
                    {
                        Response.Cookies["Email"].Value = tbemail.Text;
                        Response.Cookies["Password"].Value = tbpassword.Text;

                        Response.Cookies["Email"].Expires = DateTime.Now.AddDays(10);
                        Response.Cookies["Password"].Expires = DateTime.Now.AddDays(10);

                    }
                    else
                    {
                        Response.Cookies["Email"].Expires = DateTime.Now.AddDays(-1);
                        Response.Cookies["Password"].Expires = DateTime.Now.AddDays(-1);



                    }
                    string Utype;
                    Utype = dt.Rows[0][12].ToString().Trim();

                
                    int Uid = Convert.ToInt32(dt.Rows[0][0]);

                    SqlCommand cmd1 = new SqlCommand("select * from tblUserActivation where Uid='" + Uid + "'",con);
                    SqlDataAdapter sda1 = new SqlDataAdapter(cmd1);
                    DataTable dt1 = new DataTable();
                    sda1.Fill(dt1);

                    if (Utype == "U" && dt1.Rows.Count != 0)
                    {
                        Session["User"] = tbemail.Text.Trim();
                        Session["UserNotActivated"] = true;
                        Response.Redirect("~/UserNotActivated.aspx");
                    }
                    else if (Utype == "U" && dt1.Rows.Count==0)
                    {
                        Session["User"] = tbemail.Text;
                        
                        SqlCommand cmd2 = new SqlCommand();
                        cmd2.CommandText = "select * from tblUsers where Email='" + Session["User"] + "'";
                        cmd2.Connection = con;
                        SqlDataReader read = cmd2.ExecuteReader();
                        read.Read();
                        Session["Firstname"] = read["Firstname"].ToString();
                        Session["Lastname"] = read["Lastname"].ToString();
                        Session["Username"] = read["Username"].ToString();
                        read.Close();
                        Response.Redirect("~/ProfilePage.aspx");
                    }
                    else if (Utype == "A")
                    {
                        Session["Admin"] = Utype;

                        Response.Redirect("~/MainAdminProfile.aspx");
                    }

                    else if (Utype == "LA")
                    {
                        Session["Admin"] = Utype;
                      
                        Response.Redirect("~/AdminProfile.aspx");
                    }
                }
                else
                {
                    lblSigninError.Text = "Invalid Email or Password !";
                }



            }
        }

       
    }
    protected void lbtnForgotPassword_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/ForgotPass.aspx");
    }
}