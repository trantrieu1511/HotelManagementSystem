--CREATE DATABASE [MyHotel]
--DROP DATABASE [MyHotel]
USE [MyHotel]
--USE [master]

CREATE TABLE Customer(
	Id INT identity,
    CusID AS ('CUS'
    + REPLICATE('0', 5-LEN(Id)) + CAST(Id AS NVARCHAR)) PERSISTED PRIMARY KEY,
	FirstName nvarchar(25) not null,
	LastName nvarchar(25) not null,
	Gender bit,
	DOB varchar(50),
	[Address] nvarchar(MAX),
	Email varchar(35) not null,
	PhoneNumber varchar(35),
	[Password] varchar(25)
)

CREATE TABLE Employee(
	Id INT identity,
    EmpID AS (UPPER(LEFT(FirstName,1) + LEFT(LastName,1))
    + REPLICATE('0', 5-LEN(Id)) + CAST(Id AS NVARCHAR)) PERSISTED PRIMARY KEY,
	FirstName nvarchar(25) not null,
	LastName nvarchar(25) not null,
	Gender bit,
	DOB varchar(50),
	HireDate varchar(50),
	[Address] nvarchar(MAX),
	Email varchar(35),
	PhoneNumber varchar(35),
	Username varchar(25) not null,
	[Password] varchar(25) not null,
	ReportsTo nvarchar(4000),
	FOREIGN KEY (ReportsTo) REFERENCES Employee (EmpID)
)

CREATE TABLE RoomType(
	RoomTypeID int identity(1,1) primary key,
	[Name] nvarchar(100) not null,
	Price money not null,
	Img nvarchar(MAX),
	[Description] nvarchar(MAX),
	Adult int not null,
	Children int not null
)

CREATE TABLE BedType(
	BedTypeID int identity(1,1) primary key,
	[Name] nvarchar(100) not null
)

CREATE TABLE RoomTypeDetail(
	RTD_ID int identity primary key,
	RoomTypeID int not null,
	BedTypeID int not null,
	BedAmount int not null,
	foreign key (RoomTypeID) references RoomType (RoomTypeID),
	foreign key (BedTypeID) references BedType (BedTypeID)
)

CREATE TABLE Room(
	RoomID int identity(1,1) primary key,
	[Name] varchar(20) not null,
	RoomTypeID int not null,
	[Floor] int not null,
	[View] nvarchar(MAX),
	isAvailable bit default 1 not null,
	foreign key (RoomTypeID) references RoomType (RoomTypeID)
)

CREATE TABLE Booking(
	BookID int identity(1,1) primary key,
	CusID nvarchar(4000) not null,
	BookDate datetime not null,
	NumOfAdult int not null,
	NumOfChildren int not null,
	NumOfRoom int not null,
	PaymentStatus bit default 0 not null,
	SpecialRequests nvarchar(MAX),
	isCancelled bit default 0 not null
	FOREIGN KEY (CusID) REFERENCES [Customer] (CusID)
)

CREATE TABLE BookDetail(
	BD_ID int identity(1,1) primary key,
	BookID int not null,
	RoomID int not null,
	CheckIn date not null,
	CheckOut date not null,
	Amount money not null,
	foreign key (BookID) references Booking (BookID),
	foreign key (RoomID) references Room (RoomID)
)