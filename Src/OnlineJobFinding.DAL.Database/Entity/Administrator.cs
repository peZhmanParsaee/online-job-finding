using System;
using System.Data;
using System.Data.SqlClient;

namespace OnlineJobFinding.DAL.Database.Entity
{
    public class Administrator : DALBase
    {
        #region Properties
        public int UserId { get;set; }
        public string UserLoginName { get; set; }
        public string UserPassword { get; set; }
        public DateTime UserRegisterTime { get; set; }
        public string UserEmail { get; set; }
        public DateTime UserLastLoginTime { get; set; }
        public string UserLastLoginIp { get; set; }
        public string UserRoles { get; set; }
        public string UserStatus { get; set; }
        public int AdministratorId { get; set; }
        public string FirstName { get; set; }
        public string LastName { get; set; }
        #endregion

        #region Methods
        public Boolean Login(string loginName, string password)
        {
            bool SuccessfulLogin = false;

            int number = (int) DoExecuteScalar(CommandType.StoredProcedure, "AdminLogin",
                new SqlParameter[] 
                {

                    new SqlParameter("@loginName", loginName),
                    new SqlParameter("@password", password),

                });

            if (number == 1) SuccessfulLogin = true;

            return SuccessfulLogin;
        }        

        public void Register(
                                string userLoginName,
                                string userPassword,
                                DateTime userRegisterTime,
                                string userEmail,
                                string userRoles,
                                string userFirstName,
                                string userLastName)
        {            

            DoExecuteNonQuery(CommandType.StoredProcedure, "AddNewAdministrator",
                                new SqlParameter[]
                                {
                                    new SqlParameter("@UserLoginName", userLoginName),
                                    new SqlParameter("@UserPassword", userPassword),
                                    new SqlParameter("@UserRegisterTime", userRegisterTime),
                                    new SqlParameter("@UserEmail", userEmail),                                    
                                    new SqlParameter("@UserRoles", userRoles),                                    
                                    new SqlParameter("@FirstName", userFirstName),
                                    new SqlParameter("@LastName", userLastName),

                                });
        }        

        public DataSet GetAllAnchors()
        {
            return DoExecuteDataset(CommandType.StoredProcedure, "GetAllAnchors");
        }

        public void AddNewAnchorLink(string AnchorName, string AnchorAddress)
        {
            DoExecuteNonQuery(CommandType.StoredProcedure, "AddNewAnchorLink",
                new SqlParameter[]
                {
                    new SqlParameter("@Name", AnchorName),
                    new SqlParameter("@Address", AnchorAddress),
                });
        }        

        public SqlDataReader GetAnchorLinkById(int anchorId)
        {
            return DoExecuteReader(CommandType.StoredProcedure, "GetAnchorLinkById"
                , new SqlParameter[]
                {
                    new SqlParameter("@AnchorId", anchorId),
                });
        }

        public void DeleteAnchorLinkById(int anchorId)
        {
            DoExecuteNonQuery(CommandType.StoredProcedure, "DeleteAnchorLinkById",
                new SqlParameter[]
                {
                    new SqlParameter("@AnchorId", anchorId ),
                });
        }
        
        public DataSet GetAllApplicants()
        {
            return DoExecuteDataset(CommandType.StoredProcedure, "GetAllApplicants");
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

        public void DeleteApplicantById(int applicantId)
        {
            DoExecuteNonQuery(CommandType.StoredProcedure, "DeleteApplicantById",
                new SqlParameter[]
                {
                    new SqlParameter("@ApplicantId", applicantId),
                });
        }
        #endregion

        public void DeleteVacancyById(int vacancyId)
        {
            DoExecuteNonQuery(CommandType.StoredProcedure, "DeleteVacancyById",
                new SqlParameter[]
                {
                    new SqlParameter("@VacancyId", vacancyId),
                });
        }

        public DataSet GetAllEmployers()
        {
            return DoExecuteDataset(CommandType.StoredProcedure, "GetAllEmployers");
        }

        public SqlDataReader GetEmployerById(int employerId)
        {
            return DoExecuteReader(CommandType.StoredProcedure, "GetEmployerById",
                new SqlParameter[]
                {
                    new SqlParameter("@EmployerId", employerId),
                });
        }

        public void DeleteEmployerById(int employerId)
        {
            DoExecuteNonQuery(CommandType.StoredProcedure, "DeleteEmployerById",
                new SqlParameter[]
                {
                    new SqlParameter("@employerId", employerId),
                });
        }
    }
}
