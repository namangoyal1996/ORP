<%@ Page Title="Add Reports" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReportsAdd.aspx.cs" Inherits="Pages_ReportsAdd" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>



<%@ Register assembly="Obout.Ajax.UI" namespace="Obout.Ajax.UI.HTMLEditor" tagprefix="obout" %>
<%@ Register assembly="Obout.Ajax.UI" namespace="Obout.Ajax.UI.HTMLEditor.ToolbarButton" tagprefix="obout" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script>
        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Make sure you have filled all the mandory fields,Are you sure you want to save current data? You can always go to Manage->Reports->Edit for making changes before giving the report for verification.You will be redirected to the next page!")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
       
</script>
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>

    <div id="shortcontentdiv" runat="server">


    <h1>Brief Overview</h1>
    <table class="ReportaddTable">
        <tr  class="rdcl">
            <th>Activity Type:</th>
            <td><asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="sds_acttype" DataTextField="ActivityType" DataValueField="ActivityType" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AppendDataBoundItems="True">
            <asp:ListItem Selected="True">Other</asp:ListItem>
        </asp:DropDownList>
                
        <asp:TextBox ID="otherbox" runat="server" Visible="False"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*" ControlToValidate="otherbox" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
        <asp:SqlDataSource ID="sds_acttype" runat="server" ConnectionString="<%$ ConnectionStrings:ReportingConnection %>" SelectCommand="SELECT DISTINCT [ActivityType] FROM [ReportData]"></asp:SqlDataSource>
            </td>
        </tr>
          <tr>
            <th>Activity Title:</th>
            <td>
                
        <asp:TextBox ID="TextBox1" runat="server" Wrap="False" ForeColor="Black" MaxLength="150" Width="100%"></asp:TextBox>
              
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
              
                    <span style="color:#b5b2b2">eg: “MOCK DRILL CONDUCTED UNDER D.M PROGRAMME-2016”</span></td>
        </tr>
          <tr  class="rdcl">
            <th>Venue:</th>
            <td>
        <asp:TextBox ID="TextBox2" runat="server" Wrap="False" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                <span style="color:#b5b2b2">eg: Place: Upendra Vidya Bhavan Girl’s H.S. School, Sub Division: Sadar, District: West Tripura</span></td>
        </tr>
          <tr>
            <th>Date of Activity:</th>
            <td>
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
                <ajaxToolkit:CalendarExtender ID="TextBox3_CalendarExtender" runat="server" BehaviorID="TextBox3_CalendarExtender" TargetControlID="TextBox3" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox3" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
              </td>
        </tr>
          <tr  class="rdcl">
            <th>Organising Branch:</th>
            <td>
                <asp:DropDownList ID="DropDownList3" runat="server">
                    <asp:ListItem>Andhra Pradesh</asp:ListItem>
