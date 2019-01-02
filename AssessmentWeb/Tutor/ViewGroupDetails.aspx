<%@ Page Title="" Language="C#" MasterPageFile="~/TutorMasterPage.Master" AutoEventWireup="true" CodeBehind="ViewGroupDetails.aspx.cs" Inherits="AssessmentWeb.Tutor.ViewGroupDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            width: 207px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
     <table style="width: 100%;">
        <tr>
            <td class="auto-style1">
                <br />
                <strong>Group ID</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; >> </td>
            <td>
                <br />
                 <asp:Label ID="groupIDlbl" runat="server"  ></asp:Label>
                <br />
            </td>
        </tr>
        <tr>
            <td class="auto-style1">
                <br />
                <strong>Group Name</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; >> </td>
            <td>
                <br />
                 <asp:Label ID="groupNamelbl" runat="server"  ></asp:Label>
                <br />
            </td>
        </tr>
    </table>

    <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource1" AutoGenerateColumns="False">
        <Columns>
            <asp:CommandField ShowSelectButton="True" />
            <asp:BoundField DataField="ExamID" HeaderText="ExamID" SortExpression="ExamID" />
            <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject" />
            <asp:BoundField DataField="TestType" HeaderText="TestType" SortExpression="TestType" />
        </Columns>
     </asp:GridView>
    <br />
     <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>"  SelectCommand="SELECT [ExamID], [Subject], [TestType] FROM [Groups] WHERE ([GroupID] = @GroupID)">
         <SelectParameters>
             <asp:QueryStringParameter Name="GroupID" QueryStringField="GroupID" Type="Int32" />
         </SelectParameters>
     </asp:SqlDataSource>
     <br />
     <br />
     <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2">
         <Columns>
             <asp:CommandField ShowSelectButton="True" />
             <asp:BoundField DataField="StudentID" HeaderText="StudentID" SortExpression="StudentID" />
             <asp:BoundField DataField="studName" HeaderText="studName" SortExpression="studName" />
         </Columns>
     </asp:GridView>
     <br />
     <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT g.StudentID, s.studName FROM Groups AS g INNER JOIN Students AS s ON g.StudentID = s.studId WHERE (g.GroupID = @GroupID)">
         <SelectParameters>
             <asp:QueryStringParameter Name="GroupID" QueryStringField="GroupID" Type="Int32" />
         </SelectParameters>
     </asp:SqlDataSource>
     <br />
    <br />

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tail" runat="server">
</asp:Content>
