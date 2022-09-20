use [MyHotel]

select * from Employee
select * from Customer order by Id desc
select * from Booking
select * from BookDetail
select * from BedType
select * from Room
select * from RoomType

--Employee Queries
insert into Employee(FirstName,LastName,Username,[Password]) values(N'Triệu',N'Trần','trantrieu123', '12345678')
insert into Employee(FirstName,LastName,Username,[Password],ReportsTo) values(N'Hà',N'Đặng','dangha', 'dangha','TRTR001')
insert into Employee(FirstName,LastName,Username,[Password],ReportsTo) values(N'Ngọc',N'Nguyễn','nguyenngoc', 'nguyenngoc','TRTR001')
insert into Employee(FirstName,LastName,Username,[Password],ReportsTo) values(N'Chinh',N'Nguyễn','nguyenchinh', 'nguyenchinh','TRTR001')
insert into Employee(FirstName,LastName,Username,[Password],ReportsTo) values(N'Hiếu',N'Trần','tranhieu', 'tranhieu',N'HÀĐẶ002')

select * from Customer where Email = 'nguyenvana@gmail.com' and [Password] = 'nguyenvana'

delete from Employee where Id = 5

update Employee
set 
--LastName = N'Trần',
Gender = 'true'
where Id = '1'

--Customer Queries
insert into Customer values(N'A', N'Nguyễn Văn', 1, '20/10/2001', N'Số nhà 5, Tổ 10, Tân Hòa, HB, HB, VN', 'nguyenvana@gmail.com', '0945656677','nguyenvana')
----register----
insert into Customer(FirstName,LastName,Email,PhoneNumber,[Password]) values(N'B', N'Nguyễn Văn', 'nguyenvanb@gmail.com', '0916368677','nguyenvanb')
insert into Customer(FirstName,LastName,Email,PhoneNumber,[Password]) values(N'Vi', N'Ánh Quang', 'anhquangvi@gmail.com', '0956478933','anhquangvi')
insert into Customer(FirstName,LastName,Email,PhoneNumber,[Password]) values(N'Vu', N'Vi Văn', 'vivanvu@gmail.com', '0123321456','vivanvu')
insert into Customer(FirstName,LastName,Email,PhoneNumber,[Password]) values(N'Vẻ', N'Vui Văn', 'vuivanve@gmail.com', '0798321456','vuivanve')

delete from Customer where Id = '2'

--BedType Queries
select * from BedType
insert into BedType values('Single Bed')
insert into BedType values('Double Bed')
insert into BedType values('Triple Bed')

--RoomType Queries
select * from RoomType
insert into RoomType([Name], Price, [Description]) 
values('Standard Room',239000,N'phòng tiêu chuẩn trong khách sạn, là loại phòng đơn giản nhất với những trang bị tối thiểu, có diện tích nhỏ, ở tầng thấp, không có view hoặc view không đẹp. Đây là loại phòng có mức giá thấp nhất trong khách sạn.')
insert into RoomType([Name], Price, [Description]) 
values('King Room', 2753000,N'Là gian phòng hạng sang của khách sạn, phòng King thường nằm trên tầng cao nhất trong khách sạn. Với diên tích khoảng 150m2, phòng King gồm 2 phòng ngủ, 1 phòng khách, phòng bếp, 1 phòng sauna, ban công riêng, v..v..
Các thiết bị nội thất trong phòng đều là những sản phẩm cao cấp nhất, hiện đại và tiện nghi nhất.')
insert into RoomType([Name], Price, [Description]) 
values('Suite Room', 2535000, 'The Royal Suite has a total area of ​​about 70m2, which is divided into a bedroom and a separate living room with a small balcony with tea table outside so you can enjoy it. Wake up to the sun or sunset. Our Royal Suite rooms with unique architecture and luxurious interior will bring you the feeling of comfort, into a luxurious and classy space.')
insert into RoomType([Name], Price, [Description]) 
values('Family Room', 350000, 'Family room of 40-45m2, each room has 2 to 3 beds, with luxurious furniture, full facilities. Family Room up to 5 people per room. This is the perfect choice for families or small groups of friends to go out together. Some rooms are equipped with windows, family bath tubs and warm decoration, but also full of novelty and comfort to bring airy space, comfort, friendly and convenient for you to enjoy. Get the best holiday with family or close friends.')
insert into RoomType([Name], Price, [Description]) 
values('Deluxe Room', 1025000, 'Deluxe rooms with harmonious design, luxurious interior with full modern facilities. Area of about 60-65m2 each room is equipped with windows and balcony to bring the cool air, the most comfortable for you. The rooms are luxuriously furnished with high quality wood floor, spacious space, with windows and balconies overlooking the sea, you can easily watch the sunset or sunrise in your room.')
insert into RoomType([Name], Price, [Description]) 
values('Luxury Room', 1520000,'Luxury rooms with harmonious design, luxurious interior with full modern facilities. Area of about 60-65m2 each room is equipped with windows and balcony to bring the cool air, the most comfortable for you. The rooms are luxuriously furnished with high quality wood floor, spacious space, with windows and balconies overlooking the sea, you can easily watch the sunset or sunrise in your room.')
insert into RoomType([Name], Price, [Description]) 
values('Superior Room', 850000,'Superior rooms are about 20m2 are designed in harmony with luxury furniture and full of modern facilities and to the comfort and convenience for you. The standard room consists of 2 small beds or 1 large bed suitable for couples traveling on vacation. Rooms may have a small window with sea view or view of the campus to help you look at the beautiful surroundings.')

update RoomType 
set [Description] = 'The Royal Suite has a total area of ​​about 70m2, which is divided into a bedroom and a separate living room with a small balcony with tea table outside so you can enjoy it. Wake up to the sun or sunset. Our Royal Suite rooms with unique architecture and luxurious interior will bring you the feeling of comfort, into a luxurious and classy space.'
where RoomTypeID = 3

update RoomType 
set [Description] = N'phòng tiêu chuẩn trong khách sạn, là loại phòng đơn giản nhất với những trang bị tối thiểu, có diện tích nhỏ, ở tầng thấp, không có view hoặc view không đẹp. Đây là loại phòng có mức giá thấp nhất trong khách sạn'
where RoomTypeID = 1

--Room Queries
select * from Room
select * from RoomType
insert into Room values('101', 1, 1, 'Street view')
insert into Room values('102', 1, 1, 'No view')
insert into Room values('103', 1, 1, 'No view')
insert into Room values('501', 2, 5, 'Beachfront view')
insert into Room values('502', 2, 5, 'Beutiful Beach view')

update Room
set [View] = N'Beautiful beach view'
where RoomID = 5

--Booking Queries
insert into Booking values('')

--BookDetail Queries
insert into BookDetail values('')
