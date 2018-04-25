using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineJobFinding.BLL.Components;

public partial class Administrator_ShowAnchorDescription : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AdministratorBLL admin = new AdministratorBLL();
        Anchor anchor1 = new Anchor();

        int anchorId = Convert.ToInt32(Request.QueryString["aid"]);

        anchor1 = admin.GetAnchorLinkById(anchorId);

        lblAddress.Text = anchor1.Address;
        lblName.Text = anchor1.Name;
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        int anchorId = Convert.ToInt32(Request.QueryString["aid"]);
        AdministratorBLL admin = new AdministratorBLL();
        admin.DeleteAnchorLinkById(anchorId);
        Response.Redirect("GetAnchorLinks.aspx");
    }
}