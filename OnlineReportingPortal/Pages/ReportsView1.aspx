
<%@ Page Title="View Reports" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReportsView1.aspx.cs" Inherits="ReportsView1" %>
<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>


<script runat="server">

    
   
</script>



<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         
    <table class="ReportaddTable">
        <tr class="rdcl"><th>Search by keyword:</th><td>
            <asp:TextBox ID="TextBox4" runat="server" ValidationGroup="simplesearch"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox4" ErrorMessage="*" Font-Bold="True" ForeColor="Red" ValidationGroup="simplesearch"></asp:RequiredFieldValidator>
            </td></tr>
        <tr><td>
            <asp:Button ID="simplesearch" runat="server" Text="Simple Search" OnClick="simplesearch_Click" ValidationGroup="simplesearch" ClientIDMode="AutoID" CommandArgument="sss" CommandName="sss" EnableTheming="True" />
            </td></tr>
    </table>

                   &nbsp;

                   OR

    <table class="ReportaddTable" id="advsearch">
        <tr >
        <th>Activity Type:</th>
        <td>
    
        <asp:DropDownList ID="DropDownList1" runat="server"  DataSourceID="sds_acttype" DataTextField="ActivityType" DataValueField="ActivityType" Height="22px" Width="20%">
        <asp:ListItem>All</asp:ListItem>
    </asp:DropDownList>
    <asp:SqlDataSource ID="sds_acttype" runat="server" ConnectionString="<%$ ConnectionStrings:ReportingConnection %>" SelectCommand="SELECT DISTINCT [ActivityType] FROM [ReportData]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr  class="rdcl">
        <th>
        
    <strong>Date Of Activity:</strong></th>
        <td>
            <table><tr><td>From:</td><td><asp:TextBox ID="activitydate" runat="server"  TextMode="Date" Height="16px" ValidationGroup="advsearch" ></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="activitydate" ErrorMessage="*" ForeColor="Red" ValidationGroup="advsearch"></asp:RequiredFieldValidator>
                </td></tr>
    
            <tr>
            <td>To:</td><td><asp:TextBox ID="TextBox1" runat="server" TextMode="Date" Height="20px" ValidationGroup="advsearch"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="Red" ValidationGroup="advsearch"></asp:RequiredFieldValidator>
                </td></tr>
            
            </table>
            </td>
        </tr>
        <tr  >
        <th>
    <strong>Reporting Date:</strong></th>
            <td>
            <table><tr>
        <td>From:</td><td><asp:TextBox ID="TextBox2" runat="server" TextMode="Date" ValidationGroup="advsearch"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox2" ErrorMessage="*" ForeColor="Red" ValidationGroup="advsearch"></asp:RequiredFieldValidator>
                </td></tr>
    
            
            <tr><td>To:</td><td><asp:TextBox ID="TextBox3" runat="server" TextMode="Date" ValidationGroup="advsearch"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox3" ErrorMessage="*" ForeColor="Red" ValidationGroup="advsearch"></asp:RequiredFieldValidator>
                </td></tr>
                 </table>
            </td>
               
        </tr>
        <tr  class="rdcl">
        <th>Branch</th>
        <td>
    <ajaxToolkit:ComboBox class="nostyle2" ID="ComboBox1" runat="server" AppendDataBoundItems="True" AutoCompleteMode="SuggestAppend" DataSourceID="sds_branch" MaxLength="0" style="font-size:4px;font-family:Arial; inline;" DataTextField="OrganisingBranch" DataValueField="OrganisingBranch">
        <asp:ListItem Selected="True">All</asp:ListItem>

    </ajaxToolkit:ComboBox>
    <asp:SqlDataSource ID="sds_branch" runat="server" ConnectionString="<%$ ConnectionStrings:ReportingConnection %>" SelectCommand="SELECT DISTINCT [OrganisingBranch] FROM [ReportData]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr >
            <th>Reporter Name:</th>
            <td>
    <ajaxToolkit:ComboBox ID="ComboBox2" runat="server" AppendDataBoundItems="True" AutoCompleteMode="Append" DataSourceID="sds_reporter" DataTextField="ReportingPerson" DataValueField="ReportingPerson" MaxLength="0" style="display: inline;">
        <asp:ListItem Selected="True">All</asp:ListItem>
    </ajaxToolkit:ComboBox>
    <asp:SqlDataSource ID="sds_reporter" runat="server" ConnectionString="<%$ ConnectionStrings:ReportingConnection %>" SelectCommand="SELECT DISTINCT [ReportingPerson] FROM [ReportData]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr  class="rdcl">
            <th>Verifier Name:</th>
            <td>
    <ajaxToolkit:ComboBox ID="ComboBox3" runat="server" AppendDataBoundItems="True" AutoCompleteMode="SuggestAppend" DataSourceID="sds_verifier" DataTextField="Verifier" DataValueField="Verifier" MaxLength="0" style="display: inline;">
        <asp:ListItem Selected="True">All</asp:ListItem>
    </ajaxToolkit:ComboBox>
    <asp:SqlDataSource ID="sds_verifier" runat="server" ConnectionString="<%$ ConnectionStrings:ReportingConnection %>" SelectCommand="SELECT DISTINCT [Verifier] FROM [ReportData]"></asp:SqlDataSource>
            </td>
        </tr>
        <tr>
            <td>
        
        <asp:Button ID="searchbtn" runat="server" OnClick="searchbtn_click" Text="Advance Search" ValidationGroup="advsearch" />
            </td>
            
        </tr>
        
    </table>
                                    <asp:Label ID="Label1" runat="server"></asp:Label>

    <div id="nmnviewpnl">

    <asp:Panel ID="pnlReports" runat="server">
    </asp:Panel>

        </div>



    <br />
    <br />
    


</asp:Content>

