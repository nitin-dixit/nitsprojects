using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class MyLostedItem : System.Web.UI.Page
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
            con = new SqlConnection(cs); http://localhost:29738/Found.aspx.cs


            if (flag == 1)
            {
                con.Open();
                SqlCommand cmd5 = new SqlCommand();
                cmd5.CommandText = "select * from Lostitem where Itemlist LIKE '%" + txtsearch.Text + "%'";
                cmd5.Connection = con;
                SqlDataReader read5 = cmd5.ExecuteReader();



                while (read5.Read())
                {

                    if (Session["User"] == read5["Victimemail"])
                    {

                
                        Panel panel = new Panel();
                        panel.CssClass = "form-control card-body  ";
                        Panel3.CssClass = "centerFound  col-lg-6";
                        //   panel.CssClass = "leftmargin col-lg-4  ";
                        //   Panel3.CssClass = "card-header bg-light border-dark";

                        Label item = new Label();
                        item.Text = read5["Itemlist"].ToString();
                        Label discription = new Label();
                        discription.Text = read5["Desitem"].ToString();
                        Label contact = new Label();
                        contact.Text = read5["Victimcontactno"].ToString();
                        Button b = new Button();
                        b.Text = "CONTACT";
                        string s = read5["id"].ToString();
                        b.ID = s;


                        System.Web.UI.HtmlControls.HtmlGenericControl DIV1 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                        Label name = new Label();
                        name.Text = read5["Victimname"].ToString();
                        Table t = new Table();
                        TableRow tr = new TableRow();
                        TableCell tc = new TableCell();
                        ImageButton IB = new ImageButton();

                        IB.CssClass = "float-left rounded-circle ";
                        IB.Width = 40;
                        TableCell tc1 = new TableCell();


                        string a = read5["Victimemail"].ToString();



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

                        DIV3.Controls.Add(item);
                        panel.Controls.Add(DIV3);
                        System.Web.UI.HtmlControls.HtmlGenericControl DIV4 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");

                        item.CssClass = "font-weight-bold";
                        DIV4.Controls.Add(discription);
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
                        DIV7.InnerHtml = "<br><br>";
                        panel.Controls.Add(DIV7);


                        Panel3.Controls.Add(panel);


                        Panel p2 = new Panel();
                        p2.CssClass = "card-body ";
                        System.Web.UI.HtmlControls.HtmlGenericControl div6 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                        div6.InnerHtml = "<br>";

                        p2.Controls.Add(div6);
                        Panel3.Controls.Add(p2);

                    }

                }
                read5.Close();
                con.Close();

            }

            else
            {
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "select * from Lostitem ORDER BY Itemlist DESC";
                cmd.Connection = con;
                SqlDataReader read = cmd.ExecuteReader();

                while (read.Read())
                {

                    if (read["Victimemail"].ToString() == Session["User"].ToString())
                    {

                  
                    
                        Panel panel = new Panel();

                        panel.CssClass = "form-control card-body  ";
                        Panel3.CssClass = "centerFound  col-lg-6";

                        // panel.CssClass = "leftmargin col-lg-4  ";
                        // Panel3.CssClass = "card-header bg-light border-dark";

                        Label item = new Label();
                        item.Text = read["Itemlist"].ToString();
                        Label discription = new Label();
                        discription.Text = read["Desitem"].ToString();
                        Label contact = new Label();
                        contact.Text = read["Victimcontactno"].ToString();
                        Button b = new Button();
                        b.Text = "DELETE";
                        string s = read["id"].ToString();
                        b.ID = s;


                        System.Web.UI.HtmlControls.HtmlGenericControl DIV1 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                        Label name = new Label();
                        name.Text = read["Victimname"].ToString();
                        // name.Text = read["Victimemail"].ToString();
                        Table t = new Table();
                        TableRow tr = new TableRow();
                        TableCell tc = new TableCell();
                        ImageButton IB = new ImageButton();

                        IB.CssClass = "float-left rounded-circle ";
                        IB.Width = 40;
                        TableCell tc1 = new TableCell();


                        string a = read["Victimemail"].ToString();





                        SqlCommand cmd1 = new SqlCommand();
                        cmd1.CommandText = "select * from tblImages where Email='" + a + "'";
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

                        DIV3.Controls.Add(item);
                        panel.Controls.Add(DIV3);
                        System.Web.UI.HtmlControls.HtmlGenericControl DIV4 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");

                        item.CssClass = "font-weight-bold";
                        DIV4.Controls.Add(discription);
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
                        DIV7.InnerHtml = "<br><br>";
                        panel.Controls.Add(DIV7);

                        System.Web.UI.HtmlControls.HtmlGenericControl DIV8 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                        DIV8.InnerHtml = "<hr>";
                        panel.Controls.Add(DIV8);
                        Panel3.Controls.Add(panel);
                        Panel p1 = new Panel();
                        p1.CssClass = "card-body ";
                        System.Web.UI.HtmlControls.HtmlGenericControl div6 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                        div6.InnerHtml = "<br>";

                        p1.Controls.Add(div6);
                        Panel3.Controls.Add(p1);
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
        Button fndid = (Button)sender;

        con.Open();
        SqlCommand cmd = new SqlCommand();

        cmd.CommandText = "delete  from Lostitem where Id ='" + fndid.ID + "'";
        cmd.Connection = con;
        cmd.ExecuteNonQuery();


        Response.Redirect("~/MyLostedItem.aspx");

        con.Close();

        //Button email = (Button)sender;

        //con.Open();
        //SqlCommand cmd1 = new SqlCommand();
        //cmd1.CommandText = "select * from ContactVictim where fid='" + email.ID + "'";
        //cmd1.Connection = con;

        //SqlDataReader Read6 = cmd1.ExecuteReader();
        //Read6.Read();
        //int lid = (int)Read6["lid"];
        //// String fid = Read6["id"].ToString();
        //cmd1.CommandText = "delete from Lostitem where lid= " + lid + "";
        //Read6.Close();
        //cmd1.Connection = con;
        //cmd1.ExecuteNonQuery();

        //cmd1.CommandText = "select * from ContactVictim ";
        //cmd1.Connection = con;
        //SqlDataReader r = cmd1.ExecuteReader();
        //r.Read();
        //cmd1.CommandText = "delete  from ContactVictim where fid ='" + email.ID + "'";
        //r.Close();
        //cmd1.Connection = con;
        //int j = cmd1.ExecuteNonQuery();
        //if (j > 0)
        //{
        //    Response.Write("deleated"); //for understanding only

        //    Response.Redirect("~/SendHelp.aspx");
        //}
        //cmd1.CommandText = "select * from Contactvictim where fid='" + email.ID + "'";
        //cmd1.Connection = con;

        //SqlDataReader re = cmd1.ExecuteReader();
        //re.Read();

        //con.Close();

    }

    protected void search_Click(object sender, EventArgs e)
    {
        flag = 1;
    }
}