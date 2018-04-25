<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/administratorMPage.master" AutoEventWireup="true" CodeFile="ShowApplicantCV.aspx.cs" Inherits="Administrator_ShowApplicantDescription" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style>
        .field_value {font-weight: bold;}
    </style>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
    <p id="subject">رزومه كارجو</p>
    
    <p class="subjectlevel2">اطلاعات شخصي</p>
        نام: <asp:Label runat="server" ID="lblFName" CssClass="field_value"></asp:Label><br />
        نام خانوادگي: <asp:Label runat="server" ID="lblLName" CssClass="field_value"></asp:Label><br />
        نام پدر: <asp:Label runat="server" ID="lblFotherName" CssClass="field_value"></asp:Label><br />
        كد ملي: <asp:Label runat="server" ID="lblNationalCode" CssClass="field_value"></asp:Label><br />
        شماره شناسنامه: <asp:Label runat="server" ID="lblSHsh" CssClass="field_value"></asp:Label><br />
        تاريخ تولد: <asp:Label runat="server" ID="lblBirthDate" CssClass="field_value"></asp:Label><br />
        صادره از: <asp:Label runat="server" ID="lblBirthLocation" CssClass="field_value"></asp:Label><br />
        جنسيت: <asp:Label runat="server" ID="lblGender" CssClass="field_value"></asp:Label><br />
        وضعيت تاهل: <asp:Label runat="server" ID="lblMaritalStatus" CssClass="field_value"></asp:Label><br />
    
    <p class="subjectlevel2">مشخصات محل زندگي</p>
        شهر محل زندگي: <asp:Label runat="server" ID="lblHCity" CssClass="field_value"></asp:Label><br />
        تلفن: <asp:Label runat="server" ID="lblHPHone" CssClass="field_value"></asp:Label><br />
        موبايل: <asp:Label runat="server" ID="lblMobile" CssClass="field_value"></asp:Label><br />
        ايميل: <asp:Label runat="server" ID="lblCandidateEmail" CssClass="field_value"></asp:Label><br />
    
    <p class="subjectlevel2">سوابق شغلي</p>
        شهر آخرين شغل: <asp:Label runat="server" ID="lblLJCity" CssClass="field_value"></asp:Label><br />
        آخرين محل كار: <asp:Label runat="server" ID="lblLJLocation" CssClass="field_value"></asp:Label><br />
        تلفن آخرين محل كار: <asp:Label runat="server" ID="lblLJPhone" CssClass="field_value"></asp:Label><br />
        عنوان آخرين شغل: <asp:Label runat="server" ID="lblLJTitle" CssClass="field_value"></asp:Label><br />
    
    <p class="subjectlevel2">سوابق تحصيلي</p>
        مدرك: <asp:Label runat="server" ID="lblDegree" CssClass="field_value"></asp:Label><br />
        رشته تحصيلي: <asp:Label runat="server" ID="lblMajor" CssClass="field_value"></asp:Label><br />
        دانشگاه: <asp:Label runat="server" ID="lblUniversity" CssClass="field_value"></asp:Label><br />
        شهر محل تحصيل: <asp:Label runat="server" ID="lblUniCity" CssClass="field_value"></asp:Label><br />
        معدل: <asp:Label runat="server" ID="lblAverage" CssClass="field_value"></asp:Label><br />
        سال فارغ التحصيلي: <asp:Label runat="server" ID="lblYOG" CssClass="field_value"></asp:Label><br />

    <br />

    <div class="submitButton">
        <asp:Button ID="btnDeleteApplicant" runat="server" Text="حذف" 
            onclick="btnDeleteApplicant_Click" />
    </div>
</asp:Content>

