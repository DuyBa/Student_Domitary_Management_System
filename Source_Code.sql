-- Step 1
-- Create database
create database Student_Domitary_Managemnet_System
go

-- Active database
use Student_Domitary_Managemnet_System
go

-- Step 2
-- Create tables

-- Create contract table
create table Contractt
(
	Contract_Id nvarchar(100) not null,
	Contract_Date date,
	Contract_Starting_Date date,
	Contract_Ending_Date date,
)
go

-- Create student table
create table Student
(
	Student_Id nvarchar(50) not null,
	Student_Name nvarchar(100),
	Student_DOB date,
	Student_Sex nvarchar(10),
	Student_PN nvarchar(20),
	Student_CI nvarchar(20),
	Student_Class_Grade nvarchar(50),
)
go

-- Create room table
create table Room
(
	Room_Id nvarchar(20) not null,
	Area_Id nvarchar(20) not null,
	Room_Status nvarchar(20),
	Number_of_Student int,
	Room_Description nvarchar(255),
)
go

-- Create staff table
create table Staff
(
	Staff_Id nvarchar(20) not null,
	Staff_Name nvarchar(100),
	Staff_PN nvarchar(20),
	Staff_Sex nvarchar(10),
	Staff_DOB date,
	Staff_Position nvarchar(50),
	Staff_Address nvarchar(255),
	Staff_Description nvarchar(200),
)
go

-- Create bill table
create table Bill
(
	Bill_Id nvarchar(20) not null,
	Bill_Date date,
	Bill_Value int,
	Bill_Month date,
	Electric_Id nvarchar(20),
	Electric_Starting_Index int,
	Electric_Ending_Index int,
	Water_Id nvarchar(20),
	Water_Starting_Index int,
	Water_Ending_Index int,
)
go

-- Step 3: Create Constrain -> Primary Key & Foreign Key

-- Primary Key

alter table Contractt
	add constraint PK_Contract primary key (Contract_Id);
	go

alter table Student
	add constraint PK_Student primary key (Student_Id);
	go

alter table Room
	add constraint PK_Room primary key (Room_Id, Area_Id);
	go

alter table Staff
	add constraint PK_Staff primary key (Staff_Id);
	go

alter table Bill
	add constraint PK_Bill primary key (Bill_Id);
	go

-- Foreign Key 

alter table Contractt
	add Student_Id nvarchar(50)
	constraint FK_Contract_Student_Id
		foreign key (Student_Id)
		references Student(Student_Id);

alter table Contractt
	add Staff_Id nvarchar(20)
	constraint FK_Contract_Staff_Id
		foreign key (Staff_Id)
		references Staff(Staff_Id);


 
