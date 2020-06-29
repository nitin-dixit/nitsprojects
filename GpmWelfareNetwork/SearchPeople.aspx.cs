using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;


public partial class SearchPeople : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection();

    static int flag = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (searchusertxt.Text == "")
        { flag = 0; }


        if (Session["User"] != null)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            con = new SqlConnection(cs);
            con.Open();

            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "select *from tblUsers where Email LIKE '%" + searchusertxt.Text + "%' ";
            cmd.Connection = con;
            SqlDataReader R = cmd.ExecuteReader();

            while (R.Read())
            {


                if (R["Email"].ToString() == "sid@gamail.com")
                {

                }

                else if (R["Email"].ToString() == "gpmadmin@admin.com")
                {

                }
                else if (R["Email"].ToString() == "fid@gmail.com")
                {

                }
                else
                {
                    Panel p = new Panel();
                    p.CssClass = " card-body col-lg-10 eachuser ";
                   

                    LinkButton name = new LinkButton();
                    name.ID = R["Email"].ToString();
                    name.Click += new EventHandler(name_Click);
                    name.ForeColor = System.Drawing.Color.White;
                    name.Text = R["FirstName"].ToString() + "  " + R["LastName"].ToString();
                    name.CssClass = "namefont";

                    System.Web.UI.HtmlControls.HtmlGenericControl DIV1 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                    Table t = new Table();
                    TableRow tr = new TableRow();
                    TableCell tc = new TableCell();
                    TableCell tc1 = new TableCell();
               //     TableRow tr1 = new TableRow();
                //    tr1.CssClass = "postedname";


                    //<--------------    User Image ------------------->//
                    ImageButton IB = new ImageButton();

                    IB.CssClass = "float-left rounded-circle ";
                    IB.Width = 40;
                    string a = R["Email"].ToString();
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
                    tc1.Controls.Add(name);


                    tr.Controls.Add(tc);
                    tr.Controls.Add(tc1);
                    t.Controls.Add(tr);

                    /*     Label B = new Label();
                         B.Text = R["Branch"].ToString();
                         B.ForeColor = System.Drawing.Color.White;
                         B.CssClass = "postedname";
                         TableCell tc3 = new TableCell();
                         tc3.CssClass = "postedname";
                         tc3.Controls.Add(B);
                         tr1.Controls.Add(tc3);
                         t.Controls.Add(tr1);
                         */

                    Label B = new Label();
                    B.Text = R["Branch"].ToString();
                    B.ForeColor = System.Drawing.Color.White;
                    B.CssClass = "postedname";
                   
                    p.Controls.Add(t);
                    System.Web.UI.HtmlControls.HtmlGenericControl DIV7 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                    DIV1.InnerHtml = "<br><br>";
                    p.Controls.Add(DIV7);
                    p.Controls.Add(B);
                    user.Controls.Add(p);
                }

            }
            R.Close();
        }
        con.Close();


    }


    protected void usersearch_click(object sender, EventArgs e)
    {


        flag = 1;
        

    }


    protected void name_Click(object sender, EventArgs e)
    {

        LinkButton b = (LinkButton)sender;
                                               //--get id of button Contact which is created dynamically//
        Session["profileid"] = b.ID;

        if (Session["profileid"].ToString() == Session["User"].ToString())
        {
            Response.Redirect("~/ProfilePage.aspx");
        }
        else
        {
            Response.Redirect("~/ProfilePage1.aspx");
        }

    }


}

