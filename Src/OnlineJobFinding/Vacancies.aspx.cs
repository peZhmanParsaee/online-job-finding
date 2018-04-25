using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineJobFinding.BLL.Components;

public partial class Vacancies : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UserBLL user = new UserBLL();
        GridView1.DataSource = user.GetAllJobs();
        GridView1.DataBind();
    }
}