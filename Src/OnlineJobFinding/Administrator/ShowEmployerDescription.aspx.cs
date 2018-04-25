using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using OnlineJobFinding.BLL.Components;

public partial class Administrator_ShowEmployerDescription : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        BindEmployerInfo();
    }

    private void BindEmployerInfo()
    {
        AdministratorBLL admin = new AdministratorBLL();
        int employerId = Convert.ToInt32(Request.QueryString["eid"]);
        EmployerBLL employer = new EmployerBLL();
        
        employer = admin.GetEmployerById(employerId);

        
        lblEmployerFirstName.Text = employer.EmployerFirstName;
        lblEmployerGender.Text = employer.EmployerGender;
        lblEmployerJobTitle.Text = employer.EmployerJobTitle;
        lblEmployerLastName.Text = employer.EmployerLastName;
        lblEmployerMobile.Text = employer.EmployerMobile;
        lblEmployerNationalCode.Text = employer.EmployerNationalCode;
        lblEmployerSHsh.Text = employer.EmployerSHsh;

        lblOrganizationAddress.Text = employer.OrganizationAddress;
        lblOrganizationCity.Text = employer.OrganizationCity;
        lblOrganizationFax.Text = employer.OrganizationFax;
        lblOrganizationName.Text = employer.OrganizationName;
        lblOrganizationPostalCode.Text = employer.OrganizationPostalCode;
        lblOrganizationTelephone.Text = employer.OrganizationTelephone;

        lblUserEmail.Text = employer.UEmail;
        lblUserLoginName.Text = employer.ULoginName;
    }

    protected void btnDeleteEmployer_Click(object sender, EventArgs e)
    {
        int employerId = Convert.ToInt32(Request.QueryString["eid"]);
        AdministratorBLL admin = new AdministratorBLL();
        admin.DeleteEmployerById(employerId);
        Response.Redirect("GetEmployers.aspx");
    }
}