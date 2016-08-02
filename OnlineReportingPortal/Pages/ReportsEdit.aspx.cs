using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_ReportsEdit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {


        if (Session["alert"] != null)
        {
            string s = string.Format("<script>alert('{0}')</script>", Session["alert"].ToString());
            Response.Write(s);
            Session["alert"] = null;
            // Response.Redirect(Request.RawUrl);
        }

           
           
        Report report = ConnectionClass.GetActivityByID((string)Session["tobeedited"]);
            if(!IsPostBack)
        DropDownList1.SelectedValue = report.activityname;
            TextBox1.Text = report.title;
            TextBox2.Text = report.place;
            TextBox3.Text = report.dateofactivity;
            TextBox4.Text = report.branch;
            TextBox5.Text = report.reportsubmissiondate;
            TextBox6.Text = report.reportername;
            TextBox17.Text = report.inAtt;
            TextBox18.Text = report.facilitators;
            TextBox8.Text = report.appbudget;
            TextBox9.Text = report.expenditure;
            TextBox10.Text = report.funding;
            TextBox12.Content = report.objectives;
            TextBox11.Content = report.background;

            TextBox13.Content = report.methodology;

            TextBox14.Content = report.outcomes;
            TextBox15.Content = report.participantsexp;
            TextBox16.Content = report.volunteerexp;
            TextBox19.Text = report.verifiername;
        

        
    }
    protected void btnsave_Click(object sender, EventArgs e)
    {
        string ttype;
        if (DropDownList1.SelectedValue == "Other")
            ttype = otherbox.Text;
        else
            ttype = DropDownList1.SelectedValue;
       // Response.Write(TextBox13.Content);
        Report report = ConnectionClass.GetActivityByID((string)Session["tobeedited"]);

        Report report2 = new Report(ttype, TextBox1.Text, TextBox2.Text, TextBox3.Text, report.branch, report.reportsubmissiondate, report.reportername, report.verifiername, "", TextBox17.Text, TextBox18.Text, "", TextBox8.Text, TextBox9.Text, TextBox10.Text, TextBox11.Content, TextBox12.Content, TextBox13.Content, TextBox14.Content, TextBox15.Content, TextBox16.Content, Session["userid"].ToString(),report.verifierid);


        if (Session["tobeedited"] == null)
            return;
        ConnectionClass.UpdateReportByID((string)Session["tobeedited"], report2);
        Session["alert"] = "Report Updated!";
    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        if (DropDownList1.SelectedValue == "Other")
        {
            otherbox.Visible = true;

        }
        else otherbox.Visible = false;
    }
      

    protected void Button3_Click1(object sender, EventArgs e)
    {
        int res = ConnectionClass.ChangeStatusToPending((string)Session["tobeinserted"]);
        ConnectionClass.MakeHistory(Session["userid"].ToString(), "Submitted a Report for verification", Session["tobeinserted"].ToString(), "Report");

        Session["tobeedited"] = null;

        if (res == 1)
        {

            Response.Write("<script>alert('Your Report has been Submitted for verification');</script>");


        }
        else
        {

            Response.Write("<script>alert('Error! Please try again');</script>");

        }
    }
    
    protected void Button8_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Pages/Home.aspx");
    }








    protected void Button1_Click(object sender, EventArgs e)
    {
        Session["uploadfiles"] = Session["tobeedited"];

        Response.Redirect("~/Pages/UploadImages.aspx");
    }
   
}