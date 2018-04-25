using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineJobFinding.BLL.Components;
using System.Web.Security;

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        UserBLL user1 = new UserBLL();
        
        //user1.Login();
        string uname = txtUserName.Text;
        string pwd = txtPassword.Text;

        if (user1.GetUserAuthenticate(uname, pwd))
        {
            string ClientIP = Request.UserHostAddress;

            Session["User"] = user1.Login(uname, ClientIP);

            ((UserBLL)Session["User"]).ULoginName = uname;
            //((UserBLL)Session["User"]).UserId = 1;

            if (((UserBLL)Session["User"]).URole == "Admin")
                Response.Redirect("administrator/admindefault.aspx");
            else if (((UserBLL)Session["User"]).URole == "Applicant")
                Response.Redirect("applicant/applicantdefault.aspx");
            else if (((UserBLL)Session["User"]).URole == "Employer")
                Response.Redirect("employer/employerdefault.aspx");
        }
        else
        {
            lblLoginError.Visible = true;
        }
    }
}