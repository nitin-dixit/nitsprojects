using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class NoticeAdd : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            bindRepeaterData();
        }
    }

    protected void btnAddNotice_Click(object sender, EventArgs e)
    {
        if (tbTitle.Text != "" && tbSubject.Text != "" && tbNotice.Text != "")
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("insert into tblNoticeBoard values(@title,@subject,@notice,@datetime)", con);
                con.Open();
                cmd.Parameters.AddWithValue("@title", tbTitle.Text);
                cmd.Parameters.AddWithValue("@subject", tbSubject.Text);
                cmd.Parameters.AddWithValue("@notice", tbNotice.Text);
                cmd.Parameters.AddWithValue("@datetime", DateTime.Now);
                cmd.ExecuteNonQuery();
                tbNotice.Text = string.Empty;
                tbSubject.Text = string.Empty;
                tbTitle.Text = string.Empty;
                bindRepeaterData();
                Response.Redirect(Request.Url.AbsolutePath);
            }
    }
    protected void bindRepeaterData()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tblNoticeBoard Order By PostedDateTime desc", con);
            SqlCommand cmd1 = new SqlCommand("select COUNT(NoticeId) from tblNoticeBoard", con);
            int noticeNo = (int)cmd1.ExecuteScalar();
       
           
            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                rptrNotices.Visible = true;
                rptrNotices.DataSource = ds;
                rptrNotices.DataBind();
            }
           
            else
            {
                rptrNotices.Visible = false;
            }

            con.Close();
        }


    }
}