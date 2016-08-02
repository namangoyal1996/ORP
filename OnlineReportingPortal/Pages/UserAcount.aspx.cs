using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_UserAcount : System.Web.UI.Page
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
        if (Session["userlogin"] == null)
        {
            Response.Redirect("~/Pages/Account/Login.aspx");
            return;

        }
        TextBox1.Enabled = false;
        DropDownList3.Enabled = false;
        TextBox6.Enabled = false;
            TextBox2.Enabled= false;
            TextBox5.Enabled= false;
                DropDownList1.Enabled= false;
                DropDownList2.Enabled= false;
                    DropDownList4.Enabled = false;
        DropDownList3.SelectedValue = (string)Session["usertitle"];
        TextBox1.Text = (string)Session["userfullname"];
        TextBox6.Text = (string)Session["userdesignation"];
        TextBox2.Text = (string)Session["userlogin"];
        TextBox5.Text = (string)Session["useremail"];
        DropDownList1.SelectedValue = (string)Session["usertype"];
        DropDownList2.SelectedValue = (string)Session["userlevel"];
        DropDownList4.SelectedValue = (string)Session["userstate"];
        TextBox10.Text = (string)Session["userdistrict"];
        


    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        int change = ConnectionClass.ChangePassword((int)Session["userid"],TextBox7.Text,TextBox8.Text);
        if(change == 1)
        {
            ConnectionClass.MakeHistory(Session["userid"].ToString(), "Changed Password", Session["userid"].ToString(), "User");

            Label2.Text = "<span style='color:Green'>Password Changed</span>";
            Session["alert"] = "Password Changed!";


        }
        else
        {

            Label2.Text = "<span style='color:Red'>Error!</span>";
            Session["alert"] = "Error! Make sure your current password is correct.";



        }
        Response.Redirect(Request.RawUrl);

    }
    protected void TextBox6_TextChanged(object sender, EventArgs e)
    {

    }
}