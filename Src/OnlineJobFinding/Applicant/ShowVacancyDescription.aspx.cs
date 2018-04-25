using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineJobFinding.BLL.Components;

public partial class Applicant_JobDescription : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UserBLL user = new UserBLL();
        JobBLL job = new JobBLL();

        int jobid = Convert.ToInt32(Request.QueryString["vid"]);

        job = user.GetJobByID(jobid);

        lblJobCategory.Text = job.Category;
        lblJobCity.Text = job.City;
        lblJobDateClosing.Text = Persia.Calendar.ConvertToPersian(job.DateClosing).Persian;
        lblJobDatePosted.Text = Persia.Calendar.ConvertToPersian(job.DatePosted).Persian;
        lblJobDescription.Text =  job.Description;
        lblJobId.Text = job.JobId.ToString();
        lblJobRequirements.Text = job.Requirements;
        lblJobSalary.Text = job.Salary.ToString();
        lblJobTitle.Text = job.Title;
        lblJobType.Text = job.Type;
    }

    protected void btnFavoriteJob_Click(object sender, EventArgs e)
    {
        ApplicantBLL applicant = new ApplicantBLL();        
        int applicantId = ((UserBLL)Session["User"]).UId;
        int jobId = Convert.ToInt32(Request.QueryString["vid"]);

        applicant.FavoriteJob(applicantId, jobId);
    }
}