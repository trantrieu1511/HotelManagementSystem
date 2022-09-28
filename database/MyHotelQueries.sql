use [MyHotel]

select * from Employee
select * from Customer order by Id desc
select * from Booking
select * from BookDetail
select * from BedType
select * from Room
select * from RoomTypeDetail
select * from RoomType

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

--BookDetail Queries
select * from BookDetail
update BookDetail
set Amount = 350000
where BD_ID = 1

--display all RoomType in hotel
select * from RoomType

--display availability of Rooms (recommend rooms)
select b.*, bd.BD_ID, bd.CheckIn, bd.CheckOut, bd.Amount, r.RoomID,
r.[Name], r.[Floor], r.[View], rt.RoomTypeID, rt.[Name], rt.Price,
rt.Img, rt.[Description], rt.Adult, rt.Children
from Booking b full outer join BookDetail bd
on b.BookID = bd.BookID full outer join Room r
on bd.RoomID = r.RoomID full outer join RoomType rt
on r.RoomTypeID = rt.RoomTypeID 
where PaymentStatus = 1 or PaymentStatus is null
--and r.RoomTypeID = 1
and rt.Adult >= 2 and rt.Children >= 2

select rtd.RTD_ID, rtd.RoomTypeID, bt.[Name], 
rtd.BedAmount from RoomTypeDetail rtd join BedType bt
on rtd.BedTypeID = bt.BedTypeID where rtd.RoomTypeID = 2