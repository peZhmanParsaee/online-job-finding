using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineJobFinding.BLL.Components;

public partial class Employer_ShowApplicantCV : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        EmployerBLL employer = new EmployerBLL();
        ApplicantBLL applicant = new ApplicantBLL();

        int candidateId = Convert.ToInt32(Request.QueryString["aid"]);

        applicant = employer.GetApplicantCV(candidateId);

        lblFName.Text = applicant.FirstName;
        lblLName.Text = applicant.LastName;
        lblFotherName.Text = applicant.FotherName;
        lblNationalCode.Text = applicant.NationalCode;
        lblSHsh.Text = applicant.Shsh;
        lblBirthDate.Text = Persia.Calendar.ConvertToPersian(applicant.BirthDate.Date).Persian;
        lblBirthLocation.Text = applicant.BirthLocation;
        lblGender.Text = applicant.Gender.ToString();
        lblMaritalStatus.Text = applicant.MaritalStatus.ToString();

        lblHCity.Text = applicant.HCity;
        lblHPHone.Text = applicant.HPhone;
        lblMobile.Text = applicant.Mobile;
        lblCandidateEmail.Text = applicant.UEmail;

        lblLJCity.Text = applicant.LastJobCity;
        lblLJLocation.Text = applicant.LastJobCompanyName;
        lblLJPhone.Text = applicant.LastJobPhone;
        lblLJTitle.Text = applicant.LastJobTitle;

        lblUniCity.Text = applicant.UniversityCity;
        lblUniversity.Text = applicant.UniversityCity;
        lblDegree.Text = applicant.Degree;
        lblAverage.Text = Convert.ToString(applicant.Average);
        lblMajor.Text = applicant.Major;
        lblYOG.Text = applicant.YearOfGraduation.ToString();
    }


    protected void SelectJobForDavat_Click(object sender, EventArgs e)
    {
        string str = "SelectJobForDavat.aspx";
        Session["applicant_id_for_davatnameh"] += Convert.ToString(Request.QueryString["aid"]);
        Response.Redirect(str + "?aid=" + Request.QueryString["aid"]);
    }
}