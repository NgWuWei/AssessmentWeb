<%@ Page Title="" Language="C#" MasterPageFile="~/TutorMasterPage.Master" AutoEventWireup="true" CodeBehind="CheckMultiQuestions.aspx.cs" Inherits="AssessmentWeb.Tutor.CheckMultiQuestions" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style2 {
            width: 253px;
        }
        .auto-style3 {
            width: 253px;
            height: 23px;
        }
        .auto-style4 {
            height: 23px;
        }
        .auto-style1 {
            margin-left: 0px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <span class="style2">Select Test Name :&nbsp;&nbsp;</span>
     <asp:DropDownList ID="ddlExamID" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1" DataTextField="Subject" DataValueField="ExamID"   >
        </asp:DropDownList>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT * FROM [Exam]"></asp:SqlDataSource>

    <table style="width: 100%;">
        <tr>
            <td class="auto-style3"><%--Privacy:
                <asp:Label ID="privacylbl" runat="server" ></asp:Label>--%>
            </td>
            <td class="auto-style4"></td>
        </tr>
        <tr>
            <td class="auto-style2">
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        </table>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="QuestionID" DataSourceID="SqlDataSource2" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
            <asp:BoundField DataField="QuestionOrder" HeaderText="Question No." SortExpression="QuestionOrder" />
            <asp:BoundField DataField="QuestionDesc" HeaderText="Description" SortExpression="QuestionDesc" />
            <asp:BoundField DataField="Answer1" HeaderText="Answer 1" SortExpression="Answer1" />
            <asp:BoundField DataField="Answer2" HeaderText="Answer 2" SortExpression="Answer2" />
            <asp:BoundField DataField="Answer3" HeaderText="Answer 3" SortExpression="Answer3" />
            <asp:BoundField DataField="Answer4" HeaderText="Answer 4" SortExpression="Answer4" />
            <asp:TemplateField HeaderText="Correct Answer" SortExpression="CorrectAnswer">
                <EditItemTemplate>
                    <asp:DropDownList ID="DropDownList1" runat="server" SelectedValue='<%# Bind("CorrectAnswer") %>'>
                        <asp:ListItem>A</asp:ListItem>
                        <asp:ListItem>B</asp:ListItem>
                        <asp:ListItem>C</asp:ListItem>
                        <asp:ListItem>D</asp:ListItem>
                    </asp:DropDownList>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("CorrectAnswer") %>'></asp:Label>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="EachMarks" HeaderText="Marks" SortExpression="EachMarks" />
        </Columns>
        <EditRowStyle BackColor="#7C6F57" />
        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
        <RowStyle BackColor="#E3EAEB" />
        <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
        <SortedAscendingCellStyle BackColor="#F8FAFA" />
        <SortedAscendingHeaderStyle BackColor="#246B61" />
        <SortedDescendingCellStyle BackColor="#D4DFE1" />
        <SortedDescendingHeaderStyle BackColor="#15524A" />
    </asp:GridView>
    <br />
                <asp:Button ID="AMQbtn" runat="server" CssClass="auto-style1" Text="Add More Question" OnClick="AMQbtn_Click" />
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" DeleteCommand="DELETE FROM [MultiQuestion] WHERE [QuestionID] = @QuestionID" InsertCommand="INSERT INTO [MultiQuestion] ([QuestionDesc], [Answer1], [Answer2], [Answer3], [Answer4], [CorrectAnswer], [QuestionOrder], [ExamID], [EachMarks]) VALUES (@QuestionDesc, @Answer1, @Answer2, @Answer3, @Answer4, @CorrectAnswer, @QuestionOrder, @ExamID, @EachMarks)" SelectCommand="SELECT * FROM [MultiQuestion] WHERE ([ExamID] = @ExamID) ORDER BY [QuestionOrder]" UpdateCommand="UPDATE [MultiQuestion] SET [QuestionDesc] = @QuestionDesc, [Answer1] = @Answer1, [Answer2] = @Answer2, [Answer3] = @Answer3, [Answer4] = @Answer4, [CorrectAnswer] = @CorrectAnswer, [QuestionOrder] = @QuestionOrder, [ExamID] = @ExamID, [EachMarks] = @EachMarks WHERE [QuestionID] = @QuestionID">
        <DeleteParameters>
            <asp:Parameter Name="QuestionID" Type="Int32" />
        </DeleteParameters>
        <InsertParameters>
            <asp:Parameter Name="QuestionDesc" Type="String" />
            <asp:Parameter Name="Answer1" Type="String" />
            <asp:Parameter Name="Answer2" Type="String" />
            <asp:Parameter Name="Answer3" Type="String" />
            <asp:Parameter Name="Answer4" Type="String" />
            <asp:Parameter Name="CorrectAnswer" Type="String" />
            <asp:Parameter Name="QuestionOrder" Type="Int32" />
            <asp:Parameter Name="ExamID" Type="Int32" />
            <asp:Parameter Name="EachMarks" Type="Int32" />
        </InsertParameters>
        <SelectParameters>
            <asp:ControlParameter ControlID="ddlExamID" DefaultValue="" Name="ExamID" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
        <UpdateParameters>
            <asp:Parameter Name="QuestionDesc" Type="String" />
            <asp:Parameter Name="Answer1" Type="String" />
            <asp:Parameter Name="Answer2" Type="String" />
            <asp:Parameter Name="Answer3" Type="String" />
            <asp:Parameter Name="Answer4" Type="String" />
            <asp:Parameter Name="CorrectAnswer" Type="String" />
            <asp:Parameter Name="QuestionOrder" Type="Int32" />
            <asp:Parameter Name="ExamID" Type="Int32" />
            <asp:Parameter Name="EachMarks" Type="Int32" />
            <asp:Parameter Name="QuestionID" Type="Int32" />
        </UpdateParameters>
    </asp:SqlDataSource>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tail" runat="server">
    
</asp:Content>
