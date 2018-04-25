using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineJobFinding.BLL.Components;

public partial class Administrator_admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if ((UserBLL)Session["User"] != null)
        {
            
            if (((UserBLL)Session["User"]).URole == "Admin")
            {
                lblUEmail.Text = ((UserBLL)Session["User"]).UEmail;
                lblULLD.Text = Convert.ToString(((UserBLL)Session["User"]).ULastLoginTime);
                lblULLIP.Text = ((UserBLL)Session["User"]).ULastLoginIp;
                lblULName.Text = ((UserBLL)Session["User"]).ULoginName;
                //lblUPass.Text = ((UserBLL)Session["User"]).UPassword;
                lblURDT.Text = Convert.ToString(((UserBLL)Session["User"]).URegisterTime);
                //lblURole.Text = ((UserBLL)Session["User"]).URole;
                //lblUID.Text = ((UserBLL)Session["User"]).UId.ToString();

                GetSitestatistics();
            }
            else
            {
                Response.Redirect("../PermissionError.aspx");
            }
        }
        else
        {
            Response.Redirect("../PermissionError.aspx");
        }
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
