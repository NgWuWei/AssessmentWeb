<%@ Page Title="" Language="C#" MasterPageFile="~/TutorMasterPage.Master" AutoEventWireup="true" CodeBehind="AssignTest.aspx.cs" Inherits="AssessmentWeb.Private.AssignTest" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <asp:Label ID="Label4" runat="server" Text="Exam ID       : "></asp:Label>
    <asp:Label ID="Label1" runat="server" ></asp:Label>
    <br />
    <br />

    <asp:Label ID="Label5" runat="server" Text="Subject       : "></asp:Label>
    <asp:Label ID="Label2" runat="server" ></asp:Label>
    <br />
    <br />

    <asp:Label ID="Label6" runat="server" Text="Exam Type     : "></asp:Label>
    <asp:Label ID="Label3" runat="server" ></asp:Label>
    
    <br />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="studId" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:TemplateField>
                <ItemTemplate>
                <asp:CheckBox ID="chkSelect" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="studId" HeaderText="studId" InsertVisible="False" ReadOnly="True" SortExpression="studId" />
            <asp:BoundField DataField="studName" HeaderText="studName" SortExpression="studName" />
            <asp:BoundField DataField="studGender" HeaderText="studGender" SortExpression="studGender" />
            <asp:BoundField DataField="courseId" HeaderText="courseId" SortExpression="courseId" />
        </Columns>
    </asp:GridView>
    <br />
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT [studId], [studName], [studGender], [courseId] FROM [Students]"></asp:SqlDataSource>
    


    <br />
    <br />
    <asp:Button ID="assignbtn" runat="server" Text="ASSIGN" OnClick="assignbtn_Click" />
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tail" runat="server">
</asp:Content>
