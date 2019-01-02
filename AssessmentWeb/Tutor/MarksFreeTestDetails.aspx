<%@ Page Title="" Language="C#" MasterPageFile="~/TutorMasterPage.Master" AutoEventWireup="true" CodeBehind="MarksFreeTestDetails.aspx.cs" Inherits="AssessmentWeb.Tutor.MarksFreeTestDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 236px;
        }
        .auto-style2 {
            width: 154px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <br />
    <br />
    <table style="width: 100%;">
           <tr>
               <td class="auto-style2">
                   <br />
                   <Strong>Exam ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : </Strong></td>
               <td>
                   <br />
                    <asp:Label ID="Label1" runat="server"  ></asp:Label>
               </td>
           </tr>
           <tr>
               <td class="auto-style2">
                   <br />
                   <strong>Subject&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : </strong></td>
               <td>
                   <br />
                   <asp:Label ID="Label2" runat="server"  ></asp:Label>    
               </td>
           </tr>
         <tr>
               <td class="auto-style2">
                   <br /><strong>Student ID&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : </strong></td>
               <td>
                   <br />
                   <asp:Label ID="Label3" runat="server"  ></asp:Label>    
               </td>
           </tr>
        <tr>
               <td class="auto-style2">
                   <br /><strong>Exam Type &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; : </strong></td>
               <td>
                   <br />
                   <asp:Label ID="Label4" runat="server"  ></asp:Label>    
               </td>
           </tr>
       </table>
    <br />
 


<div class="auto-style1">
          

           <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" CssClass="auto-style3" Width="193px">
               <ItemTemplate>
                   <asp:Label ID="lblID" runat="server" Text='<%#"Question ID " + Eval("QuestionID") %>'></asp:Label>
                    <br />
                   <asp:Label ID="QNolbl" runat="server" Text='<%# "Question No. " + Eval("QuestionOrder") %>'></asp:Label>
                   <br />
                    <asp:Label ID="TextLabel" runat="server" Text='<%# Eval("ftQuestionDesc") %>' />
                    <br />
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("ftQuestionAns") %>'></asp:TextBox>
                    <br />
                   <asp:TextBox ID="TextBox2" runat="server" Text='<%# "Comment "  + Eval("ftComment") %>'></asp:TextBox>
                    <br />
                   <asp:Label ID="EachMarksLabel" runat="server" Text='<%# Eval("EachMarks") %>' />
                   <br />

                 <asp:TextBox ID="resulttxt" runat="server" Text='<%#"Your Marks >> " + Eval("EachConfirmMarks") %>' TextMode="Number" min ="1" max=Convert.ToInt32(EachMarksLabel.Text)  step="1" />
                   <br />
                <br />
            </ItemTemplate>
              
            </asp:DataList>
        </div>
    <br />
    <br />
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
     SelectCommand=" ft.ftQuestionID, QuestionOrder, ft.ftQuestionDesc, sa.stasAnswerGiven, ft.EachMarks
     FROM FreeTestQuestion ft, Assessments ass, StudentAssessments sa
     WHERE sa.ExamID = @ExamID AND sa.ExamID = ft.ExamID AND ft.QuestionID = sa.QuestionID">

           <SelectParameters>
               <asp:SessionParameter Name="ExamID" SessionField="id2" Type="Int32" />
           </SelectParameters>
       </asp:SqlDataSource>
    <br />
    <br />
    <br />
    <asp:Button ID="submitbtn" runat="server" Text="Submit" OnClick="submitbtn_Click" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tail" runat="server">
</asp:Content>
