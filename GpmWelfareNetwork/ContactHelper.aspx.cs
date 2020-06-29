using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


public partial class ContactHelper : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
    SqlConnection con;
    string Id;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["fndid"] != null)
        {
            Id = Session["fndid"].ToString();
            con = new SqlConnection(cs);
            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select * from Lostitem where id='" + Id + "'";
            cmd.Connection = con;
            SqlDataReader read = cmd.ExecuteReader();
            read.Read();


            VictimName.Text = read["Victimname"].ToString();
            ITEM.Text = read["Itemlist"].ToString();
            string a = read["Victimemail"].ToString();
            victimemail.Text = read["Victimemail"].ToString();
            victimcontactno.Text = Convert.ToString(read["Victimcontactno"]);

            USERNAME.Text = Session["Firstname"].ToString() + "  " + Session["Lastname"].ToString();

            read.Close();

            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandText = "select * from tblImages where email='" + a + "'";
            cmd1.Connection = con;
            SqlDataReader read1 = cmd1.ExecuteReader();
            read1.Read();
            byte[] img = (byte[])read1["Imagedata"];
            string image = Convert.ToBase64String(img);
            vicreqimg.ImageUrl = "data:Imge/jpg;base64," + image;


            read1.Close();
            cmd1.CommandText = "select * from tblImages where email='" + Session["User"] + "'";
            cmd1.Connection = con;
            SqlDataReader read2 = cmd1.ExecuteReader();
            read2.Read();
            byte[] img1 = (byte[])read2["Imagedata"];
            string image1 = Convert.ToBase64String(img1);
            userimgvictim.ImageUrl = "data:Imge/jpg;base64," + image1;
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
            cmd.CommandText = "select * from Lostitem where Victimemail='" + victimemail.Text + "'";
            cmd.Connection = con;


            SqlDataReader re = cmd.ExecuteReader();
            re.Read();


            cmd.CommandText = "insert into ContactVictim (Helpername,Victimname,Itemlist,Victimcontactno,Victimemail,Helpercontactno,Helperemail,Helpermsg,Helpersessionemail,Helperusername,lid,fid) values('" + USERNAME.Text + "','" + VictimName.Text + "','" + ITEM.Text + "','" + victimcontactno.Text + "','" + victimemail.Text + "','" + yourContactno.Text + "','" + emailtxt.Text + "','" + addmsg.Text + "','" + Session["User"].ToString() + "','" + Session["Username"].ToString() + "'," + re["lid"] + ",'" + USERNAME.Text + VictimName.Text + ITEM.Text + victimcontactno.Text + victimemail.Text + yourContactno.Text + emailtxt.Text + addmsg.Text + Session["User"].ToString() + Session["Username"].ToString() + "')";
            cmd.Connection = con;
            re.Close();
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            {
                Session["fndid"] = null;
                Response.Redirect("~/Found.aspx");
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
        Response.Redirect("~/Login.aspx");
    }
}