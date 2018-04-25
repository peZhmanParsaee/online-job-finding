<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/administratorMPage.master" AutoEventWireup="true" CodeFile="GetEmployers.aspx.cs" Inherits="Administrator_GetEmployers" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style>
        .tbl_employers {width: 100%;}
        .tbl_employers td {border: 1px solid #000;}
        .tbl_employers_header {background: #999;}        
        .tbl_employers_header td {text-align: center; color: #fff;}
        .row {background: rgb(255,255,255);}
        .row:hover td {background: rgb(221, 249, 93); cursor: pointer;}
        .emp_name{width: 20%;}
        .emp_lname{width: 20%;}
        .c_name{width: 20%;}
        .c_city{width: 20%;}
        .otherinfo{width: 15%; text-align: center;}
    </style>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
    <p id="subject">ليست كارفرمايان</p>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" ShowFooter="true" GridLines="None" CssClass="tbl_employers">
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    <table class="tbl_employers">
                        <tr class="tbl_employers_header">                            
                            <td class="emp_name">نام</td>
                            <td class="emp_lname">نام خانوادگي</td>
                            <td class="c_name">نام شركت</td>                            
                            <td class="c_city">شهر</td>
                            <td class="otherinfo">بقيه اطلاعات</td>
                        </tr>
                </HeaderTemplate>
                <ItemTemplate>
                        <tr class="row">                            
                            <td class="emp_name"><%#Eval("FirstName")%></td>
                            <td class="emp_lname"><%#Eval("LastName")%></td>                            
                            <td class="c_name"><%#Eval("CName") %></td>
                            <td class="c_city"><%#Eval("CCity") %></td>
                            <td class="otherinfo">
                                <asp:HiddenField runat="server" ID="hdf" Value='<%#Eval("EmployerId") %>' />
                                <asp:HyperLink ID="HyperLink1" runat="server" 
                                    NavigateUrl='<%# Eval("EmployerId", "ShowEmployerDescription.aspx?eid={0}") %>'>نمايش ...</asp:HyperLink>
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

