using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class BuyBook : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection();
    int i = 0;
    string id;
    static int flag = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {



            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            con = new SqlConnection(cs);


            if (flag == 1)
            {
                con.Open();
                SqlCommand cmd5 = new SqlCommand();
                cmd5.CommandText = "select * from SellBook where booklist LIKE '%" + txtsearch.Text + "%'";
                cmd5.Connection = con;
                SqlDataReader read5 = cmd5.ExecuteReader();



                while (read5.Read())
                {

                    if (Session["User"] == read5["selleremail"])
                    {

                    }
                    else if (read5["selleremail"].ToString() == "sid@gamail.com")
                    {

                    }
                    else
                    {


                        Panel panel = new Panel();


                        panel.CssClass = " card-body bg-light border-danger col-md-6   ";
                        Panel3.CssClass = " row col-lg-12 ";


                        Label book = new Label();
                        book.Text = read5["booklist"].ToString();
                        Label price = new Label();
                        price.Text = read5["price"].ToString();
                        Button b = new Button();
                        b.Text = "CONTACT";
                        string s = read5["id"].ToString();
                        b.ID = s;


                        System.Web.UI.HtmlControls.HtmlGenericControl DIV1 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                        Label name = new Label();

                        name.Text = read5["sellername"].ToString();
                        Table t = new Table();
                        TableRow tr = new TableRow();
                        TableCell tc = new TableCell();
                        ImageButton IB = new ImageButton();

                        IB.CssClass = "float-left rounded-circle ";
                        IB.Width = 40;
                        TableCell tc1 = new TableCell();


                        string a = read5["selleremail"].ToString();



                        SqlCommand cmd1 = new SqlCommand();
                        cmd1.CommandText = "select * from tblImages where email='" + a + "'";
                        cmd1.Connection = con;
                        SqlDataReader read1 = cmd1.ExecuteReader();
                        read1.Read();
                        byte[] img = (byte[])read1["Imagedata"];
                        string image = Convert.ToBase64String(img);
                        IB.ImageUrl = "data:Imge/jpg;base64," + image;


                        read1.Close();






                        tc.Controls.Add(IB);
                        tr.Controls.Add(tc);
                        tr.CssClass = "col-sm-12";
                        t.Controls.Add(tr);
                        tc1.Controls.Add(name);
                        tr.Controls.Add(tc1);
                        t.CssClass = " col-lg-1";
                        DIV1.Controls.Add(t);

                        panel.Controls.Add(DIV1);


                        System.Web.UI.HtmlControls.HtmlGenericControl DIV2 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                        DIV2.InnerHtml = "<hr>";
                        panel.Controls.Add(DIV2);
                        System.Web.UI.HtmlControls.HtmlGenericControl DIV3 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");

                        DIV3.Controls.Add(book);
                        panel.Controls.Add(DIV3);
                        System.Web.UI.HtmlControls.HtmlGenericControl DIV4 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");

                        price.CssClass = "font-weight-bold";
                        DIV4.Controls.Add(price);
                        panel.Controls.Add(DIV4);
                        System.Web.UI.HtmlControls.HtmlGenericControl DIV5 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                        DIV5.InnerHtml = "<hr>";
                        panel.Controls.Add(DIV5);
                        System.Web.UI.HtmlControls.HtmlGenericControl DIV6 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");






                        b.Click += new System.EventHandler(b_Click);
                        b.CssClass = "float-right btn form-control ";

                        DIV6.Controls.Add(b);

                        panel.Controls.Add(DIV6);

                        System.Web.UI.HtmlControls.HtmlGenericControl DIV7 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                        DIV7.InnerHtml = "<br>";
                        panel.Controls.Add(DIV7);





                        Panel3.Controls.Add(panel);




                    }

                }
                read5.Close();
                con.Close();

            }


            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "select * from Sellbook ORDER BY id DESC";
                cmd.Connection = con;
                SqlDataReader read = cmd.ExecuteReader();



                while (read.Read())
                {

                    if (read["selleremail"].ToString() == Session["User"].ToString())
                    {

                    }
                    else if (read["selleremail"].ToString() == "sid@gamail.com")
                    {

                    }
                    else
                    {
                        Panel panel = new Panel();

                        panel.CssClass = " card-body col-md-6  bg-light border-danger";
                        Panel3.CssClass = " row col-lg-12  ";


                        Label book = new Label();
                        book.Text = read["booklist"].ToString();
                        Label price = new Label();
                        price.Text = read["price"].ToString();

                        Button b = new Button();
                        b.Text = "CONTACT";
                        string s = read["id"].ToString();
                        b.ID = s;


                        System.Web.UI.HtmlControls.HtmlGenericControl DIV1 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                        Label name = new Label();
                        name.Text = read["sellername"].ToString();
                        name.CssClass = "  text-capitalize font-weight-bold";
                        Table t = new Table();
                        TableRow tr = new TableRow();
                        TableCell tc = new TableCell();
                        ImageButton IB = new ImageButton();

                        IB.CssClass = "float-left rounded-circle ";
                        IB.Width = 40;
                        TableCell tc1 = new TableCell();


                        string a = read["selleremail"].ToString();



                        SqlCommand cmd1 = new SqlCommand();
                        cmd1.CommandText = "select * from tblImages where email='" + a + "'";
                        cmd1.Connection = con;
                        SqlDataReader read1 = cmd1.ExecuteReader();
                        read1.Read();
                        byte[] img = (byte[])read1["Imagedata"];
                        string image = Convert.ToBase64String(img);
                        IB.ImageUrl = "data:Imge/jpg;base64," + image;
                        read1.Close();

                        tc.Controls.Add(IB);
                        tr.Controls.Add(tc);
                        tr.CssClass = "col-sm-12";
                        t.Controls.Add(tr);
                        tc1.Controls.Add(name);
                        tr.Controls.Add(tc1);
                        t.CssClass = " col-lg-1";
                        DIV1.Controls.Add(t);
                        panel.Controls.Add(DIV1);
                        System.Web.UI.HtmlControls.HtmlGenericControl DIV2 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                        DIV2.InnerHtml = "<hr>";
                        panel.Controls.Add(DIV2);
                        System.Web.UI.HtmlControls.HtmlGenericControl DIV3 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                        DIV3.Controls.Add(book);
                        panel.Controls.Add(DIV3);
                        System.Web.UI.HtmlControls.HtmlGenericControl DIV4 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                        price.CssClass = "font-weight-bold";
                        DIV4.Controls.Add(price);
                        panel.Controls.Add(DIV4);
                        System.Web.UI.HtmlControls.HtmlGenericControl DIV5 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                        DIV5.InnerHtml = "<hr>";
                        panel.Controls.Add(DIV5);
                        System.Web.UI.HtmlControls.HtmlGenericControl DIV6 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");






                        b.Click += new System.EventHandler(b_Click);
                        b.CssClass = "float-right btn form-control ";

                        DIV6.Controls.Add(b);

                        panel.Controls.Add(DIV6);

                        System.Web.UI.HtmlControls.HtmlGenericControl DIV7 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                        DIV7.InnerHtml = "<br>";
                        panel.Controls.Add(DIV7);





                        Panel3.Controls.Add(panel);




                    }

                }
                read.Close();
                con.Close();


            }
        }
        else
        {
            Response.Redirect("~/LogIn.aspx");
        }

    }



    protected void b_Click(object sender, EventArgs e)//<----CALLED WHEN CLICK ON CONTACT BUTTON FROM BUY TAB--------->//
    {




        Button b = (Button)sender;    //--get id of button Contact which is created dynamically//
        Session["btnid"] = b.ID;

        Response.Redirect("~/SendBookRequest.aspx");


        //    SqlCommand cmd = new SqlCommand();
        //    cmd.CommandText = "select * from BNS1 where id=" + id + "";
        //    cmd.Connection = con;
        //    SqlDataReader read = cmd.ExecuteReader();
        //   read.Read();


        //   sellerName.Text = read["seller"].ToString();
        //   BOOKS2.Text = read["books"].ToString();
        //  selleremail.Text = read["email"].ToString();
        //  sellercontactno.Text = read["contactno"].ToString();
        // USERNAME.Text = b.ID;
        //// read.Close();

        // con.Close();
    }






    protected void btnSignout_Click(object sender, EventArgs e)
    {

        Session["User"] = null;
        Response.Redirect("~/LogIn.aspx");
    }

    protected void search_Click(object sender, EventArgs e)
    {

        flag = 1;
    }
}