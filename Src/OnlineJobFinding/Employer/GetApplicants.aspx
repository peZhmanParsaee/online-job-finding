<%@ Page Title="" Language="C#" MasterPageFile="~/Employer/employerMPage.master" AutoEventWireup="true" CodeFile="GetApplicants.aspx.cs" Inherits="Employer_GetApplicants" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style>
        .tbl_applicants
        {
            width: 100%;
        }
        .tbl_applicants .tbl_header
        {
            background: #999;
        }
        .tbl_applicants .tbl_header td
        {
            text-align: center;
            color: #fff;
        }
        .tbl_applicants td
        {
            border: 1px solid #000;
        }
        .tbl_applicants .row td 
        {
            padding: 5px 5px 0 0;
        }
        .row {background: rgb(255,255,255);}
        .row:hover td {background: rgb(221, 249, 93); cursor: pointer;}        
    </style>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">

    <p id="subject">ليست كليه كارجويان</p>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" GridLines="None" ShowFooter="true" CssClass="tbl_applicants">
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    <table class="tbl_applicants">
                        <tr class="tbl_header">                            
                            <td>نام</td>
                            <td>نام خانوادگي</td>
                            <td>نام كاربري</td>
                            <td>وضعيت</td>
                            <td>بقيه اطلاعات</td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                        <tr class="row">                            
                            <td><%#Eval("FirstName")%></td>
                            <td><%#Eval("LastName")%></td>
                            <td><%#Eval("UserLoginName")%></td>
                            <td ><%#(Eval("ApplicantState"))%></td>
                            <td style="text-align: center;">
                                <asp:HiddenField runat="server" ID="hdf" Value='<%#Eval("ApplicantId")%>' />
                                <asp:HyperLink ID="HyperLink1" runat="server" 
                                    NavigateUrl='<%# Eval("ApplicantId", "ShowApplicantCV.aspx?aid={0}") %>'>نمايش CV ...</asp:HyperLink>
                            </td>
                        </tr>                    
                </ItemTemplate>
                <FooterTemplate>
                    </table>
                </FooterTemplate>                
            </asp:TemplateField>                        
        </Columns>
        <EmptyDataTemplate>
            موردي يافت نشد.
        </EmptyDataTemplate>
    </asp:GridView>
</asp:Content>