using System;
using System.Collections;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Util;


/// <summary>
/// Summary description for ConnectionClass
/// </summary>
public static class ConnectionClass
{
    private static SqlConnection conn;
    private static SqlCommand command;

    static ConnectionClass()
    {
        string connectionString = ConfigurationManager.ConnectionStrings["ReportingConnection"].ToString();
        conn = new SqlConnection(connectionString);
        command = new SqlCommand("", conn);
    }

    public static User GetUserById(string id)
    {
        User user = null;
        string query = string.Format("SELECT Id,Type,Email,FullName,Designation,Level,State,Title,Username,Password,District from Users where Id = '{0}'", id);
                    command.CommandText = query;
                    try
                    {
                        conn.Open();

                        SqlDataReader reader = command.ExecuteReader();
                        while (reader.Read())
                        {
                            int iD = reader.GetInt32(0);
                            string type = reader.GetString(1);

                            string email = reader.GetString(2);
                            string fullname = reader.GetString(3);
                            string Designation = reader.GetString(4);
                            string level = reader.GetString(5);
                            string state = reader.GetString(6);
                            string title = reader.GetString(7);
                            string username = reader.GetString(8);
                            string password = reader.GetString(9);
                            string district = reader.GetString(10);

                            user = new User(iD, username, password, type, email, fullname, Designation, level, state, title,district);
                        }

                    }

                    finally
                    {
                        conn.Close();

                    }

        return user;


    }


    
    public static Report GetActivityByIDshort(string id)
    {
        ArrayList list = new ArrayList();
        string query = string.Format("Select ActivityID,ActivityType,Title,Place,DateofActivity,OrganisingBranch,ReportSubmissionDate,ReportingPerson,Verifier,CoverPhoto,Status FROM ReportData where ActivityID = '{0}'", id);
        Report report = null;
        try
        {
            conn.Open();
            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                int ActivityID = reader.GetInt32(0);
                string ActivityName = reader.GetString(1);
                string title = reader.GetString(2);
                string place = reader.GetString(3);
                string dateofactivity = reader.GetDateTime(4).ToShortDateString();
                string Branch = reader.GetString(5);
                string ReportSubmissionDate = reader.GetDateTime(6).ToShortDateString();
                string reporter = reader.GetString(7);

                string Verifier = reader.GetString(8);

                string Cover = reader.GetString(9);
                string status = reader.GetString(10);

                 report = new Report(ActivityID, ActivityName, title, place, dateofactivity, Branch, ReportSubmissionDate, reporter,
                     Verifier, Cover,status);
                

            }



        }
        finally
        {
            conn.Close();
        }

