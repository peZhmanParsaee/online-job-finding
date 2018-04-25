<%@ Page Title="" Language="C#" MasterPageFile="~/Employer/employerMPage.master" AutoEventWireup="true" CodeFile="SendDavatNameh.aspx.cs" Inherits="Employer_SendDavatNameh" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    
    <p id="subject">ارسال دعوت نامه</p>
        <p>
        كارفرماي محترم شما با نوشتن كد شغل خود در كادر زير و توضيحات ديگر مي توانيد از اين كارجو
        دعوت كنيد تا كانديد آن شغل شود. كارجو در صورت تمايل به ليست كانديدهاي شغلي كه شما ارسال
        كرده ايد اضافه مي شود.
        </p>
                
        متن نامه: <textarea runat="server" id="txtBodyMessage" cols="40" rows="10"></textarea><br />

    <div class="SubmitButton">
        <asp:Button runat="server" ID="btnSendDavat" Text="ارسال دعوت نامه" onclick="btnSendDavat_Click" 
             />
    </div>
</asp:Content>

