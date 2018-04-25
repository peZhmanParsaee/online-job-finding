<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/administratorMPage.master" AutoEventWireup="true" CodeFile="GetVacancies.aspx.cs" Inherits="Administrator_GetVacancies" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style>
        .tbl_vacancies {width: 100%;}
        .tbl_vacancies td {border: 1px solid #000;}
        .tbl_vacancies_header {background: #999; color: #fff; text-align: center;}        
        .row {background: rgb(255,255,255);}
        .row:hover td {background: rgb(221, 249, 93); cursor: pointer;}
        .v_title {padding: 5px 5px 5px 0;}
        .v_city {}
        .v_dateposted {text-align: left; padding: 5px 0 5px 5px;}
        .v_dateclosing {text-align: left; padding: 5px 0 5px 5px;}
        .v_company {padding: 5px 5px 5px 0px;}
        .v_otherinfo {text-align:center;}
    </style>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
<p id="subject">ليست فرصتهاي شغلي</p>
    
    <asp:GridView ID="GridView1" runat="server" GridLines="None" CssClass="tbl_vacancies" AutoGenerateColumns="false" ShowFooter="true" >
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    <table class="tbl_vacancies">
                    <tr class="tbl_vacancies_header">                        
                        <td class="v_title">عنوان</td>
                        <td class="v_city">شهر</td>
                        <td class="v_dateposted">تاريخ ارسال</td>
                        <td class="v_dateclosing">تاريخ انقضاء</td>
                        <td class="v_company">شركت ارائه دهنده</td>                        
                        <td class="v_otherinfo">بقيه اطلاعات</td>
                    </tr>
                </HeaderTemplate>
                    
                <ItemTemplate>
                    <tr class="row">                        
                        <td class="v_title"><%#Eval("Title") %></td>
                        <td class="v_city"><%#Eval("City") %></td>
                        <td class="v_dateposted"><%#Persia.Calendar.ConvertToPersian(Convert.ToDateTime(Eval("DatePosted"))).Persian %></td>
                        <td class="v_dateclosing"><%#Persia.Calendar.ConvertToPersian(Convert.ToDateTime(Eval("DateClosing"))).Persian %></td>
                        <td class="v_company"><%#Eval("CName") %></td>                        
                        <td class="v_otherinfo">
                            <asp:HiddenField runat="server" ID="hdfj" Value='<%#Eval("JobId") %>' />
                            <asp:HiddenField runat="server" ID="eid" Value='<%#Eval("EmployerId") %>' />
                            <asp:HyperLink ID="HyperLink1" runat="server"                         
                            NavigateUrl='<%# Eval("JobId", "ShowVacancyDescription.aspx?vid={0}") %>'>نمايش ...</asp:HyperLink>
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