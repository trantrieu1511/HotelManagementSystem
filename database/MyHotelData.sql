--insert Customer
insert into Customer values(N'A', N'Nguyễn Văn', 1, '20/10/2001', N'Số nhà 5, Tổ 10, Tân Hòa, HB, HB, VN', 'nguyenvana@gmail.com', '0945656677','nguyenvana')
----Customer register----
insert into Customer(FirstName,LastName,Email,PhoneNumber,[Password]) values(N'B', N'Nguyễn Văn', 'nguyenvanb@gmail.com', '0916368677','nguyenvanb')
insert into Customer(FirstName,LastName,Email,PhoneNumber,[Password]) values(N'Vi', N'Ánh Quang', 'anhquangvi@gmail.com', '0956478933','anhquangvi')
insert into Customer(FirstName,LastName,Email,PhoneNumber,[Password]) values(N'Vu', N'Vi Văn', 'vivanvu@gmail.com', '0123321456','vivanvu')
insert into Customer(FirstName,LastName,Email,PhoneNumber,[Password]) values(N'Vẻ', N'Vui Văn', 'vuivanve@gmail.com', '0798321456','vuivanve')

--insert Employee
insert into Employee(FirstName,LastName,Username,[Password]) values(N'Triệu',N'Trần','trantrieu123', '12345678')
insert into Employee(FirstName,LastName,Username,[Password],ReportsTo) values(N'Hà', N'Đặng', 'dangha', 'dangha','TT00001')
insert into Employee(FirstName,LastName,Username,[Password],ReportsTo) values(N'Ngọc', N'Nguyễn', 'nguyenngoc', 'nguyenngoc', 'TT00001')
insert into Employee(FirstName,LastName,Username,[Password],ReportsTo) values(N'Chinh', N'Nguyễn', 'nguyenchinh', 'nguyenchinh', 'TT00001')
insert into Employee(FirstName,LastName,Username,[Password],ReportsTo) values(N'Hiếu', N'Trần', 'tranhieu', 'tranhieu', N'HĐ00002')

--insert BedType
insert into BedType values('Single Bed')
insert into BedType values('Double Bed')
insert into BedType values('Triple Bed')

