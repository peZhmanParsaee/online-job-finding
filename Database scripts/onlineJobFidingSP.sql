use OnlineJobFinding




/*  Accept Davat */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE AcceptDavat
	@JobId int,
	@ApplicantId int,
	@DavatId int
as
BEGIN

	SET NOCOUNT ON;

	insert into FavoriteJobs(JobId, ApplicantId) values(@JobId, @ApplicantId)
	
	update davat set DavatState = '»” Â' where DavatId = @DavatId
END
GO
/***************************************************************************/





SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

/*        Add New Administrator            */
create PROCEDURE AddNewAdministrator
(	
	@UserLoginName nvarchar(50), 
	@UserPassword char(32),
	@UserRegisterTime char(32),
	@UserEmail nvarchar(100),
	@UserRoles varchar(200),
	
	@FirstName nvarchar(50),
	@LastName nvarchar(50)
)
AS
BEGIN	
	SET NOCOUNT ON;
    
	insert into Users
	(
		UserLoginName, 
		UserPassword,
		UserRegisterTime,
		UserEmail,
		UserRole 
	)
	values
	(
		@UserLoginName, 
		@UserPassword,
		@UserRegisterTime,
		@UserEmail,
		@UserRoles
	)
	
	declare @UserId int;
	
	set @UserId = @@IDENTITY;
	
	insert into Administrator
	(
		AdministratorId,
		FirstName,
		LastName
	)
	values
	(
		@UserId,
		@FirstName,
		@LastName
	)	
END
/*****************************************/





SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*    Add New Anchor Link      */
create PROCEDURE AddNewAnchorLink
	@Name nvarchar(100),
	@Address nvarchar(100)
AS
BEGIN	
	SET NOCOUNT ON;
    
	insert into Anchor(Name, [Address]) values(@Name, @Address)
END
/*****************************************/





SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*        Delete Anchor Link By Id       */
create PROCEDURE DeleteAnchorLinkById
(
	@AnchorId int
)	
AS
BEGIN	
	SET NOCOUNT ON;
    
    delete from Anchor where AnchorId = @AnchorId
END
/*****************************************/





SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*    Delete Applicant By Id    */
create PROCEDURE DeleteApplicantById
	@ApplicantId int
AS
BEGIN	
	SET NOCOUNT ON;
	
	delete from Users where UserId = @ApplicantId    
END
/*****************************************/





SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*   Delete Employer By Id   */
create procedure DeleteEmployerById
	@EmployerId int
AS
BEGIN	
	SET NOCOUNT ON;
	
	delete from Users where UserId = @EmployerId
END
/*****************************************/





SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  Delete Vacancy By Id  */
create PROCEDURE DeleteVacancyById
	@VacancyId int
AS
BEGIN
	SET NOCOUNT ON;

    delete from Job where JobId = @VacancyId
END
/*****************************************/





SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  Employment  */
create PROCEDURE Employment
	@JobId int,
	@ApplicantId int
AS
BEGIN	
	SET NOCOUNT ON;
	
	insert into Applications (ApplicantId, JobId, DateApplied)
	values (@ApplicantId, @JobId, GETDATE())
	
	update Job set JobState = '»” Â', DateClosing = GETDATE() where JobId = @JobId
	
	update Applicant set ApplicantState = '‘«€·' where ApplicantId = @ApplicantId	
	
	update FavoriteJobs set FJState = '»” Â' where JobId = @JobId and ApplicantId = @ApplicantId
	
END
GO
/***************************************************/





SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  Favorite Job By Applicant  */
create PROCEDURE FavJobByApp
	@appId int,
	@JobId int
AS
BEGIN	
	SET NOCOUNT ON;
    insert into FavoriteJobs(JobId, ApplicantId) values(@JobId, @appId)
END
/*****************************************/




SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  Get All Anchors  */
create PROCEDURE GetAllAnchors
AS
BEGIN	
	SET NOCOUNT ON;
    select [Address], Name, AnchorId from Anchor
END
/*****************************************/




SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  Get All Applicants  */
create PROCEDURE GetAllApplicants
AS
BEGIN	
	SET NOCOUNT ON;
	
	SELECT		Applicant.ApplicantId, Users.UserLoginName, Applicant.FirstName, Applicant.LastName, ApplicantState
	FROM        Applicant INNER JOIN Users ON Applicant.ApplicantId = Users.UserId	
