--CREATE DATABASE [MyHotel]
--DROP DATABASE [MyHotel]
USE [MyHotel]

CREATE TABLE Customer(
	Id INT identity,
    CusID AS (UPPER(LEFT(CAST(FirstName as varchar),1) + LEFT(CAST(LastName as varchar),1))
    + REPLICATE('0', 5-LEN(Id)) + CAST(Id AS VARCHAR)) PERSISTED PRIMARY KEY,
	FirstName nvarchar(25) not null,
	LastName nvarchar(25) not null,
	Gender bit,
	DOB varchar(50),
	[Address] nvarchar(MAX),
	Email varchar(35) not null,
	PhoneNumber varchar(35) not null,
)

CREATE TABLE Account(
	CusID varchar(8000) not null,
	Username varchar(25) primary key,
	[Password] varchar(25) not null,
	Roll smallint not null default 0, -- 0: Customer, 1: Manager, 2: Receptionist
	FOREIGN KEY (CusID) REFERENCES Customer (CusID)
)

CREATE TABLE RoomType(
	RoomTypeID int identity(1,1) primary key,
	[Name] nvarchar(100) not null
)

CREATE TABLE Booking(
	BookID int identity(1,1) primary key,
	CusID varchar(8000) not null,
	BookDate varchar(50) not null,
	PaymentStatus bit default 0 not null,
	FOREIGN KEY (CusID) REFERENCES [Customer] (CusID)
)

CREATE TABLE Room(
	RoomID int identity(1,1) primary key,
	[Name] varchar(20) not null,
	RoomTypeID int not null,
	Price money not null,
	[Floor] int not null,
	[View] nvarchar(MAX),
	img nvarchar(MAX),
	foreign key (RoomTypeID) references RoomType (RoomTypeID)
)

CREATE TABLE BedType(
	BedTypeID int identity(1,1) primary key,
	[Name] nvarchar(100) not null,
	RoomID int not null,
	Amount int not null,
	foreign key (RoomID) references Room (RoomID),
)

CREATE TABLE BookDetail(
	BD_ID int identity(1,1) primary key,
	BookID int not null,
	RoomID int not null,
	CheckIn varchar(50) not null,
	CheckOut varchar(50) not null,
	foreign key (BookID) references Booking (BookID),
	foreign key (RoomID) references Room (RoomID)
)