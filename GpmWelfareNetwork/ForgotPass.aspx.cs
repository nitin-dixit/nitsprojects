using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Net.Mail;
using System.Net;


public partial class ForgotPass : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void SendEmail_Click(object sender, EventArgs e)
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("select * from tblUsers where Email='" + tbEmailId.Text + "' ", con);
            con.Open();
            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            sda.Fill(dt);

            if (dt.Rows.Count != 0)
            {
                String myGUID = Guid.NewGuid().ToString();
                int Uid = Convert.ToInt32(dt.Rows[0][0]);
                SqlCommand cmd1 = new SqlCommand("insert into ForgotPassRequest values('" + myGUID + "','"+Uid+"',getdate())",con);
                cmd1.ExecuteNonQuery();

                /////////////////////////////////////////Sending Email////////////////////////////////////////////////////////////
                String Uname= dt.Rows[0][4].ToString();
                String ToEmailAddress = dt.Rows[0][5].ToString();
                String EmailBody = "Hi "+Uname+", <br/><br/> Click the Link Below to reset your Password <br/><br/> http://localhost:29738/RecoverPass.aspx?Uid="+myGUID;
                MailMessage PassRecMail = new MailMessage("gpmwelfarenetwork@gmail.com", ToEmailAddress);
                PassRecMail.Body = EmailBody;
                PassRecMail.IsBodyHtml = true;
                PassRecMail.Subject = "Password Reset Link";

                SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
                SqlCommand cmdCheckPass = new SqlCommand("select Password from tblEmailPass where Email='gpmwelfarenetwork@gmail.com'", con);
                string pass = (string)cmdCheckPass.ExecuteScalar();

                SMTP.Credentials = new NetworkCredential()
                {
                    UserName = "gpmwelfarenetwork@gmail.com",
                    Password = pass

                };
                SMTP.EnableSsl = true;
                SMTP.Send(PassRecMail);



                lblRecoverPass.ForeColor = System.Drawing.Color.Green;
                lblRecoverPass.Text = "Check your E-mail to reset your password.";
            }
            else
            {
                lblRecoverPass.ForeColor = System.Drawing.Color.Red;
                lblRecoverPass.Text = "Oops! This E-mail id doesn't exist in our database.";
            }
        }
    }
}