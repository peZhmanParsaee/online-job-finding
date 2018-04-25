using System;
using OnlineJobFinding.DAL.Database.Entity;
using OnlineJobFinding.Tools.Tools;
using System.Data;

namespace OnlineJobFinding.BLL.Components
{
    public class AdministratorBLL : UserBLL
    {
        #region Properties
        public int AdministratorId { get; set; }
        public string AdministratorFirstName { get; set; }
        public string AdministratorLastName { get; set; }
        #endregion
                        
        #region Methods
        public bool Login(string userLoginName, string userPassword)
        {
            Administrator admin = new Administrator();
            bool isSuccessfulLogin = false;            
            isSuccessfulLogin = admin.Login(userLoginName, userPassword);
            return isSuccessfulLogin;
        }

        public bool Logout(string userLoginName, string userPassword)
        {
            throw new NotImplementedException();
        }

        public bool Register()
        {
            UPassword = StringTools.GetMD5Hash(UPassword);

            Administrator admin = new Administrator();
            admin.Register(ULoginName,
                           UPassword,
                           URegisterTime,
                           UEmail,
                           URole,                                
                           AdministratorFirstName,
                           AdministratorLastName);

            return false;
        }
        
        public DataSet GetAllAnchorLinks()
        {
            Administrator admin = new Administrator();
            DataSet ds = new DataSet();
            ds = admin.GetAllAnchors();
            return ds;
        }

        public void AddNewAnchorLink(string AnchorName, string AnchorAddress)
        {
            Administrator admin = new Administrator();
            admin.AddNewAnchorLink(AnchorName, AnchorAddress);
        }
        
        public Anchor GetAnchorLinkById(int anchorId)
        {
            Administrator admin = new Administrator();
            IDataReader dataReader = admin.GetAnchorLinkById(anchorId);

            Anchor anchor = new Anchor();
            if (dataReader.Read())
            {
                anchor.Name = dataReader["Name"].ToString();
                anchor.Address = dataReader["Address"].ToString();
            }
            return anchor;
        }

        public void DeleteAnchorLinkById(int anchorId)
        {
            Administrator admin = new Administrator();
            admin.DeleteAnchorLinkById(anchorId);
        }
        
        public DataSet GetAllApplicants()
        {
            Administrator admin = new Administrator();
            DataSet ds = new DataSet();
            ds = admin.GetAllApplicants();
            return ds;
        }

        public ApplicantBLL GetApplicantCV(int ApplicantId)
        {            
            Applicant applicant = new Applicant();
            Administrator admin = new Administrator();
            applicant = admin.GetApplicantById(ApplicantId);

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

        public void DeleteApplicantById(int applicantId)
        {
            Administrator admin = new Administrator();
            admin.DeleteApplicantById(applicantId);
        }        

        public void DeleteVacancyById(int vacancyId)
        {
            Administrator admin = new Administrator();
            admin.DeleteVacancyById(vacancyId);
        }
        
        public DataSet GetAllEmployers()
        {
            Administrator admin = new Administrator();
            DataSet ds = new DataSet();
            ds = admin.GetAllEmployers();
            return ds;
        }        

        public void DeleteEmployerById(int employerId)
        {
            Administrator admin = new Administrator();
            admin.DeleteEmployerById(employerId);
        }

        public EmployerBLL GetEmployerById(int employerId)
        {
            Administrator admin = new Administrator();            
            IDataReader dataReader =admin.GetEmployerById(employerId);

            EmployerBLL employer = new EmployerBLL();
            while (dataReader.Read())
            {
                employer.EmployerFirstName = dataReader["FirstName"].ToString();
                employer.EmployerGender = dataReader["Gender"].ToString();
                employer.EmployerJobTitle = dataReader["JobTitle"].ToString();
                employer.EmployerLastName = dataReader["LastName"].ToString();
                employer.EmployerMobile = dataReader["Mobile"].ToString();
                employer.EmployerNationalCode = dataReader["NationalCode"].ToString();
                employer.EmployerSHsh = dataReader["SHsh"].ToString();
                
                employer.OrganizationAddress = dataReader["CAddress"].ToString();
                employer.OrganizationCity = dataReader["CCity"].ToString();                
                employer.OrganizationFax = dataReader["CFax"].ToString();
                employer.OrganizationName = dataReader["CName"].ToString();
                employer.OrganizationPostalCode = dataReader["CPostalCode"].ToString();
                employer.OrganizationTelephone = dataReader["CTelephone"].ToString();

                employer.UEmail = dataReader["UserEmail"].ToString();
                employer.ULoginName = dataReader["UserLoginName"].ToString();
            }
            return employer;
        }
        #endregion
    }
}
