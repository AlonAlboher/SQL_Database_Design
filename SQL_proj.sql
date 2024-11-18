
--===================================================
-----------------------ERD PROJECT TABLES -------------------
--===================================================


---- Subscription
CREATE TABLE dbo.Subscription
(
	SubscriptionID INT IDENTITY(1,1) PRIMARY KEY,
    Subscription Nvarchar(20) NOT null check(Subscription in ('Regular', 'Platinum', 'Gold'))
)

insert into dbo.Subscription (Subscription)
values ( 'Regular'),
       ( 'Gold'),
       ( 'Platinum')


select *
from dbo.Subscription

---- User Role
CREATE TABLE dbo.UserRole
(
	UserRoleID INT IDENTITY(1,1) PRIMARY KEY,
    UserRole Nvarchar(20) NOT null check (UserRole in ('Member', 'Writer', 'Admin', 'Contributor'))
)

insert into dbo.UserRole (UserRole)
values ( 'Member'),
       ('Contributor'),
       ( 'Writer'),
	   ( 'Admin')

select *
from dbo.UserRole


--- Users
CREATE TABLE dbo.Users
(
	UserID INT IDENTITY(1,1) PRIMARY KEY,
	UserName Nvarchar(20) CHECK(LEN(username) >= 5 ) NOT NULL UNIQUE,
	User_Password Nvarchar(10) CHECK(LEN(User_Password) >= 8 ) NOT NULL,
	UserEmail Nvarchar(50) CHECK(UserEmail like '%@%.%') UNIQUE,
	Phone Nvarchar(13) not null CHECK(LEN(Phone)  between 9 and 10  
	AND Phone like '0%') UNIQUE,
	UserRoleID int references dbo.UserRole (UserRoleID),
	SubscriptionID int references dbo.Subscription (SubscriptionID),
	CreatedAt Datetime NOT NULL DEFAULT(GETDATE())
)

insert into dbo.Users (UserName,User_Password,UserEmail,Phone,UserRoleID, SubscriptionID)
values ( 'Veredb', '12345678', 'v@gmail.com', '0542004195', '1','1')

insert into dbo.Users (UserName,User_Password,UserEmail,Phone,UserRoleID, SubscriptionID)
values ( 'AlonA', '87654321', 'A@gmail.co.il', '099713733', '2','3'),
		( 'MaayanB', '123987456', 'M@walla.com', '0541234741', '3','3'),
		( 'RaananP', '74185263', 'R@Oops.uk.il', '0527415236', '4','2')

select *
from dbo.Users

---- Pages 
CREATE TABLE dbo.Pages
(
	PageID INT IDENTITY(1,1) PRIMARY KEY,
	Creartor_UserID int references dbo.Users (UserID) NOT NULL,
	LastEditor_UserID int references dbo.Users (UserID),
	Creation_Date Datetime NOT NULL DEFAULT(GETDATE()), 
	Last_Edit_date Datetime DEFAULT(GETDATE()), 
	URLlink Nvarchar(80) CHECK(LEN(URLlink) >= 5
	                      AND URLlink  LIKE 'www.%.%') NOT NULL,
    Title Nvarchar(80) CHECK(LEN(Title) >= 5) default (CAST (getdate() AS Nvarchar (30))),
	Page_Category Nvarchar(30) CHECK(LEN(Page_Category) >= 1) default ('General'),
	Access_Level int references dbo.Subscription (SubscriptionID) default (1),
	Short_description Nvarchar(100) CHECK(LEN(Short_description) >= 1)
)

insert into dbo.Pages (Creartor_UserID ,LastEditor_UserID,URLlink, Title,Page_Category,Access_Level, Short_description  )
values ( '1', '1', 'www.22.com', 'Fun with SQL','sports', '2', 'xxxxx')

