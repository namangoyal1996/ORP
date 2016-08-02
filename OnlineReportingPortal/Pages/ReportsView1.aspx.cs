using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.IO;
using System.Net;
using System.Text;
using iTextSharp.text;
using iTextSharp.text.pdf;


public partial class ReportsView1 : System.Web.UI.Page
{
    public string acttype;
    public DateTime frmactdate;
    public DateTime toactdate;
    public string sOut;
    public DateTime frmreporting;
    public DateTime toreporting;
    public string branch;
    public string reportername;
    public string verifiername;
    ArrayList reportList = new ArrayList();

       
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            return;
        Button btn2 = new Button();
        string id = Page.Request.Params["__EVENTTTARGET"];

        if (!String.IsNullOrEmpty(id))
        {
            btn2 = Page.FindControl(id) as Button;
        }
        else
        {
            foreach (var cid in Page.Request.Form.AllKeys)
            {
                Control c = Page.FindControl(cid) as Control;
                if (c is Button)
                {
                    btn2 = c as Button;
                }
            }
        }
        if (btn2.ID == "searchbtn")
        {

            Response.Write("adv");
            if (DropDownList1.SelectedValue == "All")
                acttype = "%";
            else
                acttype = DropDownList1.SelectedValue;
            if (ComboBox1.Text == "All")
                branch = "%";
            else
                branch = ComboBox1.Text;
            if (ComboBox2.Text == "All")
                reportername = "%";
            else
                reportername = ComboBox2.Text;
            if (ComboBox3.Text == "All")
                verifiername = "%";
            else
                verifiername = ComboBox3.Text;
            frmactdate = Convert.ToDateTime(activitydate.Text);
            toactdate = Convert.ToDateTime(TextBox1.Text);
            frmreporting = Convert.ToDateTime(TextBox2.Text);
            toreporting = Convert.ToDateTime(TextBox3.Text);



            //get all reports from database


            reportList = ConnectionClass.GetActivity(acttype, frmactdate, toactdate, frmreporting, toreporting, branch, reportername, verifiername);


        }
        else if (btn2.ID == "simplesearch")
        {
           Response.Write("simple");


            reportList = ConnectionClass.GetActivityByKeyword(TextBox4.Text);
        }
        else
        {
            reportList = (ArrayList)Session["reportlist"];

        }
        Session["reportlist"] = reportList;
            if (reportList.Count == 0)
                Label1.Text = "<span style='color:red'>No results match your search parameters!</span>";
            else
                Label1.Text = "<span style='color:Green'>" + reportList.Count + " results</span>";
            foreach (Report report in reportList)
            {
                //lblem.Text = report.dateofactivity;
                //create controls
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
                    Text = "</td></tr><tr><td>"

                };

                Button btn = new Button()
                {

                    Text = "View Full Report",
                    ID = report.activityid.ToString()+"_hh",
                    CausesValidation = false


                };

                btn.Click += new EventHandler(btn_Click);
                Literal literal6 = new Literal()
                {
                    Text = "</td></tr></table></div>"

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

                reportPanel.Controls.Add(btn);
                reportPanel.Controls.Add(literal6);


                pnlReports.Controls.Add(reportPanel);








            }


        }
    

   

    protected void searchbtn_click(object sender, EventArgs e)
    {
       
    }


    protected void btn_Click(object sender, EventArgs e)
    {

        Button btn = (Button)sender;
        string str = btn.ID;
        string ext = str.Substring(0, str.LastIndexOf("_"));
        Session["tobeviewed"] = ext;
        Response.Redirect("~/Pages/testing.aspx");


    }


        










    protected void simplesearch_Click(object sender, EventArgs e)
    {
        
    }
    protected void ContentsClear()
    {

       activitydate.Text="" ;
      TextBox1.Text = "";
        TextBox2.Text="" ;
       TextBox3.Text="" ;
       TextBox4.Text = "";


    }
}

