using System;
using OnlineJobFinding.DAL.Database.Entity;
using OnlineJobFinding.Tools.Tools;
using System.Collections.Generic;
using System.Data;

namespace OnlineJobFinding.BLL.Components
{
    public class EmployerBLL : UserBLL
    {
        #region Properties
        public string EmployerFirstName { get; set; }
        public string EmployerLastName { get; set; }
        public string EmployerJobTitle { get; set; }
        public string EmployerGender { get; set; }
        public string EmployerMobile { get; set; }
        public string EmployerNationalCode { get; set; }
        public string EmployerSHsh { get; set; }

        public string OrganizationAddress { get; set; }
        public string OrganizationCity { get; set; }
        public string OrganizationFax { get; set; }
        public string OrganizationName { get; set; }
        public string OrganizationPostalCode { get; set; }
        public string OrganizationTelephone { get; set; }        
        #endregion

        #region Methods
        public void Register()
        {
            UPassword = StringTools.GetMD5Hash(UPassword);

            Employer employer = new Employer();

            employer.UserLoginName = ULoginName;
            employer.UserPassword = UPassword;
            employer.UserRegisterTime = URegisterTime;
            employer.UserEmail = UEmail;
            employer.UserRoles = URole;

            employer.EmployerFirstName = EmployerFirstName;
            employer.EmployerLastName = EmployerLastName;
            employer.EmployerGender = EmployerGender;
            employer.EmployerJobTitle = EmployerJobTitle;
            employer.EmployerMobile = EmployerMobile;
            employer.EmployerNationalCode = EmployerNationalCode;
            employer.EmployerSHsh = EmployerSHsh;

            employer.OrganizationAddress = OrganizationAddress;
            employer.OrganizationCity = OrganizationCity;
            employer.OrganizationFax = OrganizationFax;
            employer.OrganizationName = OrganizationName;
            employer.OrganizationPostalCode = OrganizationPostalCode;
            employer.OrganizationTelephone = OrganizationTelephone;

            employer.Register();
        }

        public void PostJob(JobBLL newJob) 
        {
            Employer employer = new Employer();
            Job dalJob = new Job();

            dalJob.Category = newJob.Category;
            dalJob.City = newJob.City;
            dalJob.DateClosing = newJob.DateClosing;
            dalJob.DatePosted = newJob.DatePosted;
            dalJob.Description = newJob.Description;
            dalJob.EmployerId = newJob.EmployerId;
            dalJob.Requirements = newJob.Requirements;
            dalJob.Salary = newJob.Salary;
            dalJob.Title = newJob.Title;
            dalJob.Type = newJob.Type;

            employer.PostJob(dalJob);
        }
        
        public DataSet GetCandidates(int EmployerId)
        {
            Employer employer = new Employer();
            return employer.GetCandidates(EmployerId);
        }

        public ApplicantBLL GetApplicantCV(int ApplicantId)
        {
            Employer employer = new Employer();
            Applicant applicant = new Applicant();

            applicant = employer.GetApplicantById(ApplicantId);

            ApplicantBLL applicantBLL = new ApplicantBLL();
            applicantBLL.BirthDate = applicant.BirthDate;
            applicantBLL.BirthLocation = applicant.BirthLocation;
            applicantBLL.FirstName = applicant.FirstName;
            applicantBLL.FotherName = applicant.FotherName;
            applicantBLL.Gender = applicant.Gender;
            applicantBLL.LastName = applicant.LastName;
            applicantBLL.MaritalStatus = applicant.MaritalStatus;
            applicantBLL.NationalCode = applicant.NationalCode;
            applicantBLL.Shsh = applicant.Shsh;

            applicantBLL.HCity = applicant.HCity;
            applicantBLL.HPhone = applicant.HPhone;
            applicantBLL.Mobile = applicant.Mobile;
            applicantBLL.UEmail = applicant.UserEmail;

            applicantBLL.LastJobCity = applicant.LastJobCity;
            applicantBLL.LastJobCompanyName = applicant.LastJobCompanyName;
            applicantBLL.LastJobPhone = applicant.LastJobPhone;
            applicantBLL.LastJobTitle = applicant.LastJobTitle;

            applicantBLL.UniversityName = applicant.UniversityName;
            applicantBLL.UniversityCity = applicant.UniversityCity;
            applicantBLL.Degree = applicant.Degree;
            applicantBLL.Major = applicant.Major;
            applicantBLL.YearOfGraduation = applicant.YearOfGraduation;
            applicantBLL.Average = applicant.Average;

            return applicantBLL;
        }

        public DataSet GetMyJobs(int employerId)
        {
            Employer employer = new Employer();
            return employer.GetMyJobs(employerId);
        }

        public DataSet GetMyOpenJobs(int employerId)
        {
            Employer employer = new Employer();
            return employer.GetMyOpenJobs(employerId);
        }

        public void Employment(int jobId, int applicantId)
        {
            Employer employer = new Employer();
            employer.Employment (jobId, applicantId);
        }
        
        public void SendDavat(int employerId, int applicantId, int jobId, string messageBody)
        {
            Employer employer = new Employer();
            employer.SendDavat(employerId, applicantId, jobId, messageBody);
        }

        #endregion
    }
}
