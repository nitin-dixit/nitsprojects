using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;
using System.Data;
using System.Web.Security;
using System.Net.Mail;
using System.Net;

public partial class ProfilePage1 : System.Web.UI.Page
{

    static string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
    SqlConnection con = new SqlConnection(cs);
    SqlConnection con1 = new SqlConnection(cs);
    protected void Page_Load(object sender, EventArgs e)
    {




        if (Session["profileid"] != null)
        {



            string UserEmail = Session["profileid"].ToString();




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

                string gendercheck = (string)cmdGenderCheck.ExecuteScalar();

                if (cmdImagedata.ExecuteScalar() != null)
                {
                    byte[] bytes = (byte[])cmdImagedata.ExecuteScalar();
                    string strBase64 = Convert.ToBase64String(bytes);
                    Image2.ImageUrl = "data:Image/png;base64," + strBase64; //user profile image
                }
                else if (gendercheck == "Male")
                {
                    Image2.ImageUrl = "/images/male_user.png";

                }
                else if (gendercheck == "Female")
                {
                    Image2.ImageUrl = "/images/female_user.png";

                }
                else if (gendercheck == "Other")
                {
                    Image2.ImageUrl = "/images/other_user.png";

                }




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





                string a = UserEmail;
                SqlCommand cmd1 = new SqlCommand();
                cmd1.CommandText = "select * from ImageData where email='" + a + "'";
                cmd1.Connection = con1;
                con1.Open();
                SqlDataReader read1 = cmd1.ExecuteReader();
                while (read1.Read())
                {
                    ImageButton IB = new ImageButton();

                    IB.CssClass = " uploadedimage";
                    IB.Width = 150;
                    byte[] img = (byte[])read1["image"];
                    string image = Convert.ToBase64String(img);
                    IB.ImageUrl = "data:Imge/jpg;base64," + image;


                    uploadedimage.Controls.Add(IB);
                }
                read1.Close();
                con1.Close();
            }
        }

    }
}