--insert RoomType
--insert into RoomType([Name], Price, [Description]) 
--values('Standard Room',239000,N'phòng tiêu chuẩn trong khách sạn, là loại phòng đơn giản nhất với những trang bị tối thiểu, có diện tích nhỏ, ở tầng thấp, không có view hoặc view không đẹp. Đây là loại phòng có mức giá thấp nhất trong khách sạn.')
--insert into RoomType([Name], Price, [Description]) 
--values('King Room', 2753000,N'Là gian phòng hạng sang của khách sạn, phòng King thường nằm trên tầng cao nhất trong khách sạn. Với diên tích khoảng 150m2, phòng King gồm 2 phòng ngủ, 1 phòng khách, phòng bếp, 1 phòng sauna, ban công riêng, v..v..
--Các thiết bị nội thất trong phòng đều là những sản phẩm cao cấp nhất, hiện đại và tiện nghi nhất.')

insert into RoomType
values('Family Room', 350000, 'images/room-1.jpg', 'Family room of 40-45m2, each room has 2 to 3 beds, with luxurious furniture, full facilities. Family Room up to 5 people per room. This is the perfect choice for families or small groups of friends to go out together. Some rooms are equipped with windows, family bath tubs and warm decoration, but also full of novelty and comfort to bring airy space, comfort, friendly and convenient for you to enjoy. Get the best holiday with family or close friends.',2,2)
insert into RoomType
values('Deluxe Room', 1025000, 'images/room-5.jpg', 'Deluxe rooms with harmonious design, luxurious interior with full modern facilities. Area of about 60-65m2 each room is equipped with windows and balcony to bring the cool air, the most comfortable for you. The rooms are luxuriously furnished with high quality wood floor, spacious space, with windows and balconies overlooking the sea, you can easily watch the sunset or sunrise in your room.',4,3)
insert into RoomType 
values('Superior Room', 850000, 'images/room-6.jpg', 'Superior rooms are about 20m2 are designed in harmony with luxury furniture and full of modern facilities and to the comfort and convenience for you. The standard room consists of 2 small beds or 1 large bed suitable for couples traveling on vacation. Rooms may have a small window with sea view or view of the campus to help you look at the beautiful surroundings.',3,2)
insert into RoomType 
values('Luxury Room', 1520000, 'images/room-4.jpg', 'Luxury rooms with harmonious design, luxurious interior with full modern facilities. Area of about 60-65m2 each room is equipped with windows and balcony to bring the cool air, the most comfortable for you. The rooms are luxuriously furnished with high quality wood floor, spacious space, with windows and balconies overlooking the sea, you can easily watch the sunset or sunrise in your room.',5,4)
insert into RoomType 
values('Suite Room', 2535000, 'images/room-2.jpg', 'The Royal Suite has a total area of ​​about 70m2, which is divided into a bedroom and a separate living room with a small balcony with tea table outside so you can enjoy it. Wake up to the sun or sunset. Our Royal Suite rooms with unique architecture and luxurious interior will bring you the feeling of comfort, into a luxurious and classy space.',7,5)
--select * from RoomType

--insert RoomTypeDetail
insert into RoomTypeDetail 
values(1,1,2)
insert into RoomTypeDetail 
values(2,2,1)
insert into RoomTypeDetail 
values(2,1,1)
insert into RoomTypeDetail 
values(3,2,1)
insert into RoomTypeDetail 
values(4,2,1)
insert into RoomTypeDetail 
values(4,1,2)
insert into RoomTypeDetail 
values(5,3,1)
insert into RoomTypeDetail 
values(5,1,2)

--insert Room
insert into Room values('101', 1, 1, 'Street view')
insert into Room values('102', 1, 1, 'No view')
insert into Room values('103', 1, 1, 'No view')
insert into Room values('104', 1, 1, 'Normal view')
insert into Room values('105', 1, 1, 'Street view')
insert into Room values('106', 1, 1, 'Normal view')
insert into Room values('201', 2, 2, 'Beautiful Beach view')
insert into Room values('202', 2, 2, 'Beach view')
insert into Room values('203', 2, 2, 'Beach view')
insert into Room values('204', 2, 2, 'Beach view')
insert into Room values('205', 2, 2, 'Beach view')
insert into Room values('206', 2, 2, 'Beach view')
insert into Room values('301', 2, 3, 'Beautiful Beach view')
insert into Room values('302', 2, 3, 'Beautiful Beach view')
insert into Room values('401', 3, 4, 'Beautiful Beach view')
insert into Room values('402', 3, 4, 'Beach view')
insert into Room values('403', 3, 4, 'Beautiful Beach view')
insert into Room values('404', 3, 4, 'Beautiful Beach view')
insert into Room values('405', 3, 4, 'Magnificent Beach view')
insert into Room values('406', 3, 4, 'Great Beach view')
insert into Room values('407', 4, 4, 'Beautiful Beach view')
insert into Room values('408', 4, 4, 'Beautiful Beach view')
insert into Room values('409', 4, 4, 'Beach view')
insert into Room values('410', 4, 4, 'Beach view')
insert into Room values('501', 5, 5, 'Beachfront view')
insert into Room values('502', 5, 5, 'Beautiful Beach view')
insert into Room values('503', 5, 5, 'Beautiful Beach view')

--insert Booking
--select * from Booking
insert into Booking(CusID, BookDate) values('CUS00001', '2022-09-22')
insert into Booking(CusID, BookDate) values('CUS00002', '2022-09-28')
insert into Booking(CusID, BookDate, SpecialRequests) values('CUS00002', GETDATE(), 'I need more bath towels')
--insert BookDetail
--select * from BookDetail
--select * from Booking
--select * from Room
--select * from RoomType
--select * from RoomTypeDetail
insert into BookDetail values(1,1,'2022-09-22','2022-09-23',DATEDIFF(DAY,'2022-09-22','2022-09-23')*(select Price from RoomType rt join Room r on rt.RoomTypeID = r.RoomTypeID where RoomID = 1))
insert into BookDetail values(2,7,'2022-09-28','2022-09-30',DATEDIFF(DAY,'2022-09-28','2022-09-30')*(select Price from RoomType rt join Room r on rt.RoomTypeID = r.RoomTypeID where RoomID = 7))
--delete from BookDetail where BD_ID = 2