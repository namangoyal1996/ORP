using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Text;
using System.Configuration;
using System.Data;
using System.Collections;
public partial class Pages_Home : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(Session["alert"] != null)
        {
            string s = string.Format("<script>alert('{0}')</script>", Session["alert"].ToString());
            Response.Write(s);
            Session["alert"] = null;
           // Response.Redirect(Request.RawUrl);
        }
        ArrayList list = ConnectionClass.ReportMarq();
       // <ol border-style: 'ridge'>
        Literal lt = new Literal()
        {
            Text = "<marquee direction='up'  scrollamount='5' onmouseover='this.stop();' onmouseout='this.start();'>"

        };
        Literal lten = new Literal()
        {
            Text = "</marquee>"

        };
       pnlmarq.Controls.Add(lt);

        foreach (Report report in list)
        {
            Panel reportPanel = new Panel();

            LinkButton lk = new LinkButton()
            {
                ID = report.activityid.ToString(),
                Text = "<ul class='nostyle'><li>" + report.title + " on " + report.dateofactivity + " at " + report.place + "<br/>-<span >" + report.reportername + "</span><br/><br/><br/></li></ul>"
            };
            lk.Click += new EventHandler(lk_Click);

            reportPanel.Controls.Add(lk);
            pnlmarq.Controls.Add(reportPanel);


        }
        pnlmarq.Controls.Add(lten);

       
    }

    protected void lk_Click(object sender, EventArgs e)
    {

        LinkButton btn = (LinkButton)sender;
       
        
        
        string str = btn.ID;
        Session["tobeviewed"] = str;
        //   Response.Write(Session["tobeviewed"]);
        Response.Redirect("~/Pages/testing.aspx");


    }



    
}