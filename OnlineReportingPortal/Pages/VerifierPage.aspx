<%@ Page Title="View Reports" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="VerifierPage.aspx.cs" Inherits="Pages_VerifierPage" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
    <script>
        function Confirm() {
            var confirm_value = document.createElement("INPUT");
            confirm_value.type = "hidden";
            confirm_value.name = "confirm_value";
            if (confirm("Are you sure you want to delete this report?")) {
                confirm_value.value = "Yes";
            } else {
                confirm_value.value = "No";
            }
            document.forms[0].appendChild(confirm_value);
        }
       
</script>

    <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
<asp:Panel ID="pnlmng" runat="server">
    <br />

    </asp:Panel>
    
    


</asp:Content>

