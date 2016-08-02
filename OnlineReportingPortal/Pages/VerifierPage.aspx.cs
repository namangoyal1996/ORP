using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_VerifierPage : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((string)Session["usertype"] != "Verifier")
        {
            return;
        
        }
        ArrayList reportList = new ArrayList();
        
        reportList = ConnectionClass.GetActivityByTypeVerifier((int)Session["userid"],(string)Session["userlevel"],(string)Session["userstate"]);
        foreach (Report report in reportList)
        {
            Panel reportPanel = new Panel();

            Literal literal2 = new Literal()
            {
                Text = "<div id='nmnpnl'><table class='nmnreportviewtable'><tr><th rowspan='9'>"

            };


            System.Web.UI.WebControls.Image image = new System.Web.UI.WebControls.Image
            {
                ImageUrl = report.cover
            };
            Literal literal3 = new Literal()
            {
                Text = "</th><th>Type:</th><td>"


            };

            Label lbltype = new Label
            {

                Text = report.activityname

            };
            Literal literal4 = new Literal()
            {
                Text = "</td></tr><tr><th >Date Of Activity:</th><td>"

            };
            Label lblactdate = new Label
            {
                Text = report.dateofactivity

            };


            Literal literal7 = new Literal()
            {
                Text = "</td></tr><tr><th>Place:</th><td>"

            };
            Label lblVenue = new Label
            {

                Text = report.place
            };
            Literal literal8 = new Literal()
            {
                Text = "</td></tr><tr><th>Organising Branch:</th><td>"

            };

            Label lblbranch = new Label
            {
                Text = report.branch

            };
            Literal literal9 = new Literal()
            {
                Text = "</td></tr><tr><th>Reporting Date:</th><td>"

            };
            Label lblsubsdate = new Label
            {

                Text = report.reportsubmissiondate
            };
            Literal literal10 = new Literal()
            {
                Text = "</td></tr><tr><th>Reporting Person:</th><td>"

            };
            Label lblreportingperson = new Label
            {

                Text = report.reportername
            };
            Literal literal11 = new Literal()
            {
                Text = "</td></tr><tr><th>Verifying Person:</th><td>"

            };
            Label lblverifier = new Label
            {
                Text = report.verifiername

            };
            Literal literal12 = new Literal()
            {
                Text = "</td></tr><tr><th>Description:</th><td>"

            };
            Label lblName = new Label
            {
                Text = report.title

            };
            Literal literal13 = new Literal()
            {
                Text = "</td></tr>"

            };
            Literal editst = new Literal()
            {
                Text = "<tr><th>"

            };
            Literal delen = new Literal()
            {
                Text = "<strong>Status:</strong>"

            };
            if ((string)report.status == "Verified  ")
            {
                delen.Text += "<span style='color:Green;'><strong>";
            }
            else
            {

                delen.Text += "<span style='color:Red;'><strong>";
            }
            Literal status = new Literal()
            {

                Text = report.status + "</strong></span>"
            };
            Literal literal66 = new Literal()
            {
                Text = "</th><td><table><tr><td>"

            };
            Button edit = new Button()
            {

                Text = "Click to Edit",

                ID = report.activityid.ToString() + "_edit",
            };
            edit.Click += new EventHandler(editbtn_Click);
            Literal edit1 = new Literal()
            {
                Text = "</td><td>"

            };

            Button fullreport = new Button()
            {

                Text = "View full Report",

                ID = report.activityid.ToString() + "_fullreport"
            };
            fullreport.Click+=new EventHandler(fullreport_Click);
            Literal edit2 = new Literal()
            {
                Text = "</td><td>"

            };
            Button delete = new Button()
            {
                OnClientClick = "Confirm()",

                Text = "Click to Delete",

                ID = report.activityid.ToString() + "_delete"
            };
            delete.Click += new EventHandler(delete_Click);

            Literal edit3 = new Literal()
            {
                Text = "</td><td>"

            };
            Button Verify = new Button()
            {

                Text = "Verified, Publish it!",

                ID = report.activityid.ToString() + "_Verify",
            };

            Verify.Click += new EventHandler(Verify_Click);
            Literal edit4= new Literal()
            {
                Text = "</td><td>"

            };

            Button Rejected = new Button()
            {

                Text = "Reject",
                ID = report.activityid.ToString() + "_Reject"
            };
            Rejected.Click += new EventHandler(Rejected_Click);

            Literal literal6 = new Literal()
            {
                Text = "</td></tr></table></tr></table></div>"

            };

            reportPanel.Controls.Add(literal2);
            reportPanel.Controls.Add(image);
            reportPanel.Controls.Add(literal3);
            reportPanel.Controls.Add(lbltype);
            reportPanel.Controls.Add(literal4);
            reportPanel.Controls.Add(lblactdate);



            reportPanel.Controls.Add(literal7);
            reportPanel.Controls.Add(lblVenue);
            reportPanel.Controls.Add(literal8);

            reportPanel.Controls.Add(lblbranch);
            reportPanel.Controls.Add(literal9);

            reportPanel.Controls.Add(lblsubsdate);
            reportPanel.Controls.Add(literal10);

            reportPanel.Controls.Add(lblreportingperson);
            reportPanel.Controls.Add(literal11);

            reportPanel.Controls.Add(lblverifier);
            reportPanel.Controls.Add(literal12);
            reportPanel.Controls.Add(lblName);
            reportPanel.Controls.Add(literal13);
            reportPanel.Controls.Add(editst);
            reportPanel.Controls.Add(delen);
            reportPanel.Controls.Add(status);
            reportPanel.Controls.Add(literal66);
            reportPanel.Controls.Add(edit);
            reportPanel.Controls.Add(edit1);
            reportPanel.Controls.Add(fullreport);
            reportPanel.Controls.Add(edit2);


            reportPanel.Controls.Add(delete);
            reportPanel.Controls.Add(edit3);
            reportPanel.Controls.Add(Verify);
            reportPanel.Controls.Add(edit4);
            reportPanel.Controls.Add(Rejected);


            reportPanel.Controls.Add(literal6);


            pnlmng.Controls.Add(reportPanel);







        }
    }

    protected void editbtn_Click(object sender, EventArgs e)
    {

        Button btn = (Button)sender;
        string str = btn.ID;
        string ext = str.Substring(0, str.LastIndexOf("_"));

        Session["tobeedited"] = ext;
      //  Response.Write(Session["tobeedited"]);
        Response.Redirect("~/Pages/ReportsEdit.aspx");

    }
    protected void fullreport_Click(object sender, EventArgs e)
    {

        Button btn = (Button)sender;
        string str = btn.ID;
        string ext = str.Substring(0, str.LastIndexOf("_"));
        Session["tobeviewed"] = ext;
     //   Response.Write(Session["tobeviewed"]);
        Response.Redirect("~/Pages/testing.aspx");

    }
    protected void delete_Click(object sender, EventArgs e)
    {
        string confirmValue = Request.Form["confirm_value"];
        if (confirmValue == "No")
        {
            return;
        }

        Button btn = (Button)sender;
        string str = btn.ID;
        string ext = str.Substring(0, str.LastIndexOf("_"));
        ConnectionClass.MakeHistory(Session["userid"].ToString(), "Deleted a Report", ext, "Report");

            ConnectionClass.DeleteReportById(ext);
       
        Label1.Text = "<span style='color:red'>Report Deleted!</span>";
        Response.Redirect(Request.RawUrl);

       // Response.Redirect("~/Pages/testing.aspx");


    }
    protected void Verify_Click(object sender, EventArgs e)
    {

        Button btn = (Button)sender;
        string str = btn.ID;
        string ext = str.Substring(0, str.LastIndexOf("_"));
        string status = "na";
        if (Session["userlevel"].ToString() == "District")
            status = "Awaiting State Approval";
        if (Session["userlevel"].ToString() == "State")
            status = "Awaiting National Approval";
        if (Session["userlevel"].ToString() == "National")
            status = "Verified";

            ConnectionClass.VerifyReport((string)Session["usertitle"]+ (string)Session["userfullname"] + "(" + (string)Session["userdesignation"] + ")", ext,status);
            ConnectionClass.MakeHistory(Session["userid"].ToString(), "Verified a Report", ext, "Report");
    
        Response.Redirect(Request.RawUrl);

       // Response.Redirect("~/Pages/ReportsEdit.aspx");

    }



    protected void Rejected_Click(object sender,EventArgs e)
    {

        Button btn = (Button)sender;
        string str = btn.ID;
        string ext = str.Substring(0, str.LastIndexOf("_"));


        Report report = ConnectionClass.GetActivityByID(ext);
        string id = report.reporterid.ToString();
        User user = ConnectionClass.GetUserById(id);
        System.Diagnostics.Process.Start("mailto:" +user.email+ "?subject=Your+report+has+been+rejected&body=Dear Sir/Madam,Your report " + report.title + " on " + report.dateofactivity + " at " + report.place + " has been rejected%0AReason for rejection:" + "%0A%0A%0A%0A%0A%0A%0A%0A%0A" + "Please make the required changes and send it for verification again%0A" + Session["usertitle"].ToString() + Session["userfullname"].ToString() + "%0A"+Session["userdesignation"].ToString());
        ConnectionClass.SetStatusToRejected(ext);
        ConnectionClass.MakeHistory(Session["userid"].ToString(), "Rejected a Report", ext, "Report");
        Response.Redirect(Request.RawUrl);

    }
   





}