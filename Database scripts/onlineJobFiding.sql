use OnlineJobFinding

--drop table davat
--drop table [applications] 
--drop table FavoriteJobs
--drop table job 
--drop table employer
--drop table administrator
--drop table applicant
--drop table users
--drop table anchor



create table Users
(
	UserId				int identity unique not null,	
	UserLoginName		nvarchar(50) not null,
	UserPassword		char(32) not null,		
	UserRegisterTime	datetime not null,
	UserEmail			nvarchar(100) not null,
	UserLastLoginDateTime datetime null,
	UserLastLoginIp		varchar(15)  null,
	UserRole			varchar(10) not null,
	UserActiveStatus	bit default 1 not null,
	primary key			(UserId, UserEmail, UserLoginName)
)

create table Applicant
(
	ApplicantId			int primary key constraint FKApplicantId foreign key references Users(UserId) on delete cascade on update cascade not null,	
	
	BirthLocation		nvarchar(50) not NULL,
	BirthDate			date not NULL,
	FirstName			nvarchar(50) not NULL,
	FotherName			nvarchar(50) not null,
	Gender				nvarchar(5) not NULL,	
	LastName			nvarchar(50) not NULL,
	MaritalStatus		nvarchar(5) not NULL,
	NationalCode		char(10) not null,
	SHsh				varchar(10) not null, 
	
	Mobile				char(11) not NULL,
	HCity				nvarchar(65) not NULL,
	HPhone				nchar(12) not NULL,
		
	LJCity				nvarchar(65) not NULL,
	LJCompanyName		nvarchar(100) not null,	
	LJPhone				nchar(12) not NULL,
	LJTitle				nvarchar(100) not null,
	
	UniversityName		nvarchar(50) not null,
	UniversityCity		nvarchar(50) not null,
	Degree				nvarchar(50) not null,
	Major				nvarchar(50) not null,
	YearOfGraduation	char(4) not null,
	Average				Decimal(18, 0) not null,
	[ApplicantState]	nvarchar(20) default '»Â œ‰»«· ‘€·'
)

create TABLE Employer (
	EmployerId			int primary key constraint FKEmployer foreign key references Users(UserId) on delete cascade on update cascade not null,
	
	FirstName			nvarchar(50) not null,
	Gender				nvarchar(5) not null,
	JobTitle			nvarchar(50) not null,	
	LastName			nvarchar(50) not null,	
	Mobile				char(11) not null,
	NationalCode		char(10) not null,
	SHsh				varchar(10) not null,
	
	CAddress			nvarchar(100) not null,
	CCity				nvarchar(50) not null,	
	CFax				varchar(12) not null,
	CName				nvarchar(50) not null,
	CPostalCode			char(10) not null,	
	CTelephone			varchar(12) not null
)

create table Administrator
(	
	AdministratorId		int primary key constraint FKAdministratorId foreign key references Users(UserId) on delete cascade on update cascade not null,
	FirstName			nvarchar(50) not null,
	LastName			nvarchar(50) not null
)

create table Job
(
	JobId				int NOT NULL identity primary key,
	EmployerId			int constraint FKEmpJob foreign key references Employer(EmployerId) on delete cascade on update cascade not null,
	
	Category			nvarchar(100) not NULL,	
	City				nvarchar(50) not NULL,		
	DatePosted			date not NULL,
	DateClosing			date not NULL,	
	[Description]		ntext not null,	
	Requirements		ntext not null,
	Salary				decimal(10,0) not NULl,
	Title				nvarchar(100) NOT NULL,
	[Type]				nvarchar(50) not NULL,	
	[JobState]			varchar(10) default '»«“'
)

create table Applications
(
	ApplicationId		int identity primary key NOT NULL,
	ApplicantId			int constraint FKApplApp foreign key references Applicant(ApplicantId) on delete cascade on update cascade NOT NULL,
	JobId				int constraint FKAllpJob foreign key references Job(JobId) on delete no action on update no action not null,
	DateApplied			datetime NOT NULL
	UNIQUE (ApplicantId ,JobId)
)

create table Anchor
(
	[Address] nvarchar(100) not null,
	Name nvarchar(100) not null,
	AnchorId int primary key identity not null
)

Create table FavoriteJobs
(
	JobId				int foreign key references Job(JobId) on delete no action on update no action not null,
	ApplicantId			int constraint FJA foreign key references Applicant(ApplicantId) on delete cascade on update cascade not null,
	FJState				varchar(10) default '»«“'
)

create table davat
(	
	DavatId int primary key identity not null,	
	EmployerId int foreign key references Employer(EmployerId) on delete cascade on update cascade not null ,
	ApplicantId int foreign key references Applicant(ApplicantId) on delete no action on update no action not null,	
	JobId int foreign key references Job(JobId) on delete no action on update no action not null,	
	body ntext not null,
	davatState nvarchar(20) default '»«“'
)

