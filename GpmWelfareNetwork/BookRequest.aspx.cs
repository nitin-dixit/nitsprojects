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
public partial class BookRequest : System.Web.UI.Page
{

    string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
    SqlConnection con;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {



            con = new SqlConnection(cs);

            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select * from sellbookrequest where selleremail = '" + Session["User"] + "'";
            cmd.Connection = con;
            SqlDataReader read = cmd.ExecuteReader();
            while (read.Read())
            {


                Panel p = new Panel();
                p.CssClass = "card-header";
                p.BackImageUrl = "images/background/swirl_pattern.png";

                System.Web.UI.HtmlControls.HtmlGenericControl creatediv = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                Label l = new Label();
                ImageButton IB = new ImageButton();
                IB.CssClass = "";
                IB.Width = 55;
                Table It = new Table();
                TableRow Itr = new TableRow();
                TableCell Itc = new TableCell();
                TableCell Itc2 = new TableCell();


                SqlCommand cmd1 = new SqlCommand();
                cmd1.CommandText = "select * from tblImages where Email ='" + read["buyersessionemail"] + "'";
                cmd1.Connection = con;
                SqlDataReader read1 = cmd1.ExecuteReader();
                read1.Read();
                byte[] img = (byte[])read1["Imagedata"];
                string image = Convert.ToBase64String(img);
                IB.ImageUrl = "data:Imge/jpg;base64," + image;
                read1.Close();



                l.Text = read["buyername"].ToString();
                l.CssClass = "font-weight-bold";
                Itc.Controls.Add(IB);
                Itc2.Controls.Add(l);
                Itr.Controls.Add(Itc);
                Itr.Controls.Add(Itc2);
                It.Controls.Add(Itr);

                p.Controls.Add(It);
                creatediv.InnerHtml = "<hr>";
                p.Controls.Add(creatediv);

                System.Web.UI.HtmlControls.HtmlGenericControl div2 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                Label email = new Label();
                email.Text = read["buyeremail"].ToString();
                email.CssClass = "font";
                p.Controls.Add(email);
                div2.InnerHtml = "<br>";
                p.Controls.Add(div2);


                System.Web.UI.HtmlControls.HtmlGenericControl div3 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                Label contact = new Label();
                contact.Text = read["buyercontactno"].ToString();
                p.Controls.Add(contact);
                div3.InnerHtml = "<br>";
                p.Controls.Add(div3);


                Label msg = new Label();
                msg.Text = read["buyermsg"].ToString();
                p.Controls.Add(msg);

                p.CssClass = "p";


                System.Web.UI.HtmlControls.HtmlGenericControl div4 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                div4.InnerHtml = "<hr>";
                p.Controls.Add(div4);

                Button selled = new Button();

                selled.ID = read["bid"].ToString();
                Button del = new Button();

                del.ID = read["Id"].ToString();
                del.Text = "DELETE";
                del.Click += new System.EventHandler(del_click);
                selled.Text = "SOLD";
                selled.Click += new System.EventHandler(selled_click);
                del.CssClass = "btn btn-group btn-block btn-danger";
                selled.CssClass = "btn float-right  btn-success btn-block";

                Table t = new Table();
                TableRow tr = new TableRow();
                TableCell tc = new TableCell();
                TableCell tc2 = new TableCell();
                tc.Controls.Add(del);
                tc2.Controls.Add(selled);
                tr.Controls.Add(tc);
                tr.Controls.Add(tc2);
                tr.CssClass = "btn-block ";
                t.Controls.Add(tr);


                p.Controls.Add(t);

                //    p.Controls.Add(del);
                //   p.Controls.Add(selled);

                System.Web.UI.HtmlControls.HtmlGenericControl div5 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                div5.InnerHtml = "<br><br>";
                p.Controls.Add(div5);



                Panel5.Controls.Add(p);
                Panel p2 = new Panel();
                p2.CssClass = "card-body ";
                System.Web.UI.HtmlControls.HtmlGenericControl div6 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                div6.InnerHtml = "";

                p2.Controls.Add(div6);
                Panel5.Controls.Add(p2);

            }
            read.Close();
            con.Close();

        }
        else
        {
            Response.Redirect("~/LogIn.aspx");
        }

    }


    protected void del_click(object sender, EventArgs e)
    {

        Button email = (Button)sender;

        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select * from sellbookrequest where id=" + email.ID;
        cmd.Connection = con;

        SqlDataReader re = cmd.ExecuteReader();
        re.Read();
        // string buyeremail = re["buyersessionemail"].ToString();
        string buyeremail = re["buyeremail"].ToString();
        string buyername = re["buyername"].ToString();
        string sellername = re["selleremail"].ToString();
        string sname = re["sellername"].ToString();
        string semail = re["selleremail"].ToString();
        string sconno = re["sellercontactno"].ToString();
        ///notification //
        //  cmd.CommandText = "insert into tblNotification (email,msg) values ('" + re["buyersessionemail"].ToString() + "','messages')";
        re.Close();
        //  cmd.Connection = con;
        // cmd.ExecuteNonQuery();
        /////////////

        cmd.CommandText = "delete  from sellbookrequest where Id ='" + email.ID + "' AND selleremail='" + Session["User"].ToString() + "'";
        cmd.Connection = con;
        cmd.ExecuteNonQuery();

        String ToEmailAddress = buyeremail;
        String EmailBody = "Dear " + buyername + ", <br/><br/> sorry! <br/>Due to Some reason. Your request to buy the books has been denied by the seller <br/><br/>  for more information contact name:" + sname + " <br/> Email:" + semail + "<br/> Contact No:" + sconno +"< br/><br/> ";
        MailMessage AccActivationMail = new MailMessage("gpmwelfarenetwork@gmail.com", ToEmailAddress);
        AccActivationMail.Body = EmailBody;
        AccActivationMail.IsBodyHtml = true;
        AccActivationMail.Subject = " book purchase request denied";

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




        con.Close();
        Response.Redirect("~/BookRequest.aspx");
    }

    protected void selled_click(object sender, EventArgs e)   //<-----CALL  WHEN CLICK ON SOLD-------->//
    {

        Button email = (Button)sender;

        con.Open();
        SqlCommand cmd1 = new SqlCommand();
        cmd1.CommandText = "select * from sellbookrequest where bid='" + email.ID + "'";
        cmd1.Connection = con;

        SqlDataReader Read6 = cmd1.ExecuteReader();
        Read6.Read();
        int sid = (int)Read6["sid"];
        string buyeremail = Read6["buyeremail"].ToString();
        string buyername = Read6["buyername"].ToString();
        string sellername = Read6["selleremail"].ToString();

        cmd1.CommandText = "delete from SellBook where sid= " + sid + "";
        Read6.Close();
        cmd1.Connection = con;
        cmd1.ExecuteNonQuery();

        cmd1.CommandText = "select * from sellbookrequest ";
        cmd1.Connection = con;
        SqlDataReader r = cmd1.ExecuteReader();
        r.Read();
        cmd1.CommandText = "delete  from sellbookrequest where bid ='" + email.ID + "'";
        // cmd1.CommandText = "delete  from sellbookrequest where bid ='" + r["buyername"] + r["sellername"] + r["booklist"] + r["sellercontactno"] + r["selleremail"] + r["buyercontactno"] + r["buyeremail"] + r["buyermsg"] + r["buyersessionemail"] + r["buyerusername"] + "' AND selleremail='" + Session["User"].ToString() + "'";
        string sname = r["sellername"].ToString();
        string semail = r["selleremail"].ToString();
        string sconno = r["sellercontactno"].ToString();
        r.Close();
        cmd1.Connection = con;
        int j = cmd1.ExecuteNonQuery();
        if (j > 0)
        {

           ////////////////////// // sending sold email ////////////
            //  String Uname = 
            String ToEmailAddress = buyeremail;
            String EmailBody = "Dear " + buyername + ", <br/><br/> The Book which you had requested to buy have been confirmed by the  owner to sell  you   <br/><br/> for more information contact name:"+sname+" <br/> Email:"+semail+"<br/> Contact No:"+sconno+" ";
            MailMessage AccActivationMail = new MailMessage("gpmwelfarenetwork@gmail.com", ToEmailAddress);
            AccActivationMail.Body = EmailBody;
            AccActivationMail.IsBodyHtml = true;
            AccActivationMail.Subject = "Book purchase request accepted";

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


            Response.Redirect("~/BookRequest.aspx");
        }
        cmd1.CommandText = "select * from sellbookrequest where bid='" + email.ID + "'";
        cmd1.Connection = con;

        SqlDataReader re = cmd1.ExecuteReader();
        re.Read();
        // string buyeremail = re["buyersessionemail"].ToString();


        ///notification //
      //  cmd1.CommandText = "insert into tblNotification (email,msg) values ('" + re["buyersessionemail"].ToString() + "','messages')";
        re.Close();
        // cmd1.Connection = con;
        // cmd1.ExecuteNonQuery();

        con.Close();



    }

    protected void btnSignout_Click(object sender, EventArgs e)
    {

        Session["User"] = null;
        Response.Redirect("~/LogIn.aspx");
    }
}