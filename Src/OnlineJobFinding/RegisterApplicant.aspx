<%@ Page Title="" Language="C#" MasterPageFile="~/AllUsers.master" AutoEventWireup="true" CodeFile="RegisterApplicant.aspx.cs" Inherits="RegisterApplicant" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" Runat="Server">
    <title>ثبت نام كارجو</title>
    <link  href="css/form.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" Runat="Server">
    <p id="subject">ثبت نام كارجو</p>

    <p class="subjectlevel2">مشخصات كاربري</p>
    <div class="filed">
        <asp:Label CssClass="label" runat="server" ID="Label1">نام كاربري:</asp:Label>        
        <div class="boxRound">
            <asp:TextBox runat="server" ID="txtUserLoginName" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvtxtUserLoginName" runat="server" ErrorMessage="*" ControlToValidate="txtUserLoginName" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>

    <div class="field">
        <asp:Label CssClass="label" runat="server" ID="Label2">كلمه عبور:</asp:Label>        
        <div class="boxRound">
            <asp:TextBox runat="server" ID="txtUserPassword" CssClass="textEntry" 
                TextMode="Password"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvUserPassword" runat="server" ErrorMessage="*" ControlToValidate="txtUserPassword" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
    
    <div class="field">
        <asp:Label CssClass="label" ID="Label3" runat="server" Text="ايميل:"></asp:Label>         
        <div class="boxRound">
            <asp:TextBox runat="server" ID="txtUserEmail" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvUserEmail" runat="server" ErrorMessage="*" ControlToValidate="txtUserEmail" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revUserEmail" runat="server" 
            ErrorMessage="ايميل را به صورت صحيح وارد كنيد." 
            ControlToValidate="txtUserEmail" ForeColor="Red" 
            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
    </div>
    
    
    <p class="subjectlevel2">مشخصات فردي</p>
    <div class="field">
        <asp:Label CssClass="label" ID="Label4" runat="server" Text="نام:"></asp:Label>
        <div class="boxRound">
            <asp:TextBox ID="txtFirstName" runat="server" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvFirstName" runat="server" ErrorMessage="*" ControlToValidate="txtFirstName" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>

    <div class="field">
        <asp:Label CssClass="label" ID="Label5" runat="server" Text="نام خانوادگي:"></asp:Label>
        <div class="boxRound">
            <asp:TextBox ID="txtLastName" runat="server" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvLastName" runat="server" ErrorMessage="*" ControlToValidate="txtLastName" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
    
    <div class="field">
        <asp:Label CssClass="label" ID="Label6" runat="server" Text="نام پدر:"></asp:Label>
        <div class="boxRound">
            <asp:TextBox ID="txtFotherName" runat="server" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvFotherName" runat="server" ErrorMessage="*" ControlToValidate="txtFotherName" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>

    <div class="field">
        <asp:Label CssClass="label" ID="Label7" runat="server" Text="كد ملي:"></asp:Label>
        <div class="boxRound">
            <asp:TextBox ID="txtNationalCode" runat="server" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvNationalCode" runat="server" ErrorMessage="*" ControlToValidate="txtNationalCode" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="revNationalCode" runat="server" 
            ErrorMessage="كد ملي را به صورت صحيح وارد كنيد (مثل 1234567891)" 
            ForeColor="Red" ValidationExpression="\d{10}" ControlToValidate="txtNationalCode"></asp:RegularExpressionValidator>
    </div>              

    <div class="field">
        <asp:Label CssClass="label" ID="Label8" runat="server" Text="شماره شناسنامه:"></asp:Label>
        <div class="boxRound">
            <asp:TextBox ID="txtSHsh" runat="server" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvSHsh" runat="server" ErrorMessage="*" ControlToValidate="txtSHsh" ForeColor="Red"></asp:RequiredFieldValidator>        
    </div>
        
    <div class="field">
        <asp:Label CssClass="label" ID="Label9" runat="server" Text="تاريخ تولد:"></asp:Label>
        <asp:DropDownList ID="ddlPersianYear" runat="server">
        </asp:DropDownList>
        /
        <asp:DropDownList ID="ddlPersianMonth" runat="server">
        </asp:DropDownList>
        /
        <asp:DropDownList ID="ddlPersianDay" runat="server">
        </asp:DropDownList>
    </div>

    <div class="field">
        <asp:Label CssClass="label" ID="Label10" runat="server" Text="صادره از:"></asp:Label>
        <div class="boxRound">
            <asp:TextBox ID="txtBirthLocation" runat="server" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvBirthLocation" runat="server" ErrorMessage="*" ControlToValidate="txtBirthLocation" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
    
    <div class="field">
        <asp:Label CssClass="label" ID="Label11" runat="server" Text="جنسيت:"></asp:Label>
        <asp:DropDownList ID="ddlGender" runat="server">
            <asp:ListItem Value="gender">انتخاب كنيد</asp:ListItem>
            <asp:ListItem Value="مرد">مرد</asp:ListItem>
            <asp:ListItem Value="زن">زن</asp:ListItem>
        </asp:DropDownList>
    </div>
    
    <div class="field">
        <asp:Label CssClass="label" ID="Label12" runat="server" Text="وضعيت تاهل:"></asp:Label>
        <asp:DropDownList ID="ddlMaritalStatus" runat="server">
            <asp:ListItem Value="maritalStatus">انتخاب كنيد</asp:ListItem>
            <asp:ListItem Value="متاهل">متاهل</asp:ListItem>
            <asp:ListItem Value="مجرد">مجرد</asp:ListItem>
        </asp:DropDownList>
    </div>

    <div class="field">
        <asp:Label CssClass="label" ID="lblSarbazi" runat="server" Text="وضعيت سربازي:"></asp:Label>
        <asp:DropDownList ID="ddlSarbazi" runat="server">
            <asp:ListItem Value="">--- انتخاب كنيد ---</asp:ListItem>
            <asp:ListItem Value="">مشمول</asp:ListItem>
            <asp:ListItem Value="">در حال خدمت</asp:ListItem>
            <asp:ListItem Value="">داراي كارت معافيت موقت</asp:ListItem>
            <asp:ListItem Value="">داراي كارت معافيت دائم</asp:ListItem>
            <asp:ListItem Value="">داراي كارت پايان خدمت</asp:ListItem>
        </asp:DropDownList>    
    </div>

    <p class="subjectlevel2">مشخصات محل زندگي</p>
    <div>
        <asp:Label CssClass="label" ID="Label13" runat="server" Text="شهر محل زندگي:"></asp:Label>
        <div class="boxRound">
            <asp:TextBox ID="txtHomeCity" runat="server" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvHomeCity" runat="server" ErrorMessage="*" ControlToValidate="txtHomeCity" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
    
    <div class="field">
        <asp:Label CssClass="label" ID="Label14" runat="server" Text="تلفن منزل:"></asp:Label>        
        <div class="boxRound">                        
            <asp:TextBox ID="txtHomePhone" runat="server" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvHomePhone" runat="server" ErrorMessage="*" ControlToValidate="txtHomePhone" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
    
    <div>
        <asp:Label CssClass="label" ID="Label15" runat="server" Text="موبايل:"></asp:Label>
        <div class="boxRound">
            <asp:TextBox ID="txtMobile" runat="server" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvMobile" runat="server" ErrorMessage="*" ControlToValidate="txtMobile" ForeColor="Red"></asp:RequiredFieldValidator>
        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
            ErrorMessage="موبايل را صحيح وارد كنيد." ForeColor="Red" 
            ValidationExpression="0\d{10}" ControlToValidate="txtMobile"></asp:RegularExpressionValidator>
    </div>
    
    <p class="subjectlevel2">مشخصات شغل فعلي:</p>
    <div class="field">
        <asp:Label CssClass="label" ID="Label16" runat="server" Text="شهر محل كار:"></asp:Label>
        <div class="boxRound">
            <asp:TextBox ID="txtCurrentJobCity" runat="server" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvCurrentJobCity" runat="server" ErrorMessage="*" ControlToValidate="txtCurrentJobCity" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>
    
    <div class="field">
        <asp:Label CssClass="label" ID="Label17" runat="server" Text="اسم شركت / سازمان محل كار:"></asp:Label>
        <div class="boxRound">
            <asp:TextBox ID="txtCurrentJobCompanyName" runat="server" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvCurrentJobCompanyName" runat="server" ErrorMessage="*" ControlToValidate="txtCurrentJobCompanyName" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>

    <div class="field">
        <asp:Label CssClass="label" ID="Label18" runat="server" Text="تلفن محل كار:"></asp:Label>
        <div class="boxRound">
            <asp:TextBox ID="txtCurrentJobPhone" runat="server" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvCurrentJobPhone" runat="server" ErrorMessage="*" ControlToValidate="txtCurrentJobPhone" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>

    <div class="field">
        <asp:Label CssClass="label" ID="Label19" runat="server" Text="نام شغل فعلي:"></asp:Label>
        <div class="boxRound">
            <asp:TextBox ID="txtCurrentJobName" runat="server" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvCurrentJobName" runat="server" ErrorMessage="*" ControlToValidate="txtCurrentJobName" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>

    <p class="subjectlevel2">مشخصات تحصيلي</p>
    <div class="field">
        <asp:Label runat="server" ID="Label200" Text="نام دانشگاه: " CssClass="label"></asp:Label>
        <div class="boxRound">
            <asp:TextBox ID="txtUniversityName" runat="server" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvUniversityName" runat="server" ErrorMessage="*" ControlToValidate="txtUniversityName" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>

    <div class="field">
        <asp:Label runat="server" ID="Label201" Text="شهر محل تحصيل: " CssClass="label"></asp:Label>
        <div class="boxRound">
            <asp:TextBox ID="txtUniversityCity" runat="server" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvUniversityCity" runat="server" ErrorMessage="*" ControlToValidate="txtUniversityCity" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>

    <div class="field">
        <asp:Label runat="server" ID="Label202" Text="مدرك: " CssClass="label"></asp:Label>        
        <asp:DropDownList ID="ddlDegree" runat="server">
            <asp:ListItem>--- انتخاب كنيد ---</asp:ListItem>
            <asp:ListItem>بي سواد</asp:ListItem>
            <asp:ListItem>ابتدايي</asp:ListItem>
            <asp:ListItem>پنجم دبستان</asp:ListItem>
            <asp:ListItem>سيكل</asp:ListItem>
            <asp:ListItem>ديپلم</asp:ListItem>
            <asp:ListItem>فوق ديپلم</asp:ListItem>
            <asp:ListItem>ليسانس</asp:ListItem>
            <asp:ListItem>فوق ليسانس</asp:ListItem>
            <asp:ListItem>دكترا</asp:ListItem>
        </asp:DropDownList>        
    </div>

    <div class="field">
        <asp:Label runat="server" ID="Label20" Text="رشته تحصيلي: " CssClass="label"></asp:Label>
        <div class="boxRound">
            <asp:TextBox ID="txtMajor" runat="server" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvMajor" runat="server" ErrorMessage="*" ControlToValidate="txtMajor" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>

    <div class="field">
        <asp:Label runat="server" ID="Label21" Text="سال فارغ التحصيلي: " CssClass="label"></asp:Label>
        <div class="boxRound">
            <asp:TextBox ID="txtYearOfGraduation" runat="server" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvYearOfGraduation" runat="server" ErrorMessage="*" ControlToValidate="txtYearOfGraduation" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>

    <div class="field">
        <asp:Label runat="server" ID="Label22" Text="معدل: " CssClass="label"></asp:Label>
        <div class="boxRound">
            <asp:TextBox ID="txtAverage" runat="server" CssClass="textEntry"></asp:TextBox>
        </div>
        <asp:RequiredFieldValidator ID="rfvAverage" runat="server" ErrorMessage="*" ControlToValidate="txtAverage" ForeColor="Red"></asp:RequiredFieldValidator>
    </div>

    <div class="field">
        لطفا هر چيزي كه در تصوير مقابل مي بينيد در كادر زير وارد كنيد:  
        <asp:Image ID="imgCaptcha" runat="server" />       
        <br />
        <div class="boxRound">
            <asp:TextBox ID="txtCaptcha" runat="server" CssClass="textEntry" ></asp:TextBox>
        </div>        
    </div>    

    <asp:Label CssClass="label" ID="lblMessage" runat="server" Text="متن داخل تصوير و عبارت وارد شده توسط شما مطابقت ندارند." 
        Visible="false" ForeColor="#ff0000"></asp:Label>

    <div class="submitButton">
        <asp:Button runat="server" ID="btnRegisterApplicant" Text="ثبت نام" 
            onclick="btnRegisterApplicant_Click" />
    </div>

</asp:Content>

