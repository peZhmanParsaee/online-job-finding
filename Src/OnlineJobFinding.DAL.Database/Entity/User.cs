using System;
using System.Data;
using System.Data.SqlClient;

namespace OnlineJobFinding.DAL.Database.Entity
{
    public class User : DALBase
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
        #endregion

        public SqlDataReader Login(string uname, string clientIP)
        {
            return DoExecuteReader(CommandType.StoredProcedure, "Login",
                                new SqlParameter[]
                                {
                                    new SqlParameter("@LoginName", uname),
                                    new SqlParameter("@UserLastLoginIP", clientIP),
                                });            
        }

        public bool GetUserAuthenticate(string uname, string pwd)
        {
            object ret = DoExecuteScalar(CommandType.StoredProcedure, "GetUserAuthenticate",
                new SqlParameter[]
                                {
                                    new SqlParameter("@LoginName", uname),
                                    new SqlParameter("@Password", pwd),
                                });
            int ret1 = (int) ret;

            if (ret1 == 1) return true;
            else return false;
        }

        public DataSet GetAllJobs()
        {
            return DoExecuteDataset(CommandType.StoredProcedure, "GetAllJobs");
        }

        public Job GetJobByID(int jobID)
        {
            SqlDataReader dataReader = DoExecuteReader(CommandType.StoredProcedure, "GetJobById",
                new SqlParameter[]
                {
                    new SqlParameter("@jobId", jobID),
                });
            
            Job job = new Job();
            if (dataReader.Read())
            {
                job.Category = dataReader["Category"].ToString();
                job.City = dataReader["City"].ToString();
                job.DateClosing = Convert.ToDateTime(dataReader["DateClosing"]);
                job.DatePosted = Convert.ToDateTime(dataReader["DatePosted"]);
                job.Description = dataReader["Description"].ToString();
                job.EmployerId = Convert.ToInt32(dataReader["EmployerId"]);
                job.JobId = Convert.ToInt32(dataReader["JobId"]);
                job.Requirements = dataReader["Requirements"].ToString();
                job.Salary = Convert.ToDecimal(dataReader["Salary"]);
                job.Title = dataReader["Title"].ToString();
                job.Type = dataReader["Type"].ToString();
            }
            return job;
        }

        public int[] GetSiteStatistics()
        {
            int appNums = (int) DoExecuteScalar (CommandType.StoredProcedure, "GetNumberOfApplicants");
            int empNums = (int)DoExecuteScalar(CommandType.StoredProcedure, "GetNumberOfEmployers");

            int[] statArray = new int[2];
            statArray[0] = appNums;
            statArray[1] = empNums;

            return statArray;
        }

        public SqlDataReader GetAllAnchorsForMarquee()
        {
            return DoExecuteReader(CommandType.StoredProcedure, "GetAllAnchors");
        }       
    }
}
