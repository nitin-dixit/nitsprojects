using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class UserMaster : System.Web.UI.MasterPage
{
    static string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
    SqlConnection con = new SqlConnection(cs);
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack) {
            lblYear.Text = DateTime.Now.Year.ToString();

            if (Session["User"] != null)
                    {
                Session["ProfilePic"] = null;
                        string UserEmail = Session["User"].ToString();

          
                        using (con)
                        {
                            SqlCommand cmdImagedata = new SqlCommand("select Imagedata from tblImages where Email=('" + UserEmail + "')", con);
                            SqlCommand cmdUserName = new SqlCommand("select Username from tblUsers where Email=('" + UserEmail + "')", con);
                            SqlCommand cmdGenderCheck = new SqlCommand("select Gender from tblUsers where Email=('" + UserEmail + "')", con);
                            con.Open();
                    string gendercheck = (string)cmdGenderCheck.ExecuteScalar();

                    if (cmdImagedata.ExecuteScalar() != null)
                    {
                        byte[] bytes = (byte[])cmdImagedata.ExecuteScalar();
                        string strBase64 = Convert.ToBase64String(bytes);
                        navbarUserImage.ImageUrl = "data:Image/png;base64," + strBase64; //navbar profile pic default
                        Session["ProfilePic"]= "data:Image/png;base64," + strBase64;

                    }
                    else if (gendercheck == "Male")
                    {
                        navbarUserImage.ImageUrl = "/images/male_user.png";
                        Session["ProfilePic"]= "/images/male_user.png";

                    }
                    else if (gendercheck == "Female")
                    {
                        navbarUserImage.ImageUrl = "/images/female_user.png";
                        Session["ProfilePic"] = "/images/female_user.png";
                    }
                    else if (gendercheck == "Other")
                    {
                        navbarUserImage.ImageUrl = "/images/other_user.png";
                        Session["ProfilePic"] = "/images/other_user.png";

                    }

                    
                            string Uname = cmdUserName.ExecuteScalar().ToString();
                    
                    
                            lblUserDropdownName.Text = "@" + Uname;
                        }
                    }
                    else
                    {
                        Response.Redirect("~/LogIn.aspx");
            }
        }

    }
    protected void btnSignout_Click(object sender, EventArgs e)
    {
        Session["User"] = null;
        Session["Uname"] = null;
        Session["ProfilePic"] = null;
        Session["Fname"] = null; 
        Session["Lname"] = null; 
        Session["MobileNo"] = null; 
        Session["EnrollNo"] = null;
        Session["Branch"] = null;
        Session["FullName"] = null;
        Session["Firstname"] = null;
        Session["Lastname"] = null;
        Session["Username"] = null;
        Response.Redirect("~/LandingPage.aspx");
    }
}
