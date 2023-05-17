Create Database GroceryApps;

Use GroceryApps;

-- drop database groceryapps;

-- TABLE USER
Create table tblUser(
	userName varchar(25),
    passWord varchar(255),
    fullName varchar(50) CHARACTER SET UTF8MB4,
    email varchar(255)
);

-- drop table tblUser

-- TABLE CUSTOMER
Create table tblCustomer (
	customerID varchar(7) primary key  ,
    customerName varchar(20) CHARACTER SET UTF8MB4 ,
    customerPhone varchar(11) unique ,
    customerEmail varchar(50) unique ,
    customerAddress varchar(30) CHARACTER SET UTF8MB4 ,
    customerBirthday date 
);

Insert into tblcustomer
Values ('CUS001', 'Joel Glazer', '0905288747', 'joel@gmail.com', 'US', '2001-02-05'),
	   ('CUS002', 'Avram Glazer', '037345659', 'avram@gmail.com', '123 Main St', '1999-08-11'),
       ('CUS003', 'Pep Guardiola', '033524789', 'pep@gmail.com', '456 Oak St', '1990-12-12'),
	   ('CUS004', 'Jurgen Kloop', '0906456881', 'kloop@gmail.com', '789 Pine St', '1970-10-09'),
	   ('CUS005', 'Erik Ten Hag', '0935489621', 'erik@gmail.com', '456 Maple St', '1980-07-08'),
	   ('CUS006', 'Will Smith', '0905666381', 'will@gmail.com', '789 Oak St', '1968-04-19'),
	   ('CUS007', 'Tom Cruise', '0933528944', 'tom@gmail.com', '123 Pine St', '1988-11-25'),
	   ('CUS008', 'Tom Hanks', '0299146238', 'hanks@gmail.com', '456 Elm St', '1955-09-08');

-- drop table tblCustomer;

-- TABLE SUPPLIER
Create table tblSupplier (
	customerID varchar(7) primary key references tblCustomer(customerID) ON DELETE CASCADE ON UPDATE CASCADE ,
    supplierName varchar(50) CHARACTER SET UTF8MB4 ,
    supplierAddress varchar(50) CHARACTER SET UTF8MB4,
    supplierPhone varchar(11) unique,
    supplierEmail varchar(50) unique,
    suppImage varchar(255)
);

INSERT INTO tblSupplier
VALUES 	('CUS001', 'Coca Cola', '123 Main St, City A', '033251649', 'abc@company.com', 'https://static.vecteezy.com/system/resources/previews/007/978/653/original/coca-cola-popular-drink-brand-logo-vinnytsia-ukraine-may-16-202-free-vector.jpg' ),
		('CUS002', 'Pepsi', '456 Broadway, City B', '0987654321', 'xyz@corp.com', 'https://static.vecteezy.com/system/resources/previews/007/978/618/original/pepsi-popular-drink-brand-logo-vinnytsia-ukraine-may-16-202-free-vector.jpg'),
		('CUS003', 'Telio', '789 Park Ave, City C', '0935198477', '123@inc.com', 'https://cdn.techinasia.com/data/images/dKUpDjIFvZwS2XQroWo4isM9ckoywNrOdRVeybwh.png'),
		('CUS004', 'Wabi2b', '1010 Industrial Blvd, City D', '0935662583', 'supplies@co.com', 'https://play-lh.googleusercontent.com/HRRTDjyiT-T09g1V9bSjb_ZuL9-ZuMcl_oW45Bn5u1ZW0JHpEr6yA0DwRV1cOAAALiUK'),
		('CUS005', 'Omachi', '555 Fifth Ave, City E', '0905267489', 'global@enterprises.com', 'https://logowik.com/content/uploads/images/omachi-saga7671.logowik.com.webp' ),
		('CUS006', 'Bút bi', '777 Seventh St, City F', '0235977856', 'jj@supplies.com', 'https://vietworld.world/Userfiles/Upload/images/Download/2017/5/29/e80c2904036e416899c4342c1acf485e.JPG'),
		('CUS007', 'Larue', '888 Best Blvd, City G', '0905222437', 'best@inc.com', 'https://brademar.com/wp-content/uploads/2022/09/Larue-Logo-PNG.png'),
        ('CUS008', 'TH True Milk', 'TH Best Milk, City Blue', '0905781437', 'milk@inc.com', 'https://inkythuatso.com/uploads/thumbnails/800/2021/11/logo-th-true-milk-inkythuatso-01-18-15-23-19.jpg');

