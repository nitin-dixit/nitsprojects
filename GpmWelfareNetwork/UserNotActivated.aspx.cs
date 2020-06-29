using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;
using System.Data;
using System.Net;
using System.Net.Mail;

public partial class UserNotActivated : System.Web.UI.Page
{ static string cs=ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
    SqlConnection con = new SqlConnection(cs);
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)

        { if (Session["UserNotActivated"]!=null)
            {
                if (Session["User"]!=null)
                {
                    lblEmail.Text = Session["User"].ToString();
                }

            }
            else
            {
                Response.Redirect("~/LogIn.aspx");
            }
        }
    }

    protected void btnConfirmIdentity_Click(object sender, EventArgs e)
    {
        string EncryptedPass = FormsAuthentication.HashPasswordForStoringInConfigFile(tbPassword.Text, "SHA1");
        using (con)
        {
            string Email = Session["User"].ToString();
            SqlCommand cmd = new SqlCommand("select * from tblUsers where Email='"+Email+"'", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count != 0)
            {
                string pass = dt.Rows[0][11].ToString().Trim();
                if (pass == EncryptedPass)
                {
                    String myGUID = Guid.NewGuid().ToString();
                    int Uid = Convert.ToInt32(dt.Rows[0][0]);
                    DateTime datetime = DateTime.Now;

                    SqlCommand cmd1 = new SqlCommand("Update tblUserActivation set Id='"+myGUID+"', ActivationDateTime='"+ datetime + "' where Uid='"+Uid+"'", con);
                    cmd1.ExecuteNonQuery();

                    /////////////////////////////////////////Sending Email////////////////////////////////////////////////////////////
                    String Uname = dt.Rows[0][4].ToString();
                    String ToEmailAddress = dt.Rows[0][5].ToString();
                    String EmailBody = "Hi " + Uname + ", <br/><br/> Click the Link Below to Activate your account...  <br/><br/> http://localhost:29738/AccountActivated.aspx?Uid=" + myGUID;
                    MailMessage AccActivationMail = new MailMessage("gpmwelfarenetwork@gmail.com", ToEmailAddress);
                    AccActivationMail.Body = EmailBody;
                    AccActivationMail.IsBodyHtml = true;
                    AccActivationMail.Subject = "Account activation Link";

                    SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
                    SqlCommand cmdCheckPass = new SqlCommand("select Password from tblEmailPass where Email='gpmwelfarenetwork@gmail.com'", con);
                    string passwd = (string)cmdCheckPass.ExecuteScalar();
                    SMTP.Credentials = new NetworkCredential()
                    {
                        UserName = "gpmwelfarenetwork@gmail.com",
                        Password = passwd

                    };
                    SMTP.EnableSsl = true;
                    SMTP.Send(AccActivationMail);


                }
                else
                {

                }

            }
        }
    
    }
}