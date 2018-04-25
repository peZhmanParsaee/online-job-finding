using System;


namespace OnlineJobFinding.BLL.Components
{
    public class JobBLL
    {
        public int JobId {get; set;}
        public string Category{get; set;}
        public string City{get;set;}
	    public DateTime DatePosted{get;set;}
	    public DateTime DateClosing{get;set;}
        public string Description{get;set;}	    
        public int EmployerId{get;set;}	    
	    public string Requirements{get;set;}
        public decimal Salary{get;set;}
        public string Title{get;set;}
        public string Type { get; set; }
    }
}
