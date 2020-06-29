using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Data;
using System.Web.Security;
using System.Net.Mail;
using System.Net;


public partial class SendBookRequest : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
    SqlConnection con;
    string id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["btnid"] != null)
        {
            id = Session["btnid"].ToString();
            con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select * from SellBook where id='" + id + "'";
            cmd.Connection = con;
            SqlDataReader read = cmd.ExecuteReader();
            read.Read();


            sellerName.Text = read["sellername"].ToString();
            BOOKS2.Text = read["booklist"].ToString();
            string a = read["selleremail"].ToString();
            selleremail.Text = read["selleremail"].ToString();
            sellercontactno.Text = read["sellercontactno"].ToString();
            USERNAME.Text = Session["Firstname"].ToString() + "  " + Session["Lastname"].ToString();

            read.Close();

            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandText = "select * from tblImages where email='" + a + "'";
            cmd1.Connection = con;
            SqlDataReader read1 = cmd1.ExecuteReader();
            read1.Read();
            byte[] img = (byte[])read1["Imagedata"];
            string image = Convert.ToBase64String(img);
            sellreqimg.ImageUrl = "data:Imge/jpg;base64," + image;


            read1.Close();
            cmd1.CommandText = "select * from tblImages where email='" + Session["User"] + "'";
            cmd1.Connection = con;
            SqlDataReader read2 = cmd1.ExecuteReader();
            read2.Read();
            byte[] img1 = (byte[])read2["Imagedata"];
            string image1 = Convert.ToBase64String(img1);
            userimgselleq.ImageUrl = "data:Imge/jpg;base64," + image1;
            read2.Close();
            con.Close();

        }
        else
        {
            Response.Redirect("~/BuyBook.aspx");
        }


    }
    protected void sendbtn_Click(object sender, EventArgs e)
    {
        con.Open();
        sendbtn.Attributes.Add("this.disable", "true");

        if (yourContactno.Text != "" && emailtxt.Text != "" && addmsg.Text != "")
        {

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select * from SellBook where selleremail='" + selleremail.Text + "'";
            cmd.Connection = con;
         

            SqlDataReader re = cmd.ExecuteReader();
            re.Read();
            string buyeremail = emailtxt.Text;
            string buyername = USERNAME.Text;

            string sname = re["sellername"].ToString();
         
            cmd.CommandText = "insert into sellbookrequest (buyername,sellername,booklist,sellercontactno,selleremail,buyercontactno,buyeremail,buyermsg,buyersessionemail,buyerusername,sid,bid) values('" + USERNAME.Text + "','" + sellerName.Text + "','" + BOOKS2.Text + "','" + sellercontactno.Text + "','" + selleremail.Text + "','" + yourContactno.Text + "','" + emailtxt.Text + "','" + addmsg.Text + "','" + Session["User"].ToString() + "','" + Session["Username"].ToString() + "'," + re["sid"] + ",'" + USERNAME.Text + sellerName.Text + BOOKS2.Text + sellercontactno.Text + selleremail.Text + yourContactno.Text + emailtxt.Text + addmsg.Text + Session["User"].ToString() + Session["Username"].ToString() + "')";
            re.Close();
            cmd.Connection = con;

            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                String ToEmailAddress = selleremail.Text;
                String EmailBody = "Dear "+sname+" , <br/><br/> Hurray! you have a new Buyer request for your book.   <br/><br/>for more information Check the book requests page <br/><br/>Buyer Name :"+buyername+"<br/> Buyer Email:"+buyeremail+"  ";
                MailMessage AccActivationMail = new MailMessage("gpmwelfarenetwork@gmail.com", ToEmailAddress);
                AccActivationMail.Body = EmailBody;
                AccActivationMail.IsBodyHtml = true;
                AccActivationMail.Subject = "  send req message";

                SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
                SqlCommand cmdCheckPass = new SqlCommand("select Password from tblEmailPass where Email='gpmwelfarenetwork@gmail.com'", con);
                string pass = (string)cmdCheckPass.ExecuteScalar();
                SMTP.Credentials = new NetworkCredential()
                {
                    UserName = "gpmwelfarenetwork@gmail.com",
                    Password = pass

                };
                SMTP.EnableSsl = true;
                SMTP.Send(AccActivationMail);


                Session["btnid"] = null;
                Response.Redirect("~/BuyBook.aspx");
            }
            else
            { Response.Write("failed"); }
        }
        else
        {
            lblstatus.Text = "Fill The Correct Information";
        }
        con.Close();

    }

    protected void btnSignout_Click(object sender, EventArgs e)
    {

        Session["User"] = null;
        Response.Redirect("~/LogIn.aspx");
    }
}