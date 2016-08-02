using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Pages_UploadImages : System.Web.UI.Page
{

    public static ArrayList Files = new ArrayList();

    protected void Page_Load(object sender, EventArgs e)
    {
        
          if(Session["uploadfiles"] == null)
          {
              Response.Redirect("~/Pages/Home.aspx");
          }
          if ((string)Session["usertype"] == "Verifier")
          {
              Button3.Text = "Verified,Publish it!";
              Button8.Text = "Save Changes,I will verify it later!";
          }
          
        if (!IsPostBack)
        {
            string rootFolderPath = Server.MapPath("~/Images/");
            string filesToDisplay =  Session["uploadfiles"].ToString()+"_*" + ".*";
            string[] fileList = System.IO.Directory.GetFiles(rootFolderPath, filesToDisplay);

            // string name = fileList[i].Substring(fileList[i].LastIndexOf('\\') + 1);
            int sz = fileList.Length;
            for (int i = 0; i < sz; i++)
            {
                string name = fileList[i].Substring(fileList[i].LastIndexOf('\\') + 1);
                ListBox4.Items.Add(System.IO.Path.GetFileName(name));


            }




            rootFolderPath = Server.MapPath("~/Images/Cover/");
            filesToDisplay = Session["uploadfiles"].ToString() + "_*" + ".*";
            fileList = System.IO.Directory.GetFiles(rootFolderPath, filesToDisplay);

            // string name = fileList[i].Substring(fileList[i].LastIndexOf('\\') + 1);
             sz = fileList.Length;
            for (int i = 0; i < sz; i++)
            {
                string name = fileList[i].Substring(fileList[i].LastIndexOf('\\') + 1);
                ListBox2.Items.Add(System.IO.Path.GetFileName(name));


            }





            rootFolderPath = Server.MapPath("~/App_Data/");
            filesToDisplay = Session["uploadfiles"].ToString() + "_*" + ".*";
            fileList = System.IO.Directory.GetFiles(rootFolderPath, filesToDisplay);

            // string name = fileList[i].Substring(fileList[i].LastIndexOf('\\') + 1);
            sz = fileList.Length;
            for (int i = 0; i < sz; i++)
            {
                string name = fileList[i].Substring(fileList[i].LastIndexOf('\\') + 1);
                ListBox3.Items.Add(System.IO.Path.GetFileName(name));


            }






            rootFolderPath = Server.MapPath("~/Videofiles/");
            filesToDisplay = Session["uploadfiles"].ToString() + "_*" + ".*";
            fileList = System.IO.Directory.GetFiles(rootFolderPath, filesToDisplay);

            // string name = fileList[i].Substring(fileList[i].LastIndexOf('\\') + 1);
            sz = fileList.Length;
            for (int i = 0; i < sz; i++)
            {
                string name = fileList[i].Substring(fileList[i].LastIndexOf('\\') + 1);
                ListBox5.Items.Add(System.IO.Path.GetFileName(name));


            }





            rootFolderPath = Server.MapPath("~/OtherDownloadfiles");
            filesToDisplay = Session["uploadfiles"].ToString() + "_*" + ".*";
            fileList = System.IO.Directory.GetFiles(rootFolderPath, filesToDisplay);

            // string name = fileList[i].Substring(fileList[i].LastIndexOf('\\') + 1);
            sz = fileList.Length;
            for (int i = 0; i < sz; i++)
            {
                string name = fileList[i].Substring(fileList[i].LastIndexOf('\\') + 1);
                ListBox6.Items.Add(System.IO.Path.GetFileName(name));


            }

        }

    }
    protected void add3_Click(object sender, EventArgs e)
    {
        if (ListBox3.Items.Count > 1)
        {
            Label1.Text = "limit exceeded";
            return;
        }
        string[] validFileTypes = { "xlsx","xls" };
        string ext = System.IO.Path.GetExtension(FileUpload3.PostedFile.FileName);
        bool isValidFile = false;
        for (int i = 0; i < validFileTypes.Length; i++)
        {
            if (ext == "." + validFileTypes[i])
            {
                isValidFile = true;
                break;
            }
        }
        if (!isValidFile)
        {
            Label1.ForeColor = System.Drawing.Color.Red;
            Label1.Text = "Invalid File. Please upload a File with extension " +
                           string.Join(",", validFileTypes);
            return;
        }



        try
        {
            if (FileUpload3.HasFile)
            {
                if (FileUpload3.PostedFile.ContentLength <= 534288)
                {
                    if (ListBox3.Items.Contains(new ListItem(System.IO.Path.GetFileName(Session["uploadfiles"].ToString() + FileUpload3.PostedFile.FileName))))
                    {
                        Label1.Text = "File already in the ListBox";
                        return;
                    }
                    
                    
                        string path = Server.MapPath("~/App_Data/");
                        FileUpload3.SaveAs(path + Session["uploadfiles"].ToString() + "_" + FileUpload3.FileName);
                        ConnectionClass.Addexcellink(Session["uploadfiles"].ToString() + "_" + FileUpload3.FileName, Session["uploadfiles"].ToString());
                        ListBox3.Items.Add(System.IO.Path.GetFileName(Session["uploadfiles"].ToString() + "_" + FileUpload3.PostedFile.FileName));
                        Label1.Text = "Add another file or click Upload to save them all";

                    
                }
                else
                {
                    Label1.Text = "File size is too large, upload failed!";
                }
            }
            else
            {
                Label1.Text = "Please select a file to add";
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
    protected void remove3_Click(object sender, EventArgs e)
    {
        if (ListBox3.Items.Count > 0)
        {
            if (ListBox3.SelectedIndex < 0)
            {
                Label1.Text = "Please select a file to remove";
            }
            else
            {
                System.IO.File.Delete(Server.MapPath("~/App_Data/") + ListBox3.SelectedItem.Text);

                ListBox3.Items.Remove(ListBox3.SelectedItem.Text);
                Label1.Text = "File removed";
            }
        }
    }







    protected void add4_Click(object sender, EventArgs e)
    {


        if (ListBox4.Items.Count > 9)
        {
            Label1.Text = "limit exceeded";
            return;
        }

        string[] validFileTypes = { "jpg", "jpeg","png","gif","bmp" };
        string ext = System.IO.Path.GetExtension(FileUpload4.PostedFile.FileName);
        bool isValidFile = false;
        for (int i = 0; i < validFileTypes.Length; i++)
        {
            if (ext == "." + validFileTypes[i])
            {
                isValidFile = true;
                break;
            }
        }
        if (!isValidFile)
        {
            Label1.ForeColor = System.Drawing.Color.Red;
            Label1.Text = "Invalid File. Please upload a File with extension " +
                           string.Join(",", validFileTypes);
            return;
        }




        try
        {
            if (FileUpload4.HasFile)
            {
                if (FileUpload4.PostedFile.ContentLength <= 1148576)
                {
                    if (ListBox4.Items.Contains(new ListItem(System.IO.Path.GetFileName(Session["uploadfiles"].ToString()+FileUpload4.PostedFile.FileName))))
                    {
                        Label1.Text = "File already in the ListBox";
                        return;
                    }
                    else
                    {
                        string path = Server.MapPath("../Images/");
                        FileUpload4.SaveAs(path + Session["uploadfiles"].ToString() + "_" + FileUpload4.FileName);
                        Files.Add(FileUpload4);
                        ListBox4.Items.Add(System.IO.Path.GetFileName(Session["uploadfiles"].ToString() + "_" + FileUpload4.PostedFile.FileName));
                        Label1.Text = "Add another file or click Upload to save them all";

                    }
                }
                else
                {
                    Label1.Text = "File size is too large, upload failed!";
                }
            }
            else
            {
                Label1.Text = "Please select a file to add";
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
    protected void remove4_Click(object sender, EventArgs e)
    {
        if (ListBox4.Items.Count > 0)
        {
            if (ListBox4.SelectedIndex < 0)
            {
                Label1.Text = "Please select a file to remove";
            }
            else
            {
                System.IO.File.Delete(Server.MapPath("~/Images/")  + ListBox4.SelectedItem.Text);

                ListBox4.Items.Remove(ListBox4.SelectedItem.Text);
                Label1.Text = "File removed";
            }
        }
    }











    protected void add5_Click(object sender, EventArgs e)
    {

        if (ListBox5.Items.Count > 2)
        {
            Label1.Text = "limit exceeded";
            return;
        }

        string[] validFileTypes = { "mp4", "mkv","3gp","wmv" };
        string ext = System.IO.Path.GetExtension(FileUpload5.PostedFile.FileName);
        bool isValidFile = false;
        for (int i = 0; i < validFileTypes.Length; i++)
        {
            if (ext == "." + validFileTypes[i])
            {
                isValidFile = true;
                break;
            }
        }
        if (!isValidFile)
        {
            Label1.ForeColor = System.Drawing.Color.Red;
            Label1.Text = "Invalid File. Please upload a File with extension " +
                           string.Join(",", validFileTypes);
            return;
        }

        try
        {
            if (FileUpload5.HasFile)
            {
                if (FileUpload5.PostedFile.ContentLength <= 115343360)
                {
                    if (ListBox5.Items.Contains(new ListItem(System.IO.Path.GetFileName(Session["uploadfiles"].ToString() + FileUpload5.PostedFile.FileName))))
                    {
                        Label1.Text = "File already in the ListBox";
                        return;
                    }
                    else
                    {
                        string path = Server.MapPath("~/Videofiles/");
                        FileUpload5.SaveAs(path +Session["uploadfiles"].ToString()+"_"+ FileUpload5.FileName);
                        Files.Add(FileUpload5);
                        ListBox5.Items.Add(System.IO.Path.GetFileName(Session["uploadfiles"].ToString() + "_" + FileUpload5.PostedFile.FileName));
                        Label1.Text = "Add another file or click Upload to save them all";

                    }
                }
                else
                {
                    Label1.Text = "File size is too large, upload failed!";
                }
            }
            else
            {
                Label1.Text = "Please select a file to add";
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
    protected void remove5_Click(object sender, EventArgs e)
    {
        if (ListBox5.Items.Count > 0)
        {
            if (ListBox5.SelectedIndex < 0)
            {
                Label1.Text = "Please select a file to remove";
            }
            else
            {
                Files.RemoveAt(ListBox5.SelectedIndex);
                System.IO.File.Delete(Server.MapPath("~/Videofiles/") + ListBox5.SelectedItem.Text);

                ListBox5.Items.Remove(ListBox5.SelectedItem.Text);
                Label1.Text = "File removed";
            }
        }
    }








    protected void add6_Click(object sender, EventArgs e)
    {

        if (ListBox6.Items.Count > 5)
        {
            Label1.Text = "limit exceeded";
            return;
        }
        string[] validFileTypes = { "xlsx", "xls","pdf","doc","docx","jpeg","png","gif","bmp","jpg" };
        string ext = System.IO.Path.GetExtension(FileUpload6.PostedFile.FileName);
        bool isValidFile = false;
        for (int i = 0; i < validFileTypes.Length; i++)
        {
            if (ext == "." + validFileTypes[i])
            {
                isValidFile = true;
                break;
            }
        }
        if (!isValidFile)
        {
            Label1.ForeColor = System.Drawing.Color.Red;
            Label1.Text = "Invalid File. Please upload a File with extension " +
                           string.Join(",", validFileTypes);
            return;
        }



        try
        {
            if (FileUpload6.HasFile)
            {
                if (FileUpload6.PostedFile.ContentLength <= 2297152)
                {
                    if (ListBox6.Items.Contains(new ListItem(System.IO.Path.GetFileName(Session["uploadfiles"].ToString() + FileUpload6.PostedFile.FileName))))
                    {
                        Label1.Text = "File already in the ListBox";
                        return;
                    }
                    
                        string path = Server.MapPath("../OtherDownloadfiles/");
                        FileUpload6.SaveAs(path + Session["uploadfiles"].ToString() + "_" + FileUpload6.FileName);
                        Files.Add(FileUpload6);
                        ListBox6.Items.Add(System.IO.Path.GetFileName(Session["uploadfiles"].ToString() + "_" + FileUpload6.PostedFile.FileName));
                        Label1.Text = "Add another file or click Upload to save them all";

                    
                }
                else
                {
                    Label1.Text = "File size is too large, upload failed!";
                }
            }
            else
            {
                Label1.Text = "Please select a file to add";
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
    protected void remove6_Click(object sender, EventArgs e)
    {
        if (ListBox6.Items.Count > 0)
        {
            if (ListBox6.SelectedIndex < 0)
            {
                Label1.Text = "Please select a file to remove";
            }
            else
            {
                Files.RemoveAt(ListBox6.SelectedIndex);
                System.IO.File.Delete(Server.MapPath("~/OtherDownloadfiles/") + ListBox6.SelectedItem.Text);

                ListBox6.Items.Remove(ListBox6.SelectedItem.Text);
                Label1.Text = "File removed";
            }
        }
    }















    protected void add2_Click(object sender, EventArgs e)
    {
        if (ListBox2.Items.Count > 1)
        {
            
            Label1.ForeColor = System.Drawing.Color.Red;
            Label1.Text = "Only 1 cover photo allowed!";
            return;
        }

        string[] validFileTypes = { "jpeg", "jpg","png","bmp","gif" };
        string ext = System.IO.Path.GetExtension(FileUpload2.PostedFile.FileName);
       // Response.Write(ext);
        bool isValidFile = false;
        for (int i = 0; i < validFileTypes.Length; i++)
        {
            if (ext == "." + validFileTypes[i].ToString())
            {
                isValidFile = true;
                break;
            }
        }
        if (!isValidFile)
        {
            Label1.ForeColor = System.Drawing.Color.Red;
            Label1.Text = "Invalid File. Please upload a File with extension " +
                           string.Join(",", validFileTypes);
            return;
        }
        try
        {
            if (FileUpload2.HasFile)
            {
                if (FileUpload2.PostedFile.ContentLength <= 1000000)
                {
                    if (ListBox2.Items.Contains(new ListItem(System.IO.Path.GetFileName(Session["uploadfiles"].ToString() + FileUpload2.PostedFile.FileName))))
                    {
                        Label1.Text = "File already in the ListBox";
                        return;
                    }
                   
                        string path = Server.MapPath("~/Images/Cover/");
                        FileUpload2.SaveAs(path+Session["uploadfiles"].ToString() + "_" + FileUpload2.FileName);
                        ConnectionClass.AddReportCover("Images/Cover/" + Session["uploadfiles"].ToString() + "_" + FileUpload2.FileName, Session["uploadfiles"].ToString());
                        ListBox2.Items.Add(System.IO.Path.GetFileName(Session["uploadfiles"].ToString() + "_" + FileUpload2.PostedFile.FileName));
                        Label1.Text = "Add another file or click Upload to save them all";
                        
                    
                }
                else
                {
                    Label1.Text = "File size is too large, upload failed!";
                }
            }
            else
            {
                Label1.Text = "Please select a file to add";
            }
        }
        catch (Exception ex)
        {
            Response.Write(ex.ToString());
        }
    }
    protected void remove2_Click(object sender, EventArgs e)
    {
        if (ListBox2.Items.Count > 0)
        {
            if (ListBox2.SelectedIndex < 0)
            {
                Label1.Text = "Please select a file to remove";
            }
            else
            {
                System.IO.File.Delete(Server.MapPath("~/Images/Cover/") + ListBox2.SelectedItem.Text);

                ListBox2.Items.Remove(ListBox2.SelectedItem.Text);
                Label1.Text = "File removed";
            }
        }
    }













































    protected void Button3_Click1(object sender, EventArgs e)
    {
        
        string status = "";
        if((string)Session["userlevel"] == "District")
        {

            status = "Awaiting District Approval";
        }
        if((string)Session["userlevel"] == "National")
        {

            status = "Awaiting National Approval";
        }
        if((string)Session["userlevel"] == "State")
        {

            status = "Awaiting State Approval";

        }
        ConnectionClass.SetStatus(status, (string)Session["uploadfiles"]);
        if ((string)Session["usertype"] == "Verifier")
        {

            ConnectionClass.MakeHistory(Session["userid"].ToString(), "Verified a Report", (string)Session["uploadfiles"], "Report");


        }
        else
        {

            ConnectionClass.MakeHistory(Session["userid"].ToString(), "Edited a report and sent it for verification!", (string)Session["uploadfiles"], "Report");



        }
    }
    protected void Button8_Click(object sender, EventArgs e)
    {
        Session["alert"] = "Changes saved!";
        Response.Redirect("~/Pages/Home.aspx");

    }
}