using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for Report
/// </summary>
public class Report
{
    public int activityid { get; set; }
    public string activityname { get; set; }
    public string title { get; set; }
    public string place { get; set; }
    public string dateofactivity { get; set; }
    public string branch { get; set; }
    public string reportsubmissiondate { get; set; }
    public string reportername { get; set; }
    public string verifiername { get; set; }
    public string cover { get; set; }
    public string inAtt { get; set; }
    public string facilitators { get; set; }
    public string list { get; set; }
    public string appbudget { get; set; }
    public string expenditure { get; set; }
    public string funding { get; set; }
    public string background { get; set; }
    public string objectives { get; set; }
    public string methodology { get; set; }
    public string outcomes { get; set; }
    public string participantsexp { get; set; }
    public string volunteerexp { get; set; }
    public string status { get; set; }
    public string reporterid { get; set; }
    public string verifierid { get; set; }





    public Report(int activityid, string activityname, string title, string place, string dateofactivity, string Branch, string reportsubmissiondate, string reportername, string verifiername, string cover,string status)
    {
        this.activityid = activityid;
        this.activityname = activityname;
        this.title = title;
        this.place = place;
        this.dateofactivity = dateofactivity;
        this.branch = Branch;
        this.reportsubmissiondate = reportsubmissiondate;
        this.reportername = reportername;
        this.verifiername = verifiername;
        this.cover = cover;
        this.status = status;
    
    }


    public Report(int activityid, string activityname, string title, string place, string dateofactivity, string Branch, string reportsubmissiondate, string reportername, string verifiername, string cover, string status,string reporterid,string verifierid)
    {
        this.activityid = activityid;
        this.activityname = activityname;
        this.title = title;
        this.place = place;
        this.dateofactivity = dateofactivity;
        this.branch = Branch;
        this.reportsubmissiondate = reportsubmissiondate;
        this.reportername = reportername;
        this.verifiername = verifiername;
        this.cover = cover;
        this.status = status;
        this.reporterid = reporterid;
        this.verifierid = verifierid;

    }






    public Report(string activityname, string title, string place, string dateofactivity, string branch, string reportsubmissiondate, string reportername, string verifiername, string cover, string inAtt, string facilitators, string list, string appbudget, string expenditure, string funding, string background, string objectives, string methodology, string outcomes, string participantsexp, string volunteerexp,string reporterid,string verifierid)
    {

        this.activityname = activityname;
        this.title = title;
        this.place = place;
        this.dateofactivity = dateofactivity;
        this.branch = branch;
        this.reportsubmissiondate = reportsubmissiondate;
        this.reportername = reportername;
        this.verifiername = verifiername;
        this.cover = cover;
        this.inAtt = inAtt;
        this.facilitators = facilitators;
        this.list = list;
        this.appbudget = appbudget;
        this.expenditure = expenditure;
        this.funding = funding;
        this.background = background;
        this.objectives = objectives;
        this.methodology = methodology;
        this.outcomes = outcomes;
        this.participantsexp = participantsexp;
        this.volunteerexp = volunteerexp;
        this.reporterid = reporterid;
        this.verifierid = verifierid;
    }

    public Report(int activityid,string title, string place, string dateofactivity,string reportername)
    {

        this.activityid = activityid;
        this.title = title;
        this.place = place;
        this.dateofactivity = dateofactivity;       
        this.reportername = reportername;
      
    }



   


}