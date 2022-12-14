use [MyHotel]

select * from Employee
select * from Customer order by CusID desc
select * from Booking
select * from BookDetail
select * from BedType
select * from Room
select * from RoomTypeDetail
select * from RoomType

update Room
set isAvailable = 1

update Booking
set BookDate = '2022-09-22 11:20'
where BookID = 1

--Employee Queries

select * from Customer where Email = 'nguyenvana@gmail.com' and [Password] = 'nguyenvana'

delete from Employee where Id = 5

update Employee
set 
--LastName = N'Trần',
Gender = 'true'
where Id = '1'

--Customer Queries

delete from Customer where Id = '2'

--get latest Customer by their email
select top 1 * from Customer
where Email = 'nguyenvana@gmail.com'
order by CusID desc

--BedType Queries
select * from BedType

--RoomType Queries
select * from RoomType

update RoomType 
set [Description] = 'The Royal Suite has a total area of ​​about 70m2, which is divided into a bedroom and a separate living room with a small balcony with tea table outside so you can enjoy it. Wake up to the sun or sunset. Our Royal Suite rooms with unique architecture and luxurious interior will bring you the feeling of comfort, into a luxurious and classy space.'
where RoomTypeID = 3

update RoomType 
set 
--[Description] = N'phòng tiêu chuẩn trong khách sạn, là loại phòng đơn giản nhất với những trang bị tối thiểu, có diện tích nhỏ, ở tầng thấp, không có view hoặc view không đẹp. Đây là loại phòng có mức giá thấp nhất trong khách sạn',
Img = 'images/room-2.jpg'
where RoomTypeID = 5

update RoomType
set 
Adult = 4, 
Children = 3
where RoomTypeID = 2

update RoomType
set 
Adult = 3, 
Children = 2
where RoomTypeID = 3

--RoomTypeDetail Queries
--select r.RoomID, r.[Name], r.[Floor], r.[View], rt.* from Room r join RoomType rt on r.RoomTypeID = rt.RoomTypeID 
--order by r.[Name]
--select r.RoomID, r.[Name], r.[Floor], r.[View], rt.*, rd.RD_ID, rd.BedAmount, bt.* from Room r join RoomType rt on r.RoomTypeID = rt.RoomTypeID 
--join RoomDetail rd on r.RoomID = rd.RoomID join BedType bt on rd.BedTypeID = bt.BedTypeID
select * from RoomTypeDetail
delete from RoomTypeDetail where RTD_ID = 2
--select RoomTypeDetail
select * from RoomType rt join RoomTypeDetail rtd
on rt.RoomTypeID = rtd.RoomTypeID where rt.RoomTypeID = 2

--Room Queries
select * from Room order by Name
select distinct Name from Room
select * from RoomType

update Room
set 
[View] = N'Normal view',
[Name] = '206'
where RoomID = 25

--Booking Queries
select * from Booking
update Booking
set 
PaymentStatus = 0
where BookID = 1

--select lastest booking by CusID
select top 1 * from Booking where CusID = 'CUS00001'
order by BookID desc

--select Booking with CheckIn, CheckOut
select b.*, bd.CheckIn, bd.CheckOut from Booking b join BookDetail bd
on b.BookID = bd.BookID where b.CusID = 'CUS00002'

--cancel booking query
update Booking
set 
isCancelled = 1,
PaymentStatus = 1
where 
--CusID = 'CUS00001' and 
--BookID = (select top 1 BookID from Booking where CusID = 'CUS00001' 
--order by BookID desc)
BookID = 8

--set room to unavailable query
update Room set
isAvailable = 1
where RoomID = 16

--manage booking query
select distinct b.BookID, b.BookDate ,b.PaymentStatus, b.isCancelled, bd.CheckIn, bd.CheckOut, SUM(bd.Amount) as 'TotalPrice' from Booking b full outer join BookDetail bd
on b.BookID = bd.BookID where b.CusID = 'CUS00001'
group by b.BookID, b.BookDate, bd.CheckIn, bd.CheckOut, b.PaymentStatus, b.isCancelled

--BookDetail Queries
select * from BookDetail
update BookDetail
set 
Amount = 350000
where BD_ID = 1

--delete from BookDetail where BD_ID = 2
update BookDetail set BookID = 3 where BD_ID = 1002

--display booking detail by BookID
select * from Booking b full outer join BookDetail bd
on b.BookID = bd.BookID
where b.BookID = 4

--display booking detail printed by BookID
select b.*, bd.BD_ID, bd.CheckIn, bd.CheckOut, bd.Amount, r.RoomID,
r.[Name], r.[Floor], r.[View], rt.RoomTypeID, rt.[Name], rt.Price, 
rt.Adult, rt.Children 
from Booking b full outer join BookDetail bd
on b.BookID = bd.BookID full outer join Room r
on bd.RoomID = r.RoomID full outer join RoomType rt
on r.RoomTypeID = rt.RoomTypeID
where b.BookID = 4

--display all RoomType in hotel
select * from RoomType