-- drop table tblSupplier;

-- TABLE CATEGORY
Create table tblCategory (
	categoryID varchar(11) primary key ,
    categoryName varchar(50) CHARACTER SET UTF8MB4,
    categoryColor varchar(40),
    categoryImage varchar(255)
);

INSERT INTO tblCategory 
VALUES	('CA0001', 'Đồ uống có cồn', 'rgba(248, 164, 76, 0.1)', 'https://vtv1.mediacdn.vn/zoom/550_339/2019/3/4/bigstock-alcoholic-drinks-emerging-europe-1551665990593522364791.jpg'),
		('CA0002', 'Nước giải khát', 'rgba(211, 176, 224, 0.25)', 'https://tiensinuoc.com/wp-content/uploads/2022/02/dai-ly-nuoc-giai-khat-ct-tnhh-binh-minh.jpg'),
		('CA0003', 'Thực phẩm đóng hộp', 'rgba(211, 176, 224, 0.25)', 'https://efoodvietnam.com/wp-content/uploads/2022/11/thuc-pham-dong-hop-va-nhung-dieu-can-biet.jpg'),
		('CA0004', 'Mì ăn liền', 'rgba(248, 164, 76, 0.1)', 'https://i.doanhnhansaigon.vn/2020/01/11/migoi-1578742010.jpg'),
		('CA0005', 'Xả vải', 'rgba(248, 164, 76, 0.1)', 'https://cdn.tgdd.vn//Files/News/2022/06/02/730x450-(32)-845x450.jpg'),
		('CA0006', 'Gia vị', 'rgba(211, 176, 224, 0.25)', 'https://cdn.tgdd.vn/2020/12/CookProduct/thumbcn-1200x676-9.jpg'),
		('CA0007', 'Khăn lau miệng', 'rgba(211, 176, 224, 0.25)', 'https://cdn.tgdd.vn/Files/2022/05/24/1434536/review-khan-giay-pulppy-co-tot-khong-gia-bao-nhieu-202205240722077776.jpg'),
        ('CA0008', 'Nước tương', 'rgba(248, 164, 76, 0.1)', 'https://daotaobeptruong.vn/wp-content/uploads/2019/07/nuoc_tuong_la_gi.png'),
		('CA0009', 'Vở', 'rgba(248, 164, 76, 0.1)', 'https://product.hstatic.net/1000362139/product/vo_earth1_e5858e2da0b541d585370f8011bb3a27.png'),
        ('CA0010', 'Bút', 'rgba(211, 176, 224, 0.25)', 'https://cdn3.dhht.vn/wp-content/uploads/2022/08/top-10-hang-but-ky-ten-cao-cap-5-noi-ban-but-ky-uy-tin-bia.jpg');

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
VALUES ('WH0001', 'Sữa tươi', 100, 50, 50, '2023-01-01 10:00:00', NULL),
       ('WH0002', 'Nước uống', 200, 100, 100, '2023-01-01 15:00:00', '2023-01-03 09:00:00'),
       ('WH0003', 'Trứng', 500, 400, 100, '2023-01-02 11:00:00', NULL),
       ('WH0004', 'Mỳ', 1000, 800, 200, '2023-01-01 12:00:00', '2023-01-07 14:00:00'),
       ('WH0005', 'Dầu đậu nành', 300, 200, 100, '2023-01-02 08:00:00', NULL),
       ('WH0006', 'Giấy', 400, 300, 100, '2023-01-12 13:00:00', NULL),
       ('WH0007', 'Bánh', 200, 100, 100, '2023-01-10 17:00:00', '2023-01-14 10:30:00');

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
    productDescription varchar(400) CHARACTER SET UTF8MB4,
    categoryID varchar(11),
    wareHouseID varchar(7),
    foreign key (wareHouseID) references tblWareHouse(wareHouseID) ON DELETE CASCADE ON UPDATE CASCADE ,
    Foreign key (categoryID) references tblCategory(categoryID) ON DELETE CASCADE ON UPDATE CASCADE 
);

