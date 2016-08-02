<%@ Page Title="Users" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="AllUsers.aspx.cs" Inherits="Pages_AllUsers" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    












    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CC9966" BorderStyle="None" BorderWidth="1px" CellPadding="4" OnRowEditing="GridView1_RowEditing" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" AllowPaging="True">
        <Columns>
            <asp:CommandField ShowEditButton="True" />
            <asp:CommandField ShowDeleteButton="True" />
        </Columns>
        <FooterStyle BackColor="#FFFFCC" ForeColor="#330099" />
        <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="#FFFFCC" />
        <PagerStyle BackColor="#FFFFCC" ForeColor="#330099" HorizontalAlign="Center" />
        <RowStyle BackColor="White" ForeColor="#330099" />
        <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="#663399" />
        <SortedAscendingCellStyle BackColor="#FEFCEB" />
        <SortedAscendingHeaderStyle BackColor="#AF0101" />
        <SortedDescendingCellStyle BackColor="#F6F0C0" />
        <SortedDescendingHeaderStyle BackColor="#7E0000" />
    </asp:GridView>

    <div id ="updateuserdetails" runat="server">
        <table class="ReportaddTable" id="registertable" runat="server">
            <tr>
         <th class="rdcl">ID:</th>
        <td class="rdcl">
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
         </td>
    </tr>
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
     <tr class="rdcl">
         <th>Full Name</th>
        <td>
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
         </td>
    </tr>
             <tr>
         <th>Designation:</th>
        <td>
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
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
         <tr class="rdcl">
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
             
             
             
             <asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="SqlDataSource1" DataTextField="DistrictName" DataValueField="DistrictName">
             </asp:DropDownList>
             <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ReportingConnection %>" SelectCommand="SELECT [DistrictName] FROM [Districts]"></asp:SqlDataSource>
             
             
             
         </td>
        
    </tr>
     <tr>
         <td>
             <asp:Button ID="Button1" runat="server" Text="Update" OnClick="Button1_Click" style="height: 26px"/>
         &nbsp;
             <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Go Back" />
         </td>
        
    </tr>
       
    </table>

       </div>





  

    
</asp:Content>