<asp:ListItem>Arunachal Pradesh</asp:ListItem>
<asp:ListItem>Assam</asp:ListItem>
<asp:ListItem>Bihar</asp:ListItem>
<asp:ListItem>Chhattisgarh</asp:ListItem>
<asp:ListItem>Goa</asp:ListItem>
<asp:ListItem>Gujarat</asp:ListItem>
<asp:ListItem>Haryana</asp:ListItem>
<asp:ListItem>Himachal Pradesh</asp:ListItem>
<asp:ListItem>Jammu & Kashmir</asp:ListItem>
<asp:ListItem>Jharkhand</asp:ListItem>
<asp:ListItem>Karnataka</asp:ListItem>
<asp:ListItem>Kerala</asp:ListItem>
<asp:ListItem>Madhya Pradesh</asp:ListItem>
<asp:ListItem>Maharashtra</asp:ListItem>
<asp:ListItem>Manipur</asp:ListItem>
<asp:ListItem>Meghalaya</asp:ListItem>
<asp:ListItem>Mizoram</asp:ListItem>
<asp:ListItem>Nagaland</asp:ListItem>
<asp:ListItem>Orissa</asp:ListItem>
<asp:ListItem>Punjab</asp:ListItem>
<asp:ListItem>Rajasthan</asp:ListItem>
<asp:ListItem>Sikkim</asp:ListItem>
<asp:ListItem>Tamil Nadu</asp:ListItem>
<asp:ListItem>Telangana</asp:ListItem>
<asp:ListItem>Tripura</asp:ListItem>
<asp:ListItem>Uttar Pradesh</asp:ListItem>
<asp:ListItem>Uttarakhand</asp:ListItem>
<asp:ListItem>West Bengal</asp:ListItem>
<asp:ListItem>Andaman and Nicobar Islands</asp:ListItem>
<asp:ListItem>Chandigarh</asp:ListItem>
<asp:ListItem>Dadra and Nagar Haveli</asp:ListItem>
<asp:ListItem>Daman and Diu</asp:ListItem>
<asp:ListItem>Lakshadweep</asp:ListItem>
<asp:ListItem>Delhi – National Capital Territory</asp:ListItem>
<asp:ListItem>Puducherry (Pondicherry)</asp:ListItem>


                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList3" ErrorMessage="*" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
              </td>
        </tr>
          <tr>
            <th>Report Submission Date:</th>
            <td>
        <asp:TextBox ID="TextBox5" runat="server" ReadOnly="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox5" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
              </td>
        </tr>
          <tr  class="rdcl">
            <th>Reporting Person:</th>
            <td>
        <asp:TextBox ID="TextBox6" runat="server" TextMode="MultiLine" ReadOnly="True">Name(Designation)</asp:TextBox>
              </td>
        </tr>
          <tr>
            <th>Verifying Person:</th>
            <td>
                <asp:TextBox ID="TextBox19" runat="server" ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
                <span style="color:#b5b2b2">Report will be published online only after consent of the verifier</span></td>


        </tr>
          
          <tr  class="rdcl">
            <th>In Attendance:</th>
            <td> 
        <asp:TextBox ID="TextBox17" runat="server" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox17" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
                  <span style="color:#b5b2b2">eg: Secretaries of State, District &amp; Sub Divisional Branches, Red Cross Staff &amp; FMRs</span></td>
        </tr>
          <tr>
            <th>Facilitators Name</th>
            <td>
        <asp:TextBox ID="TextBox18" runat="server" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="TextBox18" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
              </td>
        </tr>
       
        <tr  class="rdcl">
            <th>Approved Budget:</th>
            <td> <asp:TextBox ID="TextBox8" runat="server" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ControlToValidate="TextBox8" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>


        </tr>
        <tr>
            <th>Expenditure:</th>
            <td> <asp:TextBox ID="TextBox9" runat="server" TextMode="Number"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="TextBox9" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>


        </tr>
        <tr  class="rdcl">
            <th>Funding Partners:</th>
            <td> <asp:TextBox ID="TextBox10" runat="server" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox10" ErrorMessage="*" SetFocusOnError="True" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>


        </tr>
        <tr>
            <td style="height: 31px"></td>
            <td style="height: 31px">
            </td>
        </tr>
           
    </table>
        
        </div>
        <div id="bigcontentdiv" runat="server">
    <h1>Detailed Analysis</h1>
    <table class="ReportaddTable">
    <tr class="rdcl"><th style="font-size:1.5em; margin-left: 40px;" >Background:<asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="TextBox11" ErrorMessage="Mandatory field" Font-Size="XX-Small" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
        </th>
        <td>
    
    <obout:Editor ID="TextBox11" runat="server" ClientIDMode="AutoID" Height="300px" Width="100%">
<QuickFormatting ClientIDMode="AutoID"></QuickFormatting>

<EditPanel ClientIDMode="AutoID">
<ContextMenu ClientIDMode="AutoID"></ContextMenu>
</EditPanel>

<BottomToolbar ClientIDMode="AutoID" showhtmltextbutton="False" showpreviewbutton="False"></BottomToolbar>

<TopToolbar ClientIDMode="AutoID" appearance="Custom">
    <AddButtons>
        <obout:Bold ID="Bold1" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_bold_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_bold_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_bold_n.gif" />
        <obout:JustifyLeft ID="JustifyLeft1" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_left_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_left_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_left_n.gif" />
        <obout:JustifyRight ID="JustifyRight1" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_right_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_right_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_right_n.gif" />
        <obout:JustifyCenter ID="JustifyCenter1" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_center_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_center_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_center_n.gif" />
        <obout:Underline ID="Underline1" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_underline_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_underline_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_underline_n.gif" />
    </AddButtons>
        </TopToolbar>

