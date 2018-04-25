<%@ Page Title="" Language="C#" MasterPageFile="~/Administrator/administratorMPage.master" AutoEventWireup="true" CodeFile="AddNewAnchorLink.aspx.cs" Inherits="Administrator_AddNewAnchorLink" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
    <p id="subject">اضافه كردن يك پيوند خارجي</p>

    <div class="field">
          <asp:Label runat="server" ID="Label1" CssClass="label">نام:</asp:Label>
          <div class="boxRound">
            <asp:TextBox runat="server" ID="txtLinkName" CssClass="textEntry"></asp:TextBox>
          </div>
    </div>

    <div class="field">
        <asp:Label runat='server' ID="Label2" CssClass="label">آدرس:</asp:Label>
        <div class="boxRound">
            <asp:TextBox runat="server" ID="txtLinkAddress" CssClass="textEntry" placeholder="example: http://www.SiteName.com"></asp:TextBox>
        </div>
    </div>

    <div class="submitButton">
        <asp:Button runat="server" ID="btnAddNewAnchorLink" Text="ثبت پيوند" 
            onclick="btnAddNewAnchorLink_Click" />
    </div>

</asp:Content>

