<%@ Page Title="" Language="C#" MasterPageFile="~/AllUsers.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" Runat="Server">
    <title>ورود كاربران</title>
    <link href="css/login.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="scripts/jQuery/jQuery.js"></script>
    <script src="scripts/validatelogin.js" type="text/javascript"></script>
</asp:Content>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
    <p id="subject">ورود كاربران</p>

    <div class="logininfo">
        <div class="field">
            <asp:Label ID="lblUserName" runat="server" AssociatedControlID="txtUserName">نام كاربري:</asp:Label>
            <div class="boxRound">
                <asp:TextBox runat="server" ID="txtUserName" AutoCompleteType="None" CssClass="textEntry" placeholder="نام كاربري خود را وارد كنيد."></asp:TextBox>
            </div>
        </div>
        <div class="field">
            <asp:Label ID="lblPassword" runat="server" AssociatedControlID="txtPassword">كلمه عبور:</asp:Label>
            <div class="boxRound">
                <asp:TextBox runat="server" ID="txtPassword" CssClass="textEntry" TextMode="Password" placeholder="كلمه عبور خود را وارد كنيد."></asp:TextBox>
            </div>
        </div>
        <div class="field">
            <asp:CheckBox ID="chkRememberMe" runat="server" Text="مرا به ياد داشته باش." />
        </div>
        <div class="submitButton">
            <asp:Button runat='server' ID="btnLogin" Text="ورود" onclick="btnLogin_Click" OnClientClick="return ValidateLogin();" />
        </div>
        <asp:Label ID="lblLoginError" runat="server" Visible="false" 
        Text="نام كاربري يا كلمه عبور نادرست مي باشد." ForeColor="Red"></asp:Label>                
    </div>

    <script type="text/javascript">
        $(document).ready(function () {
            $("input[name$='txtUserName']").focus();
        });
    </script>
</asp:Content>

