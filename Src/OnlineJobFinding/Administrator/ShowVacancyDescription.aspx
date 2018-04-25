<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/administratorMPage.master" AutoEventWireup="true" CodeFile="ShowVacancyDescription.aspx.cs" Inherits="Administrator_ShowVacancyDescription" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
<p id="subject">جزئيات فرصت شغلي</p>    
    <asp:Label runat="server" ID="Label2" Text="كد فرصت شغلي: "></asp:Label>
    <asp:Label ID="lblJobId" runat="server"></asp:Label><br />

    <asp:Label ID="Label4" runat="server" Text="گروه: "></asp:Label>
    <asp:Label ID="lblJobCategory" runat="server" ></asp:Label><br />

    <asp:Label ID="Label5" runat="server" Text="شهر: "></asp:Label>
    <asp:Label ID="lblJobCity" runat="server" ></asp:Label><br />

    <asp:Label ID="Label6" runat="server" Text="تاريخ ارسال: "></asp:Label>
    <asp:Label ID="lblJobDatePosted" runat="server"></asp:Label><br />

    <asp:Label ID="Label7" runat="server" Text="تاريخ انقضا: "></asp:Label>
    <asp:Label ID="lblJobDateClosing" runat="server"></asp:Label><br />

    <asp:Label ID="Label8" runat="server" Text="توضيحات: "></asp:Label>
    <asp:Label ID="lblJobDescription" runat="server" ></asp:Label><br />

    <asp:Label ID="Label9" runat="server" Text="احتياجات: "></asp:Label>
    <asp:Label ID="lblJobRequirements" runat="server" Text=""></asp:Label><br />

    <asp:Label ID="Label10" runat="server" Text="حقوق: "></asp:Label>
    <asp:Label ID="lblJobSalary" runat="server"></asp:Label><br />

    <asp:Label runat="server" ID="Label1" Text="عنوان فرصت شغلي: "></asp:Label>
    <asp:Label runat="server" ID="lblJobTitle"></asp:Label><br />

    <asp:Label ID="Label11" runat="server" Text="Label">نوع كار:</asp:Label>
    <asp:Label ID="lblJobType" runat="server" ></asp:Label><br />

    <asp:Button runat="server" ID="btnDeleteVacancy" Text="حذف"
        onclick="btnDeleteVacancy_Click" />
</asp:Content>

