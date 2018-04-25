<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/administratorMPage.master" AutoEventWireup="true" CodeFile="ShowEmployerDescription.aspx.cs" Inherits="Administrator_ShowEmployerDescription" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
    <p id="subject">جزئيات كارفرما</p>

    <p class="subjectlevel2">اطلاعات كاربري</p>
    نام كاربري: <b><asp:Label ID="lblUserLoginName" runat="server" CssClass="textEntry"></asp:Label></b><br />
    ايميل: <b><asp:Label ID="lblUserEmail" runat="server" CssClass="textEntry"></asp:Label></b><br />


    <p class="subjectlevel2">اطلاعات شخصي كارفرما</p>
    نام: <b><asp:Label ID="lblEmployerFirstName" runat="server" ></asp:Label></b><br />
    نام خانوادگي: <b><asp:Label ID="lblEmployerLastName" runat="server" ></asp:Label></b><br />
    جنسيت: <b><asp:Label runat="server" ID="lblEmployerGender"></asp:Label></b><br />
    كد ملي: <b><asp:Label ID="lblEmployerNationalCode" runat="server" CssClass="textEntry"></asp:Label></b><br />
    شماره شناسنامه: <b><asp:Label ID="lblEmployerSHsh" runat="server" CssClass="textEntry"></asp:Label></b><br />
    شغل كارفرما: <b><asp:Label ID="lblEmployerJobTitle" runat="server" CssClass="textEntry"></asp:Label></b><br />
    موبايل كارفرما: <b><asp:Label ID="lblEmployerMobile" runat="server" CssClass="textEntry"></asp:Label></b><br />

    <p class="subjectlevel2">اطلاعات سازمان/شركت</p>
    نام سازمان/شركت: <b><asp:Label ID="lblOrganizationName" runat="server" CssClass="textEntry"></asp:Label></b><br />
    آدرس سازمان/شركت: <b><asp:Label ID="lblOrganizationAddress" runat="server" CssClass="textEntry"></asp:Label></b><br />
    كد پستي سازمان/شركت: <b><asp:Label ID="lblOrganizationPostalCode" runat="server" CssClass="textEntry"></asp:Label></b><br />
    تلفن سازمان/شركت: <b><asp:Label ID="lblOrganizationTelephone" runat="server" CssClass="textEntry"></asp:Label></b><br />
    شهر سازمان/شركت: <b><asp:Label ID="lblOrganizationCity" runat="server" CssClass="textEntry"></asp:Label></b><br />
    فكس سازمان/شركت: <b><asp:Label ID="lblOrganizationFax" runat="server" CssClass="textEntry"></asp:Label></b><br />
        
    <asp:Button runat="server" ID="btnDeleteEmployer" Text="حذف" 
        onclick="btnDeleteEmployer_Click" />
   
</asp:Content>

