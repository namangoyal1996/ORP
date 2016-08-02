<%@ Page Title="Login" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Pages_Account_Login" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
         
    <table id="ReportaddTable">
        <tr>
                         <td>Login:</td>
                        <td>
                            <asp:TextBox ID="nmntxtlogin" runat="server"></asp:TextBox>
                         </td>

        </tr>
        <tr>
                        <td>Password:</td>
                        <td>
                            <asp:TextBox ID="nmntxtpassword" runat="server" TextMode="Password"></asp:TextBox>
                        </td>


        </tr>
        <tr>
                        <td>
                            <asp:Button ID="nmnbtnlogin" runat="server" Text="Login" OnClick="nmnbtnlogin_Click" />
                            <asp:Label ID="lblerror" runat="server" Text=""></asp:Label>
                             &nbsp;</td>
            <td>
                <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">Forgot Password?</asp:LinkButton>
                </td>

        </tr>






    </table>

    <table id="getpass" runat="server" >
        <tr>
            <td>LoginName:</td>
            <td>
                <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>                        
            </tr>
         <tr>
            <td>
                <asp:Button ID="Button1" runat="server" Text="Send password to my registered email address" OnClick="Button1_Click" />
                <asp:Label ID="Label1" runat="server"></asp:Label>
             </td>
            </tr>


        </table>

 </asp:Content>