insert into dbo.Pages (Creartor_UserID ,LastEditor_UserID,URLlink, Title,Page_Category,Access_Level, Short_description  )
values ( '2', '1', 'www.123.com', 'SQL How to','DIY', '1', 'IpsumLorem'),
		( '3', '3', 'www.321.com', 'SQL test3','Test', '1', 'Its a me'),
		( '4', '1', 'www.741.com', 'SQL testmore','Test', '3', 'OOps')

insert into dbo.Pages (Creartor_UserID ,URLlink, Title,Page_Category,Access_Level, Short_description  )
values ( '2', 'www.789.com', 'Error','Errors', '1', 'lets see')


select *
from dbo.Pages

---- Comments 
CREATE TABLE dbo.Comments
(
	CommentID INT IDENTITY(1000000,1) PRIMARY KEY,
	UserID int references dbo.Users (UserID),
	PageID int references dbo.pages (PageID),
	Parent_Comment_ID int REFERENCES dbo.Comments (CommentID),
	Post_Date Datetime NOT NULL DEFAULT(GETDATE()), 
	CommentContent Nvarchar(250) CHECK(LEN(CommentContent) >= 2 ) NOT NULL,
	Likes int default (0), 
	Dislikes int default (0),
)

insert into dbo.Comments (UserID,PageID, CommentContent)
values ( '1', '1', 'xxxxxxxx')

insert into dbo.Comments (UserID,PageID, Parent_Comment_ID, Post_Date, CommentContent, Likes, Dislikes)
values ( '3', '2', '1000000', '2024-03-20', 'Testing123', '3', '1'),
		( '2', '2', '1000000', '2024-03-22', 'OopsiTest', '1', '0')

insert into dbo.Comments (UserID,PageID, CommentContent)
values ( '2', '1', 'WTF?'),
		( '3', '1', 'Hello World')

select *
from dbo.Comments
-------------------------------------

CREATE TABLE dbo.SubscriptionHistory
(
	UserID int references dbo.Users (UserID),
    SubscriptionID int references dbo.Subscription (SubscriptionID),
	StartDate Datetime NOT NULL DEFAULT(GETDATE()),
	EndDate Datetime,
)

insert into dbo.SubscriptionHistory (UserID, SubscriptionID, StartDate, EndDate)
values ( '1','1', '2024-01-01','2024-02-28'),
       ( '2','1', '2024-01-01','2024-02-28')

insert into dbo.SubscriptionHistory (UserID, SubscriptionID, StartDate)
values ( '1','2', '2024-03-01'),
       ( '2','3', '2024-03-01'),
	   ( '3','1', '2024-02-01'),
	   ( '4','1', '2024-01-01')


select *
from dbo.SubscriptionHistory

-----------------------------------

CREATE TABLE dbo.UserRoleHistory
(
	UserID int references dbo.Users (UserID),
    UserRoleID int references dbo.UserRole (UserRoleID),
	StartDate Datetime NOT NULL DEFAULT(GETDATE()),
	EndDate Datetime,
)

insert into dbo.UserRoleHistory (UserID, UserRoleID, StartDate, EndDate)
values ( '1','1', '2024-01-01','2024-02-28'),
       ( '2','1', '2024-01-01','2024-02-28')

insert into dbo.UserRoleHistory (UserID, UserRoleID, StartDate)
values ( '1','2', '2024-03-01'),
       ( '2','3', '2024-03-01'),
	   ( '3','1', '2024-02-01'),
	   ( '4','1', '2024-01-01')

select *
from dbo.UserRoleHistory

-----------------------------------------

select * from dbo.Subscription
select * from  dbo.Users
select * from  dbo.Pages
select * from  dbo.Comments
select * from  dbo.SubscriptionHistory
select * from  dbo.UserRoleHistory

--delete table from data base
drop TABLE dbo.Subscription
drop TABLE dbo.UserRole
drop TABLE dbo.Users
drop table dbo.Pages
drop table dbo.Comments
drop table dbo.SubscriptionHistory
drop table dbo.UserRoleHistory
--------
