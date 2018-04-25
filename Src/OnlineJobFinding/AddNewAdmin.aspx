<%@ Page Title="" Language="C#" MasterPageFile="~/AllUsers.master" AutoEventWireup="true" CodeFile="AddNewAdmin.aspx.cs" Inherits="Register" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" Runat="Server">
    اضافه كردن يك مدير جديد
    <link  href="css/form.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">

    <p id="subject">اضافه كردن مدير</p>
    <table>
        <tr>
            <td>
                نام:
            </td>
            <td>
                <div class="boxRound">
                    <asp:TextBox ID="txtFirstName" runat="server" CssClass="textEntry"></asp:TextBox>
                </div>
            </td>
            <td></td>
        </tr>

        <tr>
            <td>
                نام خانوادگي:
            </td>
            <td>
                <div class="boxRound">
                    <asp:TextBox ID="txtLastName" runat="server" CssClass="textEntry"></asp:TextBox>
                </div>
            </td>
            <td></td>
        </tr>

        <tr>
            <td>
                نام كاربري:
            </td>
            <td>
                <div class="boxRound">
                    <asp:TextBox ID="txtLoginName" runat="server" CssClass="textEntry"></asp:TextBox>
                </div>
            </td>
            <td></td>
        </tr>

        <tr>
            <td>
                
                كلمه عبور:</td>
            <td>
                <div class="boxRound">
                    <asp:TextBox ID="txtPassword" runat="server" CssClass="textEntry" TextMode="Password"></asp:TextBox>
                </div>
            </td>
            <td></td>
        </tr>

        <tr>
            <td>
                
                ايميل:</td>
            <td>
                <div class="boxRound">
                    <asp:TextBox ID="txtEmail" runat="server" CssClass="textEntry"></asp:TextBox>
                </div>
            </td>
            <td></td>
        </tr>


        </table>

        <div class="submitButton">
            <asp:Button ID="btnRegister" runat="server" Text="ثبت نام" 
                onclick="btnRegister_Click" />
        </div>
</asp:Content>

