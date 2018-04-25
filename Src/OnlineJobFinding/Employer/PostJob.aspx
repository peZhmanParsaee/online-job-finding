<%@ Page Title="" Language="C#" MasterPageFile="~/Employer/employerMPage.master" AutoEventWireup="true" CodeFile="PostJob.aspx.cs" Inherits="Employer_PostJob" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" Runat="Server">
    <title>ارسال فرصت شغلي</title>
    <link href="../css/form.css" type="text/css" rel="Stylesheet" />    
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
    <p id="subject">ارسال فرصت شغلي</p>
    <table>    
        <tr>
            <td>گروه:</td>
            <td>                
                <asp:DropDownList ID="ddlCategory" runat="server">
                    <asp:ListItem Value="category">--- انتخاب كنيد ---</asp:ListItem>
                    <asp:ListItem>برنامه نويس</asp:ListItem>
                    <asp:ListItem>استاد و معلم</asp:ListItem>
                    <asp:ListItem>گرافيست و طراح</asp:ListItem>
                    <asp:ListItem>حمل و نقل</asp:ListItem>
                    <asp:ListItem>بازارياب</asp:ListItem>
                    <asp:ListItem>پزشك</asp:ListItem>
                    <asp:ListItem>پرستار</asp:ListItem>
                    <asp:ListItem>برق و الكترونيك</asp:ListItem>
                    <asp:ListItem>نفت و گاز</asp:ListItem>
                </asp:DropDownList>                
            </td>
            <td></td>
        </tr>

        <tr>
            <td>شهر:</td>
            <td>
                <div class="boxRound">
                    <asp:TextBox ID="txtCity" runat="server" CssClass="textEntry"></asp:TextBox>
                </div>
            </td>
            <td></td>
        </tr>

        <tr>
            <td>تاريخ ارسال:</td>
            <td>
                <div class="boxRound">
                    <asp:TextBox ID="txtDatePosted" runat="server" CssClass="textEntry" Enabled="false"></asp:TextBox>
                </div>
            </td>
            <td></td>
        </tr>

        <tr>
            <td>تاريخ انقضا:</td>
            <td> 
                <asp:DropDownList ID="ddlPersianDay" runat="server">
                </asp:DropDownList>    
                /
                <asp:DropDownList ID="ddlPersianMonth" runat="server">
                </asp:DropDownList>
                /
                <asp:DropDownList ID="ddlPersianYear" runat="server">
                </asp:DropDownList>            
            </td>
            <td></td>
        </tr>

        <tr>
            <td>توضيحات:</td>
            <td>
                <div class="boxRound">
                    <asp:TextBox ID="txtDescription" runat="server" CssClass="textEntry"></asp:TextBox>
                </div>
            </td>
            <td></td>
        </tr>

        <tr>
            <td>احتياجات:</td>
            <td>
                <div class="boxRound">
                    <asp:TextBox ID="txtRequirements" runat="server" CssClass="textEntry"></asp:TextBox>
                </div>
            </td>
            <td></td>
        </tr>

        <tr>
            <td>حقوق:</td>
            <td>
                <div class="boxRound">
                    <asp:TextBox ID="txtSalary" runat="server" CssClass="textEntry"></asp:TextBox>
                </div>
            </td>
            <td></td>
        </tr>

        <tr>
            <td>عنوان:</td>
            <td>
                <div class="boxRound">
                    <asp:TextBox ID="txtTitle" runat="server" CssClass="textEntry"></asp:TextBox>
                </div>
            </td>
            <td></td>
        </tr>

        <tr>
            <td>نوع كار:</td>
            <td>                
                <asp:DropDownList ID="ddlJobType" runat="server">
                    <asp:ListItem>--- انتخاب كنيد ---</asp:ListItem>
                    <asp:ListItem>پاره وقت</asp:ListItem>
                    <asp:ListItem>تمام وقت</asp:ListItem>
                    <asp:ListItem>پروژه اي</asp:ListItem>
                    <asp:ListItem>قراردادي</asp:ListItem>
                </asp:DropDownList>                
            </td>
            <td></td>
        </tr>
    </table>

    <div class="submitButton">
        <asp:Button runat="server" ID="btnPostJob" Text="ارسال فرصت شغلي" 
            onclick="btnPostJob_Click" />
    </div>
</asp:Content>

