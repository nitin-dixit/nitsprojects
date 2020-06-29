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

public partial class SignUp : System.Web.UI.Page
{
    public static string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
    public SqlConnection con = new SqlConnection(cs);
    int UidImages;
    public static string retval1 = "";
    public static string retval2 = "";
    protected void Page_Load(object sender, EventArgs e)
    { 
        if (!IsPostBack)
        {
            lblYear.Text = DateTime.Now.Year.ToString();
            picuploadlbl.Visible = false; 
        }

      
    }

    protected void btnsignup_Click(object sender, EventArgs e)
    {
       
      
        int passlength = tbPassword.Text.Length;

        if ((tbfirstname.Text != "") && (tblastname.Text != "") && (rbtnGenderList.SelectedItem.Text != "") && (tbUsername.Text != "") && (tbEmail.Text != "") && (tbMobileNumber.Text != "") && (tbEnrollmentNo.Text != "") && (rbtnBranchList.SelectedItem.Text != "") && (rbtnYearList.SelectedItem.Text != "") && (semesterDdl.SelectedItem.Text != "") && (tbPassword.Text != "") && (tbConfirmPassword.Text != "") && (picupload.HasFile==true))
        { if ((passlength >= 4))
            {
                if ((tbPassword.Text == tbConfirmPassword.Text))
                {
                    using (con)
                    {
                        SqlCommand cmdCheckUname = new SqlCommand("spCheckUser", con);
                        SqlCommand cmdCheckEmail = new SqlCommand("spCheckEmail", con);
                        cmdCheckUname.CommandType = CommandType.StoredProcedure;
                        cmdCheckEmail.CommandType = CommandType.StoredProcedure;
                        SqlParameter Username = new SqlParameter("@Username", tbUsername.Text.Trim());
                        SqlParameter Email = new SqlParameter("@Email", tbEmail.Text.Trim());

                        cmdCheckUname.Parameters.Add(Username);
                        cmdCheckEmail.Parameters.Add(Email);
                        con.Open();
                        int ReturnCodeUname = (int)cmdCheckUname.ExecuteScalar();
                        int ReturnCodeEmail = (int)cmdCheckEmail.ExecuteScalar();

                        if (ReturnCodeUname == -1 && ReturnCodeEmail == -1)
                        {
                            signuplbl.ForeColor = System.Drawing.Color.Red;
                            signuplbl.Text = "Email and Username already exist !";
                            tbUsername.Text = "";
                            tbEmail.Text = "";
                        }

                        else if (ReturnCodeUname == -1)
                        {

                            signuplbl.ForeColor = System.Drawing.Color.Red;
                            signuplbl.Text = "Username already exist !";
                            tbUsername.Text = "";

                        }

                        else if (ReturnCodeEmail == -1)
                        {
                            signuplbl.ForeColor = System.Drawing.Color.Red;
                            signuplbl.Text = "Email already exist !";
                            tbEmail.Text = "";
                        }



                        else
                        {
                            string EncryptedPass = FormsAuthentication.HashPasswordForStoringInConfigFile(tbPassword.Text, "SHA1");
                            DateTime datetime = DateTime.Now;


                            SqlCommand cmdusers = new SqlCommand("insert into tblUsers values('" + tbfirstname.Text.Trim() + "','" + tblastname.Text.Trim() + "','" + rbtnGenderList.SelectedItem.Text + "','" + tbUsername.Text.Trim() + "','" + tbEmail.Text.Trim() + "','" + tbMobileNumber.Text.Trim() + "','" + tbEnrollmentNo.Text.Trim() + "','" + rbtnBranchList.SelectedItem.Text + "','" + rbtnYearList.SelectedItem.Text + "','" + semesterDdl.SelectedItem.Text + "','" + EncryptedPass + "','U','" + datetime + "')", con);

                            cmdusers.ExecuteNonQuery();


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
                                        picuploadlbl.Visible = true;
                                        picuploadlbl.ForeColor = System.Drawing.Color.Red;
                                        picuploadlbl.Text = "Only images less than 5mb are permitted !";

                                    }

                                    else
                                    {
                                        Stream stream = postedFile.InputStream;
                                        BinaryReader binaryReader = new BinaryReader(stream);
                                        byte[] bytes = binaryReader.ReadBytes((int)stream.Length);

                                        using (con)
                                        {
                                            SqlCommand cmd2 = new SqlCommand("select * from tblUsers where Email='" + tbEmail.Text.Trim() + "'", con);
                                            SqlDataAdapter sda2 = new SqlDataAdapter(cmd2);
                                            DataTable dt2 = new DataTable();
                                            sda2.Fill(dt2);
                                            if (dt2.Rows.Count != 0)
                                            {
                                                UidImages = Convert.ToInt32(dt2.Rows[0][0]);
                                            }

                                            //insert into tblimages using stored procedure
                                            SqlCommand cmdimages = new SqlCommand("spUploadpic", con);
                                            cmdimages.CommandType = CommandType.StoredProcedure;



                                            SqlParameter paramFname = new SqlParameter()
                                            {
                                                ParameterName = "@FirstName",
                                                Value = tbfirstname.Text.Trim()

                                            };
                                            cmdimages.Parameters.Add(paramFname);


                                            SqlParameter paramLname = new SqlParameter()
                                            {
                                                ParameterName = "@LastName",
                                                Value = tblastname.Text.Trim()

                                            };
                                            cmdimages.Parameters.Add(paramLname);

                                            SqlParameter paramEmail = new SqlParameter()
                                            {
                                                ParameterName = "@Email",
                                                Value = tbEmail.Text.Trim()

                                            };
                                            cmdimages.Parameters.Add(paramEmail);

                                            SqlParameter paramUname = new SqlParameter()
                                            {
                                                ParameterName = "@Username",
                                                Value = tbUsername.Text.Trim()

                                            };
                                            cmdimages.Parameters.Add(paramUname);

                                            SqlParameter paramEnrollno = new SqlParameter()
                                            {
                                                ParameterName = "@Enrollmentno",
                                                Value = tbEnrollmentNo.Text.Trim()

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
                                                Value = bytes

                                            };
                                            cmdimages.Parameters.Add(paramImagedata);

                                            SqlParameter paramUid = new SqlParameter()
                                            {
                                                ParameterName = "@Uid",
                                                Value = UidImages

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
                                            picuploadlbl.Visible = true;
                                            picuploadlbl.ForeColor = System.Drawing.Color.Green;
                                            picuploadlbl.Text = "Pic uploaded successfuly !";

                                        }

                                    }

                                }
                                else
                                {
                                    picuploadlbl.Visible = true;
                                    picuploadlbl.ForeColor = System.Drawing.Color.Red;
                                    picuploadlbl.Text = "Only (.jpg , .png , .bmp) extensions allowed.";
                                }

                            }
                            
                           
                            using (SqlConnection con2=new SqlConnection(cs))
                            {
                                SqlCommand cmd = new SqlCommand("select * from tblUsers where Email='" + tbEmail.Text.Trim() + "' ", con2);
                                con2.Open();
                                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                                DataTable dt = new DataTable();
                                sda.Fill(dt);

                                if (dt.Rows.Count != 0)
                                {
                                    String myGUID = Guid.NewGuid().ToString();
                                    int Uid = Convert.ToInt32(dt.Rows[0][0]);
                                    SqlCommand cmd1 = new SqlCommand("insert into tblUserActivation values('" + myGUID + "','" + Uid + "',getdate())", con2);
                                    cmd1.ExecuteNonQuery();

                                    /////////////////////////////////////////Sending Email////////////////////////////////////////////////////////////
                                    String Uname = dt.Rows[0][4].ToString();
                                    String ToEmailAddress = dt.Rows[0][5].ToString();
                                    String EmailBody = "Hi " + Uname + ", <br/><br/> Click the Link Below to Activate your account...  <br/><br/> http://localhost:29738/AccountActivated.aspx?Uid=" + myGUID;
                                    MailMessage AccActivationMail = new MailMessage("gpmwelfarenetwork@gmail.com", ToEmailAddress);
                                    AccActivationMail.Body = EmailBody;
                                    AccActivationMail.IsBodyHtml = true;
                                    AccActivationMail.Subject = "Account activation Link";

                                    SmtpClient SMTP = new SmtpClient("smtp.gmail.com", 587);
                                    SqlCommand cmdCheckPass = new SqlCommand("select Password from tblEmailPass where Email='gpmwelfarenetwork@gmail.com'", con2);
                                    string pass = (string)cmdCheckPass.ExecuteScalar();
                                    SMTP.Credentials = new NetworkCredential()
                                    {
                                        UserName = "gpmwelfarenetwork@gmail.com",
                                        Password = pass

                                    };
                                    SMTP.EnableSsl = true;
                                    SMTP.Send(AccActivationMail);

                                }

                            }

                          
                            signuplbl.ForeColor = System.Drawing.Color.Green;
                            signuplbl.Text = "Registeration Successful! Account activation link has been sent to your Email. Check your Email to activate your account.";
                            tbfirstname.Text = "";
                            tblastname.Text = "";
                            tbMobileNumber.Text = "";
                            tbUsername.Text = "";
                            tbEmail.Text = "";
                            tbEnrollmentNo.Text = "";
                            semesterDdl.ClearSelection();
                            rbtnYearList.ClearSelection();
                            rbtnBranchList.ClearSelection();
                            rbtnGenderList.ClearSelection();
                            
                        }

                    }
                    
                        }
                else
                {
                    signuplbl.ForeColor = System.Drawing.Color.Red;
                    signuplbl.Text = "Password Do Not Match !";

                }

            }
            else
            {
                signuplbl.ForeColor = System.Drawing.Color.Red;
                signuplbl.Text = "Password must be greater than or equal to 4 characters !";
            }



        }
        else
        {
            signuplbl.ForeColor = System.Drawing.Color.Red;
            signuplbl.Text = "All Fields Are Mandatory !";
        }

    }
         
    [System.Web.Services.WebMethod]
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



    [System.Web.Services.WebMethod]
    public static string CheckEmail(string email)
    {
        string cs = ConfigurationManager.ConnectionStrings["DBCS"].ConnectionString;
        
        using (SqlConnection con = new SqlConnection(cs))
        {

            con.Open();
            SqlCommand cmd = new SqlCommand("select Email from tblUsers where Email=@Email", con);
            cmd.Parameters.AddWithValue("@Email", email);
            SqlDataReader dr = cmd.ExecuteReader();
            if (dr.HasRows)
            {
                retval2 = "true";
            }
            else
            {
                retval2 = "false";
            }

            return retval2;

        }
    }



    protected void rbtnYearList_SelectedIndexChanged(object sender, EventArgs e)
    {
        if(rbtnYearList.SelectedItem.Text == "First Year")
        {
            semesterDdl.Items.Clear();
            semesterDdl.Items.Add("1");
            semesterDdl.Items.Add("2");

        }
        else if(rbtnYearList.SelectedItem.Text == "Second Year")
        {
            semesterDdl.Items.Clear();
            semesterDdl.Items.Add("3");
            semesterDdl.Items.Add("4");

        }
        else if (rbtnYearList.SelectedItem.Text == "Third Year")
        {
            semesterDdl.Items.Clear();
            semesterDdl.Items.Add("5");
            semesterDdl.Items.Add("6");

        }

    }
}

