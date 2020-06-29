using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class UserProfile : System.Web.UI.Page
{
    static string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        SqlConnection con = new SqlConnection(cs);
   
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["User"] != null)
            {
                string UserEmail = Session["User"].ToString();


                
                using (con)
                {
                    
                    SqlCommand cmdImagedata = new SqlCommand("select Imagedata from tblImages where Email=('" + UserEmail + "')", con);
                    SqlCommand cmdUserName = new SqlCommand("select Username from tblUsers where Email=('" + UserEmail + "')", con);
                    SqlCommand cmdFirstName = new SqlCommand("select FirstName from tblUsers where Email=('" + UserEmail + "')", con);
                    SqlCommand cmdLastName = new SqlCommand("select LastName from tblUsers where Email=('" + UserEmail + "')", con);
                    SqlCommand cmdMobileNo = new SqlCommand("select MobileNumber from tblUsers where Email=('" + UserEmail + "')", con);
                    SqlCommand cmdEnrollmentNo = new SqlCommand("select EnrollmentNumber from tblUsers where Email=('" + UserEmail + "')", con);
                    SqlCommand cmdBranch = new SqlCommand("select Branch from tblUsers where Email=('" + UserEmail + "')", con);
                    SqlCommand cmdGenderCheck = new SqlCommand("select Gender from tblUsers where Email=('" + UserEmail + "')", con);
                    con.Open();

                    //string gendercheck = (string)cmdGenderCheck.ExecuteScalar();

                    //if (cmdImagedata.ExecuteScalar() != null)
                    //{
                    //    byte[] bytes = (byte[])cmdImagedata.ExecuteScalar();
                    //    string strBase64 = Convert.ToBase64String(bytes);
                    //    Image2.ImageUrl = "data:Image/png;base64," + strBase64; //user profile image
                    //}
                    //else if (gendercheck == "Male")
                    //{
                    //    Image2.ImageUrl = "/images/male_user.png";
                    //    Session["UserTempProfile"] = "/images/male_user.png";

                    //}
                    //else if (gendercheck == "Female")
                    //{
                    //    Image2.ImageUrl = "/images/female_user.png";
                    //    Session["UserTempProfile"] = "/images/female_user.png";

                    //}
                    //else if (gendercheck == "Other")
                    //{
                    //    Image2.ImageUrl = "/images/other_user.png";
                    //    Session["UserTempProfile"] = "/images/other_user.png";

                    //}




                    string Uname = cmdUserName.ExecuteScalar().ToString();
                    Session["Uname"] = Uname;



                    lblUsername.Text = "@" + Uname;

                    string Fname = cmdFirstName.ExecuteScalar().ToString();
                    Session["Fname"] = Fname;
                    string Lname = cmdLastName.ExecuteScalar().ToString();
                    Session["Lname"] = Lname;
                    string MobileNo = cmdMobileNo.ExecuteScalar().ToString();
                    Session["MobileNo"] = MobileNo;
                    string EnrollNo = cmdEnrollmentNo.ExecuteScalar().ToString();
                    Session["EnrollNo"] = EnrollNo;
                    string Branch = cmdBranch.ExecuteScalar().ToString();
                    Session["Branch"] = Branch;
                    string FullName = "&nbsp;" + Fname + "&nbsp;" + Lname;
                    Session["FullName"] = FullName;
                    lblName.Text = "Name: " + FullName.Trim();
                    lblEmail.Text = "E-mail:" + "&nbsp;" + UserEmail;
                    lblMobileNo.Text = "Mobile Number:" + "&nbsp;" + MobileNo;
                    lblEnrollmentNo.Text = "Enrollment Number:" + "&nbsp;" + EnrollNo;
                    lblBranch.Text = "Branch:" + "&nbsp;" + Branch;
                }
            }
            else
            {
                Response.Redirect("~/LogIn.aspx");
            }

        }
    }
}