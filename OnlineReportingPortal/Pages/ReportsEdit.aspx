<%@ Page Title="Add Reports" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ReportsEdit.aspx.cs" Inherits="Pages_ReportsEdit" %>


<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>



<%@ Register assembly="Obout.Ajax.UI" namespace="Obout.Ajax.UI.HTMLEditor" tagprefix="obout" %>
<%@ Register assembly="Obout.Ajax.UI" namespace="Obout.Ajax.UI.HTMLEditor.ToolbarButton" tagprefix="obout" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <h1>Brief Overview</h1>
    <table class="ReportaddTable">
        <tr  class="rdcl">
            <th>Activity Type:</th>
            <td><asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" DataSourceID="sds_acttype" DataTextField="ActivityType" DataValueField="ActivityType"  AppendDataBoundItems="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged">
            <asp:ListItem Selected="True">Other</asp:ListItem>
        </asp:DropDownList>
        <asp:TextBox ID="otherbox" runat="server" Visible="False"></asp:TextBox>
        <asp:SqlDataSource ID="sds_acttype" runat="server" ConnectionString="<%$ ConnectionStrings:ReportingConnection %>" SelectCommand="SELECT DISTINCT [ActivityType] FROM [ReportData]"></asp:SqlDataSource>
              
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" ControlToValidate="otherbox" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
              
            </td>
        </tr>
          <tr>
            <th>Activity Title:</th>
            <td>
                
        <asp:TextBox ID="TextBox1" runat="server" Wrap="False" TextMode="MultiLine"></asp:TextBox>
              
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
              
                    </td>
        </tr>
          <tr  class="rdcl">
            <th>Venue:</th>
            <td>
        <asp:TextBox ID="TextBox2" runat="server" Wrap="False"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
              </td>
        </tr>
          <tr>
            <th>Date of Activity:</th>
            <td>
        <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        <ajaxToolkit:CalendarExtender ID="TextBox3_CalendarExtender" runat="server" BehaviorID="TextBox3_CalendarExtender" TargetControlID="TextBox3" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox3" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
              </td>
        </tr>
          <tr  class="rdcl">
            <th>Organising Branch:</th>
            <td>
        <asp:TextBox ID="TextBox4" runat="server" ReadOnly="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox4" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
              </td>
        </tr>
          <tr>
            <th>Report Submission Date:</th>
            <td>
        <asp:TextBox ID="TextBox5" runat="server" ReadOnly="True"></asp:TextBox>
        <ajaxToolkit:CalendarExtender ID="TextBox5_CalendarExtender" runat="server" BehaviorID="TextBox5_CalendarExtender" TargetControlID="TextBox5" />
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox5" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
              </td>
        </tr>
          <tr  class="rdcl">
            <th>Reporting Person:</th>
            <td>
        <asp:TextBox ID="TextBox6" runat="server" TextMode="MultiLine" ReadOnly="True"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox6" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
              </td>
        </tr>
          <tr>
            <th>Verifying Person:</th>
            <td>
                <asp:TextBox ID="TextBox19" runat="server" ReadOnly="True" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox19" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
              </td>


        </tr>
          
          <tr  class="rdcl">
            <th>In Attendence:</th>
            <td> 
        <asp:TextBox ID="TextBox17" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TextBox17" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
              </td>
        </tr>
          <tr>
            <th>Facilitators Name</th>
            <td>
        <asp:TextBox ID="TextBox18" runat="server"></asp:TextBox>
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
                <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" ControlToValidate="TextBox10" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            </td>


        </tr>
      
           
    </table>
    <h1>Detailed Analysis</h1>
    <table class="ReportaddTable">
    <tr class="rdcl"><th>Background:<asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" ControlToValidate="TextBox11" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
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
        <tr><th>Objectives:<asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" ControlToValidate="TextBox12" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
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
        <tr class="rdcl"><th>Methodology:<asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" ControlToValidate="TextBox13" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
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
        <tr><th>Outcomes:<asp:RequiredFieldValidator ID="RequiredFieldValidator18" runat="server" ControlToValidate="TextBox14" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
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
        <tr class="rdcl"><th>Volunteers Experience<asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" ControlToValidate="TextBox16" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
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
         
        <tr><th>Participants Experience<asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" ControlToValidate="TextBox15" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
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
        <obout:Bold ID="Bold6" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_bold_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_bold_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_bold_n.gif" />
        <obout:JustifyLeft ID="JustifyLeft6" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_left_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_left_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_left_n.gif" />
        <obout:JustifyRight ID="JustifyRight6" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_right_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_right_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_right_n.gif" />
        <obout:JustifyCenter ID="JustifyCenter6" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_center_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_center_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_align_center_n.gif" />
        <obout:Underline ID="Underline6" runat="server" ActiveSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_underline_a.gif" DownSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_underline_a.gif" NormalSrc="mvwres://Obout.Ajax.UI, Version=2.13.925.3, Culture=neutral, PublicKeyToken=24f3c5cea456f322/Obout.Ajax.UI.HTMLEditor.Images.ed_format_underline_n.gif" />
    </AddButtons>
        </TopToolbar>

<PopupHolder ClientIDMode="AutoID"></PopupHolder>
    </obout:Editor>
            </td>
    </tr>
         
        <tr><th>
            <asp:Button ID="btnsave" runat="server" Text="Save Changes" OnClick="btnsave_Click" />
            </th>
        <td>
            <asp:Button ID="Button1" runat="server"  Text="Proceed to Upload Files" OnClick="Button1_Click" />
            </td>
    </tr>
    </table>
      

    

</asp:Content>

