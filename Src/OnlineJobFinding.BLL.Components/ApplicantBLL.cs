using System;
using OnlineJobFinding.DAL.Database.Entity;
using OnlineJobFinding.Tools.Tools;
using System.Collections.Generic;
using System.Data;

namespace OnlineJobFinding.BLL.Components
{
    public class ApplicantBLL : UserBLL
    {       
        #region Properties
        public string BirthLocation{get;set;}
        public DateTime BirthDate { get; set; }
        public string FirstName { get; set; }
        public string FotherName { get; set; }
        public string Gender { get; set; }
        public string LastName { get; set; }
        public string MaritalStatus { get; set; }
        public string NationalCode { get; set; }
        public string Shsh { get; set; }

        public string HCity { get; set; }
        public string Mobile { get; set; }
        public string HPhone { get; set; }

        public string LastJobCity{get;set;}
        public string LastJobCompanyName{get;set;}
        public string LastJobPhone{get;set;}
        public string LastJobTitle { get; set; }        
        
        public string UniversityName { get; set; }
        public string UniversityCity { get; set; }
        public string Degree { get; set; }
        public string Major { get; set; }
        public string YearOfGraduation { get; set; }
        public decimal Average { get; set; }
        #endregion 

        #region Methods
        public void Register()
        {
            UPassword = StringTools.GetMD5Hash(UPassword);

            Applicant newApplicant = new Applicant();
            newApplicant.UserEmail = UEmail;
            newApplicant.UserLoginName = ULoginName;
            newApplicant.UserPassword = UPassword;
            newApplicant.UserRegisterTime = URegisterTime;
            newApplicant.UserRoles = URole;

            newApplicant.BirthDate = BirthDate;
            newApplicant.BirthLocation = BirthLocation;
            newApplicant.LastJobCity = LastJobCity;
            newApplicant.LastJobCompanyName = LastJobCompanyName;
            newApplicant.LastJobPhone = LastJobPhone;
            newApplicant.LastJobTitle = LastJobTitle;
            newApplicant.FirstName = FirstName;
            newApplicant.FotherName = FotherName;
            newApplicant.Gender = Gender;
            newApplicant.HCity = HCity;
            newApplicant.HPhone = HPhone;
            newApplicant.LastName = LastName;
            newApplicant.MaritalStatus = MaritalStatus;
            newApplicant.Mobile = Mobile;
            newApplicant.NationalCode = NationalCode;
            newApplicant.Shsh = Shsh;

            newApplicant.UniversityCity = UniversityCity;
            newApplicant.UniversityName = UniversityName;
            newApplicant.Degree = Degree;
            newApplicant.Average = Average;
            newApplicant.YearOfGraduation = YearOfGraduation;
            newApplicant.Major = Major;

            newApplicant.Register();            
        }

        public void FavoriteJob(int applicantId, int jobId)
        {
            Applicant applicant = new Applicant();            

            applicant.FavoriteJob(applicantId, jobId);
        }       

        public DataSet GetDavats(int applicantId)
        {
            Applicant applicant = new Applicant();
            return applicant.GetDavats(applicantId);
        }        

        public DavatNamehBLL GetDavatDescription(int davatId)
        {
            Applicant applicant = new Applicant();
            IDataReader dataReader = applicant.GetDavatDescription(davatId);

            DavatNamehBLL davat = new DavatNamehBLL();

            while (dataReader.Read())
            {
                davat.EmployerFName = dataReader["FirstName"].ToString();
                davat.EmployerLName = dataReader["LastName"].ToString();
                davat.CName = dataReader["CName"].ToString();

                davat.MessageBody = dataReader["body"].ToString();

                davat.JobId = Convert.ToInt32(dataReader["JobId"]);
                davat.Category = dataReader["Category"].ToString();
                davat.City = dataReader["City"].ToString();
                davat.DateClosing = Convert.ToDateTime(dataReader["DateClosing"]);
                davat.DatePosted = Convert.ToDateTime(dataReader["DatePosted"]);
                davat.Description = dataReader["Description"].ToString();
                davat.Requirements = dataReader["Requirements"].ToString();
                davat.Salary = Convert.ToDecimal(dataReader["Salary"].ToString());
                davat.Title = dataReader["Title"].ToString();
                davat.Type = dataReader["Type"].ToString();
            }
            return davat;
        }        

        public void AcceptDavat(int davatId, int applicantId, int jobId)
        {
            Applicant applicant = new Applicant();
            applicant.AcceptDavat(davatId, applicantId, jobId);
        }

        #endregion
    }
}
