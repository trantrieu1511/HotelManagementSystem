use [MyHotel]

select * from Employee
select * from Customer
select * from Booking
select * from BookDetail
select * from BedType
select * from Room
select * from RoomType

--Employee Queries
insert into Employee(FirstName,LastName,Username,[Password]) values(N'Triệu',N'Trần','trantrieu123', '12345678')
insert into Employee(FirstName,LastName,Username,[Password],ReportsTo) values(N'Hà',N'Đặng','dangha', 'dangha','TRTR001')
insert into Employee(FirstName,LastName,Username,[Password],ReportsTo) values(N'Ngọc',N'Nguyễn','nguyenngoc', 'nguyenngoc','TRTR001')

update Employee
set LastName = N'Trần'
where Id = 1

--Customer Queries
insert into Customer values(N'A', N'Nguyễn Văn', 1, '20/10/2001', N'Số nhà 5, Tổ 10, Tân Hòa, HB, HB, VN', 'nguyenvana@gmail.com', '0945656677','nguyenvana')
----register----
insert into Customer(FirstName,LastName,Email,PhoneNumber,[Password]) values(N'B', N'Nguyễn Văn', 'nguyenvanb@gmail.com', '0916368677','nguyenvanb')


--BedType Queries
insert into BedType values('Single Bed')
insert into BedType values('Double Bed')
insert into BedType values('Triple Bed')

--RoomType Queries
insert into RoomType values('Standard Room')
insert into RoomType values('King Room')
insert into RoomType values('Suite Room')
insert into RoomType values('Family Room')
insert into RoomType values('Deluxe Room')
insert into RoomType values('Luxury Room')
insert into RoomType values('Superior Room')

--Room Queries
insert into Room values('')

--Booking Queries
insert into Booking values('')

--BookDetail Queries
insert into BookDetail values('')
