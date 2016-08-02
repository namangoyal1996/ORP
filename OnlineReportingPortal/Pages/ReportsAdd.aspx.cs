using System;
using System.Collections.Generic;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.IO;
using System.Linq;
using System.Data.OleDb;
using AjaxControlToolkit;
using System.Web.UI.HtmlControls;

using System.Drawing;
using System.Drawing.Drawing2D;

public partial class Pages_ReportsAdd : System.Web.UI.Page
{
    int max;
    string coverlink = "rr";
    string excellink="ef";
    string imglink="e";
    
    protected void Page_Load(object sender, EventArgs e)
    {
       
        if(Session["userlogin"] == null)
        {
            Response.Redirect("~/Pages/Account/Login.aspx");


        }
        if (Session["usertype"].ToString() == "Verifier")
        {
            Session["alert"] = "ONLY A REPORTER CAN ADD A REPORT";
            Response.Redirect("~/Pages/Home.aspx");
        }
        DateTime dat =  DateTime.Today;
       TextBox5.Text = dat.ToString("MM/dd/yyyy");
        

       otherbox.Visible = true;
        if (!IsPostBack)
        {
            TextBox6.Text =Session["usertitle"].ToString()+ " "+Session["userfullname"].ToString() + "(" + Session["userdesignation"].ToString() + ")";
            
        
        }
        DropDownList3.SelectedValue = (string)Session["userstate"];
        if((string)Session["userlevel"] != "National")
        DropDownList3.Enabled = false;
        User verifier = ConnectionClass.GetVerifier((string)Session["userstate"], (string)Session["userlevel"], (string)Session["userdistrict"]);
        if(verifier == null)
        {
            Session["alert"] = "There are no verifiers at your level in your state!";
            Response.Redirect("~/Pages/Home.aspx");
        }
        TextBox19.Text = verifier.title +" "+ verifier.fullname + "(" + verifier.designation + ")";
       
    }

    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Response.Write("ff4");
        /*if (DropDownList1.SelectedValue == "Other")
        {
            otherbox.Visible = true;

        }
        else otherbox.Visible = false;*/
    }


   
 
    
    protected void Button2_Click(object sender, EventArgs e)
    {
        string confirmValue = Request.Form["confirm_value"];
        if (confirmValue == "No")
        {
            return;
        }
        
        try
        {
            string acttype;
            if (DropDownList1.SelectedValue == "Other")
                acttype = otherbox.Text;
            else
                acttype = DropDownList1.SelectedValue;

            string title = TextBox1.Text;
            string Venue = TextBox2.Text;
            string actdate = TextBox3.Text;
             string branch = "";
             if (Session["userlevel"].ToString() != "National")
                 branch = Session["userstate"].ToString();
             else
                 branch = DropDownList3.SelectedValue;
            string subdate = DateTime.Today.ToShortDateString();
            string reporter =  Session["usertitle"].ToString() + Session["userfullname"].ToString() + "(" + Session["userdesignation"].ToString() + ")";
            User verifier = ConnectionClass.GetVerifier((string)Session["userstate"], (string)Session["userlevel"], (string)Session["userdistrict"]);
            string verifiern = verifier.title + verifier.fullname + "(" + verifier.designation + ")";
            string cover = "na";
            string inAtt = TextBox17.Text;
            string facilitators = TextBox18.Text;
            string list = "na";
            string appbudget = TextBox8.Text;
            string expenditure = TextBox9.Text;
            string funds = TextBox10.Text;
            string background = TextBox11.Content;

            string objectives = TextBox12.Content;
            string methodology = TextBox13.Content;
            string outcomes = TextBox14.Content;
            string participantsexp = TextBox15.Content;
            string volunteerexp = TextBox16.Content;
            string reporterid = Session["userid"].ToString();
            string verifierid = verifier.id.ToString();
            Report report = new Report(acttype, title, Venue, actdate, branch, subdate, reporter, verifiern, cover, inAtt, facilitators, list, appbudget, expenditure, funds, background, objectives, methodology, outcomes, participantsexp, volunteerexp, reporterid,verifierid);
            
            Session["tobeinserted"] = ConnectionClass.AddReport((report));

            Session["uploadfiles"] = Session["tobeinserted"];
            Session["tobeinserted"] = null;
            Response.Redirect("~/Pages/UploadImages.aspx");
        }
        catch (Exception ef)
        {
            Response.Write(ef.ToString());
            formres.Text = "<span style='color:red'>Some error occured, Please try again</span>";

        }


        
    }
    protected void Button3_Click(object sender, EventArgs e)
    {
    }
    protected void Button4_Click(object sender, EventArgs e)
    {



    }
  
    protected void Button5_Click1(object sender, EventArgs e)
    {
       // Session["yes"] = "yes";
    }
    protected void Button6_Click(object sender, EventArgs e)
    {
    }
    protected void Button7_Click(object sender, EventArgs e)
    {
    }
    protected void Button3_Click1(object sender, EventArgs e)
    {
        if (Session["tobeinserted"] == null)
        {
            
            Response.Redirect("~/Pages/Home.aspx");
        }
        int res = ConnectionClass.ChangeStatusToPending(Session["tobeinserted"].ToString());
        ConnectionClass.MakeHistory(Session["userid"].ToString(),"Submitted a Report for verification",Session["tobeinserted"].ToString(),"Report");

        Session["tobeinserted"] = null;
        
        if(res == 1)
        {
            Session["alert"] = "Report Submitted for verification!";
            Response.Redirect("~/Pages/Home.aspx");

        }
        else
        {
            Session["alert"] = "Report not Submitted for verification! Please try again";

            Response.Redirect("~/Pages/Home/.aspx");

           //javascript

        }
    }
    protected void DropDownList2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Pages/Home.aspx");
    }
}