        return report;



    }


    public static void MakeHistory(string userid,string activity,string activityid,string type)
    {

        User user = GetUserById(userid);
        string query = "";
        if(type == "Report")
        {
                    Report report = GetActivityByIDshort(activityid);

            query = string.Format("Insert into UserActivityLog values ({0},'{1}','{2}','{3}','{4}','{5}') ", userid,user.title+" "+user.fullname+"("+user.designation+") from "+user.district+","+user.state+" of level "+user.level,activity,activityid,report.title+" on "+report.dateofactivity+" at "+report.place,DateTime.Now);
        }
            else if(type=="User")
        {
                        User user2 = GetUserById(activityid);

                        query = string.Format("Insert into UserActivityLog values ({0},'{1}','{2}','{3}','{4}','{5}') ", userid, user.title + " " + user.fullname + "(" + user.designation + ") from " + user.district + "," + user.state + " of level " + user.level, activity, activityid, user2.title + " " + user2.fullname + "(" + user2.designation + " ) from " +user2.district+","+ user2.state + " of level " + user2.level, DateTime.Now);


        }
        try
        {
            conn.Open();
            command.CommandText = query;
            command.ExecuteNonQuery();
            


        }
        finally
        {
            conn.Close();


        }



    }





















    public static ArrayList GetActivityByType(string Activitytype)
    {
        ArrayList list = new ArrayList();
        string query = string.Format("Select ActivityID,ActivityType,Title,Place,DateofActivity,OrganisingBranch,ReportSubmissionDate,ReportingPerson,Verifier,CoverPhoto,Status FROM ReportData where ActivityType LIKE '{0}' AND Status = 'Verified'", Activitytype);

        try
        {
            conn.Open();
            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                int ActivityID = reader.GetInt32(0);
                string ActivityName = reader.GetString(1);
                string title = reader.GetString(2);
                string place = reader.GetString(3);
                string dateofactivity = reader.GetDateTime(4).ToShortDateString();
                string Branch = reader.GetString(5);
                string ReportSubmissionDate = reader.GetDateTime(6).ToShortDateString();
                string reporter = reader.GetString(7);

                string Verifier = reader.GetString(8);

                string Cover = reader.GetString(9);
                string status = reader.GetString(10);

                Report report = new Report(ActivityID, ActivityName, title, place, dateofactivity, Branch, ReportSubmissionDate, reporter,
                     Verifier, Cover,status);
                list.Add(report);

            }



        }
        finally
        {
            conn.Close();
        }

        return list;



    }
    public static ArrayList GetActivityByTypeManage(string Activitytype)
    {
        ArrayList list = new ArrayList();
        string query = string.Format("Select ActivityID,ActivityType,Title,Place,DateofActivity,OrganisingBranch,ReportSubmissionDate,ReportingPerson,Verifier,CoverPhoto,Status FROM ReportData where ActivityType LIKE '{0}'", Activitytype);

        try
        {
            conn.Open();
            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                int ActivityID = reader.GetInt32(0);
                string ActivityName = reader.GetString(1);
                string title = reader.GetString(2);
                string place = reader.GetString(3);
                string dateofactivity = reader.GetDateTime(4).ToShortDateString();
                string Branch = reader.GetString(5);
                string ReportSubmissionDate = reader.GetDateTime(6).ToShortDateString();
                string reporter = reader.GetString(7);

                string Verifier = reader.GetString(8);

                string Cover = reader.GetString(9);
                string status = reader.GetString(10);

                Report report = new Report(ActivityID, ActivityName, title, place, dateofactivity, Branch, ReportSubmissionDate, reporter,
                     Verifier, Cover, status);
                list.Add(report);

            }



        }
        finally
        {
            conn.Close();
        }

        return list;



    }

    public static ArrayList GetActivity(string acttype,DateTime frmactdate,DateTime toactdate, DateTime frmreporting, DateTime toreporting, string branch, string reportername, string verifiername)
    {
        
        ArrayList list = new ArrayList();
        string query = string.Format("Select ActivityID,ActivityType,Title,Place,DateofActivity,OrganisingBranch,ReportSubmissionDate,ReportingPerson,Verifier,CoverPhoto,Status FROM ReportData where ActivityType LIKE '{0}' AND OrganisingBranch LIKE '{5}' AND ReportingPerson LIKE '{6}' AND Verifier LIKE '{7}' AND DateOfActivity >='{1}' and DateOfActivity<='{2}' AND ReportSubmissionDate >= '{3}' AND ReportSubmissionDate <= '{4}' AND Status = 'Verified'",acttype, frmactdate, toactdate,frmreporting,toreporting,branch,reportername,verifiername);

        try
        {
            conn.Open();
            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
               
                int ActivityID = reader.GetInt32(0);
                string ActivityName = reader.GetString(1);
                string title = reader.GetString(2);
                string place = reader.GetString(3);
                string dateofactivity = reader.GetDateTime(4).ToShortDateString();
                    
                string Branch = reader.GetString(5);
                string ReportSubmissionDate = reader.GetDateTime(6).ToShortDateString();
                string reporter = reader.GetString(7);

                string Verifier = reader.GetString(8);

                string Cover = reader.GetString(9);
                string status = reader.GetString(10);

                Report report = new Report(ActivityID, ActivityName, title, place, dateofactivity, Branch, ReportSubmissionDate, reporter,
                     Verifier, Cover,status);
                list.Add(report);

            }



        }
        finally
        {
            conn.Close();
        }

        return list;



    }

    public static void DeleteReportById(string reportid)
    {
       
        
        try
        {
            conn.Open();
           
                string query = string.Format("DELETE from ReportData where ActivityID = {0}",reportid);               
                command.CommandText = query;
                SqlDataReader reader = command.ExecuteReader();

            
        }
        finally
        {
            conn.Close();

        }


    }

    
    
         public static string VerifyReport(string verifier,string Activityid,string status)
        {
            string query = string.Format("UPDATE ReportData set Status = '{2}' where ActivityID = '{1}'",verifier,Activityid,status);

            try
         {
            conn.Open();
            command.CommandText = query;
            
                command.ExecuteNonQuery();
          
        }
            catch(Exception ef)
            {
                return ef.ToString();

            }
        finally
        {
            conn.Close();
        }
            return "OK";


        }

    public static string AddUser(User user)
    {
        string result = "";
            string query = string.Format("select Count(*) from Users where FullName = '{0}'",user.fullname);
            string query2  =string.Format("select Count(*) from Users where Username = '{0}'",user.username);
            string query3 = string.Format("INSERT INTO Users OUTPUT INSERTED.Id values ('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}')", user.type, user.username, user.password, user.fullname, user.designation, user.email, user.level, user.state, user.title,user.district);
        
        try{

                conn.Open();
                command.CommandText = query;
            
                int res = (int)command.ExecuteScalar();
                if(res >=1)
                {

                    result= "fullname";
                    
                }
                else{
                        command.CommandText = query2;
                          res = (int)command.ExecuteScalar();
                        if(res >= 1)
                        {
                            result = "loginname";


                        }                        
                        else
                        {

                            command.CommandText = query3;
                            int nmn = (int)command.ExecuteScalar();
                            result = nmn.ToString();

                        }
                        

                }
            }
        finally{


                conn.Close();

            }
        return result;

   }
    
    public static int AddReport(Report report)
    {
        int nmn;
      //  User verifier = GetUserById(report.verifierid.ToString());
        string query = string.Format(@"INSERT INTO ReportData OUTPUT INSERTED.ActivityID VALUES ('{0}','{1}','{2}','{3}','{4}','{5}','{6}','{7}','{8}','{9}','{10}','{11}','{12}','{13}','{14}','{15}','{16}','{17}','{18}','{19}','{20}','Not Sent','{21}','{22}')", report.activityname, report.title, report.place, Convert.ToDateTime((report.dateofactivity).ToString()), report.branch, Convert.ToDateTime((report.reportsubmissiondate).ToString()), report.reportername,report.verifiername, "cover", report.inAtt, report.facilitators, "list", report.appbudget, report.expenditure, report.funding, report.background, report.objectives, report.methodology, report.outcomes, report.participantsexp, report.volunteerexp,report.reporterid,report.verifierid);
        command.CommandText = query;
        try
        {
            conn.Open();
            nmn = (int)command.ExecuteScalar();
            
        }
        finally
        {
            conn.Close();
            command.Parameters.Clear();
        }
        return nmn;
    }

    public static User LoginUser(string username,string password)
    {
        //check if user exists
        string query = string.Format("SELECT COUNT(*) from ReportsDB.dbo.Users WHERE Username= '{0}'", username);
        command.CommandText = query;
        try
        {
            conn.Open();
            int amountofusers = (int)command.ExecuteScalar();

            if(amountofusers == 1)
            {
                //user exists,check if passwords match
                query = string.Format("Select Password FROM Users where Username = '{0}'", username);
                command.CommandText = query;
                string dbPassword = command.ExecuteScalar().ToString();
                if(dbPassword == password)
                {
                    //passwords match
                    query = string.Format("SELECT Id,Type,Email,FullName,Designation,Level,State,Title,District from Users where UserName = '{0}'", username);
                    command.CommandText = query;

                    SqlDataReader reader = command.ExecuteReader();
                    User user = null;
                    while(reader.Read())
                    {
                        int id = reader.GetInt32(0);
                        string type = reader.GetString(1);

                        string email = reader.GetString(2);
                        string fullname = reader.GetString(3);
                        string Designation = reader.GetString(4);
                        string level = reader.GetString(5);
                        string state = reader.GetString(6);
                        string title = reader.GetString(7);
                        string district = reader.GetString(8);

                        user = new User(id,username, password,type,email,fullname,Designation,level,state,title,district);
                    }
                    return user;
                    
                }
                else
                {
                    //passwords do not match
                    return null;

                }
            }
            else
            {
                //user dont exists
                return null;

            }


        }
        
        finally
        {

            conn.Close();
        }


    }

    
   public static ArrayList GetEmailPassByLoginName(string loginname)
    {
       ArrayList list = new ArrayList();
       string query = string.Format("Select Email,Password from Users where Username='{0}'",loginname);

        try
        {
            conn.Open();
            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();
            if(reader == null)
            {
                return null;


            }
            while (reader.Read())
            {

                
                string Email = reader.GetString(0);
               
                string Password = reader.GetString(1);
                list.Add(Email);
                list.Add(Password);
                



            }



        }
        finally
        {
            conn.Close();
        }
        return list;


    }

    public static Report GetActivityByID(string Activityid)
    {


        Report report = null;
        string query = string.Format("Select ActivityID,ActivityType,Title,Place,DateofActivity,OrganisingBranch,ReportSubmissionDate,ReportingPerson,Verifier,CoverPhoto,Inattendance,FacilitatorsName,ParticipantsList_VolunteersList,ApprovedBudget,Expenditure,FundingPartners,Background,Objectives,Methodology,Outcomes,ParticipantsExperiences,VolunteersExperiences,ReporterID,VerifierID FROM ReportData where ActivityID = {0}",Activityid);
     
        try
        {
            conn.Open();
            command.CommandText = query;
             SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {

                int ActivityID = reader.GetInt32(0);
                string ActivityName = reader.GetString(1);
                string title = reader.GetString(2);
                string place = reader.GetString(3);
                string dateofactivity = reader.GetDateTime(4).ToShortDateString();

                string Branch = reader.GetString(5);
                string ReportSubmissionDate = reader.GetDateTime(6).ToShortDateString();
                string reporter = reader.GetString(7);

                string Verifier = reader.GetString(8);

                string Cover = reader.GetString(9);
                string inatt = reader.GetString(10);
                string facilitators = reader.GetString(11);
                string list = reader.GetString(12);
                string appbudget = reader.GetString(13);
                string expenditure = reader.GetString(14);
                string funding = reader.GetString(15);
                string back = reader.GetString(16);
                string obj = reader.GetString(17);
                string method = reader.GetString(18);
                string outcomes = reader.GetString(19);
                string partexp = reader.GetString(20);
                string volunteerexp = reader.GetString(21);
                string reporterid = reader.GetInt32(22).ToString();
                string verifierid = reader.GetInt32(23).ToString();

                report = new Report(ActivityName, title, place, dateofactivity, Branch, ReportSubmissionDate, reporter,
                     Verifier, Cover,inatt,facilitators,list,appbudget,expenditure,funding,back,obj,method,outcomes,partexp,volunteerexp,reporterid,verifierid);
               
               

            }



        }
        finally
        {
            conn.Close();
        }
        return report;



    }
    public static DataTable GetActivityByid(string Activityid)
    {


        
        string query = string.Format("Select ActivityID,ActivityType,Title,Place,DateofActivity,OrganisingBranch,ReportSubmissionDate,ReportingPerson,Verifier,CoverPhoto,Inattendance,FacilitatorsName,ParticipantsList_VolunteersList,ApprovedBudget,Expenditure,FundingPartners,Background,Objectives,Methodology,Outcomes,ParticipantsExperiences,VolunteersExperiences FROM ReportData where ActivityID = {0}", Activityid);
        DataTable dt = null;
        try
        {
            conn.Open();
            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();
             dt = new DataTable();
             dt.Load(reader);
             reader.Close();
             
            



        }
        finally
        {
            conn.Close();
        }
        return dt;



    }

    public static string UpdateReportByID(string Activityid,Report report)
    {
        string query = string.Format("UPDATE ReportData set ActivityType = '{0}',Title = '{1}',Place = '{2}',DateofActivity = '{3}',OrganisingBranch = '{4}',ReportSubmissionDate = '{5}',ReportingPerson = '{6}',Verifier = '{7}',Inattendance = '{8}',FacilitatorsName = '{9}',ApprovedBudget = '{10}',Expenditure = '{11}',FundingPartners = '{12}',Background = '{13}',Objectives = '{14}',Methodology = '{15}',Outcomes = '{16}',ParticipantsExperiences = '{17}',VolunteersExperiences = '{18}',Status = 'Not Sent'  where ActivityID = {19}",report.activityname,report.title,report.place, Convert.ToDateTime(report.dateofactivity),report.branch, Convert.ToDateTime(report.reportsubmissiondate),report.reportername,report.verifiername,report.inAtt,report.facilitators,report.appbudget,report.expenditure,report.funding,report.background,report.objectives,report.methodology,report.outcomes,report.participantsexp,report.volunteerexp,Activityid);

        try
        {
            conn.Open();
            command.CommandText = query;
            try
            {
                command.ExecuteNonQuery();
            }
            catch(Exception ef)
            {

                return ef.ToString();
            }
            

        }
        finally
        {
            conn.Close();
        }
         return "yes";


    }
    public static void AddReportCover(string link,string id)
     {
         string query = string.Format("UPDATE ReportData set CoverPhoto = '{0}'  where ActivityID = '{1}'",link,id);

         try
         {
             conn.Open();
             command.CommandText = query;
              command.ExecuteNonQuery();
            



         }
         finally
         {
             conn.Close();
         }
        
     }
    public static void Addexcellink(string link,string id)
    {
        string query = string.Format("UPDATE ReportData set ParticipantsList_VolunteersList= '{0}'  where ActivityID = '{1}'", link, id);

        try
        {
            conn.Open();
            command.CommandText = query;
            command.ExecuteNonQuery();




        }
        finally
        {
            conn.Close();
        }


    }
    public static User GetVerifier(string state,string level,string district)
    {
        User user = null;
        string query = "";
        if(level == "National")
        {

           query = string.Format("SELECT Id,Type,Email,FullName,Designation,Level,State,Title,Username,Password,District from Users where  Level='National'  AND Type='Verifier'");



        }
        else if(level=="State")
         query = string.Format("SELECT Id,Type,Email,FullName,Designation,Level,State,Title,Username,Password,District from Users where State = '{0}' AND Level='State' AND Type='Verifier'", state,level,district);
        else if(level == "District")
        {
            query = string.Format("SELECT Id,Type,Email,FullName,Designation,Level,State,Title,Username,Password,District from Users where State = '{0}' AND District='{2}' AND Level='District' AND Type='Verifier'", state, level, district);



        }
        command.CommandText = query;
        try
        {
            conn.Open();

            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                int iD = reader.GetInt32(0);
                string type = reader.GetString(1);

                string email = reader.GetString(2);
                string fullname = reader.GetString(3);
                string Designation = reader.GetString(4);
                string leveln = reader.GetString(5);
                string staten = reader.GetString(6);
                string title = reader.GetString(7);
                string username = reader.GetString(8);
                string password = reader.GetString(9);
                string districtn = reader.GetString(9);

                user = new User(iD, username, password, type, email, fullname, Designation, leveln, staten, title, districtn);
            }

        }

        finally
        {
            conn.Close();

        }

        return user;
    }





    public static DataTable GetDistricts(string state)
    {
        string query1 = string.Format("SELECT StateId from States where StateName = '{0}'", state);

        DataTable dt = new DataTable();
        try
        {
            conn.Open();
            command.CommandText = query1;
            int st=(int)command.ExecuteScalar();
            string query = string.Format("SELECT DistrictName from Districts where StateId = {0}", st);
            command.CommandText = query;
            
            SqlDataAdapter Adpt = new SqlDataAdapter(command);
            dt = new DataTable();
            Adpt.Fill(dt);



        }
        finally
        {
            conn.Close();
        }

        return dt;
    }














    public static DataTable GetUsers(string userlevel,string userstate)
    {
        string query = "";
        if(userlevel == "National")
        {
         query = string.Format("SELECT Id,Title,FullName,Designation,Username as Loginname,Email,Level,State,District from Users");



        }
        else if(userlevel == "State")
        {

         query = string.Format("SELECT Id,Title,FullName,Designation,Username as Loginname,Email,Level,State,District from Users where State='{0}' AND Level = 'District'",userstate);



        }
        DataTable dt = new DataTable();
        try
        {
            conn.Open();
            command.CommandText = query;
            SqlDataAdapter Adpt = new SqlDataAdapter(command);
            dt = new DataTable();
            Adpt.Fill(dt);
            


        }
        finally
        {
            conn.Close();
        }

        return dt;



    }
    public static DataTable GetData()
    {
        DataTable dt = new DataTable();
        string cmd = "SELECT OrganisingBranch,Count(*) as Activities from ReportData group by OrganisingBranch";
        try{
            conn.Open();
        
        SqlDataAdapter adp = new SqlDataAdapter(cmd,conn);
        adp.Fill(dt);
        }
        finally{
            conn.Close();

        }
        return dt;

    }

    public static int GetPendingReports(int verifierid, string userlevel, string branch)
    {
        string query = "";
        if (userlevel == "District")
            query = string.Format("Select COUNT(*) FROM ReportData where Status = 'Awaiting District Approval' AND VerifierID = '{0}'", verifierid);
        else if (userlevel == "State")
            query = string.Format("Select COUNT(*) FROM ReportData where Status = 'Awaiting State Approval' AND OrganisingBranch = '{0}'", branch);
        else if (userlevel == "National")
            query = string.Format("Select COUNT(*) FROM ReportData where Status = 'Awaiting National Approval'");
         int veri;
        try
        {
            conn.Open();

            command.CommandText = query;

             veri = (int)command.ExecuteScalar();

        }
        finally
        {
            conn.Close();

        }
        return veri;

    }
    public static int GetRejectedReports(int userid)
    {
        int veri;
        try
        {
            conn.Open();
            string query = String.Format("SELECT COUNT(*) from ReportData where Status = 'Rejected' AND ReporterID = '{0}'", userid);

            command.CommandText = query;

            veri = (int)command.ExecuteScalar();

        }
        finally
        {
            conn.Close();

        }
        return veri;

    }
    public static ArrayList ReportMarq()
    {
        ArrayList list = new ArrayList();
        string query = string.Format("Select TOP(3) ActivityID,Title,Place,DateofActivity,ReportingPerson FROM ReportData where Status='Verified' ORDER BY ActivityID DESC");


        try
        {
            conn.Open();
            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                int ActivityID = reader.GetInt32(0);
                string title = reader.GetString(1);
                string place = reader.GetString(2);
                string dateofactivity = reader.GetDateTime(3).ToShortDateString();

               
                string reporter = reader.GetString(4);

              


                Report report = new Report(ActivityID,title, place, dateofactivity,reporter);
                list.Add(report);



            }



        }
        finally
        {
            conn.Close();
        }
        return list;



    }
    public static void SetStatusToRejected(string activityid)
    {
        string query = string.Format("UPDATE ReportData set Status = 'Rejected'  where ActivityID = {0}", activityid);

        try
        {
            conn.Open();
            command.CommandText = query;
            
                command.ExecuteNonQuery();
           

        }
        finally
        {
            conn.Close();
        }



    }



    public static void SetStatus(string status,string activityid)
    {
        string query = string.Format("UPDATE ReportData set Status = '{1}'  where ActivityID = {0}", activityid,status);

        try
        {
            conn.Open();
            command.CommandText = query;

            command.ExecuteNonQuery();


        }
        finally
        {
            conn.Close();
        }



    }













    public static ArrayList GetActivityByKeyword(string keyword)
    {
        ArrayList list = new ArrayList();
        string query = string.Format("Select ActivityID,ActivityType,Title,Place,DateofActivity,OrganisingBranch,ReportSubmissionDate,ReportingPerson,Verifier,CoverPhoto,Status FROM ReportData where (ActivityType LIKE '%{0}%' OR Title LIKE '%{0}%' OR Place LIKE '%{0}%' OR DateofActivity LIKE '%{0}%' OR OrganisingBranch LIKE '%{0}%' OR ReportSubmissionDate LIKE '%{0}%' OR ReportingPerson LIKE '%{0}%' OR Verifier LIKE '%{0}%') AND Status = 'Verified' ", keyword);

        try
        {
            conn.Open();
            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                int ActivityID = reader.GetInt32(0);
                string ActivityName = reader.GetString(1);
                string title = reader.GetString(2);
                string place = reader.GetString(3);
                string dateofactivity = reader.GetDateTime(4).ToShortDateString();
                string Branch = reader.GetString(5);
                string ReportSubmissionDate = reader.GetDateTime(6).ToShortDateString();
                string reporter = reader.GetString(7);

                string Verifier = reader.GetString(8); 

                string Cover = reader.GetString(9);
                string status = reader.GetString(10);

                Report report = new Report(ActivityID, ActivityName, title, place, dateofactivity, Branch, ReportSubmissionDate, reporter,
                     Verifier, Cover, status);
                list.Add(report);

            }



        }
        finally
        {
            conn.Close();
        }

        return list;



    }


    public static int ChangeStatusToPending(string activityid)
    {
        string query = string.Format("UPDATE ReportData set Status = 'Pending'  where ActivityID = {0}",activityid);

        try
        {
            conn.Open();
            command.CommandText = query;
            try
            {
                command.ExecuteNonQuery();
            }
            catch(Exception)
            {

                return 0;
            }
            

        }
        finally
        {
            conn.Close();
        }
         return 1;




    }

    public static ArrayList GetActivityByHiearchy(string level,string state,int userid)
    {
        ArrayList list = new ArrayList();
        string query = "";
        if (level == "District")
            query = string.Format("Select ActivityID,ActivityType,Title,Place,DateofActivity,OrganisingBranch,ReportSubmissionDate,ReportingPerson,Verifier,CoverPhoto,Status,ReporterID,VerifierID FROM ReportData where ReporterID = {0} AND Status='Not Sent'  order by ActivityID desc", userid);
        else if (level == "State")
            //query = string.Format("Select ActivityID,ActivityType,Title,Place,DateofActivity,OrganisingBranch,ReportSubmissionDate,ReportingPerson,Verifier,CoverPhoto,Status,ReporterID,VerifierID FROM ReportData where ReporterID = {0} OR VerifierID={0} OR ReporterID in (Select id from Users where Level = 'District' AND State = '{1}') OR VerifierID in (Select id from Users where Level = 'District' AND State = '{1}' )order by ActivityID", userid, state);
            query = string.Format("Select ActivityID,ActivityType,Title,Place,DateofActivity,OrganisingBranch,ReportSubmissionDate,ReportingPerson,Verifier,CoverPhoto,Status,ReporterID,VerifierID FROM ReportData where ReporterID = {0} AND Status='Not Sent'  order by ActivityID desc", userid);

        else if(level == "National")
        {

            query = string.Format("Select ActivityID,ActivityType,Title,Place,DateofActivity,OrganisingBranch,ReportSubmissionDate,ReportingPerson,Verifier,CoverPhoto,Status,ReporterID,VerifierID FROM ReportData order by ActivityID desc");

         }
        try
        {
            conn.Open();
            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                int ActivityID = reader.GetInt32(0);
                string ActivityName = reader.GetString(1);
                string title = reader.GetString(2);
                string place = reader.GetString(3);
                string dateofactivity = reader.GetDateTime(4).ToShortDateString();
                string Branch = reader.GetString(5);
                string ReportSubmissionDate = reader.GetDateTime(6).ToShortDateString();
                string reporter = reader.GetString(7);

                string Verifier = reader.GetString(8);

                string Cover = reader.GetString(9);
                string status = reader.GetString(10);
                string reporterid = reader.GetInt32(11).ToString();
                string verifierid = reader.GetInt32(12).ToString();
                Report report = new Report(ActivityID, ActivityName, title, place, dateofactivity, Branch, ReportSubmissionDate, reporter,
                     Verifier, Cover, status,reporterid,verifierid);
                list.Add(report);

            }



        }
        finally
        {
            conn.Close();
        }

        return list;



    }
    

    public static ArrayList GetActivityByTypeVerifier(int verifierid,string userlevel,string branch)
    {
        string query = "";
        ArrayList list = new ArrayList();
        if(userlevel == "District")
        query = string.Format("Select ActivityID,ActivityType,Title,Place,DateofActivity,OrganisingBranch,ReportSubmissionDate,ReportingPerson,Verifier,CoverPhoto,Status FROM ReportData where Status = 'Awaiting District Approval' AND VerifierID = '{0}'", verifierid);
        else if(userlevel == "State")
        query = string.Format("Select ActivityID,ActivityType,Title,Place,DateofActivity,OrganisingBranch,ReportSubmissionDate,ReportingPerson,Verifier,CoverPhoto,Status FROM ReportData where Status = 'Awaiting State Approval' AND Branch = '{0}'", branch);
        else if(userlevel == "National")
       query = string.Format("Select ActivityID,ActivityType,Title,Place,DateofActivity,OrganisingBranch,ReportSubmissionDate,ReportingPerson,Verifier,CoverPhoto,Status FROM ReportData where Status = 'Awaiting National Approval'");
        try
        {
            conn.Open();
            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                int ActivityID = reader.GetInt32(0);
                string ActivityName = reader.GetString(1);
                string title = reader.GetString(2);
                string place = reader.GetString(3);
                string dateofactivity = reader.GetDateTime(4).ToShortDateString();
                string Branch = reader.GetString(5);
                string ReportSubmissionDate = reader.GetDateTime(6).ToShortDateString();
                string reporter = reader.GetString(7);

                string Verifier = reader.GetString(8);

                string Cover = reader.GetString(9);
                string status = reader.GetString(10);

                Report report = new Report(ActivityID, ActivityName, title, place, dateofactivity, Branch, ReportSubmissionDate, reporter,
                     Verifier, Cover, status);
                list.Add(report);

            }



        }
        finally
        {
            conn.Close();
        }

        return list;



    }


    public static void DeleteUserID(string userid)
    {

        try
        {
            conn.Open();

            string query = string.Format("DELETE from Users where ID = {0}",userid);
            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();



        }
        finally
        {
            conn.Close();

        }



    }
    


        public static int ChangePassword(int userid,string currentpassword,string newpassword)
    {

        //check if user exists
        string query = string.Format("SELECT COUNT(*) from ReportsDB.dbo.Users WHERE Id= {0} AND Password='{1}'", userid,currentpassword);
        command.CommandText = query;
        try
        {
            conn.Open();
            int amountofusers = (int)command.ExecuteScalar();

            if (amountofusers == 1)
            {
                //user exists,check if passwords match
                query = string.Format("Update Users set Password = '{0}' where Id={1} ", newpassword,userid);
                command.CommandText = query;
                command.ExecuteScalar();
               
            }
            else
            {
                return 0;

            }


        }

        finally
        {

            conn.Close();
        }
        return 1;




    }


   public static ArrayList GetRejectReports(int id)
   {

       ArrayList list = new ArrayList();
        string query = string.Format("Select ActivityID,ActivityType,Title,Place,DateofActivity,OrganisingBranch,ReportSubmissionDate,ReportingPerson,Verifier,CoverPhoto,Status FROM ReportData where Status = 'Rejected' AND ReporterID = '{0}'", id);

        try
        {
            conn.Open();
            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                int ActivityID = reader.GetInt32(0);
                string ActivityName = reader.GetString(1);
                string title = reader.GetString(2);
                string place = reader.GetString(3);
                string dateofactivity = reader.GetDateTime(4).ToShortDateString();
                string Branch = reader.GetString(5);
                string ReportSubmissionDate = reader.GetDateTime(6).ToShortDateString();
                string reporter = reader.GetString(7);

                string Verifier = reader.GetString(8);

                string Cover = reader.GetString(9);
                string status = reader.GetString(10);

                Report report = new Report(ActivityID, ActivityName, title, place, dateofactivity, Branch, ReportSubmissionDate, reporter,
                     Verifier, Cover, status);
                list.Add(report);

            }



        }
        finally
        {
            conn.Close();
        }

        return list;

   }


    public static int  GetWaitingReports(int id)
    {

         int veri;
        try
        {
            conn.Open();
            string query = String.Format("SELECT COUNT(*) from ReportData where (Status = 'Awaiting National Approval' OR  Status = 'Awaiting District Approval'OR  Status = 'Awaiting State Approval') AND ReporterID = '{0}'", id);

            command.CommandText = query;

            veri = (int)command.ExecuteScalar();

        }
        finally
        {
            conn.Close();

        }
        return veri;

    }

    public static ArrayList Getyettoverify(int id)
   {

       ArrayList list = new ArrayList();
       string query = string.Format("Select ActivityID,ActivityType,Title,Place,DateofActivity,OrganisingBranch,ReportSubmissionDate,ReportingPerson,Verifier,CoverPhoto,Status FROM ReportData where (Status = 'Awaiting National Approval' OR Status = 'Awaiting State Approval' OR Status = 'Awaiting District Approval') AND ReporterID = '{0}'", id);
         
        try
        {
            conn.Open();
            command.CommandText = query;
            SqlDataReader reader = command.ExecuteReader();
            while (reader.Read())
            {
                int ActivityID = reader.GetInt32(0);
                string ActivityName = reader.GetString(1);
                string title = reader.GetString(2);
                string place = reader.GetString(3);
                string dateofactivity = reader.GetDateTime(4).ToShortDateString();
                string Branch = reader.GetString(5);
                string ReportSubmissionDate = reader.GetDateTime(6).ToShortDateString();
                string reporter = reader.GetString(7);

                string Verifier = reader.GetString(8);

                string Cover = reader.GetString(9);
                string status = reader.GetString(10);

                Report report = new Report(ActivityID, ActivityName, title, place, dateofactivity, Branch, ReportSubmissionDate, reporter,
                     Verifier, Cover, status);
                list.Add(report);

            }



        }
        finally
        {
            conn.Close();
        }

        return list;

   }

    public static void UpdateUser(string id,string title,string fullname,string designation,string email,string type,string level)
    {
        string query = string.Format("UPDATE Users set Title = '{0}',FullName = '{1}',Designation='{2}',Email='{3}',Type='{4}',Level='{5}' where Id = '{6}'", title,fullname,designation,email,type,level,id);
        try
        {
            conn.Open();
            command.CommandText = query;
            command.ExecuteScalar();

        }
        finally
        {

            conn.Close();

        }




    }








}