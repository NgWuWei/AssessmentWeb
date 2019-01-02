<%@ Page Title="" Language="C#" MasterPageFile="~/TutorMasterPage.Master" AutoEventWireup="true" CodeBehind="QuestionMenu.aspx.cs" Inherits="AssessmentWeb.Student.QuestionMenu" %>
<asp:Content ID="Content1" ContentPlaceHolderID="title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            margin-left: 0px;
        }
        </style>
    </asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body" runat="server">
    <table style="align:center;text-align:center" >
                                       
                    <tr>
                       <td class="style2">All Public Tests</td> 
                    </tr>        
                    <tr>
                        <td width="100%"></td>
                    </tr>
                    <tr>
                        <td width="100%">
                        
                            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataKeyNames="ExamID" DataSourceID="SqlDataSource3" OnSelectedIndexChanged="GridView3_SelectedIndexChanged" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" CssClass="auto-style1" Width="553px">
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" />
                                    <asp:BoundField DataField="ExamID" HeaderText="Exam ID" InsertVisible="False" ReadOnly="True" SortExpression="ExamID" >
                                    <FooterStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject" >
                                    <FooterStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="ExamType" HeaderText="Exam Type" SortExpression="Exam Type" >
                                    <FooterStyle HorizontalAlign="Center" />
                                    <HeaderStyle HorizontalAlign="Center" />
                                    </asp:BoundField>
                                </Columns>
                                <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                                <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                                <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                                <RowStyle BackColor="White" ForeColor="#003399" />
                                <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                                <SortedAscendingCellStyle BackColor="#EDF6F6" />
                                <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                                <SortedDescendingCellStyle BackColor="#D6DFDF" />
                                <SortedDescendingHeaderStyle BackColor="#002876" />
                            </asp:GridView>
                            <br />
                            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ExamID], [Subject], [ExamType] FROM [Exam] WHERE ([Privacy] = @Privacy)">
                                <SelectParameters>
                                    <asp:SessionParameter DefaultValue="Public" Name="Privacy" SessionField="Privacy" Type="String" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        
                            <br />
                            
                        </td>
                    </tr>                                         
                    <tr>
                        <td width="100%">&nbsp;</td>
                    </tr>  
                     <tr>
                        <td class="style2" width="100%">All Private Tests</td>
                    </tr>

                     <tr>
                        <td width="100%">
                        
                           
                        
                            <br />
                            <asp:GridView ID="GridView4" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="SqlDataSource5" GridLines="Vertical" Width="544px" OnSelectedIndexChanged="GridView4_SelectedIndexChanged">
                                <AlternatingRowStyle BackColor="#DCDCDC" />
                                <Columns>
                                    <asp:CommandField ShowSelectButton="True" />
                                    <asp:BoundField DataField="ExamID" HeaderText="ExamID" SortExpression="ExamID" />
                                    <asp:BoundField DataField="Subject" HeaderText="Subject" SortExpression="Subject" />
                                    <asp:BoundField DataField="TestType" HeaderText="TestType" SortExpression="TestType" />
                                </Columns>
                                <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                                <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                                <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                                <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                                <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#F1F1F1" />
                                <SortedAscendingHeaderStyle BackColor="#0000A9" />
                                <SortedDescendingCellStyle BackColor="#CAC9C9" />
                                <SortedDescendingHeaderStyle BackColor="#000065" />
                            </asp:GridView>
                            <br />
                            <br />
     
                        
                           
                        
                            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT [ExamID], [Subject], [ExamType] FROM [Exam] WHERE ([Privacy] = @Privacy) AND (StudentAssessment.StudentID = @StudentID)">
                                <SelectParameters>
                                    <asp:SessionParameter DefaultValue="Private" Name="Privacy" SessionField="Privacy" Type="String" />
                                    <asp:SessionParameter Name="StudentID" SessionField="user" Type="Int32" />
                                    
                                </SelectParameters>
                            </asp:SqlDataSource>
                  
                            <br />
                            
                        </td>
                    </tr>      
       
                    <tr>
                        <td width="100%" class="style2">Test Result History<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4"
                                DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" Width="555px" >
                                <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
                                <RowStyle BackColor="#F7F6F3" ForeColor="#333333" CssClass="generaltext" />
                                <Columns>
                                    <asp:BoundField DataField="Subject" HeaderText="Test Name" SortExpression="Title" >
                                        <HeaderStyle HorizontalAlign="Left" />
                                        <ItemStyle HorizontalAlign="Left" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="DateTimeComplete" DataFormatString="{0:d}" HeaderText="Completed"
                                        SortExpression="DateTimeComplete" >
                                        <FooterStyle Width="150px" />
                                        <HeaderStyle Width="150px" />
                                        <ItemStyle HorizontalAlign="Center" Width="150px" />
                                    </asp:BoundField>
                                    <asp:BoundField DataField="Score" HeaderText="Score" SortExpression="Score" >
                                        <FooterStyle Width="50px" />
                                        <HeaderStyle Width="50px" />
                                        <ItemStyle HorizontalAlign="Center" Width="50px" />
                                    </asp:BoundField>
                                </Columns>
                                <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
                                <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
                                <HeaderStyle Font-Bold="True" CssClass="complete" />
                                <EditRowStyle BackColor="#999999" />
                                <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
                            </asp:GridView>
                            </td>
                    </tr>
                    <tr>
                        <td width="100%">
                            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="SELECT Exam.Subject, StudentAssessment.DateTimeComplete, StudentAssessment.Score FROM StudentAssessment INNER JOIN Exam ON StudentAssessment.ExamID = Exam.ExamID WHERE (StudentAssessment.StudentName = @StudentName) ORDER BY StudentAssessment.DateTimeComplete">
                                <SelectParameters>
                                    <asp:SessionParameter Name="Username" SessionField="Username" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                        </td>
                    </tr>                                         
                    <tr>
                        <td width="100%">&nbsp;</td>
                    </tr>                                       
                            
                </table>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="tail" runat="server">
</asp:Content>
