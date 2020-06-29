using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using System.Web.Security;
using System.IO;


public partial class EditUserProfile : System.Web.UI.Page
{
    static string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
    SqlConnection con = new SqlConnection(cs);
    public static string retval1 = "";
    public static string retval2 = "";
    int Id;//id of imagedata row in imagetable
    public static string Uname = ""; //Username
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblYear.Text = DateTime.Now.Year.ToString();
            if (Session["User"] != null)
            {

                string UserEmail = Session["User"].ToString();


                using (SqlConnection con = new SqlConnection(cs))
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
                        Session["ProfilePic"] = "data:Image/png;base64," + strBase64;

                    }
                    else if (gendercheck == "Male")
                    {
                        navbarUserImage.ImageUrl = "/images/male_user.png";
                        Session["ProfilePic"] = "/images/male_user.png";

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


                    Uname = cmdUserName.ExecuteScalar().ToString();


                    lblUserDropdownName.Text = "@" + Uname;

                    using (con)
                    {

                        if (cmdImagedata.ExecuteScalar() != null)
                        {
                            byte[] bytes = (byte[])cmdImagedata.ExecuteScalar();
                            string strBase64 = Convert.ToBase64String(bytes);
                            imgProfilePic.ImageUrl = "data:Image/png;base64," + strBase64; //profile pic

                        }
                        else
                        {
                            imgProfilePic.ImageUrl = Session["ProfilePic"].ToString();

                        }
                        SqlCommand cmdUserName1 = new SqlCommand("select * from tblUsers where Email=('" + Session["User"].ToString() + "')", con);
                        SqlDataAdapter sda = new SqlDataAdapter(cmdUserName1);
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        if (dt.Rows.Count != 0)
                        {

                            tbFName.Text = Convert.ToString((dt.Rows[0][1]));
                            tbLName.Text = Convert.ToString((dt.Rows[0][2]));
                            tbUsername.Text = Convert.ToString((dt.Rows[0][4]));
                            LabelUsername.Text = Convert.ToString((dt.Rows[0][1])) + " " + Convert.ToString((dt.Rows[0][2]));
                        }
                        con.Close();
                    }

                    //LabelUsername.Text = Session["FullName"].ToString();
                    //tbFName.Text = Session["Fname"].ToString();
                    //tbLName.Text = Session["Lname"].ToString();


                    LabelPicError.Visible = false;

                    con.Close();
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

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (Page.IsValid)
        {
            string EncryptedPass1 = FormsAuthentication.HashPasswordForStoringInConfigFile(tbPass.Text, "SHA1");
            string EncryptedPass2 = FormsAuthentication.HashPasswordForStoringInConfigFile(tbConfirmPass.Text, "SHA1");
            //checking if pic is uploaded
            if (picupload.HasFile)
            {
                HttpPostedFile postedFile = picupload.PostedFile;
                string fileName = Path.GetFileName(postedFile.FileName);
                string fileExtention = Path.GetExtension(fileName);
                int fileSize = postedFile.ContentLength;
                if (fileExtention.ToLower() == ".jpg" || fileExtention.ToLower() == ".bmp" || fileExtention.ToLower() == ".png")
                {
                    if (fileSize > 5242880)
                    {
                        LabelPicError.Visible = true;
                        LabelPicError.ForeColor = System.Drawing.Color.Red;
                        LabelPicError.Text = "Only images less than 5mb are permitted !";

                    }
                    else
                    {
                        using (con)
                        {
                            SqlCommand cmdUid = new SqlCommand("select Uid from tblUsers where Email='" + Session["User"].ToString() + "' ", con);
                            con.Open();
                            int Uid = Convert.ToInt32(cmdUid.ExecuteScalar());
                            SqlCommand cmdCheckImgExist = new SqlCommand("select * from tblImages where Email='" + Session["User"].ToString() + "'", con);
                            SqlDataAdapter sda = new SqlDataAdapter(cmdCheckImgExist);
                            DataTable dt = new DataTable();
                            sda.Fill(dt);
                            if (dt.Rows.Count != 0) //if imagedata exist for the user
                            {
                                Id = Convert.ToInt32(dt.Rows[0][0]);
                                Stream stream = picupload.PostedFile.InputStream;
                                BinaryReader binaryReader = new BinaryReader(stream);
                                byte[] Imagedata = binaryReader.ReadBytes((int)stream.Length);
                                SqlCommand cmdUpdateImgData = new SqlCommand("delete from tblImages where Email='" + Session["User"].ToString() + "'", con);
                                cmdUpdateImgData.ExecuteNonQuery();
                                //insert into tblimages using stored procedure
                                SqlCommand cmdimages = new SqlCommand("spUploadpic", con);
                                cmdimages.CommandType = CommandType.StoredProcedure;
                                SqlParameter paramFname = new SqlParameter()
                                {
                                    ParameterName = "@FirstName",
                                    Value = tbFName.Text.Trim()

                                };
                                cmdimages.Parameters.Add(paramFname);


                                SqlParameter paramLname = new SqlParameter()
                                {
                                    ParameterName = "@LastName",
                                    Value = tbLName.Text.Trim()

                                };
                                cmdimages.Parameters.Add(paramLname);

                                SqlParameter paramEmail = new SqlParameter()
                                {
                                    ParameterName = "@Email",
                                    Value = Session["User"].ToString()

                                };
                                cmdimages.Parameters.Add(paramEmail);

                                SqlParameter paramUname = new SqlParameter()
                                {
                                    ParameterName = "@Username",
                                    Value = lblUserDropdownName.Text

                                };
                                cmdimages.Parameters.Add(paramUname);

                                SqlParameter paramEnrollno = new SqlParameter()
                                {
                                    ParameterName = "@Enrollmentno",
                                    Value = Session["EnrollNo"].ToString()

                                };
                                cmdimages.Parameters.Add(paramEnrollno);


                                SqlParameter paramName = new SqlParameter()
                                {
                                    ParameterName = "@Name",
                                    Value = fileName

                                };
                                cmdimages.Parameters.Add(paramName);

                                SqlParameter paramSize = new SqlParameter()
                                {
                                    ParameterName = "@Size",
                                    Value = fileSize

                                };
                                cmdimages.Parameters.Add(paramSize);

                                SqlParameter paramImagedata = new SqlParameter()
                                {
                                    ParameterName = "@Imagedata",
                                    Value = Imagedata

                                };
                                cmdimages.Parameters.Add(paramImagedata);

                                SqlParameter paramUid = new SqlParameter()
                                {
                                    ParameterName = "@Uid",
                                    Value = Uid

                                };
                                cmdimages.Parameters.Add(paramUid);

                                SqlParameter paramNewid = new SqlParameter()
                                {
                                    ParameterName = "@Newid",
                                    Value = -1,
                                    Direction = ParameterDirection.Output

                                };
                                cmdimages.Parameters.Add(paramNewid);

                                cmdimages.ExecuteNonQuery();

                            }

                            else // else insert imgdata row in tblImages
                            {
                                using (con)
                                {
                                    Stream stream = postedFile.InputStream;
                                    BinaryReader binaryReader = new BinaryReader(stream);
                                    byte[] Imagedata = binaryReader.ReadBytes((int)stream.Length);
                                    //insert into tblimages using stored procedure
                                    SqlCommand cmdimages = new SqlCommand("spUploadpic", con);
                                    cmdimages.CommandType = CommandType.StoredProcedure;
                                    SqlParameter paramFname = new SqlParameter()
                                    {
                                        ParameterName = "@FirstName",
                                        Value = tbFName.Text.Trim()

                                    };
                                    cmdimages.Parameters.Add(paramFname);


                                    SqlParameter paramLname = new SqlParameter()
                                    {
                                        ParameterName = "@LastName",
                                        Value = tbLName.Text.Trim()

                                    };
                                    cmdimages.Parameters.Add(paramLname);

                                    SqlParameter paramEmail = new SqlParameter()
                                    {
                                        ParameterName = "@Email",
                                        Value = Session["User"].ToString()

                                    };
                                    cmdimages.Parameters.Add(paramEmail);

                                    SqlParameter paramUname = new SqlParameter()
                                    {
                                        ParameterName = "@Username",
                                        Value = lblUserDropdownName.Text

                                    };
                                    cmdimages.Parameters.Add(paramUname);

                                    SqlParameter paramEnrollno = new SqlParameter()
                                    {
                                        ParameterName = "@Enrollmentno",
                                        Value = Session["EnrollNo"].ToString()

                                    };
                                    cmdimages.Parameters.Add(paramEnrollno);


                                    SqlParameter paramName = new SqlParameter()
                                    {
                                        ParameterName = "@Name",
                                        Value = fileName

                                    };
                                    cmdimages.Parameters.Add(paramName);

                                    SqlParameter paramSize = new SqlParameter()
                                    {
                                        ParameterName = "@Size",
                                        Value = fileSize

                                    };
                                    cmdimages.Parameters.Add(paramSize);

                                    SqlParameter paramImagedata = new SqlParameter()
                                    {
                                        ParameterName = "@Imagedata",
                                        Value = Imagedata

                                    };
                                    cmdimages.Parameters.Add(paramImagedata);

                                    SqlParameter paramUid = new SqlParameter()
                                    {
                                        ParameterName = "@Uid",
                                        Value = Uid

                                    };
                                    cmdimages.Parameters.Add(paramUid);

                                    SqlParameter paramNewid = new SqlParameter()
                                    {
                                        ParameterName = "@Newid",
                                        Value = -1,
                                        Direction = ParameterDirection.Output

                                    };
                                    cmdimages.Parameters.Add(paramNewid);

                                    cmdimages.ExecuteNonQuery();

                                }
                            }

                            con.Close();
                        }


                    }
                }
                else
                {
                    LabelPicError.Visible = true;
                    LabelPicError.Text = "Only .png, .jpg, .bmp extension allowed !";
                }
            }
            ////////checking all tb filled and pass match
            if ((tbFName.Text != "") && (tbLName.Text != "") && (tbUsername.Text != "") && (EncryptedPass1 == EncryptedPass2))
            {
                retval1 = CheckUsername(tbUsername.Text);
                if (retval1 == "true")
                {
                    LabelError.Text = "Username Already exists!";

                    tbUsername.Text = string.Empty;

                }
                else if (retval1 == "false")
                {
                    using (SqlConnection con = new SqlConnection(cs))
                    {
                        SqlCommand cmd = new SqlCommand("select Password from tblUsers where Password='" + EncryptedPass1 + "' ", con);
                        con.Open();
                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        if (dt.Rows.Count != 0)
                        {
                            SqlCommand cmdUid = new SqlCommand("select Uid from tblUsers where Email='" + Session["User"].ToString() + "' ", con);
                            int Uid = Convert.ToInt32(cmdUid.ExecuteScalar());
                            SqlCommand cmdUpdate = new SqlCommand("update tblUsers set FirstName='" + tbFName.Text.Trim() + "', LastName='" + tbLName.Text.Trim() + "', Username='" + tbUsername.Text.Trim() + "' where Uid='" + Uid + "' ", con);
                            cmdUpdate.ExecuteNonQuery();
                        }
                        con.Close();
                    }

                }
                
                    using (con)
                    {
                        SqlCommand cmd = new SqlCommand("select Password from tblUsers where Password='" + EncryptedPass1 + "' ", con);
                        con.Open();
                        SqlDataAdapter sda = new SqlDataAdapter(cmd);
                        DataTable dt = new DataTable();
                        sda.Fill(dt);
                        if (dt.Rows.Count != 0)
                        {
                            SqlCommand cmdUid = new SqlCommand("select Uid from tblUsers where Email='" + Session["User"].ToString() + "' ", con);
                            int Uid = Convert.ToInt32(cmdUid.ExecuteScalar());
                            SqlCommand cmdUpdate = new SqlCommand("update tblUsers set FirstName='" + tbFName.Text.Trim() + "', LastName='" + tbLName.Text.Trim() + "' where Uid='" + Uid + "' ", con);
                            cmdUpdate.ExecuteNonQuery();
                        }
                        con.Close();
                    }

                


            }
        }
        Response.Redirect(Request.Url.AbsolutePath);
    }


    public static string CheckUsername(string user)
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;

        using (SqlConnection con = new SqlConnection(cs))
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("select Username from tblUsers where Username=@Username", con);
            cmd.Parameters.AddWithValue("@Username", user);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                retval1 = "true";
            }
            else
            {
                retval1 = "false";
            }

            return retval1;

        }
    }
}