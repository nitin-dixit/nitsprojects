using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class SellBook : System.Web.UI.Page
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
            usernamesell.Text = Session["Firstname"].ToString() + "   " + Session["Lastname"].ToString();

            // or  read["First Name"].ToString() + "  " + read["Last Name"].ToString();
            sellemailsession.Text = Session["User"].ToString();
            con.Close();
            read.Close();



            DropDownList1.Items.Clear();
            DropDownList1.Items.Add("1");
            DropDownList1.Items.Add("2");
            DropDownList1.Items.Add("3");
            DropDownList1.Items.Add("4");
            DropDownList1.Items.Add("5");
            DropDownList1.Items.Add("6");



        }
        else
        {
            Response.Redirect("~/LogIn.aspx");
        }

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "";


    }

    protected void Button4_Click1(object sender, EventArgs e) //sell btn//
    {
        con.Open();
        SqlCommand cmd = new SqlCommand();

        if (booksselltxt.Text != "" && priceselltxt.Text != "" && sellemailsession.Text != "" && contacttxt.Text != "")
        {
            cmd.CommandText = "select TOP 1 * from SellBook ORDER BY id DESC";

            cmd.Connection = con;
            SqlDataReader r = cmd.ExecuteReader();
            r.Read();
            int sid = (int)r["sid"];
            sid = sid + 1;
            cmd.CommandText = "insert into SellBook (sellername,booklist,price,semister,selleremail,sellercontactno,sid)values ('" + Session["Firstname"] +" "+ Session["Lastname"] + "','" + booksselltxt.Text + "'," + priceselltxt.Text + "," + DropDownList1.Text + ",'" + sellemailsession.Text + "'," + contacttxt.Text + "," + sid + ")";
            r.Close();

            cmd.Connection = con;
            int i = cmd.ExecuteNonQuery();
            if (i > 0)
            { Response.Redirect("~/BuyBook.aspx"); }
            else
            {
                Response.Write("failed");
            }
        }
        else
        {
            lblSellStatus.CssClass = "alert-danger";
            lblSellStatus.Text = "All Fields Are Mandatory !";
        }
        con.Close();
    }

    protected void TextBox1_TextChanged(object sender, EventArgs e)
    {

    }

    protected void priceselltxt_TextChanged(object sender, EventArgs e)
    {

    }

    protected void contacttxt_TextChanged(object sender, EventArgs e)
    {

    }

    protected void emilselltxt_TextChanged(object sender, EventArgs e)
    {


    }
    protected void btnSignout_Click(object sender, EventArgs e)
    {

        Session["User"] = null;
        Response.Redirect("~/LogIn.aspx");
    }
}