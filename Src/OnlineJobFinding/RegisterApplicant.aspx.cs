using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineJobFinding.BLL.Components;
using OnlineJobFinding.Tools.Tools;

public partial class RegisterApplicant : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
        {
            BindDateDropDownLists();
            CaptchaTools captcha = new CaptchaTools();
            string salt = captcha.CreateImage(Server.MapPath(@"~\Temp\random.gif"), 40, 90);
            imgCaptcha.ImageUrl = @"~\Temp\random.gif";
            Session.Add("salt", salt);
        }
    }

    void BindDateDropDownLists()
    {
        int minAge = 18;
        int maxAge = 50;

        int nowYear = Convert.ToInt32(DateTime.Now.Year);

        ddlPersianYear.Items.Add(new ListItem("سال", "year", true));
        for (int i = (nowYear - maxAge); i < (nowYear - minAge); i++)
        {
            ddlPersianYear.Items.Add(new ListItem(Convert.ToString(i - 621), Convert.ToString(i - 621), true));
        }

        ddlPersianMonth.Items.Add(new ListItem("ماه", "month", true));
        for (int i = 1; i <= 12; i++)
        {
            ddlPersianMonth.Items.Add(new ListItem(i.ToString(), i.ToString(), true));
        }

        ddlPersianDay.Items.Add(new ListItem("روز", "day", true));
        for (int i = 1; i <= 31; i++)
        {
            ddlPersianDay.Items.Add(new ListItem(i.ToString(), i.ToString(), true));
        }
    }

    protected void btnRegisterApplicant_Click(object sender, EventArgs e)
    {
        
        if (Session["salt"].ToString() == txtCaptcha.Text)
        {
            ApplicantBLL newApplicant = new ApplicantBLL();

            newApplicant.UEmail = txtUserEmail.Text;
            newApplicant.ULoginName = txtUserLoginName.Text;
            newApplicant.UPassword = txtUserPassword.Text;
            newApplicant.URegisterTime = DateTime.Now;
            newApplicant.URole = "Applicant";

            newApplicant.BirthDate = ConvertToGeorgian(Convert.ToInt32(ddlPersianYear.SelectedValue), Convert.ToInt32(ddlPersianMonth.SelectedValue), Convert.ToInt32(ddlPersianDay.SelectedValue));
            newApplicant.BirthLocation = txtBirthLocation.Text;
            newApplicant.LastJobCity = txtCurrentJobCity.Text;
            newApplicant.LastJobCompanyName = txtCurrentJobCompanyName.Text;
            newApplicant.LastJobPhone = txtCurrentJobPhone.Text;
            newApplicant.LastJobTitle = txtCurrentJobName.Text;

            newApplicant.FirstName = txtFirstName.Text;
            newApplicant.FotherName = txtFotherName.Text;

            newApplicant.Gender = ddlGender.SelectedValue;
            newApplicant.HCity = txtHomeCity.Text;
            newApplicant.HPhone = txtHomePhone.Text;
            newApplicant.LastName = txtLastName.Text;

            newApplicant.MaritalStatus = ddlMaritalStatus.SelectedValue;
            newApplicant.Mobile = txtMobile.Text;
            newApplicant.NationalCode = txtNationalCode.Text;
            newApplicant.Shsh = txtSHsh.Text;

            newApplicant.UniversityCity = txtUniversityCity.Text;
            newApplicant.UniversityName = txtUniversityName.Text;
            newApplicant.Major = txtMajor.Text;
            newApplicant.YearOfGraduation = txtYearOfGraduation.Text;
            newApplicant.Degree = ddlDegree.SelectedValue;
            newApplicant.Average = Convert.ToDecimal(txtAverage.Text);

            newApplicant.Register();
                        
        }
        else
        {
            lblMessage.Visible = true;
        }
    }

    DateTime ConvertToGeorgian(int faYear, int faMonth, int faDay)
    {
        return Persia.Calendar.ConvertToGregorian(faYear, faMonth, faDay);
    }
}