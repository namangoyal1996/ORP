using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Net.Mime;
using System.IO;
using System.Data;

public partial class Pages_Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["userlogin"] == null)
        {
            Response.Redirect("~/Pages/Account/Login.aspx");


        }
        if ((string)Session["userlevel"] == "District")
        {

            Label1.Text = "No Access!!";
            registertable.Style.Add("display", "none");

            return;

        }
        DropDownList2.Items.Clear();

            if ((string)Session["userlevel"] == "State")
            {

                DropDownList4.SelectedValue=Session["userstate"].ToString();
                DropDownList4.Enabled = false;
                DropDownList2.Items.Add(new ListItem("State", "State"));
                DropDownList2.Items.Add(new ListItem("District", "District"));
                DataTable dt = new DataTable();
                dt = ConnectionClass.GetDistricts(DropDownList4.SelectedValue);
                DropDownList5.DataSource = dt;

                DropDownList5.DataTextField = "DistrictName";
                DropDownList5.DataValueField = "DistrictName";
                DropDownList5.DataBind();


            }
            else if((string)Session["userlevel"] == "National")
            {
                DropDownList2.Items.Add(new ListItem("National", "National"));

                DropDownList2.Items.Add(new ListItem("State", "State"));
                DropDownList2.Items.Add(new ListItem("District", "District"));
                
            }
            else if((string)Session["userlevel"] == "District" && (string)Session["usertype"] == "Verifier")
            {

                DropDownList2.Items.Add(new ListItem("District", "District"));
               
            }
        
      
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string a = "namn";
            string b = "nmn";
            if ((Session["userlevel"].ToString() == "State" && Session["userstate"].ToString() != DropDownList4.SelectedItem.ToString()) || (Session["userlevel"].ToString() == "District" && Session["userstate"].ToString() != DropDownList4.SelectedItem.ToString()) || (Session["userlevel"].ToString() == "District" && Session["userdistrict"].ToString() != DropDownList5.SelectedValue))
            {
                Label1.ForeColor = System.Drawing.Color.Red; 
                Label1.Text = "User not registered!";
                return;



            }

        User user = new User(TextBox2.Text,TextBox3.Text,DropDownList1.SelectedItem.ToString(),TextBox5.Text,TextBox1.Text,TextBox6.Text,DropDownList2.SelectedItem.ToString(),Session["userstate"].ToString(),DropDownList3.SelectedItem.ToString(),DropDownList5.SelectedItem.ToString());
        User verifier = ConnectionClass.GetVerifier(user.state,user.level,user.district);
        if(user.type == "Verifier" && verifier != null)
        {
            Label1.ForeColor = System.Drawing.Color.Red;

            Label1.Text = "There already exists a verifier at this level of this state!";
            return;


        }
        string sts = ConnectionClass.AddUser(user);
        if(sts == "fullname")
        {
            Label1.ForeColor = System.Drawing.Color.Red; 

            Label1.Text = "A User with same Fullname already exists!Make sure user is not already registered";


        }
        else if(sts == "loginname")
        {
            Label1.ForeColor = System.Drawing.Color.Red; 

            Label1.Text = "A User with same loginname already exists!";



        }
        
        else
        {
            System.Diagnostics.Process.Start("mailto:" + TextBox5.Text + "?subject=Login+Credentials+for+Online+Reporting+Portal&body=LoginName:" + TextBox2.Text + "%0APassword:" + TextBox3.Text);

            Label1.ForeColor = System.Drawing.Color.Green; 

            Label1.Text = "User Registered!!";
            ConnectionClass.MakeHistory(Session["userid"].ToString(), "Added a user", sts, "User");

            
        }


        /* string b= "Respected Sir/Madam, here are your login credentials for online reporting portal<br/><table><th>Title:</th><td>" + DropDownList3.SelectedValue + "</td></tr><tr><th>Full Name</th><td>" + TextBox1.Text + "</td></tr><tr><th>LoginName</th><td>" + TextBox2.Text + "</td></tr><tr><th>Password:</th><td>" + TextBox3.Text + "</td></tr><tr><th>E-mail</th><td>" + TextBox5.Text + "</td></tr><tr><th>User Type:</th><td>" + DropDownList1.SelectedValue + "</td></tr><tr><th>User Level</th><td>" + DropDownList2.SelectedValue + "</td></tr><tr><th>User State</th><td>"+DropDownList4.SelectedValue+"</td></tr></table><br/>Have a good day!";

 MailMessage message = new MailMessage();
 SmtpClient smtpClient = new SmtpClient();
 string msg = string.Empty;
 try
 {
     MailAddress fromAddress = new MailAddress("f2014117@hyderabad.bits-pilani.ac.in");
     message.From = fromAddress;
     message.To.Add("jjjj@gmail.com");
     message.Subject = "Login Credentials for Online Reporting Portal";
     message.IsBodyHtml = true;
     message.Body = "Respected Sir/Madam, here are your login credentials for online reporting portal\n<table><th>Title:</th><td>" + DropDownList3.SelectedValue + "</td></tr><tr><th>Full Name</th><td>" + TextBox1.Text + "</td></tr><tr><th>LoginName</th><td>" + TextBox2.Text + "</td></tr><tr><th>Password:</th><td>" + TextBox3.Text + "</td></tr><tr><th>E-mail</th><td>" + TextBox5.Text + "</td></tr><tr><th>User Type:</th><td>" + DropDownList1.SelectedValue + "</td></tr><tr><th>User Level</th><td>" + DropDownList2.SelectedValue + "</td></tr><tr><th>User State</th><td>"+DropDownList4.SelectedValue+"</td></tr></table><br/>Have a good day!";
     smtpClient.Host = "smtp.gmail.com";   // We use gmail as our smtp client
     smtpClient.Port = 587;
          
   smtpClient.UseDefaultCredentials = true;
   //  smtpClient.EnableSsl = true;
     //smtpClient.Credentials = new System.Net.NetworkCredential("","");

     smtpClient.Send(message);
     msg = "Successful<BR>";
 }
 catch (Exception ex)
 {
     Response.Write(ex.Message);
 }*/
    }
    protected void TextBox3_TextChanged(object sender, EventArgs e)
    {

    }
    protected void DropDownList4_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList4.SelectedValue == "Select a state")
        {
            DropDownList5.SelectedValue = null;

            return;
        }
        DataTable dt = new DataTable();
        dt = ConnectionClass.GetDistricts(DropDownList4.SelectedValue.ToString());
        DropDownList5.DataSource = dt;

        DropDownList5.DataTextField = "DistrictName";
        DropDownList5.DataValueField = "DistrictName";
        DropDownList5.DataBind();
    }
    protected void DropDownList3_SelectedIndexChanged(object sender, EventArgs e)
    {
    }
}