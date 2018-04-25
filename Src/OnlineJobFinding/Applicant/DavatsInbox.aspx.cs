using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineJobFinding.BLL.Components;

public partial class Applicant_GetDavats : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        ApplicantBLL applicant = new ApplicantBLL();
        int applicantId = ((UserBLL)Session["User"]).UId;
        GridView1.DataSource = applicant.GetDavats(applicantId);
        GridView1.DataBind();
    }
}