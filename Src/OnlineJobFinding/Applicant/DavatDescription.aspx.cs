using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineJobFinding.BLL.Components;

public partial class Applicant_DavatDescription : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ApplicantBLL applicant = new ApplicantBLL();
        
        int davatId = Convert.ToInt32(Request.QueryString["did"]);

        DavatNamehBLL davat = new DavatNamehBLL();
        davat = applicant.GetDavatDescription(davatId);

        
        // Employer Info
        lblCName.Text = davat.CName;
        lblMessageBody.Text = davat.MessageBody;
        lblEmployerFName.Text = davat.EmployerFName;
        lblEmployerLName.Text = davat.EmployerLName;

        // Job Info
        lblJobCategory.Text = davat.Category;
        lblJobCity.Text = davat.City;
        lblJobDateClosing.Text = Persia.Calendar.ConvertToPersian(davat.DateClosing).Persian;
        lblJobDatePosted.Text = Persia.Calendar.ConvertToPersian(davat.DatePosted).Persian;
        lblJobDescription.Text = davat.Description;
        lblJobId.Text = davat.JobId.ToString();
        lblJobRequirements.Text = davat.Requirements;
        lblJobSalary.Text = davat.Salary.ToString();
        lblJobTitle.Text = davat.Title;
        lblJobType.Text = davat.Type;        
    }

    protected void btnAcceptDavat_Click(object sender, EventArgs e)
    {
        int jobId = Convert.ToInt32(Request.QueryString["jid"]);
        int applicantId = Convert.ToInt32(Request.QueryString["aid"]);
        int davatId = Convert.ToInt32(Request.QueryString["did"]);

        ApplicantBLL applicant = new ApplicantBLL();
        applicant.AcceptDavat(davatId, applicantId, jobId);

        Response.Redirect("DavatsInbox.aspx");
    }
}