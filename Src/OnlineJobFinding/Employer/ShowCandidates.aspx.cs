using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineJobFinding.BLL.Components;

public partial class Employer_ShowCandidates : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        EmployerBLL employer = new EmployerBLL();

        int EmployerId = ((UserBLL)Session["User"]).UId;

        GridView1.DataSource = employer.GetCandidates(EmployerId);
        GridView1.DataBind();
    }
}