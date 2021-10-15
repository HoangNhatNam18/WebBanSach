USE master
GO
IF EXISTS(SELECT * FROM sys.sysdatabases WHERE name='Bookstore')
DROP DATABASE Bookstore
GO
CREATE DATABASE Bookstore
GO
USE Bookstore
GO
CREATE TABLE Authors(
	ID INT PRIMARY KEY IDENTITY(1, 1),
	Name NVARCHAR(500),
	Job NVARCHAR(500)
)
GO
CREATE TABLE Categories(
	ID INT PRIMARY KEY IDENTITY(1, 1),
	Name NVARCHAR(500)
)
CREATE TABLE Publishers(
	ID INT PRIMARY KEY IDENTITY(1, 1),
	Name NVARCHAR(500),
	Address NVARCHAR(200),
	Phone NVARCHAR(50),
	Email NVARCHAR(30)
)
CREATE TABLE Suppliers(
	ID INT PRIMARY KEY IDENTITY(1, 1),
	Name NVARCHAR(500),
	Address NVARCHAR(500),
	Phone NVARCHAR(50)
)
CREATE TABLE Users(
	ID INT PRIMARY KEY IDENTITY(1, 1),
	Name NVARCHAR(50),
	Username NVARCHAR(50),
	Password NVARCHAR(100),
	isAdmin BIT,
	Email NVARCHAR(30),
	Phone NVARCHAR(50),
	RegistrationDate DATE,
	Sex BIT 
)
CREATE TABLE Orders(
	ID INT PRIMARY KEY IDENTITY(1, 1),
	OrderDate DATETime,
	DeliveryDate DATETime, 
	Address NVARCHAR(200),
	Phone NVARCHAR(200),
	Receiver NVARCHAR(100),
	Status BIT,
	Note NVARCHAR(200),
	UserID INT CONSTRAINT fk_Users_Orders FOREIGN KEY(UserID) REFERENCES dbo.Users(ID) ON DELETE CASCADE ON UPDATE CASCADE
)
GO
CREATE TABLE Books(
	ID INT PRIMARY KEY IDENTITY(1, 1),
	Name NVARCHAR(100),
	Price float,
	Decription NVARCHAR(max),
	NumberOfInventory INT,
	UpdateDate DATE,
	Note NVARCHAR(max),
	ImagePath NVARCHAR(100),
	BookTypeID INT FOREIGN KEY(BookTypeID) REFERENCES dbo.Categories(ID) ON DELETE CASCADE ON UPDATE CASCADE,
	AuthorID INT FOREIGN KEY(AuthorID) REFERENCES dbo.Authors(ID) ON DELETE CASCADE ON UPDATE CASCADE,
	PublisherID INT FOREIGN KEY(PublisherID) REFERENCES dbo.Publishers(ID) ON DELETE CASCADE ON UPDATE CASCADE
)
CREATE TABLE FormDetails(
	SupplierID INT FOREIGN KEY(SupplierID) REFERENCES dbo.Suppliers(ID) ON DELETE CASCADE ON UPDATE CASCADE,
	BookID INT FOREIGN KEY(BookID) REFERENCES dbo.Books(ID) ON DELETE CASCADE ON UPDATE CASCADE
	PRIMARY KEY(SupplierID, BookID),
	Price float,
	NumberOfBooks INT,
	DateOfImport DATETime
)
CREATE TABLE OrderDetails(
	BookID INT FOREIGN KEY(BookID) REFERENCES dbo.Books(ID) ON DELETE CASCADE ON UPDATE CASCADE,
	OrderID int FOREIGN KEY(OrderID) REFERENCES dbo.Orders(ID) ON DELETE CASCADE ON UPDATE CASCADE,
	PRIMARY KEY(BookID, OrderID),
	NumberOfBooks int, 
	PriceOfBook float
)
GO




--INSERT dbo.Authors VALUES
 -- Name - nvarchar(50)
 -- Job - nvarchar(50)
INSERT dbo.Authors VALUES(N'Trần Văn Thanh', N'Nhà báo')
INSERT dbo.Authors VALUES(N'Ngô Trí Toàn', N'Nhà thơ')
INSERT dbo.Authors VALUES(N'Nguyễn Hoàng Hải', N'Nhà văn')
GO

 -- Name - nvarchar(50)
INSERT dbo.Categories VALUES(N'Truyện tranh')
INSERT dbo.Categories VALUES(N'Lập trình')
INSERT dbo.Categories VALUES(N'Tiểu thuyết')
INSERT dbo.Categories VALUES(N'Cổ tích')
INSERT dbo.Categories VALUES(N'Khoa học')
INSERT dbo.Categories VALUES(N'Viễn tưởng')
GO


-- Name - nvarchar(50)
-- Address - nvarchar(200)
-- Phone - nvarchar(50)
-- Email - nvarchar(30)
INSERT dbo.Publishers VALUES(N'NXB ABC', N'Tp. HCM', N'091019223', N'no2@gmail.com')
INSERT dbo.Publishers VALUES(N'NXB Đông An', N'Tp. HCM', N'0910921', N'dongan@gmail.com')
INSERT dbo.Publishers VALUES(N'NXB Tổ Buôn 247', N'Hà Nội', N'09109021', N'd@gmail.com')
INSERT dbo.Publishers VALUES(N'NXB Đông Hương', N'Hà Nội', N'09109021', N'd@gmail.com')
INSERT dbo.Publishers VALUES(N'NXB Việt Nam', N'Hà Nội', N'09109021', N'sad@gmail.com')
INSERT dbo.Publishers VALUES(N'NXB Văn Tính', N'Tp. HCM', N'091019223', N'ad@gmail.com')
INSERT dbo.Publishers VALUES(N'NXB Cổ Tấn', N'Tp. HCM', N'0910921', N'ád@gmail.com')
INSERT dbo.Publishers VALUES(N'NXB MPP', N'Hà Nội', N'09109021', N'ád@gmail.com')
INSERT dbo.Publishers VALUES(N'NXB Nam Vương', N'Hà Nội', N'09109021', N'sad@gmail.com')
INSERT dbo.Publishers VALUES(N'NXB Quế Võ', N'Hà Nội', N'09109021', N'sadad@gmail.com')
GO


