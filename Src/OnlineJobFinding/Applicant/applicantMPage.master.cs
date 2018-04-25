using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineJobFinding.BLL.Components;

public partial class Applicant_applicantMaster : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["User"] != null)
        {
            if (((UserBLL)Session["User"]).URole == "Applicant")
            {
                lblUEmail.Text = ((UserBLL)Session["User"]).UEmail;
                lblULLD.Text = Persia.Calendar.ConvertToPersian(((UserBLL)Session["User"]).ULastLoginTime).Persian +
                    ((UserBLL)Session["User"]).ULastLoginTime.TimeOfDay;
                lblULLIP.Text = ((UserBLL)Session["User"]).ULastLoginIp;
                lblULName.Text = ((UserBLL)Session["User"]).ULoginName;
                lblURDT.Text = Persia.Calendar.ConvertToPersian(((UserBLL)Session["User"]).URegisterTime).Persian +
                    ((UserBLL)Session["User"]).URegisterTime.TimeOfDay;
                GetSitestatistics();
            }
            else
                Response.Redirect("../PermissionError.aspx");
        }
        else
            Response.Redirect("../PermissionError.aspx");
    }

    public string GetMarqueeLinks()
    {
        UserBLL admin = new UserBLL();

        List<Anchor> anchors = admin.GetAllAnchorsForMarquee();

        string Marquee = "<marquee  onmouseover=\"this.stop()\" onmouseout=\"this.start()\" direction=\"up\" scrolldelay=\"1\" scrollamount=\"1\" style=\"Width:100%;Height:100px;padding:3px;position: relative;\">";

        foreach (Anchor a in anchors)
        {
            Marquee += string.Format("<p align=\"center\"><a href=\"{0}\" target=\"_blank\"  >{1}</a></p>", a.Address, a.Name);
        }

        Marquee += "</marquee>";

        return Marquee;
    }

    public void GetSitestatistics()
    {
        UserBLL user = new UserBLL();
        int numOFApplicants;
        int numOFEmployers;
        user.GetSiteStatistics(out numOFApplicants, out numOFEmployers);
        lblNumOfApplicants.Text = numOFApplicants.ToString();
        lblNumOfEmployers.Text = numOFEmployers.ToString();
    }
}
