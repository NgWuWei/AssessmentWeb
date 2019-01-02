<%@ Page Title="" Language="C#" MasterPageFile="~/TutorMasterPage.Master" AutoEventWireup="true" CodeBehind="ViewAssessment.aspx.cs" Inherits="AssessmentWeb.Student.ViewAssessment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div><h1>View Assessment Results</h1></div>
    <div>
        <!-- Get student name , assessment name, student score -->
        <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" DataKeyField="asID">
        <ItemTemplate>
            asID:
            <asp:Label ID="asIDLabel" runat="server" Text='<%# Eval("asID") %>' />
            <br />
            examID:
            <asp:Label ID="examIDLabel" runat="server" Text='<%# Eval("examID") %>' />
            <br />
            asName:
            <asp:Label ID="asNameLabel" runat="server" Text='<%# Eval("asName") %>' />
            <br />
            asQuestionType:
            <asp:Label ID="asQuestionTypeLabel" runat="server" Text='<%# Eval("asQuestionType") %>' />
            <br />
            asTotalMarks:
            <asp:Label ID="asTotalMarksLabel" runat="server" Text='<%# Eval("asTotalMarks") %>' />
            <br />
            <br />
        </ItemTemplate>
    </asp:DataList>
    <br />
    <asp:Panel runat="server">
       
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [asID], [examID], [asName], [asQuestionType], [asTotalMarks] FROM [Assessments] WHERE ([studID] = @studID)">
            <SelectParameters>
                <asp:SessionParameter Name="studID" SessionField="user" Type="Int32" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:Button ID="Button1" runat="server" Text="Back to homepage" OnClick="Button1_Click"  />
        </asp:Panel>

    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tail" runat="server">
</asp:Content>