<PopupHolder ClientIDMode="AutoID"></PopupHolder>
    </obout:Editor>
        </td>
    </tr>
        <tr><th  style="font-size:1.5em; margin-left: 40px;">Objectives:<asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="TextBox12" ErrorMessage="Mandatory field" Font-Size="XX-Small" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </th>
        <td>
    <obout:Editor ID="TextBox12" runat="server" ClientIDMode="AutoID" Height="300px" Width="100%">
<QuickFormatting ClientIDMode="AutoID"></QuickFormatting>

<EditPanel ClientIDMode="AutoID">
<ContextMenu ClientIDMode="AutoID"></ContextMenu>
</EditPanel>

<BottomToolbar ClientIDMode="AutoID" showhtmltextbutton="False" showpreviewbutton="False"></BottomToolbar>

<TopToolbar ClientIDMode="AutoID" appearance="Custom">
    <AddButtons>
        <obout:Bold ID="Bold2" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_bold_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_bold_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_bold_n.gif" />
        <obout:JustifyLeft ID="JustifyLeft2" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_left_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_left_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_left_n.gif" />
        <obout:JustifyRight ID="JustifyRight2" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_right_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_right_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_right_n.gif" />
        <obout:JustifyCenter ID="JustifyCenter2" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_center_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_center_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_center_n.gif" />
        <obout:Underline ID="Underline2" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_underline_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_underline_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_underline_n.gif" />
    </AddButtons>
        </TopToolbar>

<PopupHolder ClientIDMode="AutoID"></PopupHolder>
    </obout:Editor>
            </td>
    </tr>
        <tr class="rdcl"><th  style="font-size:1.5em; margin-left: 40px;">Methodology:<asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="TextBox13" ErrorMessage="Mandatory field" Font-Size="XX-Small" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </th>
        <td>
    <obout:Editor ID="TextBox13" runat="server" ClientIDMode="AutoID" Height="300px" Width="100%">
<QuickFormatting ClientIDMode="AutoID"></QuickFormatting>

<EditPanel ClientIDMode="AutoID">
<ContextMenu ClientIDMode="AutoID"></ContextMenu>
</EditPanel>

<BottomToolbar ClientIDMode="AutoID" showhtmltextbutton="False" showpreviewbutton="False"></BottomToolbar>

<TopToolbar ClientIDMode="AutoID" appearance="Custom">
    <AddButtons>
        <obout:Bold ID="Bold3" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_bold_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_bold_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_bold_n.gif" />
        <obout:JustifyLeft ID="JustifyLeft3" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_left_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_left_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_left_n.gif" />
        <obout:JustifyRight ID="JustifyRight3" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_right_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_right_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_right_n.gif" />
        <obout:JustifyCenter ID="JustifyCenter3" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_center_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_center_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_center_n.gif" />
        <obout:Underline ID="Underline3" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_underline_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_underline_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_underline_n.gif" />
    </AddButtons>
        </TopToolbar>

<PopupHolder ClientIDMode="AutoID"></PopupHolder>
    </obout:Editor>

            </td>
    </tr>
        <tr><th  style="font-size:1.5em; margin-left: 40px;">Outcomes:<asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="TextBox14" ErrorMessage="Mandatory field" Font-Size="XX-Small" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </th>
        <td>
    <obout:Editor ID="TextBox14" runat="server" ClientIDMode="AutoID" Height="300px" Width="100%">
<QuickFormatting ClientIDMode="AutoID"></QuickFormatting>

<EditPanel ClientIDMode="AutoID">
<ContextMenu ClientIDMode="AutoID"></ContextMenu>
</EditPanel>

<BottomToolbar ClientIDMode="AutoID" showhtmltextbutton="False" showpreviewbutton="False"></BottomToolbar>

