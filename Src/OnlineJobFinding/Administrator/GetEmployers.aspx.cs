﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineJobFinding.BLL.Components;

public partial class Administrator_GetEmployers : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        AdministratorBLL admin = new AdministratorBLL();
        GridView1.DataSource = admin.GetAllEmployers();
        GridView1.DataBind();
    }
}