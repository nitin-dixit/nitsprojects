using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class MySellingRequest : System.Web.UI.Page
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
            cmd.CommandText = "select * from SellBook where selleremail = '" + Session["User"] + "'";
            cmd.Connection = con;
            SqlDataReader read = cmd.ExecuteReader();
            while (read.Read())
            {
               
                Panel p = new Panel();
                p.CssClass = "card-header";


                System.Web.UI.HtmlControls.HtmlGenericControl div3 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");

                Label bookkname = new Label();
                bookkname.Text = read["booklist"].ToString();

                div3.Controls.Add(bookkname);

                p.Controls.Add(div3);

                System.Web.UI.HtmlControls.HtmlGenericControl div4 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                div4.InnerHtml = "<br>";

                p.Controls.Add(div4);


                Panel btn = new Panel();
                btn.CssClass = "card-header";

                Button del = new Button();
                del.CssClass = "btn ";

                del.ID = read["Id"].ToString();
                del.Text = "DELETE";
                del.Click += new System.EventHandler(del_click);

                btn.Controls.Add(del);

                p.Controls.Add(btn);
              
               MysellReq.Controls.Add(p);






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

        Button btnid = (Button)sender;

        con.Open();
        SqlCommand cmd = new SqlCommand();

        cmd.CommandText = "delete  from SellBook where Id ='" + btnid.ID + "'";
        cmd.Connection = con;
        cmd.ExecuteNonQuery();


        Response.Redirect("~/MySellingRequest.aspx");

        con.Close();

    }
}