<%@ Page Title="" Language="C#" MasterPageFile="~/TutorMasterPage.Master" AutoEventWireup="true" CodeBehind="Tutor.aspx.cs" Inherits="AssessmentWeb.Tutor.Tutor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div><h1>Hello  <asp:Label ID="Nametxt" runat="server" ></asp:Label>
         </h1></div>
    <div>
        <asp:HyperLink runat="server" NavigateUrl="~/Tutor/AddTestMenu.aspx">Add Assessments</asp:HyperLink>
        <br />
        <asp:HyperLink runat="server" NavigateUrl="~/Tutor/CheckMultiQuestions.aspx">Check Assessment</asp:HyperLink>
        <br />
        <asp:HyperLink runat="server" NavigateUrl="~/Tutor/ViewStudentResult.aspx">View Student Result</asp:HyperLink>
        <br />
        <asp:HyperLink runat="server" NavigateUrl="~/Tutor/ViewGroup.aspx">View Group</asp:HyperLink>
        <br />
        <asp:HyperLink runat="server" NavigateUrl="~/Tutor/MarksFreeTest.aspx">Mark The Free Text Assessment</asp:HyperLink>
    </div>

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tail" runat="server">
</asp:Content>
