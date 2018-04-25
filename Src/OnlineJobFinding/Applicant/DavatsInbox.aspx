<%@ Page Title="" Language="C#" MasterPageFile="~/Applicant/applicantMPage.master" AutoEventWireup="true" CodeFile="DavatsInbox.aspx.cs" Inherits="Applicant_GetDavats" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style>
        .tbl_davats_list {width: 100%;}
        .tbl_davats_list_header {background: #999;}
        .tbl_davats_list td {border: 1px solid #000;}
        .tbl_davats_list_header td {text-align: center;}
    </style>
</asp:Content>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
    <p id="subject">صندوق دعوت نامه</p>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        GridLines="None" ShowFooter="True" CssClass="tbl_davats_list">
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    <table class="tbl_davats_list">
                        <tr class="tbl_davats_list_header">
                            <td class="from">از طرف</td>                            
                            <td class="emp_fname">نام كارفرما</td>
                            <td class="emp_lastname">نام خانوادگي</td>                            
                            <td class="emp_job_title">نام شغل</td>
                            <td class="description">جزئيات</td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                        <tr class="row">                            
                            <td class="from"><%# Eval("CName") %></td>
                            <td class="emp_fname"><%# Eval("FirstName") %></td>
                            <td class="emp_lastname"><%# Eval("LastName") %></td>                            
                            <td class="emp_job_title"><%# Eval("Title") %></td>
                            <td class="description">
                                <asp:HyperLink ID="HyperLink1" runat="server" 
                                    NavigateUrl='<%# Eval("DavatId", "DavatDescription.aspx?did={0}&jid=") + Eval("JobId") %>'>مشاهده جزئيات ...</asp:HyperLink>
                                <asp:HiddenField runat="server" ID="hdfEId" Value='<%# Eval("EmployerId") %>' />
                                <asp:HiddenField runat="server" ID="hdfJId" Value='<%# Eval("JobId") %>' />
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

