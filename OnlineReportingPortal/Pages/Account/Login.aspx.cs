using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_Account_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       // Response.Write("<script>alert('Error! Please try again');</script>");
       // Response.Redirect("~/Pages/Home.aspx");
        getpass.Style.Add("display", "none");

       // Label1.Text = "<a href = " + Request.Url.GetLeftPart(UriPartial.Authority) + "/Images/Wildlife.wmv>rere</a>";
       /* try
        {
            MailMessage mailMessage = new MailMessage();
            mailMessage.To.Add("namangoyal1996@gmail.com");
            mailMessage.From = new MailAddress("namangoyal1996@gmail.com");
            mailMessage.Subject = "ASP.NET e-mail test";
            mailMessage.Body = "Hello world,\n\nThis is an ASP.NET test e-mail!";
            SmtpClient smtpClient = new SmtpClient();
            smtpClient.Host = "smtp.gmail.com";   // We use gmail as our smtp client
            smtpClient.Port = 587; 
            smtpClient.Send(mailMessage);

            Response.Write("E-mail sent!");
        }
        catch (Exception ex)
        {
            Response.Write("Could not send the e-mail - error: " + ex.Message);
        }
        int user = 6;
        string report = "1";
        ConnectionClass.MakeHistory(user.ToString(), "sesfsefse", report.ToString(),"Report");
        ConnectionClass.MakeHistory(user.ToString(), "sesfsefse", "1", "User");*/

    }
    protected void nmnbtnlogin_Click(object sender, EventArgs e)
    {
        User user = ConnectionClass.LoginUser(nmntxtlogin.Text,nmntxtpassword.Text);
        
        if(user != null)
        {
            //store login varialble in session
            Session["userid"] = user.id;
            Session["userlogin"] = user.username;
            Session["usertype"] = user.type;
            Session["useremail"] = user.email;
            Session["userfullname"] = user.fullname;
            Session["userdesignation"] = user.designation;
            Session["userlevel"] = user.level;
            Session["userstate"] = user.state;
            Session["usertitle"] = user.title;
            Session["userdistrict"] = user.district;
            Session.Timeout = 60;

            Response.Redirect("~/Pages/Home.aspx");

        }
        else
        {
            lblerror.Text = "<span style='color:red'>Login Failed</span>";


        }
    }
    protected void LinkButton3_Click(object sender, EventArgs e)
    {
        getpass.Style.Add("display", "block");
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
       ArrayList list = ConnectionClass.GetEmailPassByLoginName(TextBox1.Text);
       Response.Write(list[0]);
       Response.Write(list[1]);

    }
}