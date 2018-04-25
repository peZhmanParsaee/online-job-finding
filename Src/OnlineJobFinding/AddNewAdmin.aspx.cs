using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineJobFinding.BLL.Components;

public partial class Register : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnRegister_Click(object sender, EventArgs e)
    {
        AdministratorBLL newAdmin = new AdministratorBLL();

        newAdmin.AdministratorFirstName = txtFirstName.Text;
        newAdmin.AdministratorLastName = txtLastName.Text;
        newAdmin.ULoginName = txtLoginName.Text;
        newAdmin.UPassword = txtPassword.Text;

        newAdmin.URegisterTime = DateTime.Now;
        newAdmin.URole = "Admin";
        newAdmin.UEmail = txtEmail.Text;        

        newAdmin.AdministratorId = 1;

        newAdmin.Register();
    }
}