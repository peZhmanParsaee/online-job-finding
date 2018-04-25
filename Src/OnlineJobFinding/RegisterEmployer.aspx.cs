using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineJobFinding.BLL.Components;
using OnlineJobFinding.Tools.Tools;

public partial class RegisterEmployer : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            CaptchaTools captcha = new CaptchaTools();
            string salt = captcha.CreateImage(Server.MapPath(@"~\Temp\random.gif"), 40, 90);
            imgCaptcha.ImageUrl = @"~\Temp\random.gif";
            Session.Add("salt", salt);
        }
    }

    protected void btnRegisterEmployer_Click(object sender, EventArgs e)
    {
        if ((string)Session["salt"] == txtCaptcha.Text)
        {
            EmployerBLL newEmployer = new EmployerBLL();

            newEmployer.UEmail = txtUserEmail.Text;
            newEmployer.ULoginName = txtUserLoginName.Text;
            newEmployer.UPassword = txtUserPassword.Text;
            newEmployer.URegisterTime = DateTime.Now;
            newEmployer.URole = "Employer";

            newEmployer.EmployerFirstName = txtEmployerFirstName.Text;
            newEmployer.EmployerGender = ddlEmployerGender.SelectedValue;
            newEmployer.EmployerJobTitle = txtEmployerJobTitle.Text;
            newEmployer.EmployerLastName = txtEmployerLastName.Text;
            newEmployer.EmployerMobile = txtEmployerMobile.Text;
            newEmployer.EmployerNationalCode = txtEmployerNationalCode.Text;
            newEmployer.EmployerSHsh = txtEmployerSHsh.Text;

            newEmployer.OrganizationAddress = txtOrganizationAddress.Text;
            newEmployer.OrganizationCity = txtOrganizationCity.Text;
            newEmployer.OrganizationFax = txtOrganizationFax.Text;
            newEmployer.OrganizationName = txtOrganizationName.Text;
            newEmployer.OrganizationPostalCode = txtOrganizationPostalCode.Text;
            newEmployer.OrganizationTelephone = txtOrganizationTelephone.Text;

            newEmployer.Register();
        }
        else
        {
            lblMessage.Text = "كد وارد شده با مقدار درون تصوير مطابقت ندارد";
            lblMessage.Visible = true;
        }
    }
}