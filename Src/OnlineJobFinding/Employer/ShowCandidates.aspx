<%@ Page Title="" Language="C#" MasterPageFile="~/Employer/employerMPage.master" AutoEventWireup="true" CodeFile="ShowCandidates.aspx.cs" Inherits="Employer_ShowCandidates" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style>
        .tbl_candidates {width: 100%;}
        .tbl_candidates td {border: 1px solid #000;}
        .tbl_candidates_header {background: #999; color:#fff; text-align: center;}
        .row {background: rgb(255,255,255);}
        .row:hover td {background: rgb(221, 249, 93); cursor: pointer;}
        .row td {padding: 5px 5px 5px 0;}
    </style>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
    <p id="subject">ليست كانديدهاي من</p>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" CssClass="tbl_candidates" ShowFooter="true" GridLines="None">
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    <table class="tbl_candidates">
                    <tr class="tbl_candidates_header">                        
                        <td class="c_fname">نام</td>
                        <td class="c_lname">نام خانوادگي</td>                        
                        <td class="j_category">دسته</td>
                        <td class="j_title">عنوان</td>                               
                        <td class="j_otherinfo">نمايش بقيه</td>
                    </tr>            
                </HeaderTemplate>
                <ItemTemplate>
                    <tr class="row">                        
                        <td class="c_fname"><%#Eval("FirstName") %></td>
                        <td class="c_lname"><%#Eval("LastName") %></td>                        
                        <td class="j_category"><%#Eval("Category") %></td>
                        <td class="j_title"><%#Eval("Title") %></td>
                        <td class="j_otherinfo">
                            <asp:HiddenField runat="server" ID="hdfjid" Value='<%#Eval("JobId")%>' />
                            <asp:HiddenField runat="server" ID="hdfcid" Value='<%#Eval("ApplicantId")%>' />
                            <asp:HyperLink ID="HyperLink1" runat="server" 
                                NavigateUrl='<%# Eval("ApplicantId", "ShowCandidateCV.aspx?aid={0}") + Eval("JobId", "&jid={0}") %>'>نمايش CV ...</asp:HyperLink>
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