END
/*****************************************/




SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  Get All Employers    */
create procedure GetAllEmployers
AS
BEGIN
	SET NOCOUNT ON;
	select EmployerId, CCity, CName, FirstName, LastName from Employer
END
/*****************************************/




SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  Get All Jobs  */
create PROCEDURE GetAllJobs
AS
BEGIN	
	SET NOCOUNT ON;

	SELECT	Employer.EmployerId, 
			CName, 
			JobId, 
			City, 
			DatePosted, 
			DateClosing, 
			Title
	FROM    Employer INNER JOIN Job ON Employer.EmployerId = Job.EmployerId
	Where   JobState = '»«“'
END
/*****************************************/




SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  Get Anchor Link By Id  */
create PROCEDURE GetAnchorLinkById
(
	@AnchorId int
)
AS
BEGIN
	SET NOCOUNT ON;
    
    select Name, [address] from Anchor where anchorId = @AnchorId
END
/*****************************************/





SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  Get Applicant By Id  */
create PROCEDURE GetApplicantById
	@ApplicantId int
AS
BEGIN	
	SET NOCOUNT ON;	
	
	SELECT     Applicant.*, Users.UserLoginName, Users.UserEmail
	FROM       Applicant INNER JOIN Users ON Applicant.ApplicantId = Users.UserId
	where	   Applicant.ApplicantId = @ApplicantId
END
/*****************************************/




SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  Get Candidates  */
create PROCEDURE GetCandidates
	@EmployerId int
AS
BEGIN
	SET NOCOUNT ON;
	
	SELECT     Applicant.FirstName, Applicant.LastName, Job.Title, Job.Category, Applicant.ApplicantId, Job.JobId, Employer.EmployerId
	FROM       Applicant INNER JOIN
               FavoriteJobs ON Applicant.ApplicantId = FavoriteJobs.ApplicantId INNER JOIN
               Job ON FavoriteJobs.JobId = Job.JobId INNER JOIN
               Employer ON Job.EmployerId = Employer.EmployerId
	where	   Employer.EmployerId = @EmployerId and FJState = '»«“'	    
	
END
/*****************************************/





/*  GetDavatsByApplicantId  */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE GetDavatsByApplicantId
	@applicantId int	
AS
BEGIN	
	SET NOCOUNT ON;
    
	SELECT      davat.DavatId,
				davat.ApplicantId, 
				davat.body, 
				Employer.EmployerId, 
				Job.JobId, 
				Employer.FirstName, 
				Employer.LastName, 
				Employer.CName, 
				Job.Title
				
	FROM        davat INNER JOIN Employer ON davat.EmployerId = Employer.EmployerId 
				INNER JOIN Job ON   davat.JobId = Job.JobId 
							   AND  Employer.EmployerId = Job.EmployerId
    Where		davat.ApplicantId = @applicantId and davat.davatState = '»«“'
END
GO
/********************************************************************/





/*  Get Davat Description By Davat Id   */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

create PROCEDURE GetDavatDescription
	@DavatId int
AS
BEGIN	
	SET NOCOUNT ON;
	
	SELECT		davat.DavatId, 
				davat.body,
				 
				Job.JobId, 
				Job.EmployerId as Expr1, 
				Job.Category, 
				Job.City, 
				Job.DateClosing, 
				Job.DatePosted, 
				[Job].[Description], 
				Job.Requirements, 
				Job.Salary, 
				Job.Title, 
				[Job].[Type],				
				Job.JobState, 
				
				Employer.FirstName, 
				Employer.EmployerId, 
				Employer.LastName, 
				Employer.CName
				
	FROM        davat INNER JOIN Employer ON davat.EmployerId = Employer.EmployerId 
					  INNER JOIN Job ON davat.JobId = Job.JobId 
					  AND Employer.EmployerId = Job.EmployerId
					  
    WHERE		davat.DavatId = @DavatId
                
END
GO
/**************************************************************************/






SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  Get Employer By Id  */
create procedure GetEmployerById
	@EmployerId int
AS
BEGIN	
	SET NOCOUNT ON;

    SELECT     Employer.EmployerId, 
			   FirstName, 
			   Gender, 
			   JobTitle, 
			   LastName, 
               Mobile,
               NationalCode, 
               SHsh, 
               CAddress, 
               CCity,                
               CFax, 
               CName, 
               CPostalCode, 
               CTelephone, 
               UserLoginName, 
               Users.UserEmail
               
	FROM       Employer INNER JOIN Users ON Employer.EmployerId = Users.UserId and Users.UserId = @EmployerId
