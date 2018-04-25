<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/administratorMPage.master" AutoEventWireup="true" CodeFile="GetAnchorLinks.aspx.cs" Inherits="Administrator_GetAnchorLinks" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style>
        .anchor_tbl td
        {
            
        }
        .anchor_tbl
        {
            width: 100%;
        }
        .AnchorName
        {
            width: 30%;
            border: 1px solid #000;
            padding: 5px 5px 0 0;
        }
        .AnchorAddress
        {
            text-align: left;
            width: 50%;border: 1px solid #000;padding: 5px 0 0 5px;
        }
        .AnchorDescription
        {border: 1px solid #000;
            width: 20%;padding: 5px 5px 0 0;
        }
        .anchor_tbl .anchor_header td
        {
            text-align : center;
            background: #999;
            color: #fff;
        }
        .row {background: rgb(255,255,255);}
        .row:hover td {background: rgb(221, 249, 93); cursor: pointer;}        
    </style>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
    <p id="subject">كليه پيوندها</p>

    <asp:GridView ID="GridView1" runat="server" GridLines="None" AutoGenerateColumns="false"
    ShowFooter="true" CssClass="anchor_tbl">        
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    <table class="anchor_tbl">
                        <tr class="anchor_header">
                            <td></td>
                            <td class="AnchorName">نام</td>
                            <td class="AnchorAddress">آدرس</td>
                            <td class="AnchorDescription">مشاهده جزئيات ...</td>
                        </tr>                    
                </HeaderTemplate>
                <ItemTemplate>
                        <tr class="row">
                            <td>
                                <asp:HiddenField runat="server" ID="hdfAnchorId" Value='<%#Eval("AnchorId") %>' />
                            </td>
                            <td class="AnchorName"><%#Eval("Name") %></td>
                            <td class="AnchorAddress"><%#Eval("Address") %></td>
                            <td class="AnchorDescription"><asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("AnchorId", "ShowAnchorDescription.aspx?aid={0}") %>'>ديدن جزئيات</asp:HyperLink></td>
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

