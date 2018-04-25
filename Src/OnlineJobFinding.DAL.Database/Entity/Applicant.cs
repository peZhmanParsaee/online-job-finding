using System;
using System.Data;
using System.Data.SqlClient;

namespace OnlineJobFinding.DAL.Database.Entity
{
    public class Applicant : DALBase
    {
        #region Properties
        public int UserId { get; set; }
        public string UserLoginName { get; set; }
        public string UserPassword { get; set; }
        public DateTime UserRegisterTime { get; set; }
        public string UserEmail { get; set; }
        public DateTime UserLastLoginTime { get; set; }
        public string UserLastLoginIp { get; set; }
        public string UserRoles { get; set; }
        public string UserStatus { get; set; }
        
        public string BirthLocation { get; set; }
        public DateTime BirthDate { get; set; }
        public string FirstName { get; set; }
        public string FotherName { get; set; }
        public string Gender { get; set; }
        public string LastName { get; set; }
        public string MaritalStatus { get; set; }
        public string NationalCode { get; set; }
        public string Shsh { get; set; }
        public string HCity{ get; set; }
        public string Mobile { get; set; }
        public string HPhone { get; set; }
        public string LastJobCity { get; set; }
        public string LastJobCompanyName{ get; set; }
        public string LastJobPhone { get; set; }
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
            DoExecuteNonQuery(CommandType.StoredProcedure, "RegisterApplicant",
                new SqlParameter[]
                {
                    new SqlParameter("@UserEmail", UserEmail),
                    new SqlParameter("@UserLoginName", UserLoginName),
                    new SqlParameter("@UserPassword", UserPassword),
                    new SqlParameter("@UserRegisterTime", UserRegisterTime),
                    new SqlParameter("@UserRole", UserRoles),

                    new SqlParameter("@BirthDate", BirthDate),
                    new SqlParameter("@BirthLocation", BirthLocation),
                    new SqlParameter("@FirstName", FirstName),
                    new SqlParameter("@FotherName", FotherName), 
                    new SqlParameter("@Gender", Gender),
                    new SqlParameter("@LastName", LastName),
                    new SqlParameter("@MaritalStatus", MaritalStatus),
                    new SqlParameter("@NationalCode", NationalCode),
                    new SqlParameter("@Shsh", Shsh),

                    new SqlParameter("@HCity", HCity),
                    new SqlParameter("@Mobile", Mobile),
                    new SqlParameter("@HPhone", HPhone),

                    new SqlParameter("@LJCity", LastJobCity),
                    new SqlParameter("@LJCompanyName", LastJobCompanyName),
                    new SqlParameter("@LJPhone", LastJobPhone),
                    new SqlParameter("@LJTitle", LastJobTitle),

                    new SqlParameter("@UniversityName", UniversityName),
                    new SqlParameter("@UniversityCity", UniversityCity),
                    new SqlParameter("@Degree", Degree),
                    new SqlParameter("@Major", Major),
                    new SqlParameter("@Average", Average),
                    new SqlParameter("@YearOfGraduation", YearOfGraduation),
                });
        }

        public void FavoriteJob(int applicantId, int jobId)
        {
            DoExecuteNonQuery(CommandType.StoredProcedure, "FavJobByApp",
                new SqlParameter[]
                {
                    new SqlParameter("@JobId", jobId),
                    new SqlParameter("@appId", applicantId),
                });
        }

        public DataSet GetDavats(int applicatId)
        {
            return DoExecuteDataset(CommandType.StoredProcedure, "GetDavatsByApplicantId",
                new SqlParameter[]
                {
                    new SqlParameter("@ApplicantId", applicatId),
                });
        }
        
        public SqlDataReader GetDavatDescription(int davatId)
        {
            return DoExecuteReader(CommandType.StoredProcedure, "GetDavatDescription",
                new SqlParameter[] { 
                    new SqlParameter("@DavatId", davatId),
                });
        }

        public void AcceptDavat(int davatId, int applicantId, int jobId)
        {
            DoExecuteNonQuery(CommandType.StoredProcedure, "AcceptDavat",
                new SqlParameter[]
                {
                    new SqlParameter("@DavatId", davatId),
                    new SqlParameter("@ApplicantId", applicantId),
                    new SqlParameter("@JobId", jobId),
                });
        }

        #endregion
    }
}
