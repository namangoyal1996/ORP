using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        
        
        //check if user is logged in
        if (Session["userlogin"] != null)
        {
            lblLogin.Text = "Welcome, " + Session["usertitle"].ToString()+" "+Session["userfullname"].ToString()+"!";
            lblLogin.Visible = true;
            LinkButton1.Text = "Logout";
            notification.Text = "";

            if ((string)Session["usertype"] == "Verifier")
            {
                int veri = ConnectionClass.GetPendingReports((int)Session["userid"],(string)Session["userlevel"],(string)Session["userstate"]);
                if (veri == 0)
                {
                    notification.Text = "";

                }
                else
                {

                    notification.Text = "You have " + veri + " Reports to Verify!";

                }
            }
            int veri2 = ConnectionClass.GetRejectedReports((int)Session["userid"]);
            if (veri2 == 0)
            {
                LinkButton2.Text = "";

            }
            else
            {

                LinkButton2.Text = "<span style='color:red'>Your " + veri2 + " Reports have been rejected!</span>";

            }


            int veri3 = ConnectionClass.GetWaitingReports((int)Session["userid"]);
            if (veri3 == 0)
            {
                yettoverify.Text = "";

            }
            else
            {

                yettoverify.Text = "<span style='color:black'>Your " + veri3 + " Reports are waiting to be verified!</span>";

            }



        }
        else
        {
            //Response.Redirect("~/Pages/Account/Login.aspx");

            lblLogin.Visible = false;
            LinkButton1.Text = "Login";
            notification.Text = "";
            LinkButton2.Text = "";
            yettoverify.Text = "";

        }
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        //user logs in
        if(LinkButton1.Text == "Login")
        {
            Response.Redirect("~/Pages/Account/Login.aspx");

        }
        else
        {
            //User logs out
            Session.Clear();
            Response.Redirect("~/Pages/Home.aspx");

        }
    }
    protected void notification_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Pages/VerifierPage.aspx");
    }
    protected void LinkButton2_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Pages/RejectedPage.aspx");

    }
    protected void yettoverify_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Pages/yettoVerify.aspx");
    }
}
