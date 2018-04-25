<%@ Page Title="" Language="C#" MasterPageFile="~/Applicant/applicantMPage.master" AutoEventWireup="true" CodeFile="DavatDescription.aspx.cs" Inherits="Applicant_DavatDescription" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" Runat="Server">
    
</asp:Content>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
    <p id="subject">جزئيات دعوت به فرصت شغلي</p>
    شما دعوت شده ايد تا به يك شغل ابراز علاقه كنيد.


    <p class="subjectlevel2">مشخصات دعوت كننده</p>
    از طرف: <b><asp:Label runat="server" ID="lblCName"></asp:Label></b><br />
    نام كارفرما: <b><asp:Label runat="server" ID="lblEmployerFName"></asp:Label></b><br />
    نام خانوادگي كارفرما: <b><asp:Label runat="server" ID="lblEmployerLName"></asp:Label></b><br />
    متن دعوت نامه: <asp:Label runat="server" ID="lblMessageBody"></asp:Label><br />

    
    <p class="subjectlevel2">مشخصات شغل</p>    
    <asp:Label runat="server" ID="Label2" Text="كد فرصت شغلي: "></asp:Label>
    <b><asp:Label ID="lblJobId" runat="server"></asp:Label></b>
    <br />

    <asp:Label ID="Label4" runat="server" Text="گروه: "></asp:Label>
    <b><asp:Label ID="lblJobCategory" runat="server" ></asp:Label></b>
    <br />

    <asp:Label ID="Label5" runat="server" Text="شهر: "></asp:Label>
    <b><asp:Label ID="lblJobCity" runat="server" ></asp:Label></b>
    <br />

    <asp:Label ID="Label6" runat="server" Text="تاريخ ارسال: "></asp:Label>
    <b><asp:Label ID="lblJobDatePosted" runat="server"></asp:Label></b>
    <br />

    <asp:Label ID="Label7" runat="server" Text="تاريخ انقضا: "></asp:Label>
    <b><asp:Label ID="lblJobDateClosing" runat="server"></asp:Label></b>
    <br />

    <asp:Label ID="Label8" runat="server" Text="توضيحات: "></asp:Label>
    <b><asp:Label ID="lblJobDescription" runat="server" ></asp:Label></b>
    <br />

    <asp:Label ID="Label9" runat="server" Text="احتياجات: "></asp:Label>
    <b><asp:Label ID="lblJobRequirements" runat="server" Text=""></asp:Label></b>
    <br />

    <asp:Label ID="Label10" runat="server" Text="حقوق: "></asp:Label>
    <b><asp:Label ID="lblJobSalary" runat="server"></asp:Label></b>
    <br />

    <asp:Label runat="server" ID="Label1" Text="عنوان فرصت شغلي: "></asp:Label>
    <b><asp:Label runat="server" ID="lblJobTitle"></asp:Label></b>
    <br />

    <asp:Label ID="Label11" runat="server" Text="Label">نوع كار:</asp:Label>
    <b><asp:Label ID="lblJobType" runat="server" ></asp:Label></b>
    <br />

    <div class="submitButton">
        <asp:Button runat="server" ID="btnAcceptDavat" Text="پذيرش دعوت" 
            onclick="btnAcceptDavat_Click" />
    </div>
</asp:Content>

