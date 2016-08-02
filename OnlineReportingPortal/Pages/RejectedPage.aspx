<%@ Page Title="Rejected Page" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="RejectedPage.aspx.cs" Inherits="Pages_RejectedPage" %>

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

    <asp:Panel ID="pnlmng" runat="server"></asp:Panel>


    </asp:Content>






