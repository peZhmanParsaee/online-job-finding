using System;


namespace OnlineJobFinding.BLL.Components
{
    public class DavatNamehBLL
    {
        public int JobId { get; set; }
        public string Category { get; set; }
        public string City { get; set; }
        public DateTime DatePosted { get; set; }
        public DateTime DateClosing { get; set; }
        public string Description { get; set; }
        public int EmployerId { get; set; }
        public string Requirements { get; set; }
        public decimal Salary { get; set; }
        public string Title { get; set; }
        public string Type { get; set; }

        public string EmployerFName { get; set; }
        public string EmployerLName { get; set; }
        public string CName { get; set; }

        public string MessageBody { get; set; }
    }
}