<TopToolbar ClientIDMode="AutoID" appearance="Custom">
    <AddButtons>
        <obout:Bold ID="Bold4" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_bold_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_bold_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_bold_n.gif" />
        <obout:JustifyLeft ID="JustifyLeft4" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_left_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_left_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_left_n.gif" />
        <obout:JustifyRight ID="JustifyRight4" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_right_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_right_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_right_n.gif" />
        <obout:JustifyCenter ID="JustifyCenter4" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_center_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_center_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_center_n.gif" />
        <obout:Underline ID="Underline4" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_underline_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_underline_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_underline_n.gif" />
    </AddButtons>
        </TopToolbar>

<PopupHolder ClientIDMode="AutoID"></PopupHolder>
    </obout:Editor>
            </td>
    </tr>
        <tr class="rdcl"><th  style="font-size:1.5em; margin-left: 40px;">Volunteers Experience:<asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="TextBox16" ErrorMessage="Mandatory field" Font-Size="XX-Small" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </th>
        <td>
    <obout:Editor ID="TextBox16" runat="server" ClientIDMode="AutoID" Height="300px" Width="100%">
<QuickFormatting ClientIDMode="AutoID"></QuickFormatting>

<EditPanel ClientIDMode="AutoID">
<ContextMenu ClientIDMode="AutoID"></ContextMenu>
</EditPanel>

<BottomToolbar ClientIDMode="AutoID" showhtmltextbutton="False" showpreviewbutton="False"></BottomToolbar>

<TopToolbar ClientIDMode="AutoID" appearance="Custom">
    <AddButtons>
        <obout:Bold ID="Bold5" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_bold_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_bold_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_bold_n.gif" />
        <obout:JustifyLeft ID="JustifyLeft5" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_left_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_left_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_left_n.gif" />
        <obout:JustifyRight ID="JustifyRight5" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_right_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_right_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_right_n.gif" />
        <obout:JustifyCenter ID="JustifyCenter5" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_center_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_center_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_center_n.gif" />
        <obout:Underline ID="Underline5" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_underline_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_underline_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_underline_n.gif" />
    </AddButtons>
        </TopToolbar>

<PopupHolder ClientIDMode="AutoID"></PopupHolder>
    </obout:Editor>
            </td>
    </tr>
         
        <tr><th  style="font-size:1.5em; margin-left: 40px;">Participants Experience:<asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="TextBox15" ErrorMessage="Mandatory field" Font-Size="XX-Small" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
            </th>
        <td>
    <obout:Editor ID="TextBox15" runat="server" ClientIDMode="AutoID" Height="300px" Width="100%">
<QuickFormatting ClientIDMode="AutoID"></QuickFormatting>

<EditPanel ClientIDMode="AutoID">
<ContextMenu ClientIDMode="AutoID"></ContextMenu>
</EditPanel>

<BottomToolbar ClientIDMode="AutoID" showhtmltextbutton="False" showpreviewbutton="False"></BottomToolbar>

<TopToolbar ClientIDMode="AutoID" appearance="Custom">
    <AddButtons>
        <obout:BulletedList ID="BulletedList6" runat="server" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_list_bullet_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_list_bullet_n.gif" />
        <obout:Bold ID="Bold6" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_bold_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_bold_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_bold_n.gif" />
        <obout:JustifyLeft ID="JustifyLeft6" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_left_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_left_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_left_n.gif" />
        <obout:JustifyRight ID="JustifyRight6" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_right_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_right_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_right_n.gif" />
        <obout:JustifyCenter ID="JustifyCenter6" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_center_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_center_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_center_n.gif" />
        <obout:OrderedList ID="OrderedList6" runat="server" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_list_num_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_list_num_n.gif" />
        <obout:Underline ID="Underline6" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_underline_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_underline_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_underline_n.gif" />
    </AddButtons>
        </TopToolbar>

<PopupHolder ClientIDMode="AutoID"></PopupHolder>
    </obout:Editor>
            </td>
    </tr>
         
        <tr><th>
            &nbsp;</th>
        <td>
            &nbsp;</td>
    </tr>
    </table>
            <p>
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" OnClientClick = "Confirm()" Text="Save All and Choose Files to Upload" margin="auto" style="height: 26px"/>
            </p>
    </div>
    
    <p>
        <asp:Label ID="formres" runat="server"></asp:Label>
    </p>


    <script>
        function file_upload() {
            var size = $("AjaxFileUpload5").size();
            alert(size);
        }
    </script>
          

    

</asp:Content>

