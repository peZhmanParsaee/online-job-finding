﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineJobFinding.BLL.Components;

public partial class Administrator_ShowVacancyDescription : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UserBLL user = new UserBLL();
        JobBLL job = new JobBLL();

        int jobid = Convert.ToInt32(Request.QueryString["vid"]);

        job = user.GetJobByID(jobid);

        lblJobCategory.Text = job.Category;
        lblJobCity.Text = job.City;
        lblJobDateClosing.Text = job.DateClosing.ToString();
        lblJobDatePosted.Text = job.DatePosted.ToString();
        lblJobDescription.Text = job.Description;
        lblJobId.Text = job.JobId.ToString();
        lblJobRequirements.Text = job.Requirements;
        lblJobSalary.Text = job.Salary.ToString();
        lblJobTitle.Text = job.Title;
        lblJobType.Text = job.Type;
    }

    protected void btnDeleteVacancy_Click(object sender, EventArgs e)
    {
        AdministratorBLL admin = new AdministratorBLL();
        int vacancyId= Convert.ToInt32(Request.QueryString["vid"]);
        admin.DeleteVacancyById(vacancyId);
        Response.Redirect("GetVacancies.aspx");
    }
}