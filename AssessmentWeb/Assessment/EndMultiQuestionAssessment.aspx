<%@ Page Title="" Language="C#" MasterPageFile="~/TutorMasterPage.Master" AutoEventWireup="true" CodeBehind="EndMultiQuestionAssessment.aspx.cs" Inherits="AssessmentWeb.Assessment.EndMultiQuestionAssessment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
 <h1>Your Result is : 
        <%# Request.QueryString["result"].ToString() %>
    </h1>
    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" DataKeyField="asID">
        <ItemTemplate>
            asID:
            <asp:Label ID="asIDLabel" runat="server" Text='<%# Eval("asID") %>' />
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
       
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [asID], [asName], [asQuestionType], [asTotalMarks] FROM [Assessments] WHERE (([studID] = @studID) AND ([examID] = @examID) AND ([asName] = @asName))">
            <SelectParameters>
                <asp:SessionParameter Name="studID" SessionField="user" Type="Int32" />
                <asp:SessionParameter Name="examID" SessionField="id2" Type="Int32" />
                <asp:SessionParameter Name="asName" SessionField="name2" Type="String" />
            </SelectParameters>
        </asp:SqlDataSource>

        <asp:Button ID="Button1" runat="server" Text="Back to homepage" OnClick="Button1_Click" />
        </asp:Panel>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tail" runat="server">
</asp:Content>
