Create Database GroceryApps;

Use GroceryApps;

-- drop database groceryapps;

-- TABLE Role
Create table tblRole (
	roleID int auto_increment primary key,
    roleName varchar(30) CHARACTER SET UTF8MB4 NOT NULL
);

insert into tblRole (roleName)
Values	('Admin'),
		('Người dùng');
        
-- drop table tblRole;

-- TABLE USER
Create table tblUser(
	userID int auto_increment primary key,
	userName varchar(25),
    passWord varchar(255),
    fullName varchar(50) CHARACTER SET UTF8MB4,
    email varchar(255) unique,
    phone varchar(11) unique ,
    address varchar(30) CHARACTER SET UTF8MB4 ,
    birthday date ,
    roleID int not null,
    foreign key (roleID) references tblRole(roleID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO tbluser(userID, userName, passWord, fullName, email, phone, address, birthday)
VALUES	('Nhan', 'Nhan', 'Nhan T', 'Nhan@gmail.com', NULL, NULL, NULL, NULL),
		('Sy', 'Sy', 'Sy V', 'Sy@gmail.com', NULL, NULL, NULL, NULL),
        ('Thien', 'Thien', 'Thien T', 'Thien@gmail.com', NULL, NULL, NULL, NULL),
        ('Huy', 'Huy', 'Huy Q', 'ancelotti@gmail.com', NULL, NULL, NULL, NULL),
        ('Tien', 'Tien', 'Tien T', 'tenhag@gmail.com', NULL, NULL, NULL, NULL);
        
delete from tbluser;

-- Thêm cột roleID vào bảng tblUser
ALTER TABLE tblUser
ADD COLUMN roleID INT ;

-- Thêm ràng buộc (constraint) để tham chiếu đến bảng tblRole
ALTER TABLE tblUser
ADD CONSTRAINT fk_roleID
FOREIGN KEY (roleID) REFERENCES tblRole(roleID);

-- ALTER TABLE tblUser
-- DROP FOREIGN KEY fk_roleID;
-- ALTER TABLE tblUser
-- DROP COLUMN roleID;

-- Select * from tblUser;

-- drop table tblUser;

-- TABLE SUPPLIER
Create table tblSupplier (
	userID int primary key  ,
    supplierName varchar(50) CHARACTER SET UTF8MB4 ,
    supplierAddress varchar(50) CHARACTER SET UTF8MB4,
    supplierPhone varchar(11) unique,
    supplierEmail varchar(50) unique,
    suppImage varchar(255),
    foreign key (userID) references tblUser(userID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO tblSupplier (userID, supplierName, supplierAddress, supplierPhone, supplierEmail, suppImage)
VALUES 	(1, 'Coca Cola', '123 Main St, City A', '033251649', 'abc@company.com', 'https://static.vecteezy.com/system/resources/previews/007/978/653/original/coca-cola-popular-drink-brand-logo-vinnytsia-ukraine-may-16-202-free-vector.jpg' ),
		(2, 'Nhansi', '456 Broadway, City B', '0987654321', 'xyz@corp.com', 'https://static.vecteezy.com/system/resources/previews/007/978/618/original/Nhansi-popular-drink-brand-logo-vinnytsia-ukraine-may-16-202-free-vector.jpg'),
		(3, 'Telio', '789 Park Ave, City C', '0935198477', '123@inc.com', 'https://cdn.techinasia.com/data/images/dKUpDjIFvZwS2XQroWo4isM9ckoywNrOdRVeybwh.png'),
		(4, 'Wabi2b', '1010 Industrial Blvd, City D', '0935662583', 'supplies@co.com', 'https://play-lh.googleusercontent.com/HRRTDjyiT-T09g1V9bSjb_ZuL9-ZuMcl_oW45Bn5u1ZW0JHpEr6yA0DwRV1cOAAALiUK'),
		(5, 'Omachi', '555 Fifth Ave, City E', '0905267489', 'global@enterprises.com', 'https://logowik.com/content/uploads/images/omachi-saga7671.logowik.com.webp' );
		
 drop table tblSupplier;

-- TABLE CATEGORY
Create table tblCategory (
	categoryID varchar(11) primary key ,
    categoryName varchar(50) CHARACTER SET UTF8MB4,
    categoryColor varchar(40),
    categoryImage varchar(255)
);

INSERT INTO tblCategory 
VALUES	('CA0001', 'Đồ uống có cồn', 'rgba(248, 164, 76, 0.1)', 'https://vtv1.mediacdn.vn/zoom/550_339/2019/3/4/bigstock-alcoholic-drinks-emerging-europe-1551665990593522364791.jpg'),
		('CA0002', 'Nước giải khát', 'rgba(211, 176, 224, 0.25)', 'https://Tiensinuoc.com/wp-content/uploads/2022/02/dai-ly-nuoc-giai-khat-ct-tnhh-binh-minh.jpg'),
		('CA0003', 'Thực phẩm đóng hộp', 'rgba(211, 176, 224, 0.25)', 'https://efoodvietnam.com/wp-content/uploads/2022/11/thuc-pham-dong-hop-va-nhung-dieu-can-biet.jpg'),
		('CA0004', 'Mì ăn liền', 'rgba(248, 164, 76, 0.1)', 'https://i.doanhnhansaigon.vn/2020/01/11/migoi-1578742010.jpg'),
		('CA0005', 'Xả vải', 'rgba(248, 164, 76, 0.1)', 'https://cdn.tgdd.vn//Files/News/2022/06/02/730x450-(32)-845x450.jpg'),
		('CA0006', 'Gia vị', 'rgba(211, 176, 224, 0.25)', 'https://cdn.tgdd.vn/2020/12/CookProduct/thumbcn-1200x676-9.jpg'),
		('CA0007', 'Khăn lau miệng', 'rgba(211, 176, 224, 0.25)', 'https://cdn.tgdd.vn/Files/2022/05/24/1434536/review-khan-giay-pulppy-co-tot-khong-gia-bao-nhieu-202205240722077776.jpg'),
        ('CA0008', 'Nước tương', 'rgba(248, 164, 76, 0.1)', 'https://daotaobeptruong.vn/wp-content/uploads/2019/07/nuoc_tuong_la_gi.png'),
		('CA0009', 'Vở', 'rgba(248, 164, 76, 0.1)', 'https://product.hstatic.net/1000362139/product/vo_earth1_e5858e2da0b541d585370f8011bb3a27.png'),
        ('CA0010', 'Bút', 'rgba(211, 176, 224, 0.25)', 'https://cdn3.dhht.vn/wp-content/uploads/2022/08/top-10-hang-but-ky-ten-cao-cap-5-noi-ban-but-ky-uy-tin-bia.jpg'),
        ('CA0011', 'Sữa', 'rgba(248, 164, 76, 0.1)', 'https://cdn.nhathuoclongchau.com.vn/unsafe/filters:quality(95)/https://cms-prod.s3-sgn09.fptcloud.com/sua_hat_va_sua_bo_loai_nao_tot_hon_1_98c377a710.jpg'),
        ('CA0012', 'Kem đánh răng', 'rgba(211, 176, 224, 0.25)', 'https://www.colgate.com.vn/content/dam/cp-sites/oral-care/oral-care-center/global/article/gscp/asia/toothpaste-shape-tooth-coming-out-tube.jpg'),
        ('CA0013', 'Xà phòng', 'rgba(248, 164, 76, 0.1)', 'https://lh6.googleusercontent.com/z3Zxuwhra51-ivCOWznWqz4oY7Pbid6ssr1YswPtEF8oRU9dq94wxTAFXlUeu19xoGuAXoYpe4IcJLmn7f7b_SxApUzXBFydbLDaNgD-6A_9-Y2cpl8QIuZuTFu67jDbI15lnbnb'),
        ('CA0014', 'Bánh', 'rgba(211, 176, 224, 0.25)', 'https://richy.com.vn/wp-content/uploads/2019/08/45.1-Majestic-h%E1%BB%99p-thi%E1%BA%BFc-Xanh-%C4%90%E1%BB%8F-382gx8-copy.jpg');

-- delete from tblcategory;

-- drop table tblCategory;

-- TABLE WAREHOUSE
Create table tblWareHouse (
	wareHouseID varchar(7) primary key ,
    wareHouseName varchar(30) CHARACTER SET UTF8MB4,
    importQuantity int,
    exportQuantity int,
    stockQuantity int,
    dateImport datetime,
    dateExport datetime
);

INSERT INTO tblWareHouse 
VALUES ('WH0001', 'Đồ uống có cồn', 300, 220, 80, '2023-01-01 10:00:00', NULL),
       ('WH0002', 'Nước uống', 280, 150, 130, '2023-01-01 15:00:00', '2023-01-03 09:00:00'),
       ('WH0003', 'Thực phẩm đóng hộp', 500, 400, 100, '2023-01-02 11:00:00', NULL),
       ('WH0004', 'Mỳ', 1000, 800, 200, '2023-01-01 12:00:00', '2023-01-07 14:00:00'),
       ('WH0005', 'Xả vải', 350, 230, 120, '2023-01-02 08:00:00', NULL),
       ('WH0006', 'Gia vị', 400, 300, 100, '2023-01-12 13:00:00', NULL),
       ('WH0007', 'Khăn lau miệng', 200, 100, 100, '2023-01-10 17:00:00', '2023-01-14 10:30:00'),
       ('WH0008', 'Nước tương', 140, 90, 50, '2023-04-20 16:20:00', '2023-04-21 09:00:01'),
       ('WH0009', 'Vở', 50, 20, 30, '2023-04-20 16:20:00', NULL),
       ('WH0010', 'Bút', 30, 15, 15, '2023-04-24 14:30:10', '2023-04-24 16:50:20'),
       ('WH0011', 'Sữa', 180, 110, 70, '2023-04-24 14:30:10', NULL),
       ('WH0012', 'Kem đánh răng', 100, 60, 40, '2023-04-24 14:30:10', '2023-04-24 16:50:20'),
       ('WH0013', 'Xà phòng', 120, 70, 50, '2023-03-11 10:11:02', '2023-03-11 15:00:00'),
       ('WH0014', 'Bánh', 160, 110, 50, '2023-02-12 08:05:00', NULL );

-- delete from tblWareHouse;
-- drop table tblWareHouse;

-- TABLE PRODUCT
Create table tblProduct (
	productID varchar(7) primary key ,
    productName varchar(30) CHARACTER SET UTF8MB4,
    price decimal,
    quantity int,
    stockQuantity int,
    expirationDate date,
    unit varchar(30),
    productDescription varchar(900) CHARACTER SET UTF8MB4,
    categoryID varchar(11),
    wareHouseID varchar(7),
    foreign key (wareHouseID) references tblWareHouse(wareHouseID) ON DELETE CASCADE ON UPDATE CASCADE ,
    Foreign key (categoryID) references tblCategory(categoryID) ON DELETE CASCADE ON UPDATE CASCADE 
);

INSERT INTO tblProduct 
VALUES	('P00001', 'Bia Huda', 12000, 32, 50, '2023-07-31', 'Lon', 'Bia là một loại đồ uống có cồn được sản xuất từ lúa mạch hoặc các loại ngũ cốc khác. Hương vị đa dạng từ nhẹ nhàng, mát mẻ đến đắng và đậm đà, bia là một lựa chọn phổ biến cho những người thích thưởng thức một đồ uống sảng khoái và giải tỏa căng thẳng sau một ngày làm việc.', 'CA0001', 'WH0001'),
		('P00002', 'Bia Larue', 12000, 20, 50, '2023-07-31', 'Lon', 'Bia là một loại đồ uống có cồn được sản xuất từ lúa mạch hoặc các loại ngũ cốc khác. Hương vị đa dạng từ nhẹ nhàng, mát mẻ đến đắng và đậm đà, bia là một lựa chọn phổ biến cho những người thích thưởng thức một đồ uống sảng khoái và giải tỏa căng thẳng sau một ngày làm việc.', 'CA0001', 'WH0001'),
		('P00003', 'Bia Tiger Xanh', 22000, 100, 50, '2023-07-31', 'Lon', 'Bia là một loại đồ uống có cồn được sản xuất từ lúa mạch hoặc các loại ngũ cốc khác. Hương vị đa dạng từ nhẹ nhàng, mát mẻ đến đắng và đậm đà, bia là một lựa chọn phổ biến cho những người thích thưởng thức một đồ uống sảng khoái và giải tỏa căng thẳng sau một ngày làm việc.', 'CA0001', 'WH0001'),
		('P00004', 'Bia Tiger Bạc', 25000, 100, 50, '2023-07-31', 'Lon', 'Bia là một loại đồ uống có cồn được sản xuất từ lúa mạch hoặc các loại ngũ cốc khác. Hương vị đa dạng từ nhẹ nhàng, mát mẻ đến đắng và đậm đà, bia là một lựa chọn phổ biến cho những người thích thưởng thức một đồ uống sảng khoái và giải tỏa căng thẳng sau một ngày làm việc.', 'CA0001', 'WH0001'),
        ('P00005', 'Revive', 10000, 12, 40, '2023-12-12', 'Chai', 'Nước giải khát có gas là một loại đồ uống phổ biến được làm từ nước và chất tạo gas như carbon dioxide. Nó mang đến cảm giác sảng khoái và sủi bọt trong miệng, làm dịu cơn khát và cung cấp một lựa chọn tuyệt vời cho những ai thích hương vị ngọt ngào và cảm giác nổi bọt khi thưởng thức đồ uống.', 'CA0002', 'WH0002'),
        ('P00006', 'Revive chanh muối', 10000, 14, 20, '2023-12-20', 'Chai', 'Nước giải khát có gas là một loại đồ uống phổ biến được làm từ nước và chất tạo gas như carbon dioxide. Nó mang đến cảm giác sảng khoái và sủi bọt trong miệng, làm dịu cơn khát và cung cấp một lựa chọn tuyệt vời cho những ai thích hương vị ngọt ngào và cảm giác nổi bọt khi thưởng thức đồ uống.', 'CA0002', 'WH0002'),
        ('P00007', 'Nước Aquafina', 5000, 10, 21, '2023-12-31', 'Chai', 'Nước giải khát có gas là một loại đồ uống phổ biến được làm từ nước và chất tạo gas như carbon dioxide. Nó mang đến cảm giác sảng khoái và sủi bọt trong miệng, làm dịu cơn khát và cung cấp một lựa chọn tuyệt vời cho những ai thích hương vị ngọt ngào và cảm giác nổi bọt khi thưởng thức đồ uống.', 'CA0002', 'WH0002'),
        ('P00008', 'Coca Cola', 10000, 12, 25, '2023-11-25', 'Lon' ,'Nước giải khát có gas là một loại đồ uống phổ biến được làm từ nước và chất tạo gas như carbon dioxide. Nó mang đến cảm giác sảng khoái và sủi bọt trong miệng, làm dịu cơn khát và cung cấp một lựa chọn tuyệt vời cho những ai thích hương vị ngọt ngào và cảm giác nổi bọt khi thưởng thức đồ uống.',  'CA0002', 'WH0002'),
        ('P00009', 'Nhansi', 10000, 15, 12, '2023-10-30', 'Lon', 'Nước giải khát có gas là một loại đồ uống phổ biến được làm từ nước và chất tạo gas như carbon dioxide, làm dịu cơn khát và cung cấp một lựa chọn tuyệt vời cho những ai thích hương vị ngọt ngào và cảm giác nổi bọt khi thưởng thức đồ uống.', 'CA0002', 'WH0002'),
        ('P00010', 'Khoáng lạt', 6000, 14, 10, '2023-11-09', 'Chai', 'Nước giải khát có gas là một loại đồ uống phổ biến được làm từ nước và chất tạo gas như carbon dioxide làm dịu cơn khát và cung cấp một lựa chọn tuyệt vời cho những ai thích hương vị ngọt ngào và cảm giác nổi bọt khi thưởng thức đồ uống.', 'CA0002', 'WH0002'),
        ('P00011', 'Khoáng ngọt', 8000, 10, 12, '2023-11-21', 'Chai', 'Nước giải khát có gas là một loại đồ uống phổ biến được làm từ nước và chất tạo gas như carbon dioxide làm dịu cơn khát và cung cấp một lựa chọn tuyệt vời cho những ai thích hương vị ngọt ngào và cảm giác nổi bọt khi thưởng thức đồ uống.', 'CA0002', 'WH0002'),
        ('P00012', 'Xúc xích', 2000, 20, 25, '2023-11-20', 'Hộp', 'Thức ăn đóng hộp là những món ăn đã được chuẩn bị, chế biến và đóng gói trong hộp hoặc lon kín. Đây là một lựa chọn tiện lợi cho những người có lối sống bận rộn hoặc khi không có thời gian nấu nướng. Các loại thức ăn đóng hộp có thể bao gồm các món mỳ, súp, hương vị truyền thống hoặc món ăn quốc tế.', 'CA0003', 'WH0003'),
        ('P00013', 'Cá hộp', 16000, 22, 20, '2023-10-24', 'Hộp', 'Thức ăn đóng hộp là những món ăn đã được chuẩn bị, chế biến và đóng gói trong hộp hoặc lon kín. Đây là một lựa chọn tiện lợi cho những người có lối sống bận rộn hoặc khi không có thời gian nấu nướng. Các loại thức ăn đóng hộp có thể bao gồm các món mỳ, súp, hương vị truyền thống hoặc món ăn quốc tế.', 'CA0003', 'WH0003'),
        ('P00014', 'Heo hai lát', 17000, 16, 25, '2023-10-28', 'Hộp', 'Thức ăn đóng hộp là những món ăn đã được chuẩn bị, chế biến và đóng gói trong hộp hoặc lon kín. Đây là một lựa chọn tiện lợi cho những người có lối sống bận rộn hoặc khi không có thời gian nấu nướng. Các loại thức ăn đóng hộp có thể bao gồm các món mỳ, súp, hương vị truyền thống hoặc món ăn quốc tế.', 'CA0003', 'WH0003'),
        ('P00015', 'Bò hai lát', 17500, 15, 24, '2023-10-29', 'Hộp', 'Thức ăn đóng hộp là những món ăn đã được chuẩn bị, chế biến và đóng gói trong hộp hoặc lon kín. Đây là một lựa chọn tiện lợi cho những người có lối sống bận rộn hoặc khi không có thời gian nấu nướng. Các loại thức ăn đóng hộp có thể bao gồm các món mỳ, súp, hương vị truyền thống hoặc món ăn quốc tế.', 'CA0003', 'WH0003'),
        ('P00016', 'Trứng', 4000, 17, 26, '2023-11-05', 'Hộp', 'Thức ăn đóng hộp là những món ăn đã được chuẩn bị, chế biến và đóng gói trong hộp hoặc lon kín. Đây là một lựa chọn tiện lợi cho những người có lối sống bận rộn hoặc khi không có thời gian nấu nướng. Các loại thức ăn đóng hộp có thể bao gồm các món mỳ, súp, hương vị truyền thống hoặc món ăn quốc tế.', 'CA0003', 'WH0003'),
        ('P00017', 'Mì Hảo Hảo', 4000, 61, 70, '2023-11-08', 'Gói', 'Mì gói có nhiều hương vị đa dạng để lựa chọn, bao gồm hương vị gà, thịt bò, hải sản, hành lá, và nhiều loại hương vị khác. Mỗi gói gia vị mang đến một hương vị độc đáo và đậm đà, tạo nên sự phong phú trong khẩu vị và sự lựa chọn cho người thưởng thức.', 'CA0004', 'WH0004'),
        ('P00018', 'Mì Omachi', 8500, 55, 62, '2023-12-05', 'Gói', 'Mì gói có nhiều hương vị đa dạng để lựa chọn, bao gồm hương vị gà, thịt bò, hải sản, hành lá, và nhiều loại hương vị khác. Mỗi gói gia vị mang đến một hương vị độc đáo và đậm đà, tạo nên sự phong phú trong khẩu vị và sự lựa chọn cho người thưởng thức.', 'CA0004', 'WH0004'),
        ('P00019', 'Mì Gấu đỏ Chay', 3000, 59, 68, '2023-12-05', 'Gói', 'Mì gói có nhiều hương vị đa dạng để lựa chọn, bao gồm hương vị gà, thịt bò, hải sản, hành lá, và nhiều loại hương vị khác. Mỗi gói gia vị mang đến một hương vị độc đáo và đậm đà, tạo nên sự phong phú trong khẩu vị và sự lựa chọn cho người thưởng thức.', 'CA0004', 'WH0004'),
        ('P00020', 'Mì gấu đỏ chua cay', 3000, 64, 74, '2023-12-05', 'Gói', 'Mì gói có nhiều hương vị đa dạng để lựa chọn, bao gồm hương vị gà, thịt bò, hải sản, hành lá, và nhiều loại hương vị khác. Mỗi gói gia vị mang đến một hương vị độc đáo và đậm đà, tạo nên sự phong phú trong khẩu vị và sự lựa chọn cho người thưởng thức.', 'CA0004', 'WH0004'),
        ('P00021', 'Comfort', 3000, 80, 100, '2024-04-05', 'Gói', 'Xả vải quan trọng trong việc giặt đồ, giúp loại bỏ các tạp chất, mùi hôi và vi khuẩn từ vải. Khi xả vải, nước được sử dụng để xả qua quần áo hoặc vật liệu vải để làm sạch và làm tươi lại chúng. Giúp tăng cường hiệu quả của quá trình giặt và đảm bảo rằng đồ vải của bạn sẽ sạch và thơm sau khi giặt.', 'CA0005', 'WH0005'),
        ('P00022', 'Downy', 3000, 100, 144, '2024-04-10', 'Gói', 'Xả vải quan trọng trong việc giặt đồ, giúp loại bỏ các tạp chất, mùi hôi và vi khuẩn từ vải. Khi xả vải, nước được sử dụng để xả qua quần áo hoặc vật liệu vải để làm sạch và làm tươi lại chúng. Giúp tăng cường hiệu quả của quá trình giặt và đảm bảo rằng đồ vải của bạn sẽ sạch và thơm sau khi giặt.', 'CA0005', 'WH0005'),
        ('P00023', 'Khăn giấy', 20000, 40, 20, '2024-10-09', 'Hộp', 'Khăn giấy có thể được sử dụng trong nhiều tình huống khác nhau. Bạn có thể mang theo khăn giấy trong túi xách hoặc hộp đựng nhỏ để sử dụng khi cần lau tay, lau mặt, lau bàn làm việc, hoặc làm sạch bất kỳ bề mặt nào. Điều này làm cho khăn giấy trở thành một sản phẩm tiện lợi trong việc duy trì vệ sinh cá nhân và trong môi trường làm việc.', 'CA0007', 'WH0007'),
        ('P00024', 'Giấy Sài Gòn', 10000, 50, 40, '2024-08-08', 'Hộp', 'Khăn giấy có thể được sử dụng trong nhiều tình huống khác nhau. Bạn có thể mang theo khăn giấy trong túi xách hoặc hộp đựng nhỏ để sử dụng khi cần lau tay, lau mặt, lau bàn làm việc, hoặc làm sạch bất kỳ bề mặt nào. Điều này làm cho khăn giấy trở thành một sản phẩm tiện lợi trong việc duy trì vệ sinh cá nhân và trong môi trường làm việc.', 'CA0007', 'WH0007'),
        ('P00025', 'Tương Chin su', 14000, 25, 20, '2024-11-05', 'Chai', ' Nước tương là một loại gia vị có nguồn gốc từ chất lỏng được chiết xuất từ đậu nành. Nó có màu nâu đậm và hương vị độc đáo, chua ngọt và mặn. Nước tương được sử dụng như một thành phần chính trong các món như cơm cuộn, mì xào, và nhiều món ăn Á Đông khác.', 'CA0008', 'WH0008');
		
Insert into tblProduct
VALUES	('P00026', 'Vở Campus', 12000, 10, 20, NULL, NULL, 'Vở là một loại sách nhỏ hoặc cuốn tập chứa các trang giấy trắng được ghim hoặc bìa cứng bao bọc. Nó thường được sử dụng để ghi chú, viết bài, làm bài tập, hoặc ghi lại thông tin. Vở thường có kích thước và hình dạng đa dạng, như 15x20 cm, 21x29.7 cm (kích thước A4) hoặc có thể còn nhỏ hơn.', 'CA0009', 'WH0009' ),
		('P00027', 'Bút bi Thiên Long', 4000, 10, 15, NULL, NULL, 'Bút bi là loại bút sử dụng một đầu bi nhỏ để tạo ra mực và viết chữ. Đầu bi thường được bao phủ bởi một lớp vỏ nhựa hoặc kim loại và có thể có nắp để bảo vệ đầu viết. Khi di cHuyển nó, đầu bi sẽ quay và đưa ra mực, tạo ra các dòng chữ. Bút bi có thể được điều chỉnh hoặc thay thế đầu viết khi mực cạn.', 'CA0010', 'WH0010'),
        ('P00028', 'Sữa cô gái Hà Lan', 7000, 24, 20, '2023-09-11', 'Hộp', 'Sữa là một loại thực phẩm có nguồn gốc từ động vật, thường được sản xuất từ những động vật như bò, dê, cừu và nhiều loài động vật khác. Nó được coi là một nguồn dinh dưỡng quan trọng và có giá trị cao trong chế độ ăn uống của con người.', 'CA0011', 'WH0011' ),
        ('P00029', 'Sữa Vinamilk', 7000, 40, 25, '2023-10-12', 'Hộp', 'Sữa là một loại thực phẩm có nguồn gốc từ động vật, thường được sản xuất từ những động vật như bò, dê, cừu và nhiều loài động vật khác. Nó được coi là một nguồn dinh dưỡng quan trọng và có giá trị cao trong chế độ ăn uống của con người.', 'CA0011', 'WH0011'),
        ('P00030', 'Kem P/S', 24000, 10, 18, '2024-12-12', 'Hộp', 'Kem đánh răng là một loại sản phẩm vệ sinh cá nhân được sử dụng để làm sạch và bảo vệ răng và lợi. Nó thường có dạng gel hoặc kem mịn, được đặt lên bàn chải đánh răng và sau đó được dùng để chải răng.', 'CA0012', 'WH0012'),
        ('P00031', 'Kem Closeup', 25000, 12, 14, '2024-12-15', 'Hộp', 'Kem đánh răng là một loại sản phẩm vệ sinh cá nhân được sử dụng để làm sạch và bảo vệ răng và lợi. Nó thường có dạng gel hoặc kem mịn, được đặt lên bàn chải đánh răng và sau đó được dùng để chải răng.', 'CA0012', 'WH0012'),
        ('P00032', 'Lifebuoy', 16000, 10, 12, '2025-04-10', 'Hộp', 'Xà phòng rửa tay là một sản phẩm chăm sóc cá nhân được sử dụng để làm sạch và vệ sinh tay. Nó có dạng chất lỏng, gel hoặc viên rắn và chứa các chất hoạt động bề mặt và chất kháng khuẩn để loại bỏ vi khuẩn, vi rút và bụi bẩn từ bề mặt của tay.', 'CA0013', 'WH0013' ),
        ('P00033', 'Bột giặt Surf', 14000, 25, 16, '2025-06-07', 'Gói', 'Xà phòng giặt đồ là một loại sản phẩm được sử dụng trong quá trình giặt là để làm sạch và loại bỏ bụi bẩn, mùi hôi, và các vết bẩn khác trên quần áo, chăn ga, và các vật liệu dệt khác. Nó có dạng chất lỏng, bột hoặc viên rắn và chứa các chất hoạt động bề mặt và các chất phụ gia khác để tác động vào các vết bẩn và làm sạch vật liệu.', 'CA0013', 'WH0013' ),
        ('P00034', 'Bột giặt Omo', 17000, 22, 17, '2025-10-10', 'Gói', 'Xà phòng giặt đồ là một loại sản phẩm được sử dụng trong quá trình giặt là để làm sạch và loại bỏ bụi bẩn, mùi hôi, và các vết bẩn khác trên quần áo, chăn ga, và các vật liệu dệt khác. Nó có dạng chất lỏng, bột hoặc viên rắn và chứa các chất hoạt động bề mặt và các chất phụ gia khác để tác động vào các vết bẩn và làm sạch vật liệu.', 'CA0013', 'WH0013'),
        ('P00035', 'Bột giặt Tie', 18500, 17, 16, '2025-10-11', 'Gói', 'Xà phòng giặt đồ là một loại sản phẩm được sử dụng trong quá trình giặt là để làm sạch và loại bỏ bụi bẩn, mùi hôi, và các vết bẩn khác trên quần áo, chăn ga, và các vật liệu dệt khác. Nó có dạng chất lỏng, bột hoặc viên rắn và chứa các chất hoạt động bề mặt và các chất phụ gia khác để tác động vào các vết bẩn và làm sạch vật liệu.', 'CA0013', 'WH0013'),
        ('P00036', 'Nước rửa chén Sunlight', 18000, 18, 14, '2025-07-28', 'Chai', 'Nước rửa chén là một loại sản phẩm được sử dụng để làm sạch và loại bỏ dầu mỡ, thức ăn và các vết bẩn trên chén, bát đĩa, và các vật dụng dùng trong việc nấu nướng và ăn uống. Nó là một dung dịch lỏng được tạo thành từ các chất hoạt động bề mặt và các chất phụ gia khác để có hiệu quả trong việc tẩy rửa và làm sạch.', 'CA0013', 'WH0013'),
        ('P00037', 'Thuốc tẩy Javel', 15000, 14, 9, '2026-03-25', 'Chai', 'Thuốc tẩy là một loại sản phẩm được sử dụng để loại bỏ các vết bẩn và vết nhơ trên bề mặt vật liệu như quần áo, thảm, nệm, da, gỗ, và nhiều vật liệu khác. Có nhiều loại thuốc tẩy khác nhau được thiết kế để xử lý các loại vết bẩn khác nhau và được sản xuất dưới dạng chất lỏng, gel, bột hoặc dạng xịt.', 'CA0013', 'WH0013'),
        ('P00038', 'Nước lau sàn sunlight', 21000, 10, 11, '2026-04-08', 'Chai', 'Nước lau sàn là một loại sản phẩm được sử dụng để làm sạch và làm mới bề mặt sàn nhà. Nó được thiết kế để loại bỏ bụi bẩn, mảng bẩn, vết bẩn và các chất nhờn khác trên sàn, giúp sàn nhà trở nên sạch sẽ và lấp lánh. Nước lau sàn thường có dạng chất lỏng và có thể có mùi thơm dễ chịu.', 'CA0013', 'WH0013'),
        ('P00039', 'Bánh Oishi', 5000, 50, 34, '2025-05-05', 'Gói', 'Bánh Oishi là một loại bánh ngọt có nguồn gốc từ Nhật Bản. Được làm từ các nguyên liệu tươi ngon, bánh Oishi thường có hình dạng nhỏ gọn, tròn hoặc hình vuông và có vị ngọt dịu, thích hợp để thưởng thức trong các dịp lễ hội, hẹn hò, hoặc làm quà biếu.', 'CA0014', 'WH0014'),
        ('P00040', 'Bánh Poca', 5000, 50, 21, '2025-05-10', 'Gói', 'Bánh Poca là một loại bánh snack phổ biến được sản xuất bởi công ty Poca, một thương hiệu nổi tiếng trong lĩnh vực sản xuất bánh ngọt và snack. Bánh Poca thường có hình dạng nhỏ gọn và mỏng, rất phù hợp để thưởng thức trong những lúc giải lao, xem phim hoặc khi cần một khẩu phần nhẹ nhàng để làm dịu cơn đói.', 'CA0014', 'WH0014'),
        ('P00041', 'Bánh OStar', 7000, 20, 15, '2025-06-27', 'Gói', 'Bánh khoai tây OStar là một loại bánh ngọt có nguồn gốc từ khoai tây và thường được làm thành hình dạng nhỏ gọn và hấp dẫn. Đặc điểm nổi bật của bánh này là sự kết hợp giữa khoai tây và các nguyên liệu khác để tạo ra vị ngọt, mềm mịn và hương vị đặc trưng.', 'CA0014', 'WH0014'),
        ('P00042', 'Bánh Swing', 7000, 18, 12, '2025-07-05', 'Gói', 'Bánh Swing là một loại bánh ngọt có hình dạng đặc biệt, được gọi là "swing" vì có thiết kế giống như một cái nhún, nhấp nháy. Đây là một loại bánh được làm từ nhiều lớp bánh mỏng xếp chồng lên nhau và được kết hợp với các lớp nhân, tạo nên một cấu trúc độc đáo và hấp dẫn.', 'CA0014', 'WH0014'),
        ('P00043', 'Mì Cay SamYang', 21000, 12, 15, '2023-11-05', 'Gói', 'Mì Samyang có nhiều biến thể khác nhau, như Mì Samyang Spicy Chicken Ramen, Mì Samyang Carbonara, Mì Samyang Cheese, Mì Samyang Hot Chicken Flavor Ramen, và nhiều loại khác. Mì này có hình dạng dẹp, dài và màu vàng, đi kèm với bột gia vị cay.', 'CA0004', 'WH0004'),
        ('P00044', 'Mì Koreno', 21000, 11, 16, '2023-11-05', 'Gói', 'Mì Koreno là một loại mì ăn liền có nguồn gốc từ Hàn Quốc. Mì Koreno là một thương hiệu nổi tiếng trong lĩnh vực mì ăn liền. Có đặc điểm là có hình dạng mì sợi dài và mềm mịn. Được làm từ bột mỳ và chất tạo hình đặc biệt để tạo nên cấu trúc và độ đàn hồi của sợi mì.', 'CA0004', 'WH0004' ),
        ('P00045', 'Mì SiuKay', 16000, 14, 9, '2023-11-20', 'Gói', 'Sợi mì vàng dai ngon hòa quyện vào nước súp mì SiuKay vị hải sản đậm đà thấm đẫm từng sợi hấp dẫn cùng hương thơm lừng quyến rũ ngất ngây. Mì hải sản SiuKay gói 128g là lựa chọn tuyệt vời không thể bỏ qua cho thực đơn bận rộn, cần một bữa ăn nhanh gọn và đảm bảo dinh dưỡng', 'CA0004', 'WH0004'),
        ('P00046', 'Bột ngọt', 8000, 24, 11, '2024-04-04', 'Gói', 'Bột ngọt hạt nhỏ là gia vị thường thấy trong chế biến món ăn hằng ngày, bột ngọt hạt nhỏ Ajinomoto sản xuất bằng phương pháp lên men từ nguyên liệu như mật mía đường và tinh bột khoai mì. Bột ngọt hạt nhỏ Ajinomoto 2kg với dung tích lớn, sử dụng tiết kiệm hơn so với mua gói nhỏ cùng loại.', 'CA0006', 'WH0006' ),
		('P00047', 'Thịt kho Aji-Quick', 6500, 18, 15, '2024-02-18', 'Gói', 'Là loại gia vị nêm sẵn kho thịt đến từ thương hiệu gia vị nêm sẵn Aji-Quick. Gia vị nêm sẵn thịt kho Aji-Quick gói 31g mang đến món thịt kho thơm ngon, đậm đà hương vị nguyên bản một cách nhanh chóng, giúp các bà nội trợ tiết kiệm thời gian chế biến mà vẫn đảm bảo dinh dưỡng.', 'CA0006', 'WH0006' ),
        ('P00048', 'Thịt kho Knorr', 7500, 24, 27, '2024-11-11', 'Gói', 'Gia vị hoàn chỉnh Knorr là loại gia vị nêm sẵn rất tiện dụng và phổ biến hiện nay. Gia vị hoàn chỉnh kho thịt Knorr 28g chứa đầy đủ các gia vị được phối trộn với một tỷ lệ hoàn hảo, cùng với vị ngon sánh quyện giúp món thịt kho ngon đúng điệu, vừa nhanh chóng lại vừa hấp dẫn.', 'CA0006', 'WH0006'),
        ('P00049', 'Nấm hương Maggi', 12000, 19, 16, '2023-12-05', 'Gói', 'Được chiết xuất từ nấm thiên nhiên giúp bổ sung nhiều dưỡng chất cho sức khỏe. Sản phẩm có nhiều công dụng, từ nêm nếm cho đến ướp, tẩm, mang đến cho món ăn hương vị đậm đà và thơm lừng. Hạt nêm nấm hương thích hợp dùng cho các món xào, nấu canh, ướp… cho cả ăn chay và ăn mặn.', 'CA0006', 'WH0006' ),
        ('P00050', 'Bột chiên giòn', 7500, 21, 27, '2023-11-20', 'Gói', 'Cho những chiếc đùi gà giòn ta, những rau củ quả hay hải sản được chiên giòn. Bột chiên giòn Meizan gói 150g tiện dụng, được căn chỉnh hoàn hảo, cho món chiên giòn rụm thơm ngon. Bột chiên giòn Meizan tiện lợi, an toàn và chất lượng cao.', 'CA0006', 'WH0006' ),
        ('P00051', 'Bột mì đa dụng', 21000, 15, 20, '2023-10-25', 'Gói', 'Bột dùng để làm bánh mì, bánh bông lan, bánh ngọt, bánh rán, bánh pizza, mì sợi, bánh bao hoặc dùng làm các món chiên giòn, tẩm bột. Bột mì đa dụng Meizan gói 1kg tiện lợi, phù hợp cho gia đình bạn. Bột mì Meizan được nhiều người chọn lựa và tin dùng', 'CA0006', 'WH0006' ),
		('P00052', 'Sữa Ông Thọ', 25000, 18, 14, '2024-09-20', 'Hộp', 'Sữa Ông Thọ có thành phần chính là sữa bò tươi, được thu thập từ các nguồn cung cấp sữa đáng tin cậy. Sữa được xử lý và đóng gói theo quy trình chất lượng để đảm bảo giữ được các dưỡng chất tự nhiên và hương vị tuyệt vời của sữa tươi.', 'CA0011', 'WH0011'),
        ('P00053', 'Sữa Ngôi sao', 22000, 15, 19, '2024-06-18', 'Lon', 'Sữa đặc Ngôi sao Phương Nam xanh lá đậm đà đặc sánh, mang lại hương vị hài hòa, thơm béo. Sữa đặc là nguồn nguyên liệu lý tưởng dùng để pha sữa, chấm bánh mì,.. thơm ngon tuyệt vời. Kem đặc có đường Ngôi sao Phương Nam xanh lá lon 380g bí quyết cho món cà phê thơm ngon.', 'CA0011', 'WH0011' ),
        ('P00054', 'Sữa Milo', 7500, 24, 30, '2023-10-28', 'Hộp', 'Sản phẩm sữa cacao, socola thơm ngon, giàu canxi và protein giúp cho cơ thể phát triển. Đặc biệt, thương hiệu sữa ca cao lúa mạch Milo nổi tiếng rất được các bé yêu thích và tin dùng. Thùng 48 hộp thức uống lúa mạch Milo Active Go 180ml cung cấp nguồn năng lượng dồi dào cho bé hoạt động mỗi ngày.', 'CA0011', 'WH0011' );
        
Alter table tblproduct
add column importPrice decimal;
Alter table tblproduct
add column importDate date;
Alter table tblproduct
add column dateManufactured date;

-- delete from tblproduct;
-- drop table tblProduct;

-- TABLE ORDER
Create table tblOrder (
	orderID int primary key auto_increment ,
    orderStatus varchar(50) CHARACTER SET UTF8MB4,
    payMethod varchar(45),
    totalPrice decimal(10,2),
    orderDate date,
	deliveryDate date,
    userID int,
    Foreign key (userID) references tblUser(userID) ON DELETE CASCADE ON UPDATE CASCADE
);

Alter table tblorder
modify column deliveryDate datetime;
-- delete from tblOrder;
-- drop table tblOrder;

-- TABLE ORDER DETAIL
Create table tblOrderDetail (
	orderDetailID int auto_increment ,
    orderID int,
    quantity int,
    productID varchar(7),
    Foreign key (orderID) references tblOrder(orderID) ON DELETE CASCADE ON UPDATE CASCADE, 
    Foreign key (productID) references tblProduct(productID) ON DELETE CASCADE ON UPDATE CASCADE,
    Primary key (orderDetailID, orderID)
);

-- drop table tblOrderDetail;

-- TABLE IMAGES
Create table tblImages (
	imageID int auto_increment primary key ,
    imageURL varchar(255),
    productID varchar(7),
    Foreign key (productID) references tblProduct(productID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO tblImages(imageURL, productID)
VALUES	
('https://saphavi.eu/cdn/shop/products/795F3E45-6423-4A69-8346-7A3AB1529481.jpg?v=1623355777', 'P00004'),
('https://product.hstatic.net/1000400508/product/2d1f507137c3a97accf2d543e2427b28_75c6271d6e0a46429542c22996f55e22_ba902b36d58e4a1291b522213c05c77c_grande.jpg
', 'P00002'),
('https://cdn.tgdd.vn/Files/2019/12/27/1228674/cac-loai-mi-goi-han-quoc-ngon-duoc-gioi-tre-yeu-thich-202112291439252440.jpg', 'P00004'),
('https://cdn.tgdd.vn/Products/Images/2443/125398/loc-6-lon-nuoc-ngot-coca-cola-320ml-1.jpg', 'P00003'),
('https://vn-live-01.slatic.net/p/1bad0f3baf434de8924ce2371c8f2cca.jpg', 'P00007'),
('https://www.vinamilk.com.vn/sua-tuoi-vinamilk/wp-content/uploads/2022/12/Smart-menu-NH_cum-packshot.png', 'P00001'),
('https://salt.tikicdn.com/cache/w1200/ts/product/79/35/58/57d299f7d79449d7611bfd0aec5d7b9e.jpg', 'P00005'),
('https://product.hstatic.net/1000074072/product/nspn-pic1_92074dcfeb834ef9b2b3e55fb8ebcba1_master.png', 'P00006'),
('https://product.hstatic.net/1000074072/product/nspn-pic2_4736e922aefe4a3fae37227878673b0b_master.png', 'P00005'),
('https://www.vinamilk.com.vn/sua-tuoi-vinamilk/wp-content/uploads/2022/03/SN_b0.png', 'P00001'),
('https://nhaphanphoihangtieudung.net/kcfinder/upload/images/sua-ong-tho-trang-380g-thung-48-hop-700x467-1.jpg', 'P00007'),
('https://vtv1.mediacdn.vn/zoom/700_438/2023/2/15/pink150223-16764357215311091538340-crop-16764360563321377681471.jpg', 'P00002');

INSERT INTO tblImages(imageURL, productID)
VALUES	('https://cdn.tgdd.vn/Products/Images/2282/113153/bhx/6-lon-bia-huda-330ml-202303310917552232.jpg', 'P00001'),
		('https://cdn.tgdd.vn/Products/Images/2282/113154/bhx/-202212201544476778.jpg', 'P00001'),
        ('https://storage.googleapis.com/mm-online-bucket/ecommerce-website/uploads/media/247984.jpg', 'P00001'),
        ('https://cdn.tgdd.vn/Products/Images/2282/79011/bhx/thung-24-lon-bia-larue-xanh-330ml-202303130909223046.jpg', 'P00002'),
        ('https://down-vn.img.susercontent.com/file/7ca75773aaf2e7337a5daaacdc1de4c7', 'P00002'),
        ('https://satrafoods.com.vn/uploads/Images/san-pham/do-uong/larue-thungx5.jpg', 'P00002'),
        ('https://nhatban.vn/wp-content/uploads/2021/09/nong-do-con-cua-bia-tiger.jpg', 'P00003'),
        ('https://cdn.tgdd.vn/Products/Images/2282/171021/bhx/6-lon-bia-tiger-330ml-202103162330599969.jpg', 'P00003'),
        ('https://img.sosanhgia.com/images/500x0/e7e2f5f593db4c9f9e584e7d48335e69/bia-tiger-xanh-330ml-thung-24-lon.jpeg', 'P00003'),
        ('https://satrafoods.com.vn/uploads/Images/san-pham/do-uong/8934822804336-5.jpg', 'P00004'),
        ('https://cdn.tgdd.vn/Products/Images/2282/171020/bhx/6-lon-bia-tiger-crystal-330ml-202301152247582379.jpg', 'P00004'),
        ('https://cdn.tgdd.vn/Products/Images/2282/77607/bhx/bia-tiger-crystal-330ml-202301152251260061.jpg', 'P00004'),
        ('https://www.sieuthixanh.com.vn/Upload/products/zoom/Thung-24-chai-nuoc-bu-khoang-Revive-muoi-khoang-500ml132691716428197868.jpg', 'P00005'),
        ('https://cdn.tgdd.vn/Products/Images/3226/112304/bhx/6-chai-nuoc-bu-khoang-revive-muoi-khoang-500ml-202103312248177034.jpg', 'P00005'),
        ('https://cdn.tgdd.vn/Products/Images/3226/83581/bhx/nuoc-ngot-revive-vi-muoi-khoang-chai-500ml-201812060918208543.jpg', 'P00005'),
        ('https://cf.shopee.vn/file/109b9ec4078cf0f36c7c694c949ba379', 'P00006'),
        ('https://cdn.tgdd.vn/Products/Images/3226/128831/bhx/6-chai-nuoc-bu-khoang-revive-chanh-muoi-390ml-202103272142426493.jpg', 'P00006'),
        ('https://cf.shopee.vn/file/58bc39d86e4bedc8949ddf4355e5fd38', 'P00006'),
        ('https://cdn.tgdd.vn/Products/Images/2563/84816/bhx/thung-24-chai-nuoc-tinh-khiet-aquafina-500ml-202303302323537794.jpg', 'P00007'),
        ('https://cdn.tgdd.vn/Products/Images/2563/79247/bhx/nuoc-tinh-khiet-aquafina-500ml-202303302316027103.jpg', 'P00007'),
        ('https://nuocaquafina.com.vn/wp-content/uploads/2019/07/Thung-Aquafina-500ml-4-1.jpeg', 'P00007'),
        ('https://souriredessaveurs.com/2977-large_default/coca-cola-metal-box-33-cl.jpg', 'P00008'),
        ('https://cdn.shopify.com/s/files/1/0521/4525/8669/products/shutterstock_193222430-2.jpg?v=1610844615', 'P00008'),
        ('https://5.imimg.com/data5/CM/QF/QB/SELLER-107310956/2l-coca-cola-cold-drink-500x500.jpg', 'P00008'),
        ('https://lzd-img-global.slatic.net/g/p/b1bd6cb6538cf6bc8b043836d0c4e481.jpg_720x720q80.jpg', 'P00009'),
        ('https://lzd-img-global.slatic.net/g/p/d581f8b32f1f10478ad7044d63ce0c68.jpg_1200x1200q80.jpg_.webp', 'P00009'),
        ('https://vn-live-01.slatic.net/p/35b1e4d55cbc665a8a0e6ace0c8da3d9.jpg', 'P00009'),
        ('https://cdn.tgdd.vn/Products/Images/2563/242253/bhx/nuoc-khoang-co-ga-danh-thanh-sparkling-430ml-202106290844171362.jpg', 'P00010'),
        ('https://binhhaduy.vn/wp-content/uploads/2021/08/9108d09110b1a5e820659b5e20fbaa19.png', 'P00010'),
        ('https://i.ytimg.com/vi/6Z54n94G9GM/sddefault.jpg', 'P00010'),
        ('https://i.ytimg.com/vi/wwDnPykp77g/sddefault.jpg', 'P00011'),
        ('https://vikoda.com.vn/wp-content/uploads/D_-CHANH-PET@4x.png', 'P00011'),
        ('https://cf.shopee.vn/file/5862ee925011618905be3cfd0d9cd992', 'P00011'),
        ('https://cdn.abphotos.link/photos/resized/1024x/1658296632-phptujhpn.png', 'P00012'),
        ('https://cf.shopee.vn/file/8f156d31b1523d41b8afe43eba5e48af', 'P00012'),
        ('https://vn-test-11.slatic.net/p/c32bc80ac0f67bbdca7be1f49540d6fa.jpg', 'P00012'),
        ('https://cdn.tgdd.vn/Products/Images/3237/86724/bhx/ca-nuc-xot-ca-3-co-gai-hop-155g-201906171552105418.jpg', 'P00013'),
        ('https://cdn.tgdd.vn/Products/Images/3237/77107/bhx/ca-nuc-xot-ca-3-co-gai-hop-nap-giut-155g-201905220838438085.jpg', 'P00013'),
        ('https://vn-live-01.slatic.net/p/1b5b29d214d15cecb4bbabf7a02f6657.jpg', 'P00013'),
        ('https://vissanmart.com/hanoi/pub/media/catalog/product/cache/ee97423e9fa68a0b8b7aae16fe28a6ff/h/e/heo_2_l_t_150g.jpg', 'P00014'),
        ('https://csfood.vn/wp-content/uploads/2020/09/Heo-2-L%C3%A1t-3-B%C3%B4ng-Mai-Vissan-H%E1%BB%99p-150g.png', 'P00014'),
        ('https://product.hstatic.net/1000288770/product/thit_heo_2_lat_vissan_loc_4_hop_x_150_g_26852cdf7ccf4556a1e8618178995308_master.jpg', 'P00014'),
        ('https://bizweb.dktcdn.net/thumb/large/100/093/924/products/bo-2-lat-ha-long-canfoco-150g-3.jpg?v=1617257776360', 'P00015'),
        ('https://product.hstatic.net/200000423985/product/upload_fad69ff8f17e414f9c18d3c43b4a2546.jpg', 'P00015'),
        ('https://product.hstatic.net/200000423985/product/upload_3666c4f367684f6d9cc4396272f70200.jpg', 'P00015'),
        ('https://voxivet.com/wp-content/uploads/Vi-dung-trung-ga-30-qua-bang-giay.jpg', 'P00016'),
        ('https://dongsaigonplas.com/vnt_upload/news/11_07_2021/khay-dung-trung-gia-re.4jpg.png', 'P00016'),
        ('https://dongsaigonplas.com/vnt_upload/news/khay-dung-trung-gia-re3.jpg', 'P00016'),
        ('https://vn-live-01.slatic.net/p/26b8c231754594ad20e92447891ae696.jpg', 'P00017'),
        ('https://vietmartjp.com/wp-content/uploads/2020/09/mi-hao-hao-bun-mi-pho-viet-o-nhat-vietmart.jpg', 'P00017'),
        ('https://bachhoaannhien.vn/wp-content/uploads/2020/07/tong-hop-day-du-tat-ca-cac-loai-mi-hao-hao.jpg', 'P00017'),
        ('https://cf.shopee.vn/file/5af184de71e8ed79df65738ea1669ada', 'P00018'),
        ('https://cf.shopee.vn/file/b74937753d7e35b5d2671c6e9f12013f', 'P00018'),
        ('https://down-vn.img.susercontent.com/file/ade601d47d5710fb4d2da1a23d55ae06', 'P00018'),
        ('https://vn-test-11.slatic.net/p/491d576098f67a8411d8f9ffa4e85b9a.jpg', 'P00019'),
        ('https://cdn.tgdd.vn/Products/Images/8638/86042/bhx/thung-30-goi-mi-gau-do-rau-nam-62g-202209280842039509.jpg', 'P00019'),
        ('https://vn-live-01.slatic.net/p/689e0c2fdb8e4ca12da6ecd4eb22abc5.jpg', 'P00019'),
        ('https://vn-test-11.slatic.net/p/2b581f95535d489fadd3771058fe44a2.jpg', 'P00020'),
        ('https://vn-test-11.slatic.net/p/d8affa84c7bf05f2a2c342458b6d2608.jpg', 'P00020'),
        ('https://bizweb.dktcdn.net/100/057/061/files/4-c92f505d-1388-42d8-9782-36d0899b068b.jpg?v=1498719757118', 'P00020'),
        ('https://concung.com/2021/10/52219-75873-large_mobile/nuoc-xa-lam-mem-vai-comfort-dam-dac-cho-da-nhay-cam-tui-3-2l.jpg', 'P00021'),
        ('https://m.media-amazon.com/images/I/41xr56lRZ5L.jpg', 'P00021'),
        ('https://cdn.tgdd.vn/Products/Images/2465/283097/bhx/10-goi-nuoc-xa-vai-comfort-phoi-trong-nha-huong-nang-moi-20ml-202206221001291045.jpg', 'P00021'),
        ('https://cf.shopee.vn/file/3ac29cbea58773793b875f5b125eb701', 'P00022'),
        ('https://ptphucthinh.com/wp-content/uploads/2017/08/XA-VAI-DOWNY-1.8-LIT-HUONG-HUYEN-BI-1.jpg', 'P00022'),
        ('https://m.media-amazon.com/images/I/71hP0jcrR1L.jpg', 'P00022'),
        ('https://vn-test-11.slatic.net/p/c0013badfcd4844a72e8ea4934f8026c.jpg', 'P00023'),
        ('https://vn-test-11.slatic.net/p/db9c73a38b154752c7993d43296af50b.jpg', 'P00023'),
        ('https://laz-img-sg.alicdn.com/p/1b37a2262928f0dc39be80192b8d2617.jpg', 'P00023'),
        ('https://cf.shopee.vn/file/e0e754e51dd3ee07b72e12b25bac37ba', 'P00024'),
        ('https://cdn.tgdd.vn/Products/Images/9081/172751/bhx/giay-ve-sinh-sai-gon-care-2-lop-loc-12-cuon-09112018175057.JPG', 'P00024'),
        ('https://sonca.vn/wp-content/uploads/2019/12/giay-cuon-sai-gon-co-loi.jpg', 'P00024'),
        ('https://cdn.tgdd.vn/Products/Images/2567/76916/bhx/tuong-ot-chinsu-250g-24-2-org.jpg', 'P00025'),
        ('https://cf.shopee.vn/file/8b51f95ca8fe7ffbf91f64a7fe2b1b94', 'P00025'),
        ('https://vn-test-11.slatic.net/p/1389b3df9f242c676b1bc5a002ead3c6.jpg', 'P00025'),
        ('https://product.hstatic.net/1000362139/product/vo_food6_797158f1ca2e49e585f0120590b2086f.jpg', 'P00026'),
        ('https://vn-test-11.slatic.net/p/7f1bff9139045a339cf5b6a8b01127ec.jpg', 'P00026'),
        ('https://ngoclanvpp.vn/User_folder_upload/admin/images/Vo-Campus-NB-BDAW120-2-120-trang.jpeg', 'P00026'),
        ('https://cf.shopee.vn/file/a8b67a7bdfc5c377be4a3105fb0d704c', 'P00027'),
        ('https://vn-live-01.slatic.net/p/6cd91ca9e54881518712fc4ce9c794e9.jpg', 'P00027'),
        ('https://vppdean.vn/uploadwb/hinhsp/TL027_513201834411_b_.png', 'P00027'),
        ('https://www.dutchlady.com.vn/sites/default/files/2022-06/0405_DL_Mockup-label_FRESH_Straw-180ml_2104036.png', 'P00028'),
        ('https://bizweb.dktcdn.net/100/438/624/products/20plusduong.jpg?v=1670670055250', 'P00028'),
        ('https://www.dutchlady.com.vn/sites/default/files/2022-06/FRESH.png', 'P00028'),
        ('https://www.vinamilk.com.vn/sua-tuoi-vinamilk/wp-content/uploads/2022/03/SN_b0.png', 'P00029'),
        ('https://www.vinamilk.com.vn/sua-tuoi-vinamilk/wp-content/uploads/2016/08/1_1-1-1@2x-1.jpg', 'P00029'),
        ('https://www.vinamilk.com.vn/sua-tuoi-vinamilk/wp-content/themes/suanuoc/tpl/fm100-revamp/images/package/packshot-hoa-co-duong.png', 'P00029'),
        ('https://www.simpleskincare.com/sk-eu/content/dam/brands/smile/vietnam/85413339-tra-xanh.jpg', 'P00030'),
        ('https://cf.shopee.vn/file/f6e64b41a64d635c4f9c531496d859e7', 'P00030'),
        ('https://u-shop.vn/images/thumbs/0008229_kem-danh-rang-ps-bao-ve-123-cham-soc-toan-dien-230g_510.png', 'P00030'),
        ('https://vn-live-01.slatic.net/p/0d8f6a8ca249da035e3ee0908820c4e0.jpg', 'P00031'),
        ('https://u-shop.vn/images/thumbs/0003864_kem-danh-rang-closeup-thom-mat-bat-tan-tinh-the-bang-tuyet-230g_510.png', 'P00031'),
        ('https://u-shop.vn/images/thumbs/0012832_kem-danh-rang-close-up-muoi-bien-chanh-230g_510.png', 'P00031'),
        ('https://www.lifebuoy.in/sk-eu/content/dam/brands/lifebuoy/india/2133673-lifebuoy-innovation-lemon-fresh-soap-wrapper-125g.png.rendition.380.380.png', 'P00032'),
        ('https://www.lifebuoy.in/sk-eu/content/dam/brands/lifebuoy/specified_clusterscountries/2133643-lifebuoy-innovation-care-soap-wrapper-125g.png.rendition.380.380.png', 'P00032'),
        ('https://www.lifebuoy.in/sk-eu/content/dam/brands/lifebuoy/india/2133695-lifebuoy-innovation-total-soap-wrapper-125g---total-10.png.rendition.380.380.png', 'P00032'),
        ('https://u-shop.vn/images/thumbs/0012561_bot-giat-surf-huong-nuoc-xa-vai-ngat-huong-xuan-55kg_510.png', 'P00033'),
        ('https://images.depxinh.net/products/item.5_2017/cfe6f4f3-833a-46aa-a3a3-aaad5685ff9a/detail/surf-6kg-ngat-huong-xuan-1-dep-xinh.jpg', 'P00033'),
        ('https://ptphucthinh.com/wp-content/uploads/2017/08/BOT-GIAT-SURF-400G-BICH-1.jpg', 'P00033'),
        ('https://images.depxinh.net/products/item.7_2021/7/detail/243018_bot-giat-omo-do-3kg-mau-moi-1.jpg', 'P00034'),
        ('https://u-shop.vn/images/thumbs/0012265_bot-giat-omo-comfort-tinh-dau-thom-ngat-ngay-53kg_510.png', 'P00034'),
        ('https://lanchi.vn/wp-content/uploads/2021/10/66ea8bfdf2ebc778ec1e51a405c0a2fb.jpg', 'P00034'),
        ('https://cdn.tgdd.vn/Products/Images/2463/178242/bhx/bot-giat-tide-trang-dot-pha-720g-201910221520535928.jpg', 'P00035'),
        ('https://horeco.vn/wp-content/uploads/2019/11/bot-giat-tide-trang-dot-pha-4-1kg.jpg', 'P00035'),
        ('https://vn-live-01.slatic.net/p/8b2ec5f85f1d5244a6506a1668764e7b.jpg', 'P00035'),
        ('https://salt.tikicdn.com/media/catalog/product/b/o/bottle_750g_400g_1_1.jpg', 'P00036'),
        ('https://vanphongphamtaihanoi.com/upload/product/nuoc-rua-chen-sunlight-chanh-800ml.jpg', 'P00036'),
        ('https://images.depxinh.net/products/2018/9/3110/default/chai-rua-chen-sunlight-chanh-750g-nen-dep-xinh.jpg', 'P00036'),
        ('https://myhao.vn/public/userfiles/products/nuoc-tay-trang-javel--2-kg.jpg', 'P00037'),
        ('https://cdn.tgdd.vn/Files/2019/09/26/1202011/cach-dung-nuoc-tay-javel-danh-bay-moi-vet-ban-cung-dau-202201041308439423.jpg', 'P00037'),
        ('https://images.depxinh.net/products/item.12_2016/4503/source/nuoc-tay-javel-1-kg-nen-dep-xinh.jpg', 'P00037'),
        ('https://u-shop.vn/images/thumbs/0012098_nuoc-lau-san-sunlight-huong-que-1kg_510.png', 'P00038'),
        ('https://u-shop.vn/images/thumbs/0010087_nuoc-lau-san-sunlight-tinh-dau-thao-moc-huong-chanh-sa-36kg_510.png', 'P00038'),
        ('https://vppdangchau.net/wp-content/uploads/2021/04/nuoc-lau-san-sunlight-38kg-1.jpg', 'P00038'),
        ('https://www.kpsmall.vn/media/catalog/product/cache/bce07674d1601eba5384b4a304d4e8a1/1/0/1000025051_2.jpg', 'P00039'),
        ('https://img.sosanhgia.com/images/5a11989467324d6eb170a8280411e593/snack-oishi-bi-do-vi-bo-nuong.jpeg', 'P00039'),
        ('https://vn-test-11.slatic.net/p/4242f6c119cb15831d9e4cca5e49a039.jpg', 'P00039'),
        ('https://khaisanfood.vn/wp-content/uploads/2022/11/6-1.png', 'P00040'),
        ('https://www.laysvietnam.com/wp-content/uploads/2019/03/poca-mobile.png', 'P00040'),
        ('https://banhkeogiare.com/wp-content/uploads/2019/10/muclan.jpg', 'P00040'),
        ('https://cf.shopee.vn/file/d9cf8fe5fc5213c505ae6abf47034bb9', 'P00041'),
        ('https://cf.shopee.vn/file/a477f8d8984076ebe730393e096d788b', 'P00041'),
        ('https://storage.googleapis.com/mm-online-bucket/ecommerce-website/uploads/media/390055.jpg', 'P00041'),
        ('https://salt.tikicdn.com/cache/w1200/ts/product/d8/da/e3/478210f64bd2ad42dcd78cb47e5c5365.jpg', 'P00042'),
        ('https://zenmart.vn/Resources/Zenmart/Product/2019/12/192/8936036024692-banh-swing-ga-30g-share-637128978025352253.jpg', 'P00042'),
        ('https://product.hstatic.net/200000513457/product/a78bc9702e89e0fc8004504e3d312951_54d85d7fc9a74b808313ac3827f29fdd.jpg', 'P00042'),
        ('https://cdn.shopify.com/s/files/1/0617/2497/products/1474941245522_5018248_grande_61430dfe-5e7f-441a-a6e9-07890a83b7d4.jpg?v=1614047326', 'P00043'),
        ('https://zikin.vn/wp-content/uploads/2018/09/loc-5-goi-mi-ga-cay-kho-samyang-140-g-5-goi-2.jpg', 'P00043'),
        ('https://zikin.vn/wp-content/uploads/2018/09/mi-ga-sieu-cay-samyang-140-g-5-goi-1.jpg', 'P00043'),
        ('https://www.paldovina.com/wp-content/uploads/2016/12/Koreno-Jumbo-Kimchi-500x500.png', 'P00044'),
        ('https://www.paldovina.com/wp-content/uploads/2016/11/koreno-kimchi-01.png', 'P00044'),
        ('https://cf.shopee.vn/file/b1cec787470573b3a3bcdc6caaeabf1e', 'P00044'),
        ('https://cf.shopee.vn/file/cefa0c236780ffb9821bb31730dea537', 'P00045'),
        ('https://satrafoods.com.vn/uploads/san-pham-cung-loai/89345631932631.jpg', 'P00045'),
        ('https://vn-test-11.slatic.net/p/mdc/c169724763fe66fd35af4c4c4dbb06c9.jpg', 'P00045'),
        ('https://cdn.tgdd.vn/Products/Images/2806/103183/bhx/bot-ngot-ajinomoto-goi-2kg-202006200902241506.jpg', 'P00046'),
        ('https://cooponline.vn/wp-content/uploads/2020/12/bot-ngot-ajinomoto-1kg-1.jpg', 'P00046'),
        ('https://sieuthivmart.com.vn/wp-content/uploads/2021/09/botnogt.jpg', 'P00046'),
        ('https://vn-live-02.slatic.net/p/0c017dab0c650cf530a8772d5ce57d0a.jpg', 'P00047'),
        ('https://cdn.tgdd.vn/Products/Images/8271/206062/bhx/gia-vi-nem-san-thit-kho-tau-aji-quick-goi-32g-202006221010325131.jpg', 'P00047'),
        ('https://product.hstatic.net/1000126467/product/aji-quick__thitkhotau_190606_0b874bc882294930b3b8eb69f817a052_master.jpg', 'P00047'),
        ('https://vietmartjp.com/wp-content/uploads/2020/09/knorr-thit-kho-tau-vietmart-sieu-thi-thuc-pham-viet-tai-nhat.jpg', 'P00048'),
        ('https://www.knorr.com/content/dam/unilever/knorr_world/vietnam/pack_shot/thitkho-63248529-png.png', 'P00048'),
        ('https://s.meta.com.vn/img/thumb.ashx/500x0x95/Data/image/2016/04/08/gia-vi-Knorr-thit-kho-500.jpg', 'P00048'),
        ('https://khohangtieudung.vn/wp-content/uploads/2021/06/Hat-Nem-Maggi-Nam-Huong-2kg.jpg', 'P00049'),
        ('https://cdn.tgdd.vn/Products/Images/8645/77242/bhx/hat-nem-maggi-nam-huong-20-450g-2-700x467.jpg', 'P00049'),
        ('https://concung.com/2022/05/57583-88893-large_mobile/maggi-nam-huong-450g.jpg', 'P00049'),
        ('https://cdn.tgdd.vn/Products/Images/2388/91563/bhx/bot-chien-gion-aji-quick-goi-150g-202001021005290290.jpg', 'P00050'),
        ('https://sieuthihoatoan.com/wp-content/uploads/2021/08/bot-tam-kho-chien-gion-aji-quick-84g.jpg', 'P00050'),
        ('https://meizanclv.com.vn/wp-content/uploads/2021/12/BCG-150g.png', 'P00050'),
        ('https://cdn.tgdd.vn/Products/Images/2388/83375/bhx/bot-mi-da-dung-meizan-goi-1kg-201903221403085142.jpg', 'P00051'),
        ('https://down-vn.img.susercontent.com/file/39fe85b549979780eb2618ffe09fe751', 'P00051'),
        ('https://bizweb.dktcdn.net/thumb/grande/100/004/714/products/bot-my-meizan-500g-ec278299-629c-441d-a2b6-5514d022b447.png?v=1635204967627', 'P00051'),
        ('https://cdn.tgdd.vn/Products/Images/2526/77423/bhx/sua-dac-co-duong-ong-tho-trang-nhan-xanh-lon-380g-201911071524564853.jpg', 'P00052'),
        ('https://vanphongphamvnt.com/ocart3/image/cache/catalog/ProductImage/Thuc_Pham/Sua/S%E1%BB%AFa%20%C3%B4ng%20th%E1%BB%8D-500x500.jpg', 'P00052'),
        ('https://nhaphanphoihangtieudung.net/kcfinder/upload/images/273.jpg', 'P00052'),
        ('https://cdn.tgdd.vn/Files/2019/08/12/1187060/cac-loai-sua-dac-ngoi-sao-phuong-nam-va-chung-khac-nhau-the-nao-202201101303513892.jpg', 'P00053'),
        ('https://barista.vn/UserUpload/Product/sua-dac-ngoi-sao-phuong-nam-xanh-la-.png?Watermark=', 'P00053'),
        ('https://cf.shopee.vn/file/7d98f2a92fffb7e5e651df48e1f935fe', 'P00053'),
        ('https://product.hstatic.net/200000376269/product/958b7a5218baf81be792ec7139f47233_4649db710a204fbf936bc5231c6637ad.jpg', 'P00054'),
        ('https://suachobeyeu.vn/application/upload/products/thuc-uong-lua-mach-nestle-milo-1.jpg', 'P00054'),
        ('https://cf.shopee.vn/file/91d570f267feec598c00518526c487f8', 'P00054');

-- delete from tblimages;
-- drop table tblImages;

-- TABLE PROVINCE
CREATE TABLE tblProvince (
  provinceID int NOT NULL auto_increment primary key,
  nameProvince varchar(64) CHARACTER SET UTF8MB4 NOT NULL
);

INSERT INTO tblProvince (nameProvince) 
VALUES	('Đà Nẵng');

-- drop table tblProvince;

-- TABLE DISTRICT
Create table tblDistrict (
  districtID int NOT NULL auto_increment primary key,
  provinceID int NOT NULL ,
  nameDistrict varchar(64) CHARACTER SET UTF8MB4 NOT NULL,
  Foreign key (provinceID) references tblProvince(provinceID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO tblDistrict (provinceID, nameDistrict) 
VALUES	(1, 'Hải Châu'),
		(1, 'Thanh Khê'),
        (1, 'Sơn Trà'),
        (1, 'Ngũ Hành Sơn'),
        (1, 'Liên Chiểu'),
        (1, 'Cẩm Lệ');

-- drop table tblDistrict;

-- TABLE WARD
Create table tblWards (
  WardsID int NOT NULL auto_increment primary key,
  provinceID int NOT NULL,
  districtID int NOT NULL,
  nameWard varchar(64) CHARACTER SET UTF8MB4 NOT NULL,
  Foreign key (provinceID) references tblProvince(provinceID) ON DELETE CASCADE ON UPDATE CASCADE,
  Foreign key (districtID) references tblDistrict(districtID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO tblWards(provinceID, districtID, nameWard)
VALUES	(1, 1, 'Thạch Thang'), 
		(1, 1, 'Hải Châu 1'), 
		(1, 1, 'Hải Châu 2'), 
		(1, 1, 'Hòa Thuận Đông'), 
		(1, 1, 'Hòa Thuận Tây'), 
		(1, 1, 'Nam Dương'), 
		(1, 1, 'Bình Hiên'), 
		(1, 1, 'Bình Thuận'), 
		(1, 1, 'Hòa Cường Bắc'), 
		(1, 1, 'Hòa Cường Nam'), 
		(1, 1, 'Hòa Thuận Nam'), 
		(1, 1, 'Hòa Minh'), 
		(1, 1, 'Vĩnh Hải'), 
		(1, 1, 'Vĩnh Trung');

INSERT INTO tblWards(provinceID, districtID, nameWard)
VALUES	(1, 2, 'An Khê'), 
		(1, 2, 'Chính Gián'),
		(1, 2, 'Hòa Khê'), 
		(1, 2, 'Tam Thuận'), 
		(1, 2, 'Tân Chính'), 
		(1, 2, 'Thạc Gián'), 
		(1, 2, 'Thạch Thang'), 
		(1, 2, 'Thanh Khê Đông'), 
		(1, 2, 'Thanh Khê Tây'), 
		(1, 2, 'Thọ Quang'), 
		(1, 2, 'Vĩnh Trung'), 
		(1, 2, 'Xuân Hà');
        
INSERT INTO tblWards(provinceID, districtID, nameWard)
VALUES	(1, 3, 'An Hải Bắc'), 
		(1, 3, 'An Hải Đông'), 
		(1, 3, 'An Hải Tây'), 
		(1, 3, 'Mân Thái'), 
		(1, 3, 'Phước Mỹ'), 
		(1, 3, 'Thọ Quang'), 
		(1, 3, 'Nại Hiên Đông'), 
		(1, 3, 'Mỹ An'), 
		(1, 3, 'Phước Mỹ'), 
		(1, 3, 'An Hải Trung'), 
		(1, 3, 'An Hải Nam');

INSERT INTO tblWards(provinceID, districtID, nameWard)
VALUES (1, 4, 'Mỹ An'), (1, 4, 'Khuê Mỹ'), (1, 4, 'Khuê Trung'), (1, 4, 'Hòa Quý'), (1, 4, 'Hòa Hải');

INSERT INTO tblWards(provinceID, districtID, nameWard)
VALUES (1, 5, 'Hòa Hiệp Bắc'), (1, 5, 'Hòa Hiệp Nam'), (1, 5, 'Hòa Khánh Bắc'), (1, 5, 'Hòa Khánh Nam'), (1, 5, 'Hòa Minh');

INSERT INTO tblWards(provinceID, districtID, nameWard)
VALUES (1, 6, 'Khuê Trung'), (1, 6, 'Khuê Thượng'), (1, 6, 'Hòa Phát'), (1, 6, 'Hòa An'), (1, 6, 'Hòa Thọ Đông'), (1, 6, 'Hòa Thọ Tây');


-- drop table tblWards;

-- TABLE CART
Create table tblCart (
	cartID int auto_increment primary key,
	productID varchar(7) ,
    userID int NOT NULL, 
    quantity int,
    Foreign key (productID) references tblProduct(productID) ON DELETE CASCADE ON UPDATE CASCADE,
    Foreign key (userID) references tblUser(userID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO tblCart (productID, userID, quantity )
VALUES	('P00001', 2, 12),
		('P00002', 5, 8),
        ('P00003', 1, 11),
        ('P00004', 4, 9),
        ('P00005', 3, 15);
        
-- drop table tblCart;
        
-- TABLE UserAddress
Create table tblUserAddress (
	userAddressID int auto_increment primary key,
    userNameAddress varchar(100) CHARACTER SET UTF8MB4 NOT NULL,
    userID int NOT NULL,
    WardsID int NOT NULL,
    Foreign key (userID) references tblUser(userID) ON DELETE CASCADE ON UPDATE CASCADE,
    Foreign key (WardsID) references tblWards(WardsID) ON DELETE CASCADE ON UPDATE CASCADE
);

ALTER TABLE tblOrder
ADD COLUMN userAddressID INT,
ADD FOREIGN KEY (userAddressID) REFERENCES tblUserAddress(userAddressID) ON DELETE CASCADE ON UPDATE CASCADE;
        
-- drop table tblUserAddress;

Select * from tblCart;
      
Alter table tblproduct modify productID varchar(50);
Alter table tblimages modify productID varchar(50);
Alter table tblCart modify productID varchar(50);
Alter table tblOrderDetail modify productID varchar(50);





















































































