-- Name - nvarchar(50)
-- Address - nvarchar(50)
-- Phone - nvarchar(50)
INSERT dbo.Suppliers VALUES('Suppliers 1', N'Hà Nội', '019090223')
INSERT dbo.Suppliers VALUES('Suppliers 2', N'Hà Nội', '090911232')
INSERT dbo.Suppliers VALUES('Suppliers 3', N'Hà Nội', '090810011')
INSERT dbo.Suppliers VALUES('Suppliers 4', N'Hà Nội', '042352343')
GO



-- Name - nvarchar(50)
-- Username - nvarchar(50)
-- PASSWORD - nvarchar(100)
 -- isAdmin - bit
-- Email - nvarchar(30)
-- Phone - nvarchar(50)
-- RegistrationDate - date
-- Sex - bit
INSERT dbo.Users VALUES(N'Admin', N'admin', '202cb962ac59075b964b07152d234b70', 1, 'admin@gmail.com', '03448840032', '2020/01/24', 1)
INSERT dbo.Users VALUES(N'vinh', N'vinh', '202cb962ac59075b964b07152d234b70', 0, 'admin@gmail.com', '03448840032', '2020/01/24', 1)
GO


-- OrderDate - date
-- DeliveryDate - date
-- Address - nvarchar(200)
-- Receiver - nvarchar(100)
-- Status - bit
 -- Note - nvarchar(200)
-- UserID - int
--INSERT dbo.Orders VALUES('2020/02/10', '2020/02/14', N'Số 5- Mê Linh- Hà Nội','Anh Tùng', 0, N'Giao hàng buổi chiều', 1)
GO


--VALUES
--(   N'',       -- Name - nvarchar(100)
--    0,         -- Price - int
--    N'',       -- Decription - nvarchar(500)
--    0,         -- NumberOfInventory - int
--    GETDATE(), -- UpdateDate - date
--    N'',       -- Note - nvarchar(200)
--    NULL,      -- Image - image
--    0,         -- BookTypeID - int
--    0,         -- AuthorID - int
--    0          -- PublisherID - int
--    )
INSERT Books VALUES(N'Giáo Trình C++ Và Lập Trình Hướng Đối Tượng', 90000, N'Viết về cuộc sống', 100, '2020/02/25', N'Đã Xuất Bản lần thứ 2', N'~/images/product11.jpg', 5, 3, 3)
INSERT Books VALUES(N'Tôi Thấy Hoa Vàng Trên Cỏ Xanh', 76000, N'Viết về hoa vàng trên cỏ xanh', 120, '2020/02/25', N'Không', N'~/images/product11.jpg', 3, 2, 1)
INSERT Books VALUES(N'Mắt biếc', 76000, N'Viết về cuốc sống cô gái và chàng trai...', 120, '2020/02/25', N'Không', N'~/images/product13.jpg', 2, 1, 1)
INSERT Books VALUES(N'Tình anh em', 126000, N'Viết về hoa vàng trên cỏ xanh', 120, '2020/02/25', N'Không', N'~/images/product11.jpg', 1, 1, 1)
INSERT Books VALUES(N'Phía sau một cô gái', 90000, N'Viết về hoa vàng trên cỏ xanh', 120, '2020/02/25', N'Không', N'~/images/product13.jpg', 3, 2, 1)
INSERT Books VALUES(N'Nơi này có anh', 85000, N'Viết về hoa vàng trên cỏ xanh', 120, '2020/02/25', N'Không', N'~/images/product11.jpg', 3, 1, 1)
INSERT Books VALUES(N'Mắt biếc 2', 76000, N'Viết về cuốc sống cô gái và chàng trai...', 120, '2020/02/25', N'Không', N'~/images/product13.jpg', 3, 2, 1)
INSERT Books VALUES(N'Tình anh em 2', 126000, N'Viết về hoa vàng trên cỏ xanh', 120, '2020/02/25', N'Không', N'~/images/product11.jpg', 2, 2, 1)
INSERT Books VALUES(N'Phía sau một cô gái 2', 90000, N'Viết về hoa vàng trên cỏ xanh', 120, '2020/02/25', N'Không', N'~/images/product13.jpg', 3, 2, 1)
INSERT Books VALUES(N'Nơi này có anh 2', 85000, N'Viết về hoa vàng trên cỏ xanh', 120, '2020/02/25', N'Không', N'~/images/product11.jpg', 4, 3, 1)
SELECT * FROM dbo.Orders


go
create trigger trg_OrderDetails on OrderDetails
for insert
as
begin
	declare @sluongbandau int
	declare @sluongthem int
	select @sluongbandau = NumberOfInventory from Books inner join inserted on Books.ID=inserted.BookID where Inserted.BookID = Books.ID
	select @sluongthem = NumberOfBooks from inserted inner join Books on inserted.BookID=Books.ID where Inserted.BookID = Books.ID
	if(@sluongthem>@sluongbandau)
	begin
	print 'khong the them'
	RAISERROR('Khong the them du lieu', 10, 1)
	rollback transaction
	return
	end
	else
	begin
		update Books set NumberOfInventory=@sluongbandau-@sluongthem where ID=(select NumberOfBooks from inserted)
	end
end



--test trigger

SELECT * FROM dbo.OrderDetails
SELECT * FROM dbo.Books