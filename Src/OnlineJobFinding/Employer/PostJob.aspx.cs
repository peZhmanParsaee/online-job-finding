using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineJobFinding.BLL.Components;

public partial class Employer_PostJob : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            BindDateDropDownLists();
        txtDatePosted.Text = Persia.Calendar.ConvertToPersian(DateTime.Now).Persian;
    }

    void BindDateDropDownLists()
    {
        int minAge = 18;
        int maxAge = 50;

        int nowYear = Convert.ToInt32(DateTime.Now.Year);

        ddlPersianYear.Items.Add(new ListItem("سال", "year", true));
        for (int i = nowYear; i <= nowYear + 1; i++)
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
    protected void btnPostJob_Click(object sender, EventArgs e)
    {
        EmployerBLL employer = new EmployerBLL();
        JobBLL newJob = new JobBLL();

        newJob.Category = ddlCategory.SelectedValue;
        newJob.City = txtCity.Text;

        int Year = Convert.ToInt32(ddlPersianYear.SelectedValue);
        int Month = Convert.ToInt32(ddlPersianMonth.SelectedValue);
        int Day = Convert.ToInt32(ddlPersianDay.SelectedValue);

        DateTime DateClosing = ConvertToGregorian(Year, Month, Day);

        newJob.DateClosing = DateClosing;
        newJob.DatePosted = DateTime.Now.Date;
        newJob.Description = txtDescription.Text;
        newJob.EmployerId = ((UserBLL)Session["User"]).UId;
        newJob.Requirements = txtRequirements.Text;
        newJob.Salary = Convert.ToDecimal(txtSalary.Text);
        newJob.Title = txtTitle.Text;
        newJob.Type = ddlJobType.SelectedValue;

        employer.PostJob(newJob);
    }

    DateTime ConvertToGregorian(int faYear, int faMonth, int FaDay)
    {
        return Persia.Calendar.ConvertToGregorian(faYear, faMonth, FaDay);
    }
}