<%@ Page Title="Register" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Register.aspx.cs" Inherits="Pages_Register" %>

<%@ Register assembly="AjaxControlToolkit" namespace="AjaxControlToolkit" tagprefix="ajaxToolkit" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <table class="ReportaddTable" id="registertable" runat="server">
        <tr>
             <th>
                 Title:
             </th>
         <td>
             
             <asp:DropDownList ID="DropDownList3" runat="server" OnSelectedIndexChanged="DropDownList3_SelectedIndexChanged">
                 <asp:ListItem>Mr.</asp:ListItem>
                 <asp:ListItem>Mrs.</asp:ListItem>
                 <asp:ListItem>Ms.</asp:ListItem>
                 <asp:ListItem>Dr.</asp:ListItem>
                 <asp:ListItem>Shri</asp:ListItem>
             </asp:DropDownList>
             
         </td>
        
    </tr>
     <tr>
         <th class="rdcl">Full Name</th>
        <td class="rdcl">
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
         </td>
    </tr>
         <tr>
         <th>Designation</th>
        <td>
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox6" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
         </td>
    </tr>
     <tr class="rdcl">
         <th>LoginName</th>
        <td>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox2" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
         </td>
    </tr>
     <tr>
         <th>Password</th>
        <td>
            <asp:TextBox ID="TextBox3" runat="server" OnTextChanged="TextBox3_TextChanged" TextMode="Password"></asp:TextBox>
            <ajaxToolkit:PasswordStrength ID="TextBox3_PasswordStrength" runat="server" MinimumLowerCaseCharacters="5" PreferredPasswordLength="5" TargetControlID="TextBox3" />
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox3" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
         </td>
    </tr>
     <tr class="rdcl">
         <th>Confirm-Password</th>
        <td>
            <asp:TextBox ID="TextBox4" runat="server" TextMode="Password"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox4" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox3" ControlToValidate="TextBox4" ErrorMessage="Doesn't match with the password!" ForeColor="Red"></asp:CompareValidator>
         </td>
    </tr>
     
     <tr>
         <th style="height: 24px">E-mail id</th>
        <td style="height: 24px">
            <asp:TextBox ID="TextBox5" runat="server" TextMode="Email"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5" ErrorMessage="*" ForeColor="Red"></asp:RequiredFieldValidator>
         </td>
    </tr>
      
     <tr class="rdcl">
         <th>User-Type:</th>
        <td>
            <asp:DropDownList ID="DropDownList1" runat="server">
                <asp:ListItem>Reporter</asp:ListItem>
                <asp:ListItem>Verifier</asp:ListItem>
            </asp:DropDownList>
         </td>
    </tr>
         <tr>
             <th>User Level:
             </th>
         <td>
             
             <asp:DropDownList ID="DropDownList2" runat="server">
             </asp:DropDownList>
             
         </td>
        
    </tr>
         <tr>
             <th class="rdcl">
                 User State:
             </th>
         <td class="rdcl">
             
             <asp:DropDownList ID="DropDownList4" runat="server" DataSourceID="SqlDataSource1" DataTextField="StateName" DataValueField="StateName" OnSelectedIndexChanged="DropDownList4_SelectedIndexChanged" AutoPostBack="True" AppendDataBoundItems="True">
                 <asp:ListItem Selected="True">Select a state</asp:ListItem>
                
             </asp:DropDownList>
             
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ReportingConnection %>" SelectCommand="SELECT [StateName], [StateId] FROM [States]"></asp:SqlDataSource>
             
             <asp:CompareValidator ID="CompareValidator2" runat="server" ControlToValidate="DropDownList4" ErrorMessage="Please select a state" ForeColor="Red" Operator="NotEqual" ValueToCompare="Select a state"></asp:CompareValidator>
             
         </td>
        
    </tr>
        <tr>
             <th style="height: 34px">
                 User District:
             </th>
         <td style="height: 34px">
             
             <asp:DropDownList ID="DropDownList5" runat="server">
                
             </asp:DropDownList>
             
         </td>
        
    </tr>
     <tr>
         <td style="height: 42px">
             <asp:Button ID="Button1" runat="server" Text="Register" OnClick="Button1_Click" />
         </td>
         <td style="height: 42px">
             
             </td>
    </tr>
       
    </table>

</asp:Content>
