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
	[Password] varchar(35) not null
)

CREATE TABLE RoomType(
	RoomTypeID int identity(1,1) primary key,
	[Name] nvarchar(100) not null
)

CREATE TABLE BedType(
	BedTypeID int identity(1,1) primary key,
	[Name] nvarchar(100) not null
)

CREATE TABLE Booking(
	BookID int identity(1,1) primary key,
	CusID varchar(8000),
	BookDate varchar(50) not null,
	PaymentStatus bit default 0 not null,
	FOREIGN KEY (CusID) REFERENCES [Customer] (CusID)
)

CREATE TABLE Room(
	RoomID int identity(1,1) primary key,
	[Name] varchar(20) not null,
	RoomTypeID int not null,
	BedTypeID int not null,
	Bed int not null,
	Price money not null,
	[Floor] int not null,
	[View] nvarchar(MAX),
	Adult int not null,
	Child int not null,
	foreign key (BedTypeID) references BedType (BedTypeID),
	foreign key (RoomTypeID) references RoomType (RoomTypeID)
)

CREATE TABLE BookDetail(
	DetailID int identity(1,1) primary key,
	BookID int not null,
	RoomID int not null,
	CheckIn varchar(50) not null,
	CheckOut varchar(50) not null,
	foreign key (BookID) references Booking (BookID),
	foreign key (RoomID) references Room (RoomID)
)