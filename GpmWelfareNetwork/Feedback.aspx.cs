using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Feedback : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        { if(Session["Branch"]!=null)
            {
                string branch = Session["Branch"].ToString();
                string sqlcmd = "";
                string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
                using (SqlConnection con = new SqlConnection(cs))
                {
                   
                    if (branch == "Computer Engineering")
                    {
                        sqlcmd = "select Fid, Fname from tblCompFaculty";

                    }
                    else if (branch =="Mechanical Engineering")
                    {
                         sqlcmd = "select Fid, Fname from tblMechFaculty";

                    }
                    else if (branch =="Electrical Engineering")
                    {
                         sqlcmd = "select Fid, Fname from tblElecFaculty";

                    }
                    else if (branch =="Information Technology")
                    {
                        sqlcmd = "select Fid, Fname from tblITFaculty";

                    }
               
                    SqlCommand cmdDdlData = new SqlCommand(sqlcmd, con);
                    con.Open();
                    ddlFacultyName.DataTextField = "Fname";
                    ddlFacultyName.DataValueField = "Fid";
                    ddlFacultyName.DataSource = cmdDdlData.ExecuteReader();
                    ddlFacultyName.DataBind();
                }
            }
            else
            {

            }

        }
    }


    protected void btnSendFeedback_Click(object sender, EventArgs e)
    {
        if (TextBox1.Text != "" && TextBox2.Text != "" && rbtnlist1.SelectedIndex != -1 && rbtnlist2.SelectedIndex != -1 && rbtnlist3.SelectedIndex != -1 && rbtnlist4.SelectedIndex != -1 && rbtnlist5.SelectedIndex != -1 && ddlFacultyName.SelectedIndex != -1 && tbfeedback.Text != "")
        {
            string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                string branch = Session["Branch"].ToString();
                string Fname = Session["Fname"].ToString();
                string Lname = Session["Lname"].ToString();
                string FullName = Fname + Lname;
                string sEnrollNo = Session["EnrollNo"].ToString();
                string FacultyName = ddlFacultyName.SelectedItem.Text.ToString();
                string q1 = rbtnlist1.SelectedItem.Text.ToString();
                string q2 = rbtnlist2.SelectedItem.Text.ToString();
                string q3 = rbtnlist3.SelectedItem.Text.ToString();
                string q4 = rbtnlist4.SelectedItem.Text.ToString();
                string q5 = rbtnlist5.SelectedItem.Text.ToString();
                string FeedbackText = tbfeedback.Text.ToString();
                string sqlcmdInsertFeedback="";
                if (branch == "Computer Engineering")
                {
                    sqlcmdInsertFeedback = "insert into tblCompFeedback values('"+ FullName + "','"+ sEnrollNo + "','"+ FacultyName + "','"+ q1 + "','"+q2+ "','" + q3 + "','" + q4 + "','" + q5 + "','" + FeedbackText + "')";

                }
                else if (branch == "Mechanical Engineering")
                {
                    sqlcmdInsertFeedback = "insert into tblMechFeedback values('" + FullName + "','" + sEnrollNo + "','" + FacultyName + "','" + q1 + "','" + q2 + "','" + q3 + "','" + q4 + "','" + q5 + "','" + FeedbackText + "')";

                }
                else if (branch == "Electrical Engineering")
                {
                    sqlcmdInsertFeedback = "insert into tblElecFeedback values('" + FullName + "','" + sEnrollNo + "','" + FacultyName + "','" + q1 + "','" + q2 + "','" + q3 + "','" + q4 + "','" + q5 + "','" + FeedbackText + "')";

                }
                else if (branch == "Information Technology")
                {
                    sqlcmdInsertFeedback = "insert into tblITFeedback values('" + FullName + "','" + sEnrollNo + "','" + FacultyName + "','" + q1 + "','" + q2 + "','" + q3 + "','" + q4 + "','" + q5 + "','" + FeedbackText + "')";

                }

                SqlCommand cmdInsertFeedback = new SqlCommand(sqlcmdInsertFeedback, con);
                con.Open();
                cmdInsertFeedback.ExecuteNonQuery();
                lblFeedbackerrormsg.Text = "Feedback Submitted Successfully !";
                lblFeedbackerrormsg.ForeColor = System.Drawing.Color.Green;

                //empty all the fields 
                TextBox1.Text = "";
                TextBox2.Text = "";
                rbtnlist1.SelectedIndex = -1;
                rbtnlist2.SelectedIndex = -1;
                rbtnlist3.SelectedIndex = -1;
                rbtnlist4.SelectedIndex = -1;
                rbtnlist5.SelectedIndex = -1;
             
                tbfeedback.Text = "";
            }
        }
        else
        {
            lblFeedbackerrormsg.Text = "Please fill and Select all Fields !";
            lblFeedbackerrormsg.ForeColor = System.Drawing.Color.Red;

        }
    }
}