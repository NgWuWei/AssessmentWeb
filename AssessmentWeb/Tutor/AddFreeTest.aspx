﻿<%@ Page Title="" Language="C#" MasterPageFile="~/TutorMasterPage.Master" AutoEventWireup="true" CodeBehind="AddFreeTest.aspx.cs" Inherits="AssessmentWeb.Tutor.AddFreeTest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    
    <asp:Button ID="RTMbtn" runat="server" Text="Return to Test Menu" CssClass="auto-style3" OnClick="RTMbtn_Click" style="margin-left: 2px" />
    <br />
    <br />

    <asp:Label ID="Label2" runat="server" Text="Test ID       : "></asp:Label>
    <asp:Label ID="ExamIDtxt" runat="server" ></asp:Label>
    
    <br />
    <br />
    
    <asp:Label ID="Label1" runat="server" Text="Test Name      : "></asp:Label>
    <asp:Label ID="TestNametxt" runat="server"></asp:Label>
    <br />
    <br />

    <asp:Label ID="QTName" runat="server" Text="Question Type : "></asp:Label>
    <asp:Label ID="QTNametxt" runat="server"></asp:Label>

    <br />
    <br />

    <asp:Label ID="Privacy" runat="server" Text="Privacy : "></asp:Label>
    <asp:Label ID="Privacytxt" runat="server"></asp:Label>
    
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tail" runat="server">

<div style="float:right">
</div>

        <div>
            
            <table align="center" style="color:black" >
        <tr>
            <td style="width: 234px" >
                &nbsp;</td>
            <td style="font-weight: 700; color: #000000; width: 304px;" class="style6">
                &nbsp;</td>
        </tr>
      <tr>
            <td align="top" style="width: 234px">
                Question NO:</td>
            <td style="width: 304px">
                <asp:Label ID="QuestionNolbl" runat="server"></asp:Label>
            </td>
            
        </tr>
        <tr>
            <td align="top" style="width: 234px">
                Question:</td>
            <td style="width: 304px">
                <asp:TextBox ID="txtTitle" runat="server" Width="339px" TextMode="MultiLine" CssClass="auto-style2" Height="103px"></asp:TextBox>
            </td>
            
        </tr>
        
      
                <tr>
                    <td>
                        <br />
                        Marks
                        :</td>
                    <td><br />
                        <asp:TextBox ID="resulttxt" runat="server" TextMode="Number" min ="1" max="20" step="1" Text="5"></asp:TextBox>

                    </td>
                </tr>
           </table>
            <br />
            <br />
                <asp:Button ID="btnAddQuestion" runat="server" Text="Save And Add Question" 
                     Width="200px" BackColor="#ffb606" BorderColor="black" OnClick="btnAddQuestion_Click" CssClass="auto-style1" />
                &nbsp;&nbsp;&nbsp;&nbsp;<asp:Button ID="reset" runat="server" type="reset" text="Reset" Width="140px" BackColor="#ffb606" BorderColor="black" OnClick="reset_Click"/>
 
            
        </div>


</asp:Content>