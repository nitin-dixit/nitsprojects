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

public partial class Answer : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["User"] != null)
        {

            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            con = new SqlConnection(cs);

            if (Session["replybtn"] != null)
            {
                con.Open();
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "select * from Questions where id=" + Session["replybtn"];
                cmd.Connection = con;
                SqlDataReader R = cmd.ExecuteReader();
                R.Read();
                lblque.Text = R["question"].ToString();
                lbldesc.Text = R["description"].ToString();
                string email = R["email"].ToString();
                lblcountans.Text = R["Rcount"].ToString() + "  answers";
              //  lblcount.Text = R["count"].ToString();
                R.Close();
                cmd.CommandText = "select * from tblUsers where Email = '" + email + "'";
                cmd.Connection = con;
                SqlDataReader readtbluser = cmd.ExecuteReader();
                readtbluser.Read();
                ansusernamelbl.Text = readtbluser["Firstname"].ToString() + " " + readtbluser["Lastname"].ToString();
                readtbluser.Close();

                cmd.CommandText = "select * from tblImages where email='" + email + "'";
                cmd.Connection = con;
                readtbluser = cmd.ExecuteReader();
                readtbluser.Read();
                byte[] img = (byte[])readtbluser["Imagedata"];
                string image = Convert.ToBase64String(img);
                ansuserimage.ImageUrl = "data:Imge/jpg;base64," + image;



                readtbluser.Close();

                cmd.CommandText = "select * from Answer where QuestionId =" + Session["replybtn"];
                cmd.Connection = con;
                SqlDataReader ansread = cmd.ExecuteReader();
                while (ansread.Read())
                {
                    Panel p = new Panel();

                    p.CssClass = "postedans form-control ";
                    System.Web.UI.HtmlControls.HtmlGenericControl DIV = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                    Label ans = new Label();
                    ans.CssClass = "from-control";
                    ans.Text = ansread["answer"].ToString();
                    DIV.Controls.Add(ans);

                    p.Controls.Add(DIV);

                    System.Web.UI.HtmlControls.HtmlGenericControl DIV2 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                    ImageButton ib = new ImageButton();
                    ib.BackColor = System.Drawing.Color.White;
                    ib.BorderColor = System.Drawing.Color.White;
                    ib.CssClass = "float-right";
                    ib.Width = 60;

                    SqlCommand cmd1 = new SqlCommand();
                    cmd1.CommandText = "select * from tblImages where email='" + ansread["postemail"].ToString() + "'";
                    cmd1.Connection = con;
                    SqlDataReader read1 = cmd1.ExecuteReader();
                    read1.Read();
                    byte[] img1 = (byte[])read1["Imagedata"];
                    string image1 = Convert.ToBase64String(img1);
                    ib.ImageUrl = "data:Imge/jpg;base64," + image1;
                    read1.Close();

                    Table T = new Table();
                    TableRow tr = new TableRow();
                    TableCell tc = new TableCell();
                    TableCell tc1 = new TableCell();

                    T.CssClass = "float-right ";
                    Label username = new Label();
                    SqlCommand cmd2 = new SqlCommand();
                    cmd2.CommandText = "select * from tblUsers where Email = '" + ansread["postemail"].ToString() + "'";
                    cmd2.Connection = con;
                    SqlDataReader readname = cmd2.ExecuteReader();
                    readname.Read();
                    username.Text = readname["Firstname"].ToString() + " " + readname["Lastname"].ToString();
                    readname.Close();


                    username.CssClass = "postedandusernamelbl";
                    tc.Controls.Add(username);
                    tc1.Controls.Add(ib);
                    tr.Controls.Add(tc);
                    tr.Controls.Add(tc1);
                    T.Controls.Add(tr);

                    p.Controls.Add(T);

                    PostedAnswer.Controls.Add(p);
                }
                ansread.Close();

                con.Close();

            }

        }
        else
        {
            Response.Redirect("~/LogIn.aspx");
        }

    }

    protected void Plus_Click(object sender, EventArgs e)
    {
   /*     con.Open();
        SqlCommand cmd = new SqlCommand();

   



        cmd.CommandText = "select * from Questions where id=" + Session["replybtn"];
        cmd.Connection = con;
        SqlDataReader dr = cmd.ExecuteReader();
        dr.Read();
        int i = Convert.ToInt32(dr["count"]);
        int j = i + 1;
        dr.Close();
        cmd.CommandText = "update Questions set count =" + j + "where id=" + Session["replybtn"];
        cmd.Connection = con;
        cmd.ExecuteNonQuery();

   

        Response.Redirect("~/Answer.aspx");
        con.Close();  
    */
        
        }
    protected void min_Click(object sender, EventArgs e)
    {

      /*  con.Open();
        SqlCommand cmd = new SqlCommand();



  
        cmd.CommandText = "select * from Questions where id=" + Session["replybtn"];
        cmd.Connection = con;
        SqlDataReader dr = cmd.ExecuteReader();
        dr.Read();
        int i = Convert.ToInt32(dr["count"]);
        int j = i - 1;
        dr.Close();
        cmd.CommandText = "update Questions set count =" + j + "where id=" + Session["replybtn"];
        cmd.Connection = con;
        cmd.ExecuteNonQuery();
        Response.Redirect("~/Answer.aspx");
        con.Close();
*/    }
    protected void btnSignout_Click(object sender, EventArgs e)
    {
        Session["User"] = null;
        Response.Redirect("~/LogIn.aspx");
    }
    protected void Post_Click(object sender, EventArgs e)
    {
        con.Open();
        if (Answertxt.Value != "")
        {
            SqlCommand c = new SqlCommand();
            c.CommandText = "select * from questions where id=" + Session["replybtn"] + "";
            c.Connection = con;
            SqlDataReader dr = c.ExecuteReader();
            dr.Read();
            int i = Convert.ToInt32(dr["Rcount"]);
            int j = i + 1;
            dr.Close();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "insert into Answer(QuestionId,answer,postemail) values (" + Session["replybtn"] + ",'" + Answertxt.Value + "','" + Session["User"].ToString() + "')";
            cmd.Connection = con;
            cmd.ExecuteNonQuery();

            cmd.CommandText = "update Questions set Rcount=" + j + "where id =" + Session["replybtn"] + "";
            cmd.Connection = con;
            cmd.ExecuteNonQuery();

            Answertxt.Value = "";
            Response.Redirect("~/Questions.aspx");
        }
        con.Close();
    }

}