using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineJobFinding.BLL.Components;

public partial class Employer_SendDavatNameh : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnSendDavat_Click(object sender, EventArgs e)
    {
        EmployerBLL employer = new EmployerBLL();

        int employerId = ((UserBLL)Session["User"]).UId;
        int applicantId = Convert.ToInt32(Request.QueryString["aid"]);
        int jobId = Convert.ToInt32(Request.QueryString["jid"]);

        employer.SendDavat(employerId, applicantId, jobId, txtBodyMessage.Value);
    }
}