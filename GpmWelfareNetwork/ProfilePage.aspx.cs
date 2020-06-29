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


public partial class ProfilePage : System.Web.UI.Page
{
    static string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
    SqlConnection con = new SqlConnection(cs);
    SqlConnection con1 = new SqlConnection(cs);

    int i = 0;

    protected void Page_Load(object sender, EventArgs e)
    {


        if (Session["User"].ToString() != null)
        {


            string UserEmail;


            UserEmail = Session["User"].ToString();





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

                    i = i++;

                    Panel panel = new Panel();
                    panel.CssClass = " card-body col-md-4  border-dark card-profile ";
                    uploadedimage.CssClass = " row col-lg-12  ";
                    //    panel.CssClass = "row col-lg-3 col-sm-6 col-md-4 ";
                    System.Web.UI.HtmlControls.HtmlGenericControl DIV7 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");

                    ImageButton IB = new ImageButton();
                    LinkButton del = new LinkButton();
                    del.Text = "Delete";
                    del.ID = read1["id"].ToString();

                    del.Click += new System.EventHandler(del_Click);


                    IB.CssClass = " uploadedimage";
                    IB.Width = 150;

                    byte[] img = (byte[])read1["image"];
                    string image = Convert.ToBase64String(img);
                    IB.ImageUrl = "data:Imge/jpg;base64," + image;

                    DIV7.Controls.Add(IB);
                    panel.Controls.Add(DIV7);
                    System.Web.UI.HtmlControls.HtmlGenericControl DIV8 = new System.Web.UI.HtmlControls.HtmlGenericControl("DIV");
                    DIV8.Controls.Add(del);
                    panel.Controls.Add(DIV8);



                    uploadedimage.Controls.Add(panel);
                }
                read1.Close();
                con1.Close();
            }
        }
        else
        {
            Response.Redirect("~/LogIn.aspx");
        }
        
    }

    protected void del_Click(object sender ,EventArgs e)
    {

        LinkButton delid = (LinkButton)sender;

        con1.Open();
        SqlCommand cmd = new SqlCommand();
  

        cmd.CommandText = "delete  from ImageData where id =" + delid.ID ;
        cmd.Connection = con1;
        cmd.ExecuteNonQuery();
        con1.Close();

        Response.Redirect("~/ProfilePage.aspx");

    }

    protected void upload_click(object sender, EventArgs e)
    {


        if (i < 10)
        {


            if (btnupload.HasFile)
            {
                HttpPostedFile postedFile = btnupload.PostedFile;
                string fileName = Path.GetFileName(postedFile.FileName);
                string fileExtention = Path.GetExtension(fileName);
                int fileSize = postedFile.ContentLength;



                if (fileExtention.ToLower() == ".jpg" || fileExtention.ToLower() == ".bmp" || fileExtention.ToLower() == ".png")

                {



                    Stream stream = postedFile.InputStream;
                    BinaryReader binaryReader = new BinaryReader(stream);
                    byte[] bytes = binaryReader.ReadBytes((int)stream.Length);

                    using (con1)
                    {
                        SqlCommand cmdparm = new SqlCommand("spUploadImage", con1);
                        cmdparm.CommandType = CommandType.StoredProcedure;

                        SqlParameter email = new SqlParameter()
                        {
                            ParameterName = "@email",
                            Value = Session["User"].ToString()
                        };
                        cmdparm.Parameters.Add(email);

                        SqlParameter image = new SqlParameter()
                        {
                            ParameterName = "@image",
                            Value = bytes
                        };
                        cmdparm.Parameters.Add(image);

                        SqlParameter imagename = new SqlParameter()
                        {
                            ParameterName = "@imagename",
                            Value = fileName
                        };
                        cmdparm.Parameters.Add(imagename);
                        SqlParameter imagesize = new SqlParameter()
                        {
                            ParameterName = "@imagesize",
                            Value = fileSize
                        };
                        cmdparm.Parameters.Add(imagesize);


                        SqlParameter newid = new SqlParameter()
                        {
                            ParameterName = "@newid",
                            Value = -1,
                            Direction = ParameterDirection.Output
                        };
                        cmdparm.Parameters.Add(newid);
                        con1.Open();
                        cmdparm.ExecuteNonQuery();
                        con1.Close();




                    }


                }



            }
        }else
        {

        }
            Response.Redirect("~/ProfilePage.aspx");
        }
    
}