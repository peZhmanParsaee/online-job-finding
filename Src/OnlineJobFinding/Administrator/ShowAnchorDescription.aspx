<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/administratorMPage.master" AutoEventWireup="true" CodeFile="ShowAnchorDescription.aspx.cs" Inherits="Administrator_ShowAnchorDescription" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
    <p id="subject">جزئيات پيوند</p>
    نام: <b><asp:Label ID="lblName" runat="server" Text="Label"></asp:Label></b><br />
    آدرس: <b><asp:Label ID="lblAddress" runat="server" Text="Label"></asp:Label></b><br />
    <asp:Button ID="btnDelete" runat="server" Text="حذف" 
        onclick="btnDelete_Click" />
</asp:Content>

