<%@ Page Title="" Language="C#" MasterPageFile="~/TutorMasterPage.Master" AutoEventWireup="true" CodeBehind="AddGroupDetails.aspx.cs" Inherits="AssessmentWeb.Private.AddGroupDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <br />
    <asp:Label ID="Label1" runat="server" Text="Group Name         >>         "></asp:Label> 
    <asp:Label ID="groupNamelbl" runat="server"  ></asp:Label>
    <br />
    <br />
    <br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="ExamID" DataSourceID="SqlDataSource1" ForeColor="Black" GridLines="Horizontal" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            
            <asp:CommandField ShowSelectButton="True" />
            
            <asp:BoundField DataField="ExamID" HeaderText="ExamID" InsertVisible="False" ReadOnly="True" SortExpression="ExamID" />
            <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject" />
            <asp:BoundField DataField="ExamType" HeaderText="ExamType" SortExpression="ExamType" />
            <asp:BoundField DataField="Privacy" HeaderText="Privacy" SortExpression="Privacy" />
        </Columns>
        <FooterStyle BackColor="#CCCC99" ForeColor="Black" />
        <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
        <PagerStyle BackColor="White" ForeColor="Black" HorizontalAlign="Right" />
        <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" />
        <SortedAscendingCellStyle BackColor="#F7F7F7" />
        <SortedAscendingHeaderStyle BackColor="#4B4B4B" />
        <SortedDescendingCellStyle BackColor="#E5E5E5" />
        <SortedDescendingHeaderStyle BackColor="#242121" />
    </asp:GridView>
    <br />
    <br />
    <br />

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString2 %>" SelectCommand="SELECT * FROM [Exam]  WHERE ([Privacy] = @Privacy)">
        <SelectParameters>
            <asp:SessionParameter DefaultValue="Private" Name="Privacy" SessionField="Privacy" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
    </asp:Content>
