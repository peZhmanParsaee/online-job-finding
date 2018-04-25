<%@ Page Title="" Language="C#" MasterPageFile="~/Applicant/applicantMPage.master" AutoEventWireup="true" CodeFile="ShowVacancyDescription.aspx.cs" Inherits="Applicant_JobDescription" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
    <p id="subject">جزئيات فرصت شغلي</p>
    
    كد فرصت شغلي:
    <b>
    <asp:Label ID="lblJobId" runat="server"></asp:Label>
    </b><br />

    عنوان فرصت شغلي:
    <b>
    <asp:Label runat="server" ID="lblJobTitle"></asp:Label>
    </b><br />

    گروه:
    <b>
    <asp:Label ID="lblJobCategory" runat="server" ></asp:Label>
    </b><br />

    شهر:
    <b>
    <asp:Label ID="lblJobCity" runat="server" ></asp:Label>
    </b>
    <br />

    تاريخ ارسال:
    <b>
    <asp:Label ID="lblJobDatePosted" runat="server"></asp:Label>
    </b><br />

    تاريخ انقضاء:
    <b>
    <asp:Label ID="lblJobDateClosing" runat="server"></asp:Label>
    </b><br />

    توضيحات:
    <b>
    <asp:Label ID="lblJobDescription" runat="server" ></asp:Label>
    </b><br />

    احتياجات:
    <b>
    <asp:Label ID="lblJobRequirements" runat="server" Text=""></asp:Label>
    </b><br />

    حقوق:
    <b>
    <asp:Label ID="lblJobSalary" runat="server"></asp:Label>
    </b><br />
    
    نوع كار:
    <b>
    <asp:Label ID="lblJobType" runat="server" ></asp:Label>
    </b><br />

    <asp:Button ID="btnFavoriteJob" runat="server" Text="ابراز علاقه" 
        onclick="btnFavoriteJob_Click" />
</asp:Content>