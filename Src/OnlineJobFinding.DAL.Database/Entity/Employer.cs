using System;
using System.Data;
using System.Data.SqlClient;

namespace OnlineJobFinding.DAL.Database.Entity
{
    public class Employer : DALBase
    {
        #region Properties
        public int UserId { get; set; }
        public string UserEmail { get; set; }
        public string UserLastLoginIp { get; set; }
        public DateTime UserLastLoginTime { get; set; }
        public string UserLoginName { get; set; }
        public string UserPassword { get; set; }
        public DateTime UserRegisterTime { get; set; }
        public string UserRoles { get; set; }
        public string UserStatus { get; set; }

        public string EmployerFirstName { get; set; }
        public string EmployerLastName { get; set; }
        public string EmployerGender { get; set; }
        public string EmployerJobTitle { get; set; }
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
            DoExecuteNonQuery(CommandType.StoredProcedure, "RegisterEmployer",
                new SqlParameter[] 
                {
                    new SqlParameter("@UserEmail", UserEmail),
                    new SqlParameter("@UserLoginName", UserLoginName),
                    new SqlParameter("@UserPassword", UserPassword),
                    new SqlParameter("@UserRegisterTime", UserRegisterTime),
                    new SqlParameter("@UserRole", UserRoles),

                    new SqlParameter("@EmployerFirstName", EmployerFirstName),
                    new SqlParameter("@EmployerGender", EmployerGender),
                    new SqlParameter("@EmployerJobTitle", EmployerJobTitle),                    
                    new SqlParameter("@EmployerLastName", EmployerLastName),
                    new SqlParameter("@EmployerMobile", EmployerMobile),
                    new SqlParameter("@EmployerNationalCode", EmployerNationalCode),
                    new SqlParameter("@EmployerSHsh", EmployerSHsh),

                    new SqlParameter("@CAddress", OrganizationAddress),
                    new SqlParameter("@CCity", OrganizationCity),
                    new SqlParameter("@CFax", OrganizationFax),
                    new SqlParameter("@CName", OrganizationName),
                    new SqlParameter("@CPostalCode", OrganizationPostalCode),
                    new SqlParameter("@CTelephone", OrganizationTelephone),
                
                });
        #endregion
        }

        public void PostJob(Job newJob)
        {
            DoExecuteNonQuery(CommandType.StoredProcedure, "PostJob",
                new SqlParameter[]
                {
                    new SqlParameter("@Category", newJob.Category),
                    new SqlParameter("@City", newJob.City),
                    new SqlParameter("@DatePosted", newJob.DatePosted),
                    new SqlParameter("@DateClosing", newJob.DateClosing),
                    new SqlParameter("@Description", newJob.Description),
                    new SqlParameter("@EmployerId", newJob.EmployerId),
                    new SqlParameter("@Requirements", newJob.Requirements),
                    new SqlParameter("@Salary", newJob.Salary),
                    new SqlParameter("@Title", newJob.Title),
                    new SqlParameter("@Type", newJob.Type),
                });
        }

        public DataSet GetCandidates(int EmployerId)
        {
            return DoExecuteDataset(CommandType.StoredProcedure, "GetCandidates"
                , new SqlParameter[]{
                    new SqlParameter("@EmployerId", EmployerId),
                });
        }

        public Applicant GetApplicantById(int ApplicantId)
        {
            SqlDataReader dataReader = DoExecuteReader(CommandType.StoredProcedure, "GetApplicantById",
                    new SqlParameter[]
                    {
                        new SqlParameter("@ApplicantId", ApplicantId),
                    });

            Applicant applicant = new Applicant();
            while (dataReader.Read())
            {
                applicant.BirthDate = Convert.ToDateTime(dataReader["BirthDate"]);
                applicant.BirthLocation = dataReader["BirthLocation"].ToString();
                applicant.FirstName = dataReader["FirstName"].ToString();
                applicant.FotherName = dataReader["FotherName"].ToString();
                applicant.Gender = dataReader["Gender"].ToString();
                applicant.LastName = dataReader["LastName"].ToString();
                applicant.MaritalStatus = dataReader["MaritalStatus"].ToString();
                applicant.NationalCode = dataReader["NationalCode"].ToString();
                applicant.Shsh = dataReader["SHsh"].ToString();

                applicant.HCity = dataReader["HCity"].ToString();
                applicant.HPhone = dataReader["HPhone"].ToString();
                applicant.Mobile = dataReader["Mobile"].ToString();
                applicant.UserEmail = dataReader["UserEmail"].ToString();

                applicant.LastJobCity = dataReader["LJCity"].ToString();
                applicant.LastJobCompanyName = dataReader["LJCompanyName"].ToString();
                applicant.LastJobPhone = dataReader["LJPhone"].ToString();
                applicant.LastJobTitle = dataReader["LJTitle"].ToString();

                applicant.UniversityName = dataReader["UniversityName"].ToString();
                applicant.UniversityCity = dataReader["UniversityCity"].ToString();
                applicant.Degree = dataReader["Degree"].ToString();
                applicant.Major = dataReader["Major"].ToString();
                applicant.YearOfGraduation = dataReader["YearOfGraduation"].ToString();
                applicant.Average = Convert.ToDecimal(dataReader["Average"]);
            }

            return applicant;
        }

        public DataSet GetMyJobs(int employerId)
        {
            return DoExecuteDataset(CommandType.StoredProcedure, "GetMyJobs",
                new SqlParameter[]
                {
                    new SqlParameter("@EmployerId", employerId),
                });
        }

        public DataSet GetMyOpenJobs(int employerId)
        {
            return DoExecuteDataset(CommandType.StoredProcedure, "GetMyOpenJobs",
                new SqlParameter[]
                {
                    new SqlParameter("@EmployerId", employerId),
                });
        }

        public void Employment(int jobId, int applicantId)
        {
            DoExecuteNonQuery(CommandType.StoredProcedure, "Employment",
                new SqlParameter[]
                {                    
                    new SqlParameter("@JobId", jobId),
                    new SqlParameter("@ApplicantId", applicantId),
                });
        }

        public void SendDavat(int employerId, int applicantId, int jobId, string messageBody)
        {
            DoExecuteNonQuery(CommandType.StoredProcedure, "SendDavat",
                new SqlParameter[]
                {
                    new SqlParameter("@EmployerId", employerId),
                    new SqlParameter("@ApplicantId", applicantId),
                    new SqlParameter("@JobId", jobId),
                    new SqlParameter("@MessageBody", messageBody),
                });
        }
    }
}
