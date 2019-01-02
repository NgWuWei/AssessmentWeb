<%@ Page Title="" Language="C#" MasterPageFile="~/TutorMasterPage.Master" AutoEventWireup="true" CodeBehind="Student.aspx.cs" Inherits="AssessmentWeb.Student.Student" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <div><h1>Hello  <asp:Label ID="Nametxt" runat="server" ></asp:Label>
         </h1></div>
    <div>
        <asp:HyperLink runat="server" NavigateUrl="~/Student/QuestionMenu.aspx">Check Assessments</asp:HyperLink>
        <br />
        <asp:HyperLink runat="server" NavigateUrl="~/Student/ViewAssessment.aspx">View Assessment</asp:HyperLink>
        <br />
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tail" runat="server">
</asp:Content>
