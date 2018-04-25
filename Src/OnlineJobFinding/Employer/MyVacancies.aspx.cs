using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineJobFinding.BLL.Components;

public partial class Employer_MyVacancies : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        EmployerBLL employer=new EmployerBLL();
        int employerId = ((UserBLL)Session["User"]).UId;
        GridView1.DataSource = employer.GetMyJobs(employerId);
        GridView1.DataBind();
    }
}