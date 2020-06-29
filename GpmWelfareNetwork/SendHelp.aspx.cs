using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


public partial class SendHelp : System.Web.UI.Page
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
            cmd.CommandText = "select * from ContactVictim where Victimemail = '" + Session["User"] + "'";
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
                cmd1.CommandText = "select * from tblImages where Email ='" + read["Helpersessionemail"] + "'";
                cmd1.Connection = con;
                SqlDataReader read1 = cmd1.ExecuteReader();
                read1.Read();
                byte[] img = (byte[])read1["Imagedata"];
                string image = Convert.ToBase64String(img);
                IB.ImageUrl = "data:Imge/jpg;base64," + image;
                read1.Close();



                l.Text = read["Helpername"].ToString();
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
                email.Text = read["Helperemail"].ToString();
                email.CssClass = "font";
                p.Controls.Add(email);
                div2.InnerHtml = "<br>";
                p.Controls.Add(div2);


                System.Web.UI.HtmlControls.HtmlGenericControl div3 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                Label contact = new Label();
                contact.Text = read["Helpercontactno"].ToString();
                contact.CssClass = "font-weight-bold";
                p.Controls.Add(contact);
                div3.InnerHtml = "<br>";
                p.Controls.Add(div3);


                Label msg = new Label();
                msg.Text = read["Helpermsg"].ToString();
                p.Controls.Add(msg);

                p.CssClass = "p";


                System.Web.UI.HtmlControls.HtmlGenericControl div4 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                div4.InnerHtml = "<hr>";
                p.Controls.Add(div4);

                Button losted = new Button();

                Button selled = new Button();

                losted.ID = read["fid"].ToString();
                Button del = new Button();

                del.ID = read["Id"].ToString();
                del.Text = "DELETE";
                del.Click += new System.EventHandler(del_click);
                losted.Text = "FOUND";
                losted.Click += new System.EventHandler(found_click);
                del.CssClass = "btn btn-group btn-block btn-danger";
                losted.CssClass = "btn float-right  btn-success btn-block";

                Table t = new Table();
                TableRow tr = new TableRow();
                TableCell tc = new TableCell();
                TableCell tc2 = new TableCell();
                tc.Controls.Add(del);
                tc2.Controls.Add(losted);
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
        cmd.CommandText = "delete  from ContactVictim where Id ='" + email.ID + "' AND Victimemail='" + Session["User"].ToString() + "'";
        cmd.Connection = con;
        int j = cmd.ExecuteNonQuery();
        if (j > 0)
        {
            Response.Write("deleated"); //for understanding only


            Response.Redirect("~/SendHelp.aspx");

        }
        con.Close();

    }

    protected void found_click(object sender, EventArgs e)   //<-----CALL  WHEN CLICK ON FOUND-------->//
    {


        Button email = (Button)sender;

        con.Open();
        SqlCommand cmd1 = new SqlCommand();
        cmd1.CommandText = "select * from ContactVictim where fid='" + email.ID + "'";
        cmd1.Connection = con;

        SqlDataReader Read6 = cmd1.ExecuteReader();
        Read6.Read();
        int lid = (int)Read6["lid"];
        // String fid = Read6["id"].ToString();
        cmd1.CommandText = "delete from Lostitem where lid= " + lid + "";
        Read6.Close();
        cmd1.Connection = con;
        cmd1.ExecuteNonQuery();

        cmd1.CommandText = "select * from ContactVictim ";
        cmd1.Connection = con;
        SqlDataReader r = cmd1.ExecuteReader();
        r.Read();
        cmd1.CommandText = "delete  from ContactVictim where fid ='" + email.ID + "'";
        r.Close();
        cmd1.Connection = con;
        int j = cmd1.ExecuteNonQuery();
        if (j > 0)
        {
            Response.Write("deleated"); //for understanding only

            Response.Redirect("~/SendHelp.aspx");
        }
        cmd1.CommandText = "select * from Contactvictim where fid='" + email.ID + "'";
        cmd1.Connection = con;

        SqlDataReader re = cmd1.ExecuteReader();
        re.Read();

        con.Close();





        //Button email = (Button)sender;

        //con.Open();
        //SqlCommand cmd = new SqlCommand();
        //cmd.CommandText = "delete  from ContactVictim where Helperemail ='" + email.ID + "' AND Victimemail='" + Session["User"].ToString() + "'";
        //cmd.Connection = con;
        //int j = cmd.ExecuteNonQuery();
        //if (j > 0)
        //{
        //    Response.Write("deleated"); //for understanding only

        //    Response.Redirect("~/SendHelp.aspx");
        //}
        //con.Close();

        //<-----CALL  WHEN CLICK ON FOUND-------->//

    }

    protected void btnSignout_Click(object sender, EventArgs e)
    {

        Session["User"] = null;
        Response.Redirect("~/LogIn.aspx");
    }
}