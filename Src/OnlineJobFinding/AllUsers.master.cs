using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineJobFinding.BLL.Components;

public partial class AllUsers : System.Web.UI.MasterPage
{
    public string MarqueeLinks;
    

    protected void Page_Load(object sender, EventArgs e)
    {
        lblTodayDate.Text = Persia.Calendar.ConvertToPersian(DateTime.Now).Persian;
        GetSitestatistics();        
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
