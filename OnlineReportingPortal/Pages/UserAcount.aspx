<%@ Page Title="User Account" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UserAcount.aspx.cs" Inherits="Pages_UserAcount" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:Label ID="Label1" runat="server"></asp:Label>
    <table class="ReportaddTable" id="registertable" runat="server">
        <tr>
             <th>
                 Title:
             </th>
         <td>
             
             <asp:DropDownList ID="DropDownList3" runat="server">
                 <asp:ListItem>Mr.</asp:ListItem>
                 <asp:ListItem>Mrs.</asp:ListItem>
                 <asp:ListItem>Ms.</asp:ListItem>
                 <asp:ListItem>Dr.</asp:ListItem>
                 <asp:ListItem>Shri</asp:ListItem>
             </asp:DropDownList>
             
         </td>
        
    </tr>
     <tr  class="rdcl">
         <th>Full Name</th>
        <td>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
         </td>
    </tr>
         <tr>
         <th>Designation</th>
        <td>
            <asp:TextBox ID="TextBox6" runat="server" OnTextChanged="TextBox6_TextChanged"></asp:TextBox>
         </td>
    </tr>
     <tr class="rdcl">
         <th>LoginName</th>
        <td>
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
         </td>
    </tr>
    
     
     <tr>
         <th style="height: 24px">E-mail id</th>
        <td style="height: 24px">
            <asp:TextBox ID="TextBox5" runat="server" TextMode="Email"></asp:TextBox>
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
                 <asp:ListItem>National</asp:ListItem>
                 <asp:ListItem>State</asp:ListItem>
                 <asp:ListItem>District</asp:ListItem>
             </asp:DropDownList>
             
         </td>
        
    </tr>
         <tr  class="rdcl">
             <th>
                 User State:
             </th>
         <td>
             
             <asp:DropDownList ID="DropDownList4" runat="server">
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
             
         </td>
        
    </tr>
     <tr>
         <th>User District:
             </th>
         <td>


             <asp:TextBox ID="TextBox10" runat="server" ReadOnly="True"></asp:TextBox>


         </td>
        
    </tr>
       
    </table>

    <table class="ReportaddTable">
        <tr><th>Current Password:</th><td>
            <asp:TextBox ID="TextBox7" runat="server" ValidationGroup="passchange"></asp:TextBox>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox7" ErrorMessage="*" ForeColor="#FF3300" ValidationGroup="passchange"></asp:RequiredFieldValidator>
            </td></tr>
                <tr  class="rdcl"><th>New Password</th><td>
                    <asp:TextBox ID="TextBox8" runat="server" ValidationGroup="passchange"></asp:TextBox> <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*" ControlToValidate="TextBox8" ForeColor="#FF3300" ValidationGroup="passchange"></asp:RequiredFieldValidator>
                    </td></tr>

                <tr><th>Confirm New Password</th><td>
                    <asp:TextBox ID="TextBox9" runat="server" ValidationGroup="passchange"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox8" ControlToValidate="TextBox9" ErrorMessage="Passwords do not match!" ForeColor="#FF3300" ValidationGroup="passchange"></asp:CompareValidator>
                    </td></tr>
        <tr><td>
             <asp:Button ID="Button2" runat="server" Text="Change Password"  ValidationGroup="passchange" OnClick="Button2_Click" />
             <asp:Label ID="Label2" runat="server"></asp:Label>
            </td><td></td></tr>


        </table>
   




</asp:Content>