INSERT INTO tblProduct 
VALUES	('P00001', 'Sữa tươi Vinamilk 180ml', 8000, 100, 50, '2023-07-31', 'Hộp', 'Sữa tươi Vinamilk 180ml là một sản phẩm sữa tươi tinh khiết và thơm ngon. Được đóng gói trong hũ nhựa tiện lợi, sữa tươi Vinamilk 180ml rất dễ dàng để bạn mang theo và thưởng thức bất cứ khi nào bạn muốn.', 'CA0001', 'WH0001'),
		('P00002', 'Bánh quy Oreo', 15000, 200, 80, '2024-12-10', 'Hộp', 'Bánh quy Oreo là một loại bánh quy kẹo phổ biến và được yêu thích trên toàn thế giới. Với hai lớp bánh quy màu đen giữa là một lớp kem vani ngọt ngào, bánh quy Oreo mang đến sự kết hợp giữa vị ngọt, tạo nên trải nghiệm ăn rất đặc biệt.', 'CA0002', 'WH0002'),
		('P00003', 'Nước ngọt Coca Cola 500ml', 12000, 150, 50, '2023-09-20', 'Lon', 'Coca Cola là một loại nước ngọt nổi tiếng trên toàn cầu, với hương vị ngọt ngào, hòa quyện giữa các thành phần như đường, gas và các hương liệu bí mật. Nước ngọt Coca Cola có màu đen đặc trưng và được đóng trong lon hoặc chai, mang lại cảm giác sảng khoái và tươi mát khi uống.', 'CA0003', 'WH0003'),
		('P00004', 'Bia Sài Gòn 333 330ml', 15000, 100, 30, '2024-08-30', 'Lon', 'Bia Sài Gòn là một loại bia nổi tiếng được sản xuất tại Việt Nam. Với màu vàng óng ánh và hương vị tươi mát, bia Sài Gòn mang đến trải nghiệm thưởng thức bia đậm đà và đáng nhớ. ', 'CA0004', 'WH0004'),
		('P00005', 'Cháo hạt dinh dưỡng Nutifood', 20000, 80, 20, '2023-11-20', 'Hộp', 'Cháo hạt dinh dưỡng Nutifood là một sản phẩm chất lượng cao dành cho trẻ em. Cháo được làm từ các hạt dinh dưỡng tự nhiên như gạo, ngô, đậu xanh, kết hợp với các thành phần giàu vitamin và khoáng chất.', 'CA0005', 'WH0005'),
		('P00006', 'Súp đặc chế Knorr 60g', 7000, 150, 70, '2024-04-30', 'Gói', 'Súp đặc chế Knorr 60g là một sản phẩm súp tiện lợi và ngon miệng. Được đóng gói trong gói 60g, súp Knorr mang đến hương vị đậm đà và tươi ngon. Với các thành phần tinh túy và hỗn hợp gia vị đặc biệt, súp Knorr là một lựa chọn hấp dẫn để thưởng thức trong bữa ăn hàng ngày hoặc khi bạn cần một tô súp ấm nóng và thú vị.', 'CA0006', 'WH0006'),
		('P00007', 'Sữa đặc Nestle hộp 397g', 22000, 60, 15, '2024-09-15', 'Hộp', 'Sữa đặc Nestle là một sản phẩm sữa đậm đặc giàu chất dinh dưỡng. Với hàm lượng cao về protein, canxi và các vitamin quan trọng, sữa đặc Nestle là một nguồn dinh dưỡng hữu ích cho cả trẻ em và người lớn.', 'CA0001', 'WH0007');