--display availability of Rooms
select b.*, bd.BD_ID, bd.CheckIn, bd.CheckOut, bd.Amount, r.RoomID,
r.[Name], r.[Floor], r.[View], rt.RoomTypeID, rt.[Name], rt.Price,
rt.Img, rt.[Description], rt.Adult, rt.Children
from Booking b full outer join BookDetail bd
on b.BookID = bd.BookID full outer join Room r
on bd.RoomID = r.RoomID full outer join RoomType rt
on r.RoomTypeID = rt.RoomTypeID 
where 
PaymentStatus = 1 or PaymentStatus is null
--bd.CheckIn >= '2022-10-05' and 
--bd.CheckIn < '2022-10-07' and 
--bd.CheckOut > '2022-10-07'
--or bd.CheckIn is null and bd.CheckOut is null
--and r.RoomTypeID = 1
--and rt.Adult >= 2 and rt.Children >= 2

select b.*, bd.BD_ID, bd.CheckIn, bd.CheckOut, bd.Amount, r.RoomID,
r.[Name] as RoomName, r.[Floor], r.[View], rt.RoomTypeID, rt.[Name] as RoomTypeName, rt.Price,
rt.Img, rt.[Description], rt.Adult, rt.Children
from Booking b full outer join BookDetail bd
on b.BookID = bd.BookID full outer join Room r
on bd.RoomID = r.RoomID full outer join RoomType rt
on r.RoomTypeID = rt.RoomTypeID 
where 
bd.CheckOut <= '2022-10-17' and 
b.PaymentStatus = 1 and
rt.RoomTypeID = 1 or 
b.PaymentStatus is null and
rt.RoomTypeID = 1
order by r.RoomID asc

--select available rooms query
select distinct top 3 r.RoomID, r.[Name] as RoomName, 
r.[Floor], r.[View], rt.RoomTypeID, rt.[Name] as RoomTypeName, 
rt.Adult, rt.Children, rt.Price
from Room r full outer join RoomType rt
on r.RoomTypeID = rt.RoomTypeID 
where r.isAvailable = 1 and
rt.RoomTypeID = 1
order by r.RoomID asc

--room single query
select r.RoomID, r.[Name] as RoomName, 
r.[Floor], r.[View], rt.RoomTypeID, rt.[Name] as RoomTypeName, 
rt.Adult, rt.Children, rt.Price, rt.[Description]
from Room r full outer join RoomType rt
on r.RoomTypeID = rt.RoomTypeID 
where 
--r.isAvailable = 1 and
rt.RoomTypeID = 1
order by r.RoomID asc

--select room detail by bookID
select b.NumOfAdult, b.NumOfChildren, r.RoomID, r.[Name] as RoomName, 
r.[Floor], r.[View], rt.RoomTypeID, rt.[Name] as RoomTypeName, 
rt.Adult, rt.Children, rt.Price, rt.[Description]
from Booking b full outer join BookDetail bd
on b.BookID = bd.BookID full outer join Room r
on bd.RoomID = r.RoomID full outer join RoomType rt
on r.RoomTypeID = rt.RoomTypeID
where 
b.BookID = 4
order by r.RoomID asc

--room single views query
select distinct r.[View]
from Room r full outer join RoomType rt
on r.RoomTypeID = rt.RoomTypeID 
where rt.RoomTypeID = 1

--count rooms that are available
select rt.RoomTypeID, Count(*) as 'NoOfAvailableRoom' 
from Room r full outer join RoomType rt
on r.RoomTypeID = rt.RoomTypeID 
where r.isAvailable = 1
group by rt.RoomTypeID

select * 
from Room r full outer join RoomType rt
on r.RoomTypeID = rt.RoomTypeID 
where r.isAvailable = 1

--select BedTypes and BedAmount of a RoomType
select rtd.RTD_ID, rtd.RoomTypeID, bt.[Name], 
rtd.BedAmount from RoomTypeDetail rtd join BedType bt
on rtd.BedTypeID = bt.BedTypeID where rtd.RoomTypeID = 2

select rtd.RTD_ID, rt.[Name], bt.[Name], 
rtd.BedAmount from RoomType rt join RoomTypeDetail rtd 
on rt.RoomTypeID = rtd.RoomTypeID join BedType bt
on rtd.BedTypeID = bt.BedTypeID where rtd.RoomTypeID = 2

--select rooms according to customer's demand (recommend the cheapest room)
--select * from RoomType where Adult * @roomnum <= @adult and Children * @roomnum <= @children
--and Price = MIN(Price)

select * from RoomType where Adult <= 6 and Children >= 1

select * from RoomType where Adult >= 4 and Children >= 3

select * from RoomType where 8 / Adult = 2 and Children >= 0 and RoomTypeID = 0


select * from RoomType where 
(select sum(Adult) from RoomType) <= 6 
and (select sum(Children) from RoomType) <= 6


select b.*, Sum(Amount) as 'Tổng giá' from Booking b full outer join BookDetail bd
  on b.BookID = bd.BookID where b.isCancelled = 'true'
  group by b.BookID, b.CusID, b.BookDate, b.NumOfAdult, b.NumOfChildren, b.NumOfRoom,
  b.PaymentStatus, b.SpecialRequests, b.isCancelled

  select c.LastName + ' ' + c.FirstName as 'Fullname', b.BookDate, b.NumOfAdult, b.NumOfChildren,
  b.NumOfRoom, r.[Name] as 'RoomName', rt.[Name] as 'RoomTypeName', b.PaymentStatus, b.isCancelled,
  bd.Amount
  from Booking b join BookDetail bd
  on b.BookID = bd.BookID join Customer c
  on c.CusID = b.CusID join Room r
  on r.RoomID = bd.RoomID join RoomType rt
  on r.RoomTypeID = rt.RoomTypeID