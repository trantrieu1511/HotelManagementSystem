use [MyHotel]

select * from Employee
select * from Customer order by Id desc
select * from Booking
select * from BookDetail
select * from BedType
select * from Room
select * from RoomTypeDetail
select * from RoomType

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
PaymentStatus = 1
where BookID = 1

--BookDetail Queries
select * from BookDetail
update BookDetail
set 
Amount = 350000
where BD_ID = 1

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

select top 3 b.*, bd.BD_ID, bd.CheckIn, bd.CheckOut, bd.Amount, r.RoomID,
r.[Name] as RoomName, r.[Floor], r.[View], rt.RoomTypeID, rt.[Name] as RoomTypeName, rt.Price,
rt.Img, rt.[Description], rt.Adult, rt.Children
from Booking b full outer join BookDetail bd
on b.BookID = bd.BookID full outer join Room r
on bd.RoomID = r.RoomID full outer join RoomType rt
on r.RoomTypeID = rt.RoomTypeID 
where 
(select MAX(CheckOut) from BookDetail) <= '2022-09-29' or 
PaymentStatus = 1 or PaymentStatus is null and
rt.RoomTypeID = 1
order by r.RoomID asc

--count rooms that are available to some condition
select rt.RoomTypeID, Count(*) as 'NoOfAvailableRoom' from Booking b full outer join BookDetail bd
on b.BookID = bd.BookID full outer join Room r
on bd.RoomID = r.RoomID full outer join RoomType rt
on r.RoomTypeID = rt.RoomTypeID 
where PaymentStatus = 1 or PaymentStatus is null
and r.RoomTypeID = 1
group by rt.RoomTypeID

select * from Booking b full outer join BookDetail bd
on b.BookID = bd.BookID full outer join Room r
on bd.RoomID = r.RoomID full outer join RoomType rt
on r.RoomTypeID = rt.RoomTypeID 
where PaymentStatus = 1 or PaymentStatus is null
and r.RoomTypeID = 1

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