END
/*****************************************/




SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  Get Job By Id  */
create PROCEDURE GetJobById
	@jobId int
AS
BEGIN
	SET NOCOUNT ON;
	select [JobId]
      ,[Category]
      ,[City]
      ,[DatePosted]
      ,[DateClosing]
      ,[Description]
      ,[EmployerId]
      ,[Requirements]
      ,[Salary]
      ,[Title]
      ,[Type]
      from Job where JobId = @jobId
END
/*****************************************/





SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  Get My Jobs */
create PROCEDURE GetMyJobs
	@EmployerId int
AS
BEGIN	
	SET NOCOUNT ON;

	SELECT	Employer.EmployerId, 
			CName, 
			JobId, 
			City, 
			DatePosted, 
			DateClosing, 
			Title
	FROM    Employer INNER JOIN Job ON Employer.EmployerId = Job.EmployerId
	and Employer.EmployerId = @EmployerId
END
/*****************************************/





SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  Get Number Of Applicants  */
create PROCEDURE GetNumberOfApplicants
AS
BEGIN	
	SET NOCOUNT ON;
		
	select COUNT(*) from Users where UserRole = 'Applicant';	
END
/*****************************************/




SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  Get Number Of Employers  */
create PROCEDURE GetNumberOfEmployers
AS
BEGIN	
	SET NOCOUNT ON;
		
	select COUNT(*) from Users where UserRole = 'Employer';	
END
/*****************************************/




SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  Get User Authenticate  */
create PROCEDURE GetUserAuthenticate
(
	@LoginName nvarchar(50),
	@Password char(32)
)
AS
BEGIN	
	SET NOCOUNT ON;
    select COUNT(*) from Users where UserLoginName = @LoginName 
									and UserPassword = @Password
END
/*****************************************/




SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  Login  */
create PROCEDURE [Login]
(
	@LoginName nvarchar(50),
	@userLastLoginIP varchar(15)
)
AS
BEGIN	
	SET NOCOUNT ON;	
	
	declare @LoginDateTime datetime;		
	set @LoginDateTime = GETDATE();
	update Users set UserLastLoginDateTime = @LoginDateTime, userLastLoginIP = @userLastLoginIP where UserLoginName = @LoginName and UserActiveStatus = 1;	
	
	select UserId, UserPassword, UserRegisterTime, UserEmail, UserLastLoginDateTime, UserLastLoginIp, UserRole, UserActiveStatus from Users where UserLoginName = @LoginName and UserActiveStatus = 1;
END
/*****************************************/




SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  Post Job  */
create PROCEDURE PostJob
(	
	@Category			nvarchar(255),	
	@City				nvarchar(100),		
	@DatePosted			date,
	@DateClosing		date,	
	@Description		ntext,
	@EmployerId			int,	
	@Requirements		ntext,	
	@Salary				decimal(10,0),
	@Title				nvarchar(100),
	@Type				nvarchar(65)
)
AS
BEGIN	
	SET NOCOUNT ON;

	insert into Job
	(		
		Category,
		City,
		DatePosted,
		DateClosing,
		[Description],
		EmployerId,
		Requirements,
		Salary,
		Title,
		[Type]
	)
	values
	(		
		@Category,
		@City,
		@DatePosted,
		@DateClosing,
		@Description,
		@EmployerId,
		@Requirements,
		@Salary,
		@Title,
		@Type
	)
END
/*****************************************/




SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  Register Applicant  */
create PROCEDURE RegisterApplicant
(	
	@UserEmail			nvarchar(100),
	@UserLoginName		nvarchar(50),
	@UserPassword		char(32),
	@UserRegisterTime	datetime,	
	@UserRole			varchar(10),
		
	@BirthLocation		nvarchar(50),
	@BirthDate			date,
	@FirstName			nvarchar(50),
	@FotherName			nvarchar(50) ,
	@Gender				nvarchar(5) ,	
	@LastName			nvarchar(50) ,
	@MaritalStatus		nvarchar(5) ,
	@NationalCode		char(10),
	@SHsh				varchar(10) , 
	
	@Mobile				char(11) ,
	@HCity				nvarchar(65) ,
	@HPhone				nchar(12) ,
		
	@LJCity				nvarchar(65) ,
	@LJCompanyName		nvarchar(100) ,	
	@LJPhone			nchar(12) ,
	@LJTitle			nvarchar(100) ,
	
	@UniversityName		nvarchar(50) ,
	@UniversityCity		nvarchar(50) ,
	@Degree				nvarchar(50) ,
	@Major				nvarchar(50) ,
	@YearOfGraduation	char(4) ,
	@Average			Decimal(18, 0)
)	
AS
BEGIN
	SET NOCOUNT ON;
	
	insert into Users
	(
		UserEmail,
		UserLoginName,
		UserPassword,
		UserRegisterTime,
		UserRole
	)
	values
	(
		@UserEmail,
		@UserLoginName,
		@UserPassword,
		@UserRegisterTime,
		@UserRole
	)
    

	
	declare @UserId int;

	set @UserId = @@IDENTITY;
	
	insert into Applicant
	(
		ApplicantId,
					
		BirthLocation,
		BirthDate,
		FirstName,
		FotherName,
		Gender,
		LastName,
		MaritalStatus,
		NationalCode,
		SHsh,
		
		Mobile,
		HCity,
		HPhone,
			
		LJCity,
		LJCompanyName,
		LJPhone,
		LJTitle,
		
		UniversityName,
		UniversityCity,
		Degree,
		Major,
		YearOfGraduation,
		Average
	)
	values
	(
		@UserId,
				
		@BirthLocation,
		@BirthDate,
		@FirstName,
		@FotherName,
		@Gender,
		@LastName,
		@MaritalStatus,
		@NationalCode,
		@SHsh,
		
		@Mobile,
		@HCity,
		@HPhone,
			
		@LJCity,
		@LJCompanyName,
		@LJPhone,
		@LJTitle,
		
		@UniversityName,
		@UniversityCity,
		@Degree,
		@Major,
		@YearOfGraduation,
		@Average
	)	
END
/*****************************************/




SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*  Register Employer  */

create PROCEDURE RegisterEmployer
	@UserEmail nvarchar(100),
	@UserLoginName nvarchar(50), 
	@UserPassword char(32),
	@UserRegisterTime datetime,	
	@UserRole varchar(10),
	
	@EmployerFirstName	nvarchar(50),
	@EmployerGender	nvarchar(5),
	@EmployerJobTitle nvarchar(50),	
	@EmployerLastName	nvarchar(50),	
	@EmployerMobile	char(11),	
	@EmployerNationalCode char(10),
	@EmployerSHsh	varchar(10),
	
	@CAddress nvarchar(100),
	@CCity nvarchar(50),
	@CFax	varchar(12),
	@CName nvarchar(50),	
	@CPostalCode char(10),	
	@CTelephone	varchar(12)
	
AS
BEGIN	
	SET NOCOUNT ON;

insert into Users
(
	UserLoginName, 
	UserPassword,
	UserRegisterTime,
	UserEmail,
	UserRole 
)
values
(
	@UserLoginName, 
	@UserPassword,
	@UserRegisterTime,
	@UserEmail,
	@UserRole
)

declare @UserId int;

set @UserId = @@IDENTITY;


insert into Employer
(
	EmployerId,
		
	FirstName,
	Gender,
	JobTitle,
	LastName,
	Mobile,
	NationalCode,
	SHsh,
	
	CAddress,
	CCity,	
	CFax,
	CName,
	CPostalCode,
	CTelephone
)
values
(
	@UserId,
	
	@EmployerFirstName,
	@EmployerGender,
	@EmployerJobTitle,
	@EmployerLastName,
	@EmployerMobile,
	@EmployerNationalCode,
	@EmployerSHsh,
	
	@CAddress,
	@CCity,	
	@CFax,
	@CName,
	@CPostalCode,
	@CTelephone
)	
END
/*****************************************/






/*  Send Davat  */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create PROCEDURE SendDavat
	@EmployerId int,
	@ApplicantId int,
	@JobId int,
	@MessageBody ntext
AS
BEGIN	
	SET NOCOUNT ON;

    insert into davat(EmployerId, ApplicantId, JobId, body)
    values (@EmployerId, @ApplicantId, @JobId, @MessageBody)
END
GO
/**********************************************/