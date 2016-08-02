<%@ Page Title="Login" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UploadImages.aspx.cs" Inherits="Pages_UploadImages" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  
     

      <div id="fileuplddiv" runat="server">
    <h1>Relevant Documents/Media</h1>
        <p>
            <asp:Label ID="Label2" runat="server" Font-Bold="True" ForeColor="#00CC00" Text="Success!! Now please upload relevant files "></asp:Label>
        <asp:Label ID="Label1" runat="server"></asp:Label>
        </p>
    <table class="ReportaddTable dplytbl" >
        <tr><th>Cover Photo:<br />
            This will be displayed on first page of<br />
            your report<br />
            Maximum file size allowed:1MB<br />
            </th>
        <td>
        <asp:FileUpload ID="FileUpload2" runat="server"  />
        <asp:ListBox ID="ListBox2" runat="server" Rows="5" SelectionMode="Single" Width="221px" BackColor="#CCCCFF">
        </asp:ListBox>
        <asp:Button ID="add2" runat="server" Text="Add" Width="75px" OnClick="add2_Click" />
        <asp:Button ID="remove2" runat="server" Text="Remove" Width="98px" OnClick="remove2_Click" />
            </td>
    </tr>
        <tr  class="rdcl"><th>Participants/Volunteers List:<br />
            Upload a excel file, with each<br />
            sheet name as heading for the sheet<br />
            <br />
            Maximum file size allowed:500kb</th>
        <td>
        <asp:FileUpload ID="FileUpload3" runat="server"  />
        <asp:ListBox ID="ListBox3" runat="server" Rows="5" SelectionMode="Single" Width="221px" BackColor="#CCCCFF">
        </asp:ListBox>
        <asp:Button ID="add3" runat="server" Text="Add" Width="75px" OnClick="add3_Click" />
        <asp:Button ID="remove3" runat="server" Text="Remove" Width="98px" OnClick="remove3_Click" />
            </td>
    </tr>
        <tr><th>Pictures of the Activity:<br />
            Total pictures allowed:8<br />
            size of each image &lt;= 1MB</th>
        <td>
                
        <asp:FileUpload ID="FileUpload4" runat="server"  />
        <asp:ListBox ID="ListBox4" runat="server" Rows="5" SelectionMode="Single" Width="221px" BackColor="#CCCCFF">
        </asp:ListBox>
        <asp:Button ID="add4" runat="server" Text="Add" Width="75px" OnClick="add4_Click" />
        <asp:Button ID="remove4" runat="server" Text="Remove" Width="98px" OnClick="remove4_Click" />
                
         </td>
    </tr>
        
        <tr class="rdcl"><th>Videos:<br />
            Total Videos allowed:2<br />
            size of each video &lt;= 100MB</th>
        <td>
                
                
        <asp:FileUpload ID="FileUpload5" runat="server"  />
        <asp:ListBox ID="ListBox5" runat="server" Rows="5" SelectionMode="Single" Width="221px" BackColor="#CCCCFF">
        </asp:ListBox>
        <asp:Button ID="add5" runat="server" Text="Add" Width="75px" OnClick="add5_Click" />
        <asp:Button ID="remove5" runat="server" Text="Remove" Width="98px" OnClick="remove5_Click" />
                
                
         </td>
    </tr>
        <tr>
            <th>
                Documents:<br />
                These will be available as download links<br />
                in your report<br />
                <br />
                Maximum files allowed:5<br />
                size of each file &lt;=2MB</th>

            <td>
        <asp:FileUpload ID="FileUpload6" runat="server" />
        <asp:ListBox ID="ListBox6" runat="server" Rows="5" SelectionMode="Single" Width="221px" BackColor="#CCCCFF">
        </asp:ListBox>
        <asp:Button ID="add6" runat="server" Text="Add" Width="75px" OnClick="add6_Click" />
        <asp:Button ID="remove6" runat="server" Text="Remove" Width="98px" OnClick="remove6_Click" />

                </td>

            </tr>
    </table>
        <table>
       <tr><td><asp:Button ID="Button3" runat="server" align='center' Text="Done!! Send it for verification" OnClick="Button3_Click1" /></td>
   <td>
           <asp:Button ID="Button8" runat="server" Text="Save changes, I will send it for verification later!" OnClick="Button8_Click" />
        </td>
           </tr>
            </table>
        </div>









 </asp:Content>