using System;
using OnlineJobFinding.DAL.Database.Entity;
using OnlineJobFinding.Tools.Tools;
using System.Data;
using System.Collections;
using System.Collections.Generic;
using Persia;

namespace OnlineJobFinding.BLL.Components
{
    public class UserBLL
    {
        #region Properties
            public int UId { get; set; }
            public string ULoginName { get; set; }
            public string UPassword { get; set; }
            public DateTime URegisterTime { get; set; }
            public string UEmail { get; set; }
            public DateTime ULastLoginTime { get; set; }
            public string ULastLoginIp { get; set; }
            public string URole { get; set; }
            public string UStatus { get; set; }        
        #endregion

        #region Method
            public UserBLL Login(string uname, string clientIP)
            {
                User user = new User();
                IDataReader dr = user.Login(uname, clientIP);                       

                if (dr.Read())
                {
                    UId = Convert.ToInt32(dr["UserId"]);
                    //UserId = 1;
                    //UserLoginName = uname;
                    UPassword = dr["UserPassword"].ToString();
                    URegisterTime = Convert.ToDateTime(dr["UserRegisterTime"]);
                    UEmail = dr["UserEmail"].ToString();
                    ULastLoginTime = Convert.ToDateTime(dr["UserLastLoginDateTime"]);
                    ULastLoginIp = clientIP;
                    URole = dr["UserRole"].ToString();                
                }

                return this;
            }

            public bool GetUserAuthenticate(string uname, string pwd)
            {
                User user1 = new User();
                pwd = StringTools.GetMD5Hash(pwd);
                return user1.GetUserAuthenticate(uname, pwd);
            }

            public DataSet GetAllJobs()
            {            
                User user1 = new User();
                return user1.GetAllJobs();
            }

            public JobBLL GetJobByID(int jobID)
            {
                JobBLL jobBll = new JobBLL();

                User user = new User();
                Job jobDal = new Job();

                jobDal = user.GetJobByID(jobID);

                jobBll.Category = jobDal.Category;
                jobBll.City = jobDal.City;
                jobBll.DateClosing = jobDal.DateClosing;
                jobBll.DatePosted = jobDal.DatePosted;
                jobBll.Description = jobDal.Description;
                jobBll.EmployerId = jobDal.EmployerId;
                jobBll.JobId = jobDal.JobId;
                jobBll.Requirements = jobDal.Requirements;
                jobBll.Salary = jobDal.Salary;
                jobBll.Title = jobDal.Title;
                jobBll.Type = jobDal.Type;

                return jobBll;
            }        

            public void GetSiteStatistics(out int numOFApplicants, out int numOFEmployers)
            {
                User user = new User();
                        
                int[] statArray = user.GetSiteStatistics();

                numOFApplicants = statArray[0];
                numOFEmployers = statArray[1];
            }

            public List<Anchor> GetAllAnchorsForMarquee()
            {
                User user = new User();
                IDataReader dataReader = user.GetAllAnchorsForMarquee();

                List<Anchor> anchors = new List<Anchor>();
                while (dataReader.Read())
                {
                    Anchor anchor = new Anchor();

                    anchor.Address = dataReader["Address"].ToString();
                    anchor.Name = dataReader["Name"].ToString();

                    anchors.Add(anchor);
                }
                return anchors;
            }       
        #endregion
    }
}
