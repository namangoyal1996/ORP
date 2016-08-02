using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net;
using System.Text;
using iTextSharp.text;
using System.Data;

using System.Data.OleDb;
using iTextSharp.text.pdf;
public partial class Pages_testing : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["tobeviewed"] == null)
            return;
        Response.Write(Session["tobeviewed"].ToString());
        Report report = ConnectionClass.GetActivityByID((string)Session["tobeviewed"]);
       // Response.Write(report.place);
        string s = "";
        Label1.Text= string.Format("<a href='{0}'><span style='font-size:30px'>Download report as pdf</a><br/>", Request.Url.GetLeftPart(UriPartial.Authority) + "/pdfs/"+(string)Session["tobeviewed"]+" report.pdf");
        s += string.Format(" <img src='{5}' alt='IRCS LOGO' style='background-color:#C21109;width:250px' /><h3 align='center'>Activity Report</h3><h1 align='center'>{0}</h1><div align='center'><img src='{1}'  align='center' width='500px' style='border:3px solid black' height='300px'/><h2 align='center'>Place:<span style='color:#9a1c1c; font-style:italic'>{2}</span></h2><h2 align='center'>Date:<span style='color:#9a1c1c; font-style:italic'>{3}</span></h2><h2 align='center'>Organising Branch:<span style='color:#9a1c1c; font-style:italic;'>Indian Red Cross Society,{4}</span></h2></div><br/><br/><br/><br/><br/><br/>", '"' + report.title + '"', Request.Url.GetLeftPart(UriPartial.Authority) + report.cover, report.place, report.dateofactivity, report.branch, Request.Url.GetLeftPart(UriPartial.Authority) + "/ircslogo.png");
        s += string.Format("<br/><table border='1' width='85%' cellpadding='10' align='center' ><tr><th style='background-color:#FFFBD6'colspan='2'>PROGRAMME INFORMATION</th></tr><tr><th>Title:</th><td>{0}</td></tr><tr><th>Place:</th><td>{1}</td></tr><tr><th>Organising Branch</th><td>{2}</td></tr><tr><th>In Attendance:</th><td>{3}</td></tr><tr><th>Facilitators Name:</th><td>{4}</td></tr><tr><th>Total Approved Budget:</th><td>{5}</td></tr><tr><th>Total Expenditure:</th><td>{6}</td></tr><tr><th>Funding Partners:</th><td>{7}</td></tr><tr><th>Report Prepared by:</th><td>{8}</td></tr><tr><th>Reporting Date:</th><td>{9}</td></tr><tr><th>Report Verified by:</th><td>{10}</td></tr></table>", report.title, report.place, report.branch, report.inAtt, report.facilitators, report.appbudget, report.expenditure, report.funding, report.reportername, report.reportsubmissiondate, report.verifiername);
        s += string.Format("<h2 align='left' style='background-color:#FFFBD6'>Background</h2><p>{0}</p><h2 style='background-color:#FFFBD6'>Objectives/Purpose:</h2><p>{1}</p><h2 style='background-color:#FFFBD6'>Methodology</h2><p>{2}</p><h2 style='background-color:#FFFBD6'>Outcomes:</h2><p>{3}</p><h2 style='background-color:#FFFBD6'>Participants Experiences:</h2><p>{4}</p><h2 style='background-color:#FFFBD6'>Volunteer Experiences:</h2><p>{5}</p>", report.background, report.objectives, report.methodology, report.outcomes, report.participantsexp, report.volunteerexp);



        s += string.Format("<h2 style='background-color:#FFFBD6'>Annexes</h2>");
        if (report.list != "na")
        {
            s += string.Format("<a href = '{0}'>Download excel file=> {0}</a>", Request.Url.GetLeftPart(UriPartial.Authority) + "/list/" + report.list);
            string filePath = "";
            filePath = Server.MapPath("~/list/");
            filePath += report.list;
            string sConnection;
            //if( report.list.Substring(report.list.LastIndexOf('.') + 1) == "xls")
            //sConnection = "Provider=Microsoft.Jet.OLEDB.4.0;Data Source=" + filePath + ";Extended Properties='Excel 8.0;HDR=Yes'";
            //else
            // {

            sConnection = "Provider=Microsoft.ACE.OLEDB.12.0;Data Source=" + filePath + ";Extended Properties=Excel 8.0;";


            //  }
            OleDbConnection dbCon = new OleDbConnection(sConnection);

            dbCon.Open();



            // Get All Sheets Name

            DataTable dtSheetName = dbCon.GetOleDbSchemaTable(OleDbSchemaGuid.Tables, null);

            // Retrive the Data by Sheetwise





            for (int nCount = 0; nCount < dtSheetName.Rows.Count; nCount++)
            {
                DataSet dsOutput = new DataSet();
                string sSheetName = dtSheetName.Rows[nCount]["TABLE_NAME"].ToString();

                string sQuery = "Select * From [" + sSheetName + "]";

                OleDbCommand dbCmd = new OleDbCommand(sQuery, dbCon);

                OleDbDataAdapter dbDa = new OleDbDataAdapter(dbCmd);

                DataTable dtData = new DataTable();

                dbDa.Fill(dtData);

                dsOutput.Tables.Add(dtData);
                int row = dsOutput.Tables[0].Rows.Count;
                int col = dsOutput.Tables[0].Columns.Count;
                s += "<h3 align='center'>" + sSheetName + "</h3>";
                s += "<table align='center' border='1' width='85%' cellpadding='10'>";
                for (int i = 0; i < row; i++)
                {
                    s += "<tr>";
                    for (int j = 0; j < col; j++)
                    {
                        s += "<td>" + dsOutput.Tables[0].Rows[i][j].ToString() + "</td>";


                    }
                    s += "</tr>";
                }
                s += "</table>";

            }



            // Response.Write(html);
            dbCon.Close();
        }
                string rootFolderPath = Server.MapPath("~/Images/");

         string filesToDisplay = (string)Session["tobeviewed"] + "_" + "*" + ".*";
         string[] fileList = System.IO.Directory.GetFiles(rootFolderPath, filesToDisplay);
      
        

        if (fileList.Length != 0)
        {
            s += "<h2 style='background-color:#FFFBD6'>Photo Gallery</h2>";


            /*foreach (string inputString in fileList)
            {
                last = inputString.Substring(inputString.LastIndexOf('\\') + 1);

                // Response.Write(last);
            }*/



            int sz = fileList.Length;
            //Response.Write(filesToDisplay);
            //Response.Write(report.activityid);

            //Response.Write(sz);



            // string name = fileList[0].Substring(fileList[0].LastIndexOf('\\') + 1);
            // Response.Write(name);
            // if (i % 2 == 0)
            //    {
            //        s += string.Format("<div><img src = '{0}' width='400px' height = '400px' /><br/>{1}</div>", Request.Url.GetLeftPart(UriPartial.Authority) + "/Images/Cover/Cover1.jpg", name.Substring(name.LastIndexOf('_') + 1));


            //  }
            //  else
            s += string.Format("<table align='center'><tr>");
            for (int i = 0; i < sz; i++)
            {
                string name = fileList[i].Substring(fileList[i].LastIndexOf('\\') + 1);

                if (i % 2 == 0 && i != 0)
                    s += string.Format("</tr><tr>");
                s += string.Format("<td><img src='{0}'  style='float:right' align='center' width='350px' style='border:3px solid black' height='200px'/><br/><div style='width:300px'>'{1}'</div></td>", Request.Url.GetLeftPart(UriPartial.Authority) + "/Images/" + name, name.Substring(name.LastIndexOf('_')+1));
                //  else
                //  s += string.Format("<td><img src='{0}'  style='float:right' align='center' width='400px' style='border:3px solid black' height='200px'/><br/>{1}</td>", Request.Url.GetLeftPart(UriPartial.Authority) + "/Images/" + name, name);

            }
            s += string.Format("</tr></table>");



        }
        rootFolderPath = Server.MapPath("~/Videofiles/");

          filesToDisplay = (string)Session["tobeviewed"] + "_" + "*" + ".*"; 
        string[] fileList2 = System.IO.Directory.GetFiles(rootFolderPath, filesToDisplay);
      int sz1 = fileList2.Length;
        if(sz1 != 0)
          s += string.Format("<h2 style='background-color:#FFFBD6'>Video Links</h2>");
        for (int i = 0; i < sz1; i++)
        {
           string name = fileList2[i].Substring(fileList2[i].LastIndexOf('\\') + 1);

            s += string.Format("<a href = '{0}' >{1}</a><br/>",Request.Url.GetLeftPart(UriPartial.Authority) + "/Videofiles/"+name,name);

        }

        rootFolderPath = Server.MapPath("~/OtherDownloadfiles/");

        filesToDisplay = (string)Session["tobeviewed"] + "_" + "*" + ".*";
        string[] fileList3 = System.IO.Directory.GetFiles(rootFolderPath, filesToDisplay);
        int sz3 = fileList3.Length;
        if (sz3 != 0)
        {
            s += string.Format("<h2   style='background-color:#FFFBD6'>Download Links</h2>");
            for (int i = 0; i < sz3; i++)
            {
                string name = fileList3[i].Substring(fileList3[i].LastIndexOf('\\') + 1);

                s += string.Format("<a href = '{0}' >{1}</a><br/>", Request.Url.GetLeftPart(UriPartial.Authority) + "/OtherDownloadfiles/" + name, Request.Url.GetLeftPart(UriPartial.Authority) + "/OtherDownloadfiles/" + name);

            }
        }
        
        //Response.Write(s);
        Label1.Text += s;
        Byte[] bytes;

        //Boilerplate iTextSharp setup here
        //Create a stream that we can write to, in this case a MemoryStream
        using (var ms = new MemoryStream())
        {

            //Create an iTextSharp Document which is an abstraction of a PDF but **NOT** a PDF
            using (var doc = new Document())
            {

                //Create a writer that's bound to our PDF abstraction and our stream
                using (var writer = PdfWriter.GetInstance(doc, ms))
                {

                    //Open the document for writing
                    doc.Open();

                    //Our sample HTML and CSS
                    var example_html = s;

                    var example_css = @".headline{font-size:200%}";



                  /*  using (var msCss = new MemoryStream(System.Text.Encoding.UTF8.GetBytes(example_css)))
                    {
                        using (var msHtml = new MemoryStream(System.Text.Encoding.UTF8.GetBytes(example_html)))
                        {

                            //Parse the HTML
                            iTextSharp.tool.xml.XMLWorkerHelper.GetInstance().ParseXHtml(writer, doc, msHtml, msCss);
                        }
                    }*/
                    //XMLWorker also reads from a TextReader and not directly from a string
                    using (var srHtml = new StringReader(example_html))
                    {

                        //Parse the HTML
                        iTextSharp.tool.xml.XMLWorkerHelper.GetInstance().ParseXHtml(writer, doc, srHtml);
                    }

                    doc.Close();
                }
            }

            //After all of the PDF "stuff" above is done and closed but **before** we
            //close the MemoryStream, grab all of the active bytes from the stream
            bytes = ms.ToArray();
        }

        //Now we just need to do something with those bytes.
        //Here I'm writing them to disk but if you were in ASP.Net you might Response.BinaryWrite() them.
        //You could also write the bytes to a database in a varbinary() column (but please don't) or you
        //could pass them to another function for further PDF processing.
        string s2 = Server.MapPath("~/pdfs/");
        var testFile = Path.Combine(s2, (string)Session["tobeviewed"]+" report.pdf");
        System.IO.File.WriteAllBytes(testFile, bytes);

    
        
    }
}