-- drop table tblProduct;

-- TABLE ORDER
Create table tblOrder (
	orderID varchar(11) primary key ,
    orderStatus varchar(50) CHARACTER SET UTF8MB4,
    payMethod varchar(45),
    totalValue decimal(10,2),
    orderDate date,
	deliveryDate date,
    customerID varchar(7),
    Foreign key (customerID) references tblCustomer(customerID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO tblOrder (orderID, orderStatus, payMethod, totalValue, orderDate, deliveryDate, customerID)
VALUES ('ORD001', 'Chưa giao', 'Cash', 100.50, '2022-05-03', '2022-05-05', 'CUS001'),
       ('ORD002', 'Đã giao', 'Credit Card', 220.75, '2022-05-04', '2022-05-06', 'CUS002'),
       ('ORD003', 'Đang xử lý', 'Cash', 300.00, '2022-05-05', '2022-05-08', 'CUS001'),
       ('ORD004', 'Chưa giao', 'Credit Card', 75.25, '2022-05-05', '2022-05-07', 'CUS003'),
       ('ORD005', 'Bị huỷ', 'PayPal', 50.00, '2022-05-06', NULL, 'CUS002'),
       ('ORD006', 'Đang xử lý', 'Cash', 150.00, '2022-05-07', '2022-05-09', 'CUS001'),
       ('ORD007', 'Đã giao', 'Credit Card', 90.25, '2022-05-08', '2022-05-10', 'CUS003');

-- drop table tblOrder;

-- TABLE ORDER DETAIL
Create table tblOrderDetail (
	orderDetailID varchar(11) ,
    orderID varchar(11),
    quantity int,
    orderDetailAmount int,
    orderDetailStatus varchar(11) CHARACTER SET UTF8MB4,
    productID varchar(7),
    Foreign key (orderID) references tblOrder(orderID) ON DELETE CASCADE ON UPDATE CASCADE, 
    Foreign key (productID) references tblProduct(productID) ON DELETE CASCADE ON UPDATE CASCADE,
    Primary key (orderDetailID, orderID)
);

INSERT INTO tblOrderDetail (orderDetailID, orderID, quantity, orderDetailAmount, orderDetailStatus, productID)
VALUES 
	('OD0001', 'ORD001', 2, 10, 'Đang giao', 'P00001'),
	('OD0002', 'ORD001', 1, 9, 'Đã giao', 'P00003'),
	('OD0003', 'ORD002', 3, 5, 'Đang xử lý', 'P00002'),
	('OD0004', 'ORD003', 4, 20, 'Đang giao', 'P00005'),
	('OD0005', 'ORD003', 2, 11, 'Đã giao', 'P00004'),
	('OD0006', 'ORD003', 1, 6, 'Đã giao', 'P00006');
    
INSERT INTO tblOrderDetail 
VALUES 
	('OD0007', 'ORD001', 2, 5, 'Đã giao', 'P00004');
    
INSERT INTO tblOrderDetail 
VALUES 
	('OD0008', 'ORD001', 2, 7, 'Đã giao', 'P00001');

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
  Foreign key (districtID) references tblDistrict(districtID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO tblWards (provinceID, districtID, nameWard)
VALUES	(1, 3, 'An Hải Bắc'),
		(1, 3, 'An Hải Đông'),
        (1, 3, 'An Hải Tây'),
        (1, 1, 'Bình Hiên'),
        (1, 1, 'Hải Châu 1'),
        (1, 1, 'Hải Châu 2'),
        (1, 2, 'Tam Thuận'),
        (1, 1, 'Thanh Bình'),
        (1, 1, 'Thuận Phước'),
        (1, 2, 'Vĩnh Trung');

-- drop table tblWards;












































































































