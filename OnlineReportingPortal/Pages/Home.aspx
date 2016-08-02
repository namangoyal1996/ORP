<%@ Page Title="Welcome" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Home.aspx.cs" Inherits="Pages_Home" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" style="border:3px solid #e3e3e3">
    <h3 class="homehd" style="text-align:center;margin-left:50%" >Latest Reports</h3>
    
    <div style="margin-right:60%;float:left;position:absolute "><p ><strong>Welcome to Online Reporting Portal, an initiative by Disaster Management Center,IRCS to decrease the carbon footprints of the Indian Red Cross Society by terminating the paperwork and using online databases to store the activity reports.</strong></p> <ol style="font-family:'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;font-size:medium"><li>This portal accepts the detailed reports of the FMR activities such as mock drill, training, awareness programmes, etc. and also helps in searching the report when needed.</li><li>The reports are easily accessible and admins have the authority to verify,edit or delete the reports and automatically convert them to .pdf format! <a href="../Documentation ORP.pdf" style="font-size:20px">View Full Documentation</a></li></ol><h1 style="font-size:20px;align-content:center;margin-left:25%;margin-top:20px; font-family:'Comic Sans MS' ">GO <span style="color:#46c25b">GREEN</span>, GO <span style="color:#cfcfcf">PAPERLESS!</span></h1></div>
    <div class ="homepnl" style="height:400px"><asp:Panel ID="pnlmarq" runat="server" style="float:right" BorderStyle="Inset" Width="100%">

    </asp:Panel></div>
   
   
    </asp:Content>
