using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

public partial class Pages_AllUsers : System.Web.UI.Page
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
            Response.Redirect("~/Pages/Account/Login.aspx");
        if(Session["userlevel"].ToString() == "District")
        {
            Response.Redirect("~/Pages/Home.aspx");


        }
        GridView1.DataSource = ConnectionClass.GetUsers((string)Session["userlevel"],(string)Session["userstate"]);
        GridView1.DataBind();
        updateuserdetails.Style.Add("display", "none");


    }
    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {
          int index = Convert.ToInt32(e.NewEditIndex);

    // Retrieve the row that contains the button 
    // from the Rows collection.
          GridView1.Visible = false;
    GridViewRow row = GridView1.Rows[index];
  //  Response.Write("erre");
    updateuserdetails.Style.Add("display", "block");
           TextBox1.Text = row.Cells[4].Text;
           TextBox3.Text = row.Cells[2].Text;
         TextBox2.Text = row.Cells[6].Text;
         TextBox5.Text = row.Cells[7].Text;
        DropDownList3.SelectedValue = row.Cells[3].Text;
       TextBox4.Text = row.Cells[5].Text;
       TextBox3.Enabled = false;
       DropDownList5.Enabled = false;
         Session["tobeupdated"] = TextBox3.Text;
    DropDownList4.SelectedValue = row.Cells[9].Text;
    TextBox2.Enabled = false;
    DropDownList4.Enabled = false;
  //  Response.Write(row.Cells[2].Text);

       // Response.Write(row.Cells[4].Text);
        DropDownList5.SelectedValue = row.Cells[10].Text;
    }
    protected void Button2_Click(object sender, EventArgs e)
    {
        Session["tobeupdated"] = null;

        GridView1.Visible = true;
        Response.Redirect(Request.RawUrl);
        GridView1.DataSource = ConnectionClass.GetUsers((string)Session["userlevel"], (string)Session["userstate"]);
        GridView1.DataBind();
        updateuserdetails.Style.Add("display", "none");
       

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        ConnectionClass.UpdateUser(Session["tobeupdated"].ToString(),DropDownList3.SelectedValue,TextBox1.Text,TextBox4.Text,TextBox5.Text,DropDownList1.SelectedValue,DropDownList2.SelectedValue);
        ConnectionClass.MakeHistory(Session["userid"].ToString(),"Updated a user",Session["tobeupdated"].ToString(),"User");
        Session["tobeupdated"] = null;
        Session["alert"] = "User has been Updated!";
        Response.Redirect(Request.RawUrl);

    }
    protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
    {

    }
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        int index = Convert.ToInt32(e.RowIndex);

        
        GridViewRow row = GridView1.Rows[index];
        ConnectionClass.DeleteUserID(row.Cells[2].Text);
       // Response.Write(row.Cells[2].Text);
        Session["alert"] = "User has been delelted!";
       Response.Redirect(Request.RawUrl);

    }
    protected void TextBox3_TextChanged(object sender, EventArgs e)
    {

    }
}