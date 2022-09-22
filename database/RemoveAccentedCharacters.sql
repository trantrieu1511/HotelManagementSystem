CREATE FUNCTION fn_remove_accents(@textvalue1 nvarchar(50))
RETURNS nvarchar(50) as
BEGIN
	--declare
	declare @textvalue nvarchar(50);
	declare @withaccents nvarchar(50);
	declare @withoutaccents nvarchar(50);
	declare @count int

    -- ACCENTS
	SET @textvalue = @textvalue1;
    SET @withaccents = 'àáãạảăắằẳẵặâấầẩẫậèéẹẻẽêềếểễệđìíĩỉịòóõọỏôốồổỗộơớờởỡợùúũụủưứừửữựỳỵỷỹýÀÁÃẠẢĂẮẰẲẴẶÂẤẦẨẪẬÈÉẸẺẼÊỀẾỂỄỆĐÌÍĨỈỊÒÓÕỌỎÔỐỒỔỖỘƠỚỜỞỠỢÙÚŨỤỦƯỨỪỬỮỰỲỴỶỸÝ';
    SET @withoutaccents = 'aadeoouaaaaaaaaaaaaaaaeeeeeeeeeeiiiiiooooooooooooooouuuuuuuuuuyyyyyAADEOOUAAAAAAAAAAAAAAAEEEEEEEEEEIIIIIOOOOOOOOOOOOOOOUUUUUUUUUUYYYYY';
    SET @count = LEN(@withaccents);

    WHILE @count > 0 
	BEGIN
        SET @textvalue = REPLACE(@textvalue, SUBSTRING(@withaccents, @count, 1), SUBSTRING(@withoutaccents, @count, 1));
        SET @count = @count - 1;
    END

    RETURN @textvalue;
END

select dbo.fn_remove_accents(TenKH) as TenKH from tblKhachHang
select TenKH from tblKhachHang