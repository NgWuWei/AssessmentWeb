<%@ Page Title="" Language="C#" MasterPageFile="~/TutorMasterPage.Master" AutoEventWireup="true" CodeBehind="FreeTestAssessment.aspx.cs" Inherits="AssessmentWeb.Assessment.FreeTestAssessment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
   <div class="auto-style1">
       <table style="width: 100%;">
           <tr>
               <td>
                   <br />
                   <Strong>Test ID:</Strong></td>
               <td>
                   <br />
                   <asp:Label ID="CurrentIDlbl" runat="server"></asp:Label>
               </td>
           </tr>
           <tr>
               <td class="auto-style2">
                   <br /><strong>Current Test : </strong></td>
               <td>
                   <br />
                   <asp:Label ID="CurrentTestlbl" runat="server" ></asp:Label>
               </td>
           </tr>
          <tr>
               <td class="auto-style2">
                   <br /><strong>Test Type    : </strong></td>
               <td>
                   <br />
                   <asp:Label ID="CurrentTypelbl" runat="server" ></asp:Label>
               </td>
           </tr>
       </table>
       <br />
       <div>
          

           <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" CssClass="auto-style3">
               <ItemTemplate>
                   <asp:Label ID="lblID" runat="server" Text='<%# Eval("QuestionID") %>'></asp:Label>
                    <br />
                   <asp:Label ID="QNolbl" runat="server" Text='<%# "Question No. " + Eval("QuestionOrder") %>'></asp:Label>
                   <br />
                    <asp:Label ID="TextLabel" runat="server" Text='<%# Eval("ftQuestionDesc") %>' />
                    <br />
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Eval("ftQuestionAns") %>'></asp:TextBox>
              
                    
                    <br />
                   <asp:Label ID="EachMarksLabel" runat="server" Text='<%#"Full Marks >> " + Eval("EachMarks") %>' />


                  
              
                   
                   <br />
                <br />
            </ItemTemplate>
              
            </asp:DataList>


            <asp:TextBox ID="resulttxt" runat="server" TextMode="Number" min ="1" max="10" step="1" Text="5"></asp:TextBox>


        </div>
      
       <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [QuestionID], [QuestionOrder], [ftQuestionDesc], [ftQuestionAns], [EachMarks] FROM [FreeTestQuestion] WHERE ([ExamID] = @ExamID)">
           <SelectParameters>
               <asp:SessionParameter Name="ExamID" SessionField="id2" Type="Int32" />
           </SelectParameters>
       </asp:SqlDataSource>
       <br />
       <br />
       <asp:Button ID="submitbtn" runat="server" Text="Submit" OnClick="submitbtn_Click" style="height: 26px" />
       <br />
       
   </div>

            
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tail" runat="server">
</asp:Content>
