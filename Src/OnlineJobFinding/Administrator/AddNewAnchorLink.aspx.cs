using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineJobFinding.BLL.Components;

public partial class Administrator_AddNewAnchorLink : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnAddNewAnchorLink_Click(object sender, EventArgs e)
    {
        AdministratorBLL admin = new AdministratorBLL();

        string AnchorName = txtLinkName.Text;
        string AnchorAddress = txtLinkAddress.Text;

        admin.AddNewAnchorLink(AnchorName, AnchorAddress);
    }
}