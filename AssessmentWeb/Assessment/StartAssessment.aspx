<%@ Page Title="" Language="C#" MasterPageFile="~/TutorMasterPage.Master" AutoEventWireup="true" CodeBehind="StartAssessment.aspx.cs" Inherits="AssessmentWeb.Assessment.StartAssessment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style8 {
            width: 313px;
        }
        .auto-style9 {
            margin-left: 735px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <table style="width: 100%;">
        <tr>
            <td class="auto-style8">
                <strong>Exam ID</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td>
                 <asp:Label ID="Label1" runat="server"  ></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style8">
                <strong>Test Name</strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</td>
            <td>
                 <asp:Label ID="Label2" runat="server"  ></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="auto-style8">
                <strong>Exam Type</strong>&nbsp;&nbsp;&nbsp;</td>
            <td>
                 <asp:Label ID="Label3" runat="server"  ></asp:Label>
            </td>
        </tr>
    </table>
    <br /><br /><br />
    <table style="width: 100%;">
        <tr>
            <td><strong>
                    Ready to Start the Test</strong><span class="style3"> </span>
                </td>
        </tr>
        <tr>
            <td>You are about to take the 
                    Exam. The Exam contains multiple choice style questions with 5 Question 
                    for each Subject. Read the Question carefully and Choose the Correct Answer form 
                    the drop down list box then select the Next button. 
                    You are not allow to go back and change your answers once you select the Next
                    button, so choose carefully.</td>
        </tr>
        <tr>
            <td>When you are ready to begin, select the Start button below.</td>
        </tr>
         <tr>
            <td>
                    <asp:Button ID="Button2" runat="server" Text="Start" 
                        OnClick="startButton_Click" CssClass="auto-style9" /></td>
        </tr>
    </table>

    <br />   

</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tail" runat="server">
</asp:Content>
