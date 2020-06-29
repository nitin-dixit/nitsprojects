using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.IO;

public partial class Lost : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            con = new SqlConnection(cs);

            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandText = "select * from tblImages where email='" + Session["User"] + "'";
            con.Open();
            cmd1.Connection = con;
            SqlDataReader read = cmd1.ExecuteReader();
            read.Read();

            byte[] img = (byte[])read["Imagedata"];

            string image = Convert.ToBase64String(img);

            userimgsell.ImageUrl = "data:Imge/jpg;base64," + image;
            ImageButton1.ImageUrl = "data:Imge/jpg;base64," + image;


            usernamesell.Text = read["First Name"].ToString() + "  " + read["Last Name"].ToString();
            username.Text = Session["Fname"].ToString() + "   " + Session["Lname"].ToString();
            lostemailsession.Text = Session["User"].ToString();
            Helperemail.Text = Session["User"].ToString();

            con.Close(); read.Close();

        }

    }


    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }

    protected void Button4_Click1(object sender, EventArgs e)
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();
        if (lostitemtxt.Text != "" && discriptiontxt.Text != "" && contacttxt.Text != "" && lostemailsession.Text != "")
        {
            cmd.CommandText = "select TOP 1 * from Lostitem ORDER BY id DESC";

            cmd.Connection = con;
            SqlDataReader r = cmd.ExecuteReader();
            r.Read();
            int lid = (int)r["lid"];
            lid = lid + 1;

            cmd.CommandText = "insert into Lostitem (Victimname,Itemlist,Desitem,Victimcontactno,Victimemail,lid)values ('" + Session["Fname"] + Session["Lname"] + "','" + lostitemtxt.Text + "','" + discriptiontxt.Text + "','" + contacttxt.Text + "' ,'" + lostemailsession.Text + "'," + lid + ")";
            cmd.Connection = con;
            r.Close();
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            { Response.Redirect("~/MyLostedItem.aspx"); }
            else
            {
                Response.Write("failed");
            }
        }
        //////............

    }




    protected void Btnsubmit_Click(object sender, EventArgs e)
    {


        con.Open();
        SqlCommand cmd1 = new SqlCommand();
        if (ItemList.Text != "" && DisItem.Text != "" && VictimCon.Text != "" && Helperemail.Text != "")
        {



            cmd1.CommandText = "insert into Helper (Helpername,Itemlist,Desitem,Helpercontactno,Helperemail)values ('" + Session["Fname"] + Session["Lname"] + "','" + ItemList.Text + "','" + DisItem.Text + "','" + VictimCon.Text + "' ,'" + Helperemail.Text + "')";
            cmd1.Connection = con;
            int i = cmd1.ExecuteNonQuery();
            if (i > 0)
            { Response.Redirect("~/HelperPage.aspx"); }
            else
            {
                Response.Write("failed");
            }






        }
    }









    ///////////////////////////////////////////////////////////////.











    protected void HelperHelp_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/HelperPage.aspx");
    }
    protected void discriptiontxt_TextChanged(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {

    }

    protected void contacttxt_TextChanged(object sender, EventArgs e)
    {

    }
}