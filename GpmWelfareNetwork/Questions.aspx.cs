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

public partial class Questions : System.Web.UI.Page
{
    static int flag = 0;
    SqlConnection con = new SqlConnection();

    protected void Page_Load(object sender, EventArgs e)
    {

        if (searchquetxt.Text == "")
        { flag = 0; }

        if (Session["User"] != null)
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            con = new SqlConnection(cs);
            con.Open();





            SqlCommand cmd1 = new SqlCommand();
            cmd1.CommandText = "select * from tblImages where email='" + Session["User"] + "'";

            cmd1.Connection = con;
            SqlDataReader read = cmd1.ExecuteReader();
            read.Read();

            byte[] img = (byte[])read["Imagedata"];

            string image = Convert.ToBase64String(img);

            Qnauserimage.ImageUrl = "data:Imge/jpg;base64," + image;

            Qnausernamelbl.Text = Session["Firstname"].ToString() + "   " + Session["Lastname"].ToString();

            // or  read["First Name"].ToString() + "  " + read["Last Name"].ToString();

            read.Close();
            if (flag == 1)
            {


                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "select * from Questions where tags  LIKE '%" + searchquetxt.Text + "%'";
                cmd.Connection = con;
                SqlDataReader R = cmd.ExecuteReader();

                while (R.Read())
                {
                    Panel p = new Panel();

                    p.CssClass = "btn-block questionslist form-control";

                    Table t = new Table();
                    TableRow tr = new TableRow();
                    TableCell tc = new TableCell();
                    TableCell tc1 = new TableCell();


                    Label question = new Label();

                    question.CssClass = "quelabel";
                    question.Text = R["question"].ToString();

                    System.Web.UI.HtmlControls.HtmlGenericControl DIV = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                    DIV.InnerHtml = "";
                    /*    LinkButton plus = new LinkButton();


                        plus.Click += new EventHandler(plus_Click);
                        plus.Text = "+"; 
                        plus.BackColor = System.Drawing.Color.Black;
                        plus.CssClass = "plusmin";
                        plus.BorderColor = System.Drawing.Color.Black;
                        LinkButton min = new LinkButton();
                        min.Click += new EventHandler(min_Click);
                        min.Text = "-";
                        min.CssClass = "plusmin";
                        min.BackColor = System.Drawing.Color.Black;
                        min.BorderColor = System.Drawing.Color.Black;

                        Label count = new Label();
                        count.ForeColor = System.Drawing.Color.Gray;
                        count.Text = "10";

                        DIV.Controls.Add(plus);

                        DIV.Controls.Add(count);
                        DIV.Controls.Add(min);
                        */


                    
               /*     Label votes = new Label();

                    votes.ForeColor = System.Drawing.Color.White;
                    if (Convert.ToInt32(R["count"]) > 0)
                    {
                        votes.Text = " +" + R["count"];
                        votes.Font.Size = 10;
                    }
                    else
                    {
                        votes.Text = "  " + R["count"];
                        votes.Font.Size = 10;
                    }

                    DIV.Controls.Add(votes);
             */
                    tc.Controls.Add(DIV);
                    tc1.Controls.Add(question);
                    tr.Controls.Add(tc);
                    tr.Controls.Add(tc1);
                    t.Controls.Add(tr);


                    System.Web.UI.HtmlControls.HtmlGenericControl DIV1 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                    DIV1.Controls.Add(t);

                    p.Controls.Add(DIV1);


                    System.Web.UI.HtmlControls.HtmlGenericControl DIV2 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");

                    //          DIV2.InnerHtml = "&nbsp;&nbsp;&nbsp;<a href='Answer.aspx' >Reply</a>";

                    LinkButton LB = new LinkButton();
                    LB.Text = "Reply";
                    LB.ID = R["id"].ToString();
                    LB.Click += new EventHandler(b_Click);

                    Label Rc = new Label();
                    Rc.Text = "(" + R["Rcount"].ToString() + ")";
                    Rc.Font.Size = 12;
                    Rc.ForeColor = System.Drawing.Color.Blue;
                    DIV2.Controls.Add(Rc);
                    DIV2.Controls.Add(LB);

                    SqlCommand name = new SqlCommand();
                    name.CommandText = "select * from tblUsers where Email='" + R["email"].ToString() + "'";
                    name.Connection = con;
                    SqlDataReader Ndr = name.ExecuteReader();
                    Ndr.Read();
                    Label username = new Label();
                    username.Text = "posted by  " + Ndr["Firstname"].ToString() + " " + Ndr["Lastname"].ToString() + "";
                    username.CssClass = "postedname";
                    Ndr.Close();

                    username.ForeColor = System.Drawing.Color.DarkGray;

                    DIV2.Controls.Add(username);

                    p.Controls.Add(DIV2);

                    Questionspanel.Controls.Add(p);

                }
                R.Close();

                searchquetxt.Text = "";
            }
            else
            {
                SqlCommand cmd = new SqlCommand();
                cmd.CommandText = "select * from Questions";
                cmd.Connection = con;
                SqlDataReader R = cmd.ExecuteReader();

                while (R.Read())
                {
                    Panel p = new Panel();

                    p.CssClass = "btn-block questionslist form-control";

                    Table t = new Table();
                    TableRow tr = new TableRow();
                    TableCell tc = new TableCell();
                    TableCell tc1 = new TableCell();


                    Label question = new Label();

                    question.CssClass = "quelabel";
                    question.Text = R["question"].ToString();

                    System.Web.UI.HtmlControls.HtmlGenericControl DIV = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                    DIV.InnerHtml = "";
                    /*    LinkButton plus = new LinkButton();


                        plus.Click += new EventHandler(plus_Click);
                        plus.Text = "+"; 
                        plus.BackColor = System.Drawing.Color.Black;
                        plus.CssClass = "plusmin";
                        plus.BorderColor = System.Drawing.Color.Black;
                        LinkButton min = new LinkButton();
                        min.Click += new EventHandler(min_Click);
                        min.Text = "-";
                        min.CssClass = "plusmin";
                        min.BackColor = System.Drawing.Color.Black;
                        min.BorderColor = System.Drawing.Color.Black;

                        Label count = new Label();
                        count.ForeColor = System.Drawing.Color.Gray;
                        count.Text = "10";

                        DIV.Controls.Add(plus);

                        DIV.Controls.Add(count);
                        DIV.Controls.Add(min);
                        */
             /*      Label votes = new Label();

                    votes.ForeColor = System.Drawing.Color.White;
                    if (Convert.ToInt32(R["count"]) > 0)
                    {
                        votes.Text = " +" + R["count"];
                        votes.Font.Size = 10;
                    }
                    else
                    {
                        votes.Text = "  " + R["count"];
                        votes.Font.Size = 10;
                    }
                    */
                //    DIV.Controls.Add(votes);
                    tc.Controls.Add(DIV);
                    tc1.Controls.Add(question);
                    tr.Controls.Add(tc);
                    tr.Controls.Add(tc1);
                    t.Controls.Add(tr);
                    

                    System.Web.UI.HtmlControls.HtmlGenericControl DIV1 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                    DIV1.Controls.Add(t);

                    p.Controls.Add(DIV1);


                    System.Web.UI.HtmlControls.HtmlGenericControl DIV2 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");

                    // DIV2.InnerHtml = "&nbsp;&nbsp;&nbsp;<a href='Answer.aspx' >Reply</a>";

                    LinkButton LB = new LinkButton();
                    LB.Text = "Reply";
                    LB.ID = R["id"].ToString();
                    LB.Click += new EventHandler(b_Click);

                    Label Rc = new Label();
                    Rc.Text = "(" + R["Rcount"].ToString() + ")";
                    Rc.Font.Size = 12;
                    Rc.ForeColor = System.Drawing.Color.Blue;
                    DIV2.Controls.Add(Rc);
                    DIV2.Controls.Add(LB);

                    SqlCommand name = new SqlCommand();
                    name.CommandText = "select * from tblUsers where Email='" + R["email"].ToString() + "'";
                    name.Connection = con;
                    SqlDataReader Ndr = name.ExecuteReader();
                    Ndr.Read();
                    Label username = new Label();
                    username.Text = "posted by  " + Ndr["Firstname"].ToString() + " " + Ndr["Lastname"].ToString() + "";
                    username.CssClass = "postedname";
                    Ndr.Close();

                    username.ForeColor = System.Drawing.Color.DarkGray;

                    DIV2.Controls.Add(username);

                    p.Controls.Add(DIV2);

                    Questionspanel.Controls.Add(p);

                }
                R.Close();
            }
            con.Close();


        }
        else
        {
            Response.Redirect("~/LogIn.aspx");
        }

    }
    protected void b_Click(object sender, EventArgs e)
    {
        LinkButton LB = (LinkButton)sender;
        Session["replybtn"] = LB.ID;
        Response.Redirect("~/Answer.aspx");
    }
    protected void plus_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Answer.aspx");
    }
    protected void min_Click(object sender, EventArgs e)
    {

    }
    protected void btnSignout_Click(object sender, EventArgs e)
    {
        Session["User"] = null;
        Response.Redirect("~/Default.aspx");

    }
    protected void quesearch_click(object sender, EventArgs e)
    {

        flag = 1;


    }
    protected void searchtext_chaged(object sender, EventArgs e)
    {


    }

    protected void postquestionbtn_Click(object sender, EventArgs e)
    {


        if (txtquestions.Value != "")
        {
            string questions = txtquestions.Value;
            string description = Descriptiontxt.Value;
            string tags = Tagxtxt.Value;

            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "insert into Questions (email,question,description,tags,count,Rcount) values ('" + Session["User"] + "','" + questions + "','" + description + "','" + tags + "',0,0)";
            cmd.Connection = con;
            cmd.ExecuteNonQuery();

            txtquestions.Value = "";
            Descriptiontxt.Value = "";
            Tagxtxt.Value = "";

            con.Close();
            Response.Redirect("~/Questions.aspx");

        }

    }

}