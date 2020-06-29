using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddTender : System.Web.UI.Page
{
    string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
  

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            bindRepeaterData();
        }

    }

    protected void bindRepeaterData()
    {
        using (SqlConnection con = new SqlConnection(cs))
        {
            con.Open();
            SqlCommand cmd = new SqlCommand("select * from tblTender Order By PostedDate desc", con);
           
          

            DataSet ds = new DataSet();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(ds);
            if (ds.Tables[0].Rows.Count > 0)
            {
                rptrTender.Visible = true;
                rptrTender.DataSource = ds;
                rptrTender.DataBind();
            }

            else
            {
                rptrTender.Visible = false;
            }
         
            con.Close();
        }


    }

    protected void btnAddTender_Click(object sender, EventArgs e)
    {

        if (tbTitle.Text != "" && tbLink.Text != "")
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("insert into tblTender values(@title,@datetime,@link)", con);
                con.Open();
              
                cmd.Parameters.AddWithValue("@title", tbTitle.Text);
                cmd.Parameters.AddWithValue("@datetime",DateTime.Now.ToShortDateString());
                cmd.Parameters.AddWithValue("@Link", tbLink.Text.Trim());
              
                cmd.ExecuteNonQuery();
                tbTitle.Text ="";
                tbLink.Text ="";
             
                bindRepeaterData();
                Response.Redirect(Request.Url.AbsolutePath);
            }
    }
}