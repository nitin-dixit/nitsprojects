using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Net.Mail;

public partial class ContactUs : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }



    protected void btnSendMessage_Click(object sender, EventArgs e)
    {
        if(tbName.Text!=""&& tbEmail.Text!=""&& tbMessage.Text!="")
        {
            string userName = tbName.Text;
            string userEmail = tbEmail.Text.Trim();
            string userPhone;
            string userMessage = tbMessage.Text;
            string EmailBody = "";
            if (tbPhone.Text!="")
            {
              userPhone = tbPhone.Text.Trim();
              EmailBody = "Hi Admin,<br/> <br/>Below is the message from user, Kindly go through it : <br/> <br/> User Name: " + userName + "<br/> User Email: " + userEmail + "<br/> User MobileNo: " + userPhone + "<br/> User Message: " + userMessage + "<br/>";
            }
            else
            {
                EmailBody = "Hi Admin,<br/> <br/>Below is the message from user, Kindly go through it : <br/> <br/> User Name: " + userName + "<br/> User Email: " + userEmail +"<br/> User Message: " + userMessage + "<br/>";
            }
            MailMessage userMessageMail = new MailMessage("nitindixit.ji@gmail.com", "gpmwelfarenetwork@gmail.com");
            userMessageMail.Body = EmailBody;
            userMessageMail.Subject = "Contact Us Form User Message";
            userMessageMail.IsBodyHtml = true;
            SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
            SMTP.Credentials = new NetworkCredential()
            {
                UserName = "nitindixit.ji@gmail.com",
                Password = "nitindixitji1910"

            };
            SMTP.EnableSsl = true;
            SMTP.Send(userMessageMail);



            //clear all textboxes
            tbName.Text = "";
            tbEmail.Text = "";
            tbMessage.Text = "";
        }
    }
}