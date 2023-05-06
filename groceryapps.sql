Create Database GroceryApps;

Use GroceryApps;

-- drop database groceryapps

-- TABLE USER
Create table tblUser(
	userName varchar(25),
    passWord varchar(50)
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
	supplierID varchar(7) primary key ,
    supplierName varchar(50) CHARACTER SET UTF8MB4 ,
    supplierAddress varchar(50) CHARACTER SET UTF8MB4,
    supplierPhone varchar(11) unique,
    supplierEmail varchar(50) unique
);

INSERT INTO tblSupplier
VALUES 	('SUP001', 'Coca Cola', '123 Main St, City A', '033251649', 'abc@company.com'),
		('SUP002', 'Pepsi', '456 Broadway, City B', '0987654321', 'xyz@corp.com'),
		('SUP003', 'Telio', '789 Park Ave, City C', '0935198477', '123@inc.com'),
		('SUP004', 'Wabi2b', '1010 Industrial Blvd, City D', '0935662583', 'supplies@co.com'),
		('SUP005', 'Mỳ gói', '555 Fifth Ave, City E', '0905267489', 'global@enterprises.com'),
		('SUP006', 'Huda', '777 Seventh St, City F', '0235977856', 'jj@supplies.com'),
		('SUP007', 'Larue', '888 Best Blvd, City G', '0905222437', 'best@inc.com');

-- drop table tblSupplier;

-- TABLE CATEGORY
Create table tblCategory (
	categoryID varchar(11) primary key ,
    categoryName varchar(50) CHARACTER SET UTF8MB4
);

INSERT INTO tblCategory 
VALUES	('CA0001', 'Đồ uống có cồn'),
		('CA0002', 'Nước giải khát'),
		('CA0003', 'Thực phẩm đóng hộp'),
		('CA0004', 'Mì ăn liền'),
		('CA0005', 'Thuốc lá'),
		('CA0006', 'Gia vị'),
		('CA0007', 'Khăn lau miệng'),
        ('CA0008', 'Nước mắm'),
		('CA0009', 'Dầu gội');

-- drop table tblCategory;

