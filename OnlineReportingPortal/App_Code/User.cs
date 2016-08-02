using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for User
/// </summary>
public class User
{

    public int id { get; set; }
    public string username { get; set; }
    public string password { get; set; }
    public string type { get; set; }
    public string email { get; set; }  
    public string fullname { get; set; }
    public string designation { get; set; }
    public string level { get; set; }
    public string state { get; set; }
    public string title { get; set; }
    public string district { get; set; }
    public User(int id,string username, string password, string type, string email, string fullname, string designation,string level,string state,string title,string district)
    {
        this.id = id;
        
        this.username = username;
        this.password = password;
        this.type = type;
        this.email = email;
        this.fullname = fullname;
        this.designation = designation;
        this.level = level;
        this.state = state;
        this.title = title;
        this.district = district;

    }
    public User(string username, string password, string type, string email, string fullname, string designation, string level, string state, string title,string district)
    {
        

        this.username = username;
        this.password = password;
        this.type = type;
        this.email = email;
        this.fullname = fullname;
        this.designation = designation;
        this.level = level;
        this.state = state;
        this.title = title;
        this.district = district;

    }

}