using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace OnlineJobFinding.BLL.Components
{
    public class CandidateBLL
    {
        public int CandidateId { get; set; }        
        public string CandidateFirstName { get; set; }
        public string CandidateLastName { get; set; }
        
        public int JobId { get; set; }
        public string JobCategory { get; set; }
        public string JobTitle { get; set; }
    }
}
