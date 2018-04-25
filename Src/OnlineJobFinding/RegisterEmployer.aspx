<%@ Page Title="" Language="C#" MasterPageFile="~/AllUsers.master" AutoEventWireup="true" CodeFile="RegisterEmployer.aspx.cs" Inherits="RegisterEmployer" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" Runat="Server">
    <link href="css/form.css" type="text/css" rel="Stylesheet" />
    <title>ثبت نام كارفرمايان</title>
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
    <p id="subject">ثبت نام كارفرما</p>

    <p class="subjectlevel2">اطلاعات كاربري</p>
    <div class="field">
        <asp:Label ID="Label1" runat="server" Text="نام كاربري:" CssClass="label"></asp:Label>
        <div class="boxRound">
            <asp:TextBox ID="txtUserLoginName" runat="server" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvtxtUserLoginName" runat="server" ErrorMessage="*" ControlToValidate="txtUserLoginName" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>

    <div class="field">
        <asp:Label ID="Label2" runat="server" Text="كلمه عبور:" CssClass="label"></asp:Label>
        <div class="boxRound">
            <asp:TextBox ID="txtUserPassword" runat="server" CssClass="textEntry" TextMode="Password"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvUserPassword" runat="server" ErrorMessage="*" ControlToValidate="txtUserPassword" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>

    <div class="field">
        <asp:Label ID="Label4" runat="server" Text="ايميل:" CssClass="label"></asp:Label>
        <div class="boxRound">
            <asp:TextBox ID="txtUserEmail" runat="server" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvUserEmail" runat="server" ErrorMessage="*" ControlToValidate="txtUserEmail" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revUserEmail" runat="server" 
            ErrorMessage="ايميل را به صورت صحيح وارد كنيد." 
            ControlToValidate="txtUserEmail" ForeColor="Red" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    </div>

    <p class="subjectlevel2">اطلاعات شخصي كارفرما</p>
     <div class="field">
        <asp:Label ID="Label5" runat="server" Text="نام:" CssClass="label"></asp:Label>
        <div class="boxRound">
            <asp:TextBox ID="txtEmployerFirstName" runat="server" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ErrorMessage="*" ControlToValidate="txtEmployerFirstName" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>

    <div class="field">
        <asp:Label ID="Label7" runat="server" Text="نام خانوادگي:" CssClass="label"></asp:Label>
        <div class="boxRound">
            <asp:TextBox ID="txtEmployerLastName" runat="server" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvEmployerLastName" runat="server" ErrorMessage="*" ControlToValidate="txtEmployerLastName" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
    
    <div class="field">
        <asp:Label ID="Label8" runat="server" Text="جنسيت:" CssClass="label"></asp:Label>
        
        <asp:DropDownList ID="ddlEmployerGender" runat="server">
            <asp:ListItem>انتخاب كنيد</asp:ListItem>
            <asp:ListItem>مرد</asp:ListItem>
            <asp:ListItem>زن</asp:ListItem>
        </asp:DropDownList>
        
    </div>

    <div class="field">
        <asp:Label ID="Label10" runat="server" Text="كد ملي:" CssClass="label"></asp:Label>
        <div class="boxRound">
            <asp:TextBox ID="txtEmployerNationalCode" runat="server" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvNationalCode" runat="server" ErrorMessage="*" ControlToValidate="txtEmployerNationalCode" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revNationalCode" runat="server" 
            ErrorMessage="كد ملي را به صورت صحيح وارد كنيد (مثل 1234567891)" 
            ForeColor="Red" ValidationExpression="\d{10}" ControlToValidate="txtEmployerNationalCode"></asp:RegularExpressionValidator>    
    </div>
    
    <div class="field">
        <asp:Label ID="Label15" runat="server" Text="شماره شناسنامه:" CssClass="label"></asp:Label>
        <div class="boxRound">
            <asp:TextBox ID="txtEmployerSHsh" runat="server" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvSHsh" runat="server" ErrorMessage="*" ControlToValidate="txtEmployerSHsh" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>


    <p class="subjectlevel2">اطلاعات سازمان/شركت</p>
    <div class="field">
        <asp:Label ID="Label12" runat="server" Text="نام سازمان/شركت:" CssClass="label"></asp:Label>
        <div class="boxRound">
            <asp:TextBox ID="txtOrganizationName" runat="server" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvOrganizationName" runat="server" ErrorMessage="*" ControlToValidate="txtOrganizationName" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>

    <div class="field">
        <asp:Label ID="Label13" runat="server" Text="آدرس سازمان/شركت:" CssClass="label"></asp:Label>
        <div class="boxRound">
            <asp:TextBox ID="txtOrganizationAddress" runat="server" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvOrganizationAddress" runat="server" ErrorMessage="*" ControlToValidate="txtOrganizationAddress" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>

    <div class="field">
        <asp:Label ID="Label14" runat="server" Text="كد پستي سازمان/شركت:" CssClass="field"></asp:Label>
        <div class="boxRound">
            <asp:TextBox ID="txtOrganizationPostalCode" runat="server" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvOrganizationPostalCode" runat="server" ErrorMessage="*" ControlToValidate="txtOrganizationPostalCode" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>    

    <div class="field">
        <asp:Label ID="Label16" runat="server" Text="تلفن سازمان/شركت:" CssClass="label"></asp:Label>
        <div class="boxRound">
            <asp:TextBox ID="txtOrganizationTelephone" runat="server" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvOrganizationTelephone" runat="server" ErrorMessage="*" ControlToValidate="txtOrganizationTelephone" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>

    <div>
        <asp:Label ID="Label17" runat="server" Text="شهر سازمان/شركت:" CssClass="label"></asp:Label>
        <div class="boxRound">
            <asp:TextBox ID="txtOrganizationCity" runat="server" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvOrganizationCity" runat="server" ErrorMessage="*" ControlToValidate="txtOrganizationCity" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>

    <div class="field">
         <asp:Label ID="Label6" runat="server" Text="شغل:" CssClass="label"></asp:Label>
        <div class="boxRound">
            <asp:TextBox ID="txtEmployerJobTitle" runat="server" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvEmployerJobTitle" runat="server" ErrorMessage="*" ControlToValidate="txtEmployerJobTitle" ForeColor="Red"></asp:RequiredFieldValidator>
     </div>
        
    <div class="field">
        <asp:Label ID="Label9" runat="server" Text="موبايل:" CssClass="label"></asp:Label>
        <div class="boxRound">
            <asp:TextBox ID="txtEmployerMobile" runat="server" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ErrorMessage="*" ControlToValidate="txtEmployerMobile" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revEmployerMobile" runat="server" 
            ErrorMessage="موبايل را صحيح وارد كنيد." ForeColor="Red" 
            ValidationExpression="0\d{10}" ControlToValidate="txtEmployerMobile"></asp:RegularExpressionValidator>
    </div>    
        
    <div class="field"> 
        <asp:Label ID="Label11" runat="server" Text="فكس:" CssClass="label"></asp:Label>
        <div class="boxRound">
            <asp:TextBox ID="txtOrganizationFax" runat="server" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvOrganizationFax" runat="server" ErrorMessage="*" ControlToValidate="txtOrganizationFax" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>

    لطفا هر چيزي كه در تصوير مقابل مي بينيد در كادر زير وارد كنيد:  
    <asp:Image ID="imgCaptcha" runat="server" />       
    <br />

    <div class="boxRound">
        <asp:TextBox ID="txtCaptcha" runat="server" CssClass="textEntry" ></asp:TextBox>
    </div>

    <asp:Label runat="server" ID="lblMessage" Text="" Visible="false" ForeColor="Red"></asp:Label>

    <div class="submitButton">
        <asp:Button ID="btnRegisterEmployer" runat="server" Text="ثبت نام" 
            onclick="btnRegisterEmployer_Click" />
    </div>
</asp:Content>