-- TABLE PRODUCT
Create table tblProduct (
	productID varchar(7) primary key ,
    productName varchar(30) CHARACTER SET UTF8MB4,
    price decimal,
    quantity int,
    stockQuantity int,
    expirationDate datetime,
    unit varchar(30),
    productDescription varchar(255) CHARACTER SET UTF8MB4,
    productStatus varchar(2) CHARACTER SET UTF8MB4,
    categoryID varchar(11),
    categoryName varchar(30) CHARACTER SET UTF8MB4,
    supplierID varchar(7),
    supplierName varchar(50) CHARACTER SET UTF8MB4,
    Foreign key (categoryID) references tblCategory(categoryID) ON DELETE CASCADE ON UPDATE CASCADE ,
    Foreign key (supplierID) references tblSupplier(supplierID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO tblProduct 
VALUES	('P00001', 'Sữa tươi Vinamilk 180ml', 8000, 100, 50, '2023-05-31 23:59:59', 'Hộp', 'Sữa tươi nguyên kem', '1', 'CA0001', 'Sữa tươi', 'SUP001', 'Vinamilk'),
		('P00002', 'Bánh quy Oreo', 15000, 200, 80, '2024-12-31 23:59:59', 'Hộp', 'Bánh quy kem socola', '1', 'CA0002', 'Bánh quy', 'SUP002', 'Mondelez'),
		('P00003', 'Nước ngọt Coca Cola 500ml', 12000, 150, 50, '2023-09-30 23:59:59', 'Lon', 'Nước ngọt Coca Cola', '1', 'CA0003', 'Nước ngọt', 'SUP003', 'Coca Cola'),
		('P00004', 'Bia Sài Gòn 333 330ml', 15000, 100, 30, '2024-06-30 23:59:59', 'Lon', 'Bia Sài Gòn 333', '1', 'CA0004', 'Bia', 'SUP004', 'Sài Gòn 333'),
		('P00005', 'Cháo hạt dinh dưỡng Nutifood', 20000, 80, 20, '2023-11-30 23:59:59', 'Hộp', 'Cháo hạt dinh dưỡng Nutifood', '1', 'CA0005', 'Cháo', 'SUP005', 'Nutifood'),
		('P00006', 'Súp đặc chế Knorr 60g', 7000, 150, 70, '2024-04-30 23:59:59', 'Gói', 'Súp đặc chế Knorr', '1', 'CA0006', 'Súp', 'SUP006', 'Knorr'),
		('P00007', 'Sữa đặc Nestle hộp 397g', 22000, 60, 15, '2024-10-31 23:59:59', 'Hộp', 'Sữa đặc Nestle', '1', 'CA0001', 'Sữa tươi', 'SUP007', 'Nestle');

-- drop table tblProduct;

-- TABLE WAREHOUSE
Create table tblWareHouse (
	productID varchar(7) primary key ,
    productName varchar(30) CHARACTER SET UTF8MB4,
    importQuantity int,
    exportQuantity int,
    stockQuantity int,
    dateImport datetime,
    dateExport datetime,
    Foreign key (productID) references tblProduct(productID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO tblWareHouse 
VALUES ('P00001', 'Sữa tươi Vinamilk', 100, 50, 50, '2023-05-02 10:00:00', NULL),
       ('P00002', 'Coca-cola', 200, 100, 100, '2023-05-01 15:00:00', '2023-05-02 09:00:00'),
       ('P00003', 'Trứng gà', 500, 400, 100, '2023-05-02 11:00:00', NULL),
       ('P00004', 'Mỳ tôm', 1000, 800, 200, '2023-05-01 12:00:00', '2023-05-02 14:00:00'),
       ('P00005', 'Sữa đậu nành Meizan', 300, 200, 100, '2023-05-02 08:00:00', NULL),
       ('P00006', 'Khoai tây chiên', 400, 300, 100, '2023-05-02 13:00:00', NULL),
       ('P00007', 'Bánh Oreo', 200, 100, 100, '2023-05-01 17:00:00', '2023-05-02 10:30:00');

-- drop table tblWareHouse;

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

-- drop table tblOrderDetail;

-- TABLE BILL
Create table tblBill (
	bill_ID varchar(7) primary key ,
    productName varchar(30) CHARACTER SET UTF8MB4,
    quantityProduct int,
    price decimal(10,2),
    payBill double,
    invoiceDate date,
    invoiceStatus varchar(30) CHARACTER SET UTF8MB4,
    customerID varchar(7),
    customerName varchar(20) CHARACTER SET UTF8MB4,
    productID varchar(7),
	Foreign key (productID) references tblProduct(productID) ON DELETE CASCADE ON UPDATE CASCADE,
    Foreign key (customerID) references tblCustomer(customerID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO tblBill
VALUES	('B00001', 'Sữa tươi Vinamilk', 5, 15000, 75000, '2023-05-02', 'Đã thanh toán', 'CUS001', 'Pep Guardiola', 'P00001'),
		('B00002', 'Bánh mì trứng', 10, 5000, 50000, '2023-05-02', 'Đã thanh toán', 'CUS004', 'Tom Cruise', 'P00003'),
		('B00003', 'Nước suối Lavie', 20, 10000, 200000, '2023-05-02', 'Đã thanh toán', 'CUS006', 'Jurgen Kloop', 'P00005');

-- drop table tblBill;

-- TABLE BILL DETAIL
Create table tblBillDetail (
	billDetailID varchar(7) primary key ,
    bill_ID varchar(7),
    quantityProduct int,
    price decimal(10,2),
    productID varchar(7),
    Foreign key (bill_ID) references tblBill(bill_ID) ON DELETE CASCADE ON UPDATE CASCADE,
    Foreign key (productID) references tblProduct(productID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO tblBillDetail 
VALUES	('BD0001', 'B00001', 5, 15000, 'P00001'),
		('BD0002', 'B00002', 10, 5000, 'P00003'),
		('BD0003', 'B00003', 20, 10000, 'P00005');

-- drop table tblBillDetail;

-- TABLE REVENUE
Create table tblRevenue (
	revenueID varchar(11) PRIMARY KEY,
	bill_ID varchar(7),
    invoiceDate date,
    total_InvoiceValue double,
	customerID varchar(7)  ,
    totalPayment double,
    paymentMethod varchar(20) CHARACTER SET UTF8MB4,
    paymentStatus varchar(30) CHARACTER SET UTF8MB4,
    datePayment datetime,
    Foreign key (customerID) references tblCustomer(customerID) ON DELETE CASCADE ON UPDATE CASCADE,
    Foreign key (bill_ID) references tblBill(bill_ID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO tblRevenue 
VALUES 	('R00001', 'B00001', '2023-05-02', 22000, 'CUS001', 22000, 'Cash', 'Đã thanh toán', '2023-05-02 10:30:00'),
		('R00002', 'B00002', '2023-05-02', 55000, 'CUS005', 55000, 'Cash', 'Đã thanh toán', '2023-05-02 10:30:00'),
        ('R00003', 'B00002', '2023-05-02', 95000, 'CUS004', 95000, 'Cash', 'Đã thanh toán', '2023-05-02 10:30:00'),
        ('R00004', 'B00003', '2023-05-02', 45000, 'CUS001', 45000, 'Cash', 'Đã thanh toán', '2023-05-02 10:30:00');

-- drop table tblRevenue;

-- TABLE SALE HISTORY
Create table tblSaleHistory (
	saleHistoryID varchar(7) PRIMARY KEY,
	productID varchar(7) ,
    exportQuantity int,
    price varchar(10),
    saleDate datetime,
    bill_ID varchar(7),
    customerID varchar(7),
    customerName varchar(20) CHARACTER SET UTF8MB4,
    Foreign key (customerID) references tblCustomer(customerID) ON DELETE CASCADE ON UPDATE CASCADE,
    Foreign key (productID) references tblProduct(productID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO tblSaleHistory
VALUES	('SH0001', 'P00001', 3, '20000', '2023-04-30 10:30:00', 'B00001', 'CUS001', 'Joel Glazer'),
		('SH0002', 'P00002', 2, '15000', '2023-04-30 11:45:00', 'B00001', 'CUS001', 'Tom Hanks'),
		('SH0003', 'P00001', 1, '22000', '2023-05-01 09:15:00', 'B00002', 'CUS002', 'Erik Ten Hag');

-- drop table tblSaleHistory;

-- TABLE IMPORT HISTORY
Create table tblImportHistory (
	importHistoryID varchar(7) primary key,
	productID varchar(7) ,
    importQuantity int,
    dateImport datetime,
    price DECIMAL(10, 2),
    Foreign key (productID) references tblProduct(productID) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO tblImportHistory 
VALUES	('IH00001', 'P00001', 100, '2022-01-01', 20000),
		('IH00002', 'P00002', 50, '2022-01-02', 41000),
        ('IH00004', 'P00003', 75, '2022-01-03', 14000),
		('IH00003', 'P00005', 75, '2022-01-03', 18000);

-- drop table tblImportHistory;

-- TABLE IMAGES
Create table tblImages (
	imageID int primary key ,
    imageName varchar(255)
);

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











































































































