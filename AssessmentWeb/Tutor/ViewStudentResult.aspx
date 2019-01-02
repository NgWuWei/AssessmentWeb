<%@ Page Title="" Language="C#" MasterPageFile="~/TutorMasterPage.Master" AutoEventWireup="true" CodeBehind="ViewStudentResult.aspx.cs" Inherits="AssessmentWeb.Tutor.ViewStudentResult" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
      <div>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataSourceID="SqlDataSource2" ForeColor="Black" GridLines="Horizontal" DataKeyNames="asID">
                <Columns>
                    <asp:CommandField ShowDeleteButton="True" ShowSelectButton="True" />
                    <asp:BoundField DataField="asID" HeaderText="Assessment Number" InsertVisible="False" ReadOnly="True" SortExpression="asID" />
                    <asp:BoundField DataField="examID" HeaderText="Exam ID" SortExpression="examID" />
                    <asp:BoundField DataField="asName" HeaderText="Exam Name" SortExpression="asName" />
                    <asp:BoundField DataField="asQuestionType" HeaderText="Question Type" SortExpression="asQuestionType" />
                    <asp:BoundField DataField="asTotalMarks" HeaderText="TotalMarks" SortExpression="asTotalMarks" />
                    <asp:BoundField DataField="studID" HeaderText="Studnet ID" SortExpression="studID" />
                    <asp:BoundField DataField="studName" HeaderText="Student Name" SortExpression="studName" />
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black"  HorizontalAlign="Center"/>
                <HeaderStyle BackColor="#ffb606" Font-Bold="True" ForeColor="White"  HorizontalAlign="Center"/>
                <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="center" />
                <RowStyle  HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#F7F7F7" />
                <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
                <SortedDescendingCellStyle BackColor="#E5E5E5" />
                <SortedDescendingHeaderStyle BackColor="#242121" />
            </asp:GridView>
            <br />
            <br />
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT Assessments.asID, Assessments.examID, Assessments.asName, Assessments.asQuestionType, Assessments.asTotalMarks, Assessments.studID, Students.studName FROM Exam INNER JOIN Assessments ON Exam.ExamID = Assessments.examID AND Exam.ExamType = Assessments.asQuestionType AND Exam.Subject = Assessments.asName INNER JOIN Students ON Assessments.studID = Students.studId" DeleteCommand="DELETE FROM [Assessments] WHERE [asID] = @asID" InsertCommand="INSERT INTO [Assessments] ([asName], [asDetails], [asQuestionType], [asTotalMarks], [studID], [examID]) VALUES (@asName, @asDetails, @asQuestionType, @asTotalMarks, @studID, @examID)" UpdateCommand="UPDATE [Assessments] SET [asName] = @asName, [asDetails] = @asDetails, [asQuestionType] = @asQuestionType, [asTotalMarks] = @asTotalMarks, [studID] = @studID, [examID] = @examID WHERE [asID] = @asID">
                <DeleteParameters>
                    <asp:Parameter Name="asID" Type="Int32" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="asName" Type="String" />
                    <asp:Parameter Name="asDetails" Type="String" />
                    <asp:Parameter Name="asQuestionType" Type="String" />
                    <asp:Parameter Name="asTotalMarks" Type="Double" />
                    <asp:Parameter Name="studID" Type="Int32" />
                    <asp:Parameter Name="examID" Type="Int32" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="asName" Type="String" />
                    <asp:Parameter Name="asDetails" Type="String" />
                    <asp:Parameter Name="asQuestionType" Type="String" />
                    <asp:Parameter Name="asTotalMarks" Type="Double" />
                    <asp:Parameter Name="studID" Type="Int32" />
                    <asp:Parameter Name="examID" Type="Int32" />
                    <asp:Parameter Name="asID" Type="Int32" />
                </UpdateParameters>
            </asp:SqlDataSource>

        </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tail" runat="server">
</asp:Content>
