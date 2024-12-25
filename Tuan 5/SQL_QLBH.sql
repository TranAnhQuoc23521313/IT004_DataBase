﻿--CREATE DATABASE QLBH;

USE QLBH;

/*
CREATE TABLE KHACHHANG
(
	MAKH CHAR(4) NOT NULL,
	HOTEN VARCHAR(40),
	DCHI VARCHAR(50),
	SODT VARCHAR(20),
	NGSINH SMALLDATETIME,
	NGDK SMALLDATETIME,
	DOANHSO MONEY,
)

CREATE TABLE NHANVIEN
(
	MANV CHAR(4) NOT NULL,
	HOTEN VARCHAR(40),
	SODT VARCHAR(20),
	NGVL SMALLDATETIME,
)

CREATE TABLE SANPHAM
(
	MASP CHAR(4) NOT NULL,
	TENSP VARCHAR(40),
	DVT VARCHAR(20),
	NUOCSX VARCHAR(40),
	GIA MONEY,
)

CREATE TABLE HOADON
(
	SOHD INT NOT NULL,
	NGHD SMALLDATETIME,
	MAKH CHAR(4),
	MANV CHAR(4),
	TRIGIA MONEY,
)

CREATE TABLE CTHD
(
	SOHD INT NOT NULL,
	MASP CHAR(4) NOT NULL,
	SL INT,
)
*/

-- BÀI TẬP 1 - PHẦN 1:
-- 1.Tạo các quan hệ và khai báo các khóa chính, khóa ngoại của quan hệ.

ALTER TABLE KHACHHANG ADD CONSTRAINT PK_KHACHHANG PRIMARY KEY (MAKH)
ALTER TABLE NHANVIEN ADD CONSTRAINT PK_NHANVIEN PRIMARY KEY (MANV)
ALTER TABLE SANPHAM ADD CONSTRAINT PK_SANPHAM PRIMARY KEY (MASP)
ALTER TABLE HOADON ADD CONSTRAINT PK_HOADON PRIMARY KEY (SOHD)
ALTER TABLE CTHD ADD CONSTRAINT FK_SOHD FOREIGN KEY (SOHD) REFERENCES HOADON(SOHD)
ALTER TABLE CTHD ADD CONSTRAINT FK_MASP FOREIGN KEY (MASP) REFERENCES SANPHAM(MASP)
ALTER TABLE HOADON ADD CONSTRAINT FK_MAKH FOREIGN KEY (MAKH) REFERENCES KHACHHANG(MAKH)
ALTER TABLE HOADON ADD CONSTRAINT FK_MANV FOREIGN KEY (MANV) REFERENCES NHANVIEN(MANV)
ALTER TABLE CTHD ADD CONSTRAINT PK_CTHD PRIMARY KEY (SOHD,MASP)


-- 2.Thêm vào thuộc tính GHICHU có kiểu dữ liệu varchar(20) cho quan hệ SANPHAM.

ALTER TABLE SANPHAM ADD GHICHU VARCHAR(20)


-- 3.Thêm vào thuộc tính LOAIKH có kiểu dữ liệu là tinyint cho quan hệ KHACHHANG.

ALTER TABLE KHACHHANG ADD LOAIKH TINYINT


-- 4.Sửa kiểu dữ liệu của thuộc tính GHICHU trong quan hệ SANPHAM thành varchar(100).

ALTER TABLE SANPHAM ALTER COLUMN GHICHU VARCHAR(100)


-- 5.Xóa thuộc tính GHICHU trong quan hệ SANPHAM.

ALTER TABLE SANPHAM DROP COLUMN GHICHU


-- 6.Làm thế nào để thuộc tính LOAIKH trong quan hệ KHACHHANG có thể lưu các giá trị là: “Vang lai”, “Thuong xuyen”, “Vip”, ...

ALTER TABLE KHACHHANG ALTER COLUMN LOAIKH VARCHAR(40)

-- 7.Đơn vị tính của sản phẩm chỉ có thể là (“cay”,”hop”,”cai”,”quyen”,”chuc”)

ALTER TABLE SANPHAM ADD CONSTRAINT CK_DVT CHECK ( DVT IN ('cay','hop','cai','quyen','chuc'))


-- 8.Giá bán của sản phẩm từ 500 đồng trở lên.

ALTER TABLE SANPHAM ADD CONSTRAINT CK_GIA CHECK ( GIA >= 500 )


-- 9.Mỗi lần mua hàng, khách hàng phải mua ít nhất 1 sản phẩm.

ALTER TABLE CTHD ADD CONSTRAINT CK_SL CHECK (SL >= 1)


-- 10.Ngày khách hàng đăng ký là khách hàng thành viên phải lớn hơn ngày sinh của người đó.

ALTER TABLE KHACHHANG ADD CONSTRAINT CK_NGDK CHECK ( NGDK > NGSINH)

-- TUẦN 2 ---------------------------------------------------------------------------------

-- Bài tập 1 -- 

-- Phần II: Câu 1

------------ Nhập dữ liệu NHÂN VIÊN ---------------------------------------------------------------------------

INSERT INTO NHANVIEN(MANV,HOTEN,SODT,NGVL) VALUES('NV01','Nguyen Nhu Nhut','0927345678','2006-04-13')
INSERT INTO NHANVIEN(MANV,HOTEN,SODT,NGVL) VALUES('NV02','Le Thi Phi Yen','0987567390','2006-04-21')
INSERT INTO NHANVIEN(MANV,HOTEN,SODT,NGVL) VALUES('NV03','Nguyen Van B','0997047382','2006-04-27')
INSERT INTO NHANVIEN(MANV,HOTEN,SODT,NGVL) VALUES('NV04','Ngo Thanh Tuan','0913758498','2006-06-24')
INSERT INTO NHANVIEN(MANV,HOTEN,SODT,NGVL) VALUES('NV05','Nguyen Thi Truc Thanh','0918590387','2006-07-20')

------------ Nhập dữ liệu KHÁCH HÀNG --------------------------------------------------------------------------

INSERT INTO KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) VALUES('KH01','Nguyen Van A','731 Tran Hung Dao, Q5, TpHCM','08823451','1960/10/22',13060000,'2006/07/22')
INSERT INTO KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) VALUES('KH02','Tran Ngoc Han','23/5 Nguyen Trai, Q5, TpHCM','0908256478','1974/04/03',280000,'2006/07/30')
INSERT INTO KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) VALUES('KH03','Tran Ngoc Linh','45 Nguyen Canh Chan, Q1, TpHCM','0938776266','1980/06/12',3860000,'2006/08/05')
INSERT INTO KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) VALUES('KH04','Tran Minh Long','50/34 Le Dai Hanh, Q10, TpHCM','0917325476','1965/03/09',250000,'2006/10/02')
INSERT INTO KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) VALUES('KH05','Le Nhat Minh','34 Truong Dinh, Q3, TpHCM','08246108','1950/03/10',21000,'2006/10/28')
INSERT INTO KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) VALUES('KH06','Le Hoai Thuong','227 Nguyen Van Cu, Q5, TpHCM','08631738','1981/12/31',915000,'2006/11/24')
INSERT INTO KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) VALUES('KH07','Nguyen Van Tam','32/3 Tran Binh Trong, Q5, TpHCM','0916783565','1971/04/06',12500,'2006/12/01')
INSERT INTO KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) VALUES('KH08','Phan Thi Thanh','45/2 An Duong Vuong, Q5, TpHCM','0938435756','1971/01/10',365000,'2006/12/13')
INSERT INTO KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) VALUES('KH09','Le Ha Vinh','873 Le Hong Phong, Q5, TpHCM','08654763','1979/09/03',70000,'2007/01/14')
INSERT INTO KHACHHANG(MAKH,HOTEN,DCHI,SODT,NGSINH,DOANHSO,NGDK) VALUES('KH10','Ha Duy Lap','34/34B Nguyen Trai, Q1, TpHCM','08768904','1983/05/02',67500,'2007/01/16')


------------ Nhập dữ liệu SẢN PHẨM ----------------------------------------------------------------------------

INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES('BC01','But chi','cay','Singapore',3000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES('BC02','But chi','cay','Singapore',5000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES('BC03','But chi','cay','Viet Nam',3500)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES('BC04','But chi','hop','Viet Nam',30000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES('BB01','But bi','cay','Viet Nam',5000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES('BB02','But bi','cay','Trung Quoc',7000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES('BB03','But bi','hop','Thai Lan',100000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES('TV01','Tap 100 giay mong','quyen','Trung Quoc',2500)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES('TV02','Tap 200 giay mong','quyen','Trung Quoc',4500)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES('TV03','Tap 100 giay tot','quyen','Viet Nam',3000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES('TV04','Tap 200 giay tot','quyen','Viet Nam',5500)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES('TV05','Tap 100 trang','chuc','Viet Nam',23000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES('TV06','Tap 200 trang','chuc','Viet Nam',53000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES('TV07','Tap 100 trang','chuc','Trung Quoc',34000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES('ST01','So tay 500 trang','quyen','Trung Quoc',40000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES('ST02','So tay loai 1','quyen','Viet Nam',55000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES('ST03','So tay loai 2','quyen','Viet Nam',51000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES('ST04','So tay','quyen','Thai Lan',55000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES('ST05','So tay mong','quyen','Thai Lan',20000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES('ST06','Phan viet bang','hop','Viet Nam',5000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES('ST07','Phan khong bui','hop','Viet Nam',7000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES('ST08','Bong bang','cai','Viet Nam',1000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES('ST09','But long','cay','Viet Nam',5000)
INSERT INTO SANPHAM(MASP,TENSP,DVT,NUOCSX,GIA) VALUES('ST10','But long','cay','Trung Quoc',7000)

------------ Nhập dữ liệu HOÁ ĐƠN ----------------------------------------------------------------------------

INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES(1001,'2006/07/23','KH01','NV01',320000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES(1002,'2006/08/12','KH01','NV02',840000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES(1003,'2006/08/23','KH02','NV01',100000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES(1004,'2006/09/01','KH02','NV01',180000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES(1005,'2006/10/20','KH01','NV02',3800000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES(1006,'2006/10/16','KH01','NV03',2430000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES(1007,'2006/10/28','KH03','NV03',510000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES(1008,'2006/10/28','KH01','NV03',440000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES(1009,'2006/10/28','KH03','NV04',200000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES(1010,'2006/11/01','KH01','NV01',5200000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES(1011,'2006/11/04','KH04','NV03',250000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES(1012,'2006/11/30','KH05','NV03',21000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES(1013,'2006/12/12','KH06','NV01',5000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES(1014,'2006/12/31','KH03','NV02',3150000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES(1015,'2007/01/01','KH06','NV01',910000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES(1016,'2007/01/01','KH07','NV02',12500)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES(1017,'2007/01/02','KH08','NV03',35000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES(1018,'2007/01/13','KH08','NV03',330000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES(1019,'2007/01/13','KH01','NV03',30000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES(1020,'2007/01/14','KH09','NV04',70000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES(1021,'2007/01/16','KH10','NV03',67500)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES(1022,'2007/01/16',NULL,'NV03',7000)
INSERT INTO HOADON(SOHD,NGHD,MAKH,MANV,TRIGIA) VALUES(1023,'2007/01/17',NULL,'NV01',330000)

------------ Nhập dữ liệu CHI TIẾT HOÁ ĐƠN ----------------------------------------------------------------------------

INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1001,'TV02',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1001,'ST01',5)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1001,'BC01',5)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1001,'BC02',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1001,'ST08',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1002,'BC04',20)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1002,'BB01',20)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1002,'BB02',20)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1003,'BB03',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1004,'TV01',20)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1004,'TV02',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1004,'TV03',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1004,'TV04',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1005,'TV05',50)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1005,'TV06',50)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1006,'TV07',20)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1006,'ST01',30)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1006,'ST02',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1007,'ST03',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1008,'ST04',8)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1009,'ST05',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1010,'TV07',50)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1010,'ST07',50)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1010,'ST08',100)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1010,'ST04',50)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1010,'TV03',100)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1011,'ST06',50)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1012,'ST07',3)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1013,'ST08',5)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1014,'BC02',80)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1014,'BB02',100)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1014,'BC04',60)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1014,'BB01',50)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1015,'BB02',30)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1015,'BB03',7)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1016,'TV01',5)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1017,'TV02',1)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1017,'TV03',1)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1017,'TV04',5)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1018,'ST04',6)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1019,'ST05',1)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1019,'ST06',2)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1020,'ST07',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1021,'ST08',5)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1021,'TV01',7)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1021,'TV02',10)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1022,'ST07',1)
INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1023,'ST04',6)


--------------------------- BÀI TẬP 3 -------------------------------------------------
--- Phần II: Từ 2 -> 5
-- 2.Tạo quan hệ SANPHAM1 chứa toàn bộ dữ liệu của quan hệ SANPHAM. Tạo quan hệ KHACHHANG1 chứa toàn bộ dữ liệu của quan hệ KHACHHANG.
SELECT * INTO SANPHAM1 FROM SANPHAM
SELECT * INTO KHACHHANG1 FROM KHACHHANG

-- 3.Cập nhật giá tăng 5% đối với những sản phẩm do “Thai Lan” sản xuất (cho quan hệ SANPHAM1)
UPDATE SANPHAM1
SET GIA = GIA*1.05
WHERE NUOCSX = 'Thai Lan'

-- 4.Cập nhật giá giảm 5% đối với những sản phẩm do “Trung Quoc” sản xuất có giá từ 10.000 trở xuống (cho quan hệ SANPHAM1).
UPDATE SANPHAM1 
SET GIA = GIA*0.95
WHERE NUOCSX = 'Trung Quoc'

/* 5.Cập nhật giá trị LOAIKH là “Vip” đối với những khách hàng đăng ký thành viên trước ngày 1/1/2007 
có doanh số từ 10.000.000 trở lên hoặc khách hàng đăng ký thành viên từ 1/1/2007 trở về sau 
có doanh số từ 2.000.000 trở lên (cho quan hệ KHACHHANG1). */

UPDATE KHACHHANG1
SET LOAIKH = 'Vip'
WHERE ((NGDK < '2007/01/01' AND DOANHSO >= 10000000) OR (NGDK > '2007/01/01' AND DOANHSO >= 2000000))

--------------------------- BÀI TẬP 5 -------------------------------------------------
-- PHẦN III: Từ 1 -> 5

-- 1.In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất.
SELECT MASP,TENSP FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc'

-- 2.In ra danh sách các sản phẩm (MASP, TENSP) có đơn vị tính là “cay”, ”quyen”.
SELECT MASP,TENSP FROM SANPHAM
WHERE DVT IN ('cay','quyen')

-- 3.In ra danh sách các sản phẩm (MASP,TENSP) có mã sản phẩm bắt đầu là “B” và kết thúc là “01”.
SELECT MASP,TENSP FROM SANPHAM
WHERE MASP LIKE 'B_01'

-- 4.In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quốc” sản xuất có giá từ 30.000 đến 40.000.
SELECT MASP,TENSP FROM SANPHAM 
WHERE (NUOCSX = 'Trung Quoc' AND (GIA >= 30000 AND GIA <= 40000))

-- 5.In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” hoặc “Thai Lan” sản xuất có giá từ 30.000 đến 40.000.
SELECT MASP,TENSP FROM SANPHAM 
WHERE (NUOCSX IN('Trung Quoc','Thai Lan') AND (GIA >= 30000 AND GIA <= 40000))

-- TUẦN 3 ---------------------------------------------------------------------------------

-- Bài tập 1 -- 

-- Phần III: 12 -> 13

-- 12. Tìm các số hóa đơn đã mua sản phẩm có mã số “BB01” hoặc “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
SELECT DISTINCT SOHD 
FROM CTHD 
WHERE (MASP IN ('BB01','BB02')) AND (SL >= 10 AND SL <= 20)

-- 13. Tìm các số hóa đơn mua cùng lúc 2 sản phẩm có mã số “BB01” và “BB02”, mỗi sản phẩm mua với số lượng từ 10 đến 20.
SELECT SOHD 
FROM CTHD
WHERE (MASP = 'BB01') AND (SL BETWEEN 10 AND 20) 

INTERSECT 

SELECT SOHD 
FROM CTHD
WHERE (MASP = 'BB02') AND (SL BETWEEN 10 AND 20)

-- Bài tập 4 --

-- PHẦN III: 14 -> 19

-- 14. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất hoặc các sản phẩm được bán ra trong ngày 1/1/2007.
SELECT DISTINCT SP.MASP, SP.TENSP
FROM SANPHAM SP
JOIN CTHD ON CTHD.MASP = SP.MASP
JOIN HOADON HD ON HD.SOHD = CTHD.SOHD
WHERE SP.NUOCSX = 'Trung Quoc' OR HD.NGHD = '01/01/2007' 

-- 15. In ra danh sách các sản phẩm (MASP,TENSP) không bán được.
SELECT SP.MASP, SP.TENSP
FROM SANPHAM SP

EXCEPT 

SELECT SP.MASP,SP.TENSP 
FROM CTHD 
JOIN SANPHAM SP ON CTHD.MASP = SP.MASP

-- 16. In ra danh sách các sản phẩm (MASP,TENSP) không bán được trong năm 2006.
SELECT SP.MASP, SP.TENSP
FROM SANPHAM SP

EXCEPT 

SELECT SP.MASP, SP.TENSP
FROM CTHD 
JOIN SANPHAM SP ON CTHD.MASP = SP.MASP
JOIN HOADON HD ON HD.SOHD = CTHD.SOHD
WHERE YEAR(HD.NGHD) = 2006

-- 17. In ra danh sách các sản phẩm (MASP,TENSP) do “Trung Quoc” sản xuất không bán được trong năm 2006.
SELECT SP.MASP, SP.TENSP
FROM SANPHAM SP
WHERE SP.NUOCSX = 'Trung Quoc'

EXCEPT 

SELECT SP.MASP, SP.TENSP
FROM CTHD 
JOIN SANPHAM SP ON CTHD.MASP = SP.MASP
JOIN HOADON HD ON HD.SOHD = CTHD.SOHD
WHERE YEAR(HD.NGHD) = 2006

-- 18. Tìm số hóa đơn đã mua tất cả các sản phẩm do Singapore sản xuất.

SELECT SOHD
FROM HOADON
WHERE NOT EXISTS (SELECT * 
				FROM SANPHAM 
				WHERE NUOCSX = 'Singapore' 
				AND NOT EXISTS (SELECT * 
								FROM CTHD 
								WHERE HOADON.SOHD=CTHD.SOHD 
								AND CTHD.MASP=SANPHAM.MASP))

-- 19. Tìm số hóa đơn trong năm 2006 đã mua ít nhất tất cả các sản phẩm do Singapore sản xuất.

SELECT SOHD
FROM HOADON
WHERE YEAR(NGHD) = 2006 
AND NOT EXISTS (SELECT * 
				FROM SANPHAM 
				WHERE NUOCSX = 'Singapore' 
				AND NOT EXISTS (SELECT * 
								FROM CTHD 
								WHERE HOADON.SOHD=CTHD.SOHD 
								AND CTHD.MASP=SANPHAM.MASP))

-- TUẦN 4 ---------------------------------------------------------------------------------
-- Bài tập 1 -- 

-- Phần III: 20 -> 30

-- 20. Có bao nhiêu hóa đơn không phải của khách hàng đăng ký thành viên mua?
SELECT COUNT(*) AS SL
FROM HOADON HD
WHERE HD.MAKH NOT IN ( SELECT MAKH FROM KHACHHANG WHERE HD.MAKH = KHACHHANG.MAKH)

-- 21. Có bao nhiêu sản phẩm khác nhau được bán ra trong năm 2006.

SELECT COUNT(DISTINCT MASP)
FROM HOADON HD
JOIN CTHD ON CTHD.SOHD = HD.SOHD
WHERE YEAR(HD.NGHD) = 2006

-- 22. Cho biết trị giá hóa đơn cao nhất, thấp nhất là bao nhiêu ?
SELECT MAX(HD.TRIGIA) AS CAONHAT, MIN(HD.TRIGIA) AS THAPNHAT
FROM HOADON HD

-- 23. Trị giá trung bình của tất cả các hóa đơn được bán ra trong năm 2006 là bao nhiêu?
SELECT AVG(HD.TRIGIA) AS GIATRUNGBINH
FROM HOADON HD
WHERE YEAR(HD.NGHD) = 2006

-- 24. Tính doanh thu bán hàng trong năm 2006
SELECT SUM(TRIGIA) AS DOANHTHU
FROM HOADON
WHERE YEAR(NGHD) = 2006

-- 25. Tìm số hóa đơn có trị giá cao nhất trong năm 2006
SELECT TOP 1 WITH TIES SOHD
FROM HOADON
WHERE YEAR(NGHD) = 2006
ORDER BY TRIGIA DESC

-- 26. Tìm họ tên khách hàng đã mua hóa đơn có trị giá cao nhất trong năm 2006
SELECT KH.HOTEN
FROM KHACHHANG KH
WHERE KH.MAKH IN ( SELECT TOP 1 WITH TIES MAKH FROM HOADON
				   WHERE YEAR(NGHD) = 2006
				   ORDER BY TRIGIA DESC )

-- 27. In ra danh sách 3 khách hàng (MAKH, HOTEN) có doanh số cao nhất.
SELECT TOP 3 MAKH 
FROM KHACHHANG 
ORDER BY DOANHSO DESC

-- 28. In ra danh sách các sản phẩm (MASP, TENSP) có giá bán bằng 1 trong 3 mức giá cao nhất
SELECT SP.MASP, SP.TENSP 
FROM SANPHAM SP
WHERE GIA IN ( SELECT DISTINCT TOP 3 GIA FROM SANPHAM ORDER BY GIA DESC)

-- 29. In ra danh sách các sản phẩm (MASP, TENSP) do “Thai Lan” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của tất cả các sản phẩm).
SELECT SP.MASP, SP.TENSP 
FROM SANPHAM SP
WHERE NUOCSX = 'Thai Lan' AND GIA IN ( SELECT DISTINCT TOP 3 GIA FROM SANPHAM ORDER BY GIA DESC)

-- 30. In ra danh sách các sản phẩm (MASP, TENSP) do “Trung Quoc” sản xuất có giá bằng 1 trong 3 mức giá cao nhất (của sản phẩm do “Trung Quoc” sản xuất).
SELECT SP.MASP, SP.TENSP 
FROM SANPHAM SP
WHERE NUOCSX = 'Trung Quoc' AND GIA IN ( SELECT DISTINCT TOP 3 GIA FROM SANPHAM 
											WHERE NUOCSX = 'Trung Quoc'
											ORDER BY GIA DESC)
-- BÀI TẬP 3 --

-- PHẨN III: 31 -> 45

-- 31. In ra danh sách 3 khách hàng có doanh số cao nhất (sắp xếp theo kiểu xếp hạng).
SELECT TOP 3 MAKH, HOTEN, RANK() OVER (ORDER BY DOANHSO DESC ) RANK_KH
FROM KHACHHANG

-- 32. Tính tổng số sản phẩm do “Trung Quoc” sản xuất.
SELECT COUNT(MASP) AS SOLUONG
FROM SANPHAM
WHERE NUOCSX = 'Trung Quoc'

-- 33. Tính tổng số sản phẩm của từng nước sản xuất.
SELECT NUOCSX, COUNT(MASP) AS SOLUONG
FROM SANPHAM
GROUP BY NUOCSX

-- 34. Với từng nước sản xuất, tìm giá bán cao nhất, thấp nhất, trung bình của các sản phẩm.
SELECT NUOCSX, MAX(GIA) AS GIACAONHAT, MIN(GIA) AS GIATHAPNHAT, AVG(GIA) AS GIATRUNGBINH
FROM SANPHAM
GROUP BY NUOCSX

-- 35. Tính doanh thu bán hàng mỗi ngày.
SELECT NGHD, SUM(TRIGIA) AS DOANHTHU
FROM HOADON
GROUP BY NGHD

-- 36. Tính tổng số lượng của từng sản phẩm bán ra trong tháng 10/2006.
SELECT CTHD.MASP, SUM(CTHD.SL) AS SOLUONG
FROM HOADON HD
JOIN CTHD ON CTHD.SOHD = HD.SOHD
WHERE YEAR(HD.NGHD) = 2006 AND MONTH(HD.NGHD) = 10
GROUP BY MASP

-- 37. Tính doanh thu bán hàng của từng tháng trong năm 2006.
SELECT MONTH(HD.NGHD) AS NGAYBAN, SUM(HD.TRIGIA) AS DOANHTHU
FROM HOADON HD
WHERE YEAR(HD.NGHD) = 2006
GROUP BY MONTH(HD.NGHD)

-- 38. Tìm hóa đơn có mua ít nhất 4 sản phẩm khác nhau.
SELECT HD.SOHD
FROM HOADON HD
JOIN CTHD ON HD.SOHD = CTHD.SOHD
GROUP BY HD.SOHD
HAVING COUNT(DISTINCT CTHD.MASP) >= 4

-- 39. Tìm hóa đơn có mua 3 sản phẩm do “Viet Nam” sản xuất (3 sản phẩm khác nhau).
SELECT HD.SOHD 
FROM HOADON HD
JOIN CTHD ON CTHD.SOHD = HD.SOHD
JOIN SANPHAM SP ON SP.MASP = CTHD.MASP
WHERE SP.NUOCSX = 'Viet Nam'
GROUP BY HD.SOHD
HAVING COUNT(DISTINCT SP.MASP) = 3

-- 40. Tìm khách hàng (MAKH, HOTEN) có số lần mua hàng nhiều nhất.
SELECT TOP 1 WITH TIES KH.MAKH, KH.HOTEN, COUNT(HD.SOHD) AS SOLANMUA
FROM KHACHHANG KH 
JOIN HOADON HD ON HD.MAKH = KH.MAKH
GROUP BY KH.MAKH, KH.HOTEN
ORDER BY COUNT(HD.SOHD) DESC

-- 41. Tháng mấy trong năm 2006, doanh số bán hàng cao nhất ?
SELECT TOP 1 WITH TIES MONTH(NGHD) AS THANG
FROM HOADON
GROUP BY MONTH(NGHD)
ORDER BY SUM(TRIGIA) DESC


-- 42. Tìm sản phẩm (MASP, TENSP) có tổng số lượng bán ra thấp nhất trong năm 2006.
SELECT TOP 1 WITH TIES SP.MASP, SP.TENSP, SUM(CTHD.SL) AS 'Số lượng bán ra'
FROM SANPHAM SP
JOIN CTHD ON CTHD.MASP = SP.MASP
JOIN HOADON HD ON HD.SOHD = CTHD.SOHD
WHERE YEAR(HD.NGHD) = 2006
GROUP BY SP.MASP, SP.TENSP
ORDER BY SUM(CTHD.SL) ASC


-- 43. Mỗi nước sản xuất, tìm sản phẩm (MASP,TENSP) có giá bán cao nhất
SELECT NUOCSX,MASP,TENSP 
FROM ( SELECT NUOCSX, MASP, TENSP, RANK() OVER (PARTITION BY NUOCSX ORDER BY GIA DESC ) RANK_GIA 
		FROM SANPHAM ) A
WHERE A.RANK_GIA = 1

-- 44. Tìm nước sản xuất sản xuất ít nhất 3 sản phẩm có giá bán khác nhau
SELECT NUOCSX
FROM SANPHAM
GROUP BY NUOCSX
HAVING COUNT(DISTINCT GIA) >= 3

-- 45. Trong 10 khách hàng có doanh số cao nhất, tìm khách hàng có số lần mua hàng nhiều nhất
SELECT KH.MAKH, KH.HOTEN
FROM KHACHHANG KH 
JOIN (  SELECT TOP 10 MAKH,DOANHSO 
		FROM KHACHHANG
		ORDER BY DOANHSO DESC ) B
ON KH.MAKH = B.MAKH
WHERE KH.MAKH IN ( SELECT TOP 1 WITH TIES MAKH 
				FROM HOADON
				GROUP BY MAKH 
				ORDER BY COUNT(*) DESC )

-- TUẦN 5 ---------------------------------------------------------------------------------

----------- BÀI TẬP 1 
-- PHẦN 1: 11 -> 14

-- 11. Ngày mua hàng (NGHD) của một khách hàng thành viên sẽ lớn hơn hoặc bằng ngày khách hàng đó đăng ký thành viên (NGDK)
-- HOADON (SOHD * , NGHD, MAKH, MANV, TRIGIA)
-- KHACHHANG (MAKH *, HOTEN, DCHI, SODT, NGSINH, DOANHSO, NGDK)
-- HOA DON: THEM +, XOA -, SUA +(MAKH,NGHD)
-- KHACHHANG: THEM -, XOA-, SUA + (NGDK)
--DROP TRIGGER ngdk_nghd_hoadon_insert
GO
CREATE TRIGGER ngdk_nghd_hoadon_insert ON HOADON 
AFTER INSERT 
AS 
	DECLARE @NGHD SMALLDATETIME, @NGDK SMALLDATETIME, @MAKH CHAR(4)
	SELECT @NGHD = NGHD, @NGDK = NGDK FROM inserted, KHACHHANG
	WHERE KHACHHANG.MAKH = inserted.MAKH
	if (@NGHD >= @NGDK)
	BEGIN 
		print 'Thêm một hoá đơn thành công'
	END 
	ELSE 
		rollback transaction
		print 'Ngày mua hàng của một khách hàng phải lớn hơn hoặc bằng ngày đăng kí thành viên'


INSERT INTO HOADON(SOHD, NGHD, MAKH, MANV, TRIGIA) VALUES('1024', '2005/07/22', 'KH01', 'NV01', '320000')
delete from HOADON where SOHD = '1024'


--DROP TRIGGER ngdk_nghd_hoadon_update
GO
CREATE TRIGGER ngdk_nghd_hoadon_update ON HOADON
AFTER UPDATE
AS
IF (UPDATE(NGHD) OR UPDATE(MAKH))
BEGIN
	DECLARE @NGHD SMALLDATETIME, @NGDK SMALLDATETIME, @MAKH CHAR(4)
	SELECT @NGHD = NGHD, @NGDK = NGDK FROM inserted, KHACHHANG
	WHERE KHACHHANG.MAKH = inserted.MAKH
	if (@NGHD >= @NGDK)
	BEGIN 
		print 'Thêm một hoá đơn thành công'
	END 
	ELSE 
		rollback transaction
		print 'Ngày mua hàng của một khách hàng phải lớn hơn hoặc bằng ngày đăng kí thành viên'
END


--DROP TRIGGER ngdk_nghd_khachhang_update
GO
CREATE TRIGGER ngdk_nghd_khachhang_update ON KHACHHANG
AFTER UPDATE 
AS
IF (UPDATE(NGDK))
BEGIN
	DECLARE @NGDK SMALLDATETIME, @NGHD SMALLDATETIME, @MAKH CHAR(4) 
	SELECT @NGDK = NGDK, @MAKH = inserted.MAKH, @NGHD = NGHD FROM inserted, HOADON
	WHERE inserted.MAKH = HOADON.MAKH
	IF (@NGHD >= @NGHD)
	BEGIN 
		print 'Chỉnh sửa thông tin khách hàng thành công'
	END 
	ELSE 
	BEGIN
		rollback transaction
		print 'Ngày mua hàng phải lớn ngày đăng kí khách hàng'
	END
END


-- 12. Ngày bán hàng (NGHD) của một nhân viên phải lớn hơn hoặc bằng ngày nhân viên đó vào làm: NGHD >= NGVL
-- HOADON (SOHD * , NGHD, MAKH, MANV, TRIGIA)
-- NHANVIEN (MANV* ,HOTEN, NGVL, SODT)
-- HOADON: THEM +, XOA -, SUA +(MANV,NGHD)
-- NHANVIEN: THEM -, XOA -, SUA + (NGVL)
--DROP TRIGGER ngvl_nghd_hoadon_insert
GO
CREATE TRIGGER ngvl_nghd_hoadon_insert ON HOADON 
AFTER INSERT 
AS
	IF (EXISTS(SELECT * FROM inserted JOIN NHANVIEN NV ON NV.MANV = inserted.MANV WHERE inserted.NGHD < NV.NGVL))
	BEGIN
		rollback transaction
		print 'Ngày bán hàng phải lớn hơn hoặc bằng ngày vào làm của nhân viên'
	END
	ELSE 
		print 'Thêm một hoá đơn thành công'

--DROP TRIGGER ngvl_nghd_hoadon_update
GO 
CREATE TRIGGER ngvl_nghd_hoadon_update ON HOADON
AFTER UPDATE
AS 
	IF (UPDATE(MANV) OR UPDATE(NGHD))
		BEGIN 
			IF (EXISTS(SELECT * FROM inserted JOIN NHANVIEN NV ON NV.MANV = inserted.MANV WHERE inserted.NGHD < NV.NGVL))
			BEGIN
				rollback transaction
				print 'Ngày bán hàng phải lớn hơn hoặc bằng ngày vào làm của nhân viên'
			END
			ELSE 
				print 'Chỉnh sửa một hoá đơn thành công'
		END

--DROP TRIGGER ngvl_nghd_nhanvien_update
GO
CREATE TRIGGER ngvl_nghd_nhanvien_update ON NHANVIEN
AFTER UPDATE 
AS
	IF (UPDATE(NGVL))
	BEGIN
		IF (EXISTS(SELECT * FROM inserted JOIN HOADON HD ON HD.MANV = inserted.MANV WHERE inserted.NGVL < HD.NGHD))
		BEGIN
				rollback transaction
				print 'Ngày bán hàng phải lớn hơn hoặc bằng ngày vào làm của nhân viên'
			END
			ELSE 
				print 'Chỉnh sửa một hoá đơn thành công' 
	END


-- 13. Mỗi một hóa đơn phải có ít nhất một chi tiết hóa đơn.
-- HOADON (SOHD * , NGHD, MAKH, MANV, TRIGIA)
-- CTHD (SOHD*,MASP*,SL)
-- Vm c thuộc CTHD, Vm hd thuộc HOADON: Count{* | c.SOHD = hd.SOHD} >= 1
-- HOADON: THEM -, XOA -, SUA -
-- CTHD: THEM -, XOA +, SUA -
-- DROP TRIGGER hd_cthd_co_it_nhat_1_cthd
GO
CREATE TRIGGER hd_cthd_co_it_nhat_1_cthd ON CTHD 
AFTER DELETE
AS
	DECLARE @SOHD INT, @SOLUONG_CTHD INT
	SELECT @SOHD = SOHD FROM deleted
	SELECT @SOLUONG_CTHD = COUNT(*) FROM CTHD WHERE CTHD.SOHD = @SOHD
	IF (@SOLUONG_CTHD >= 1)
	BEGIN
		print N'Đã xoá một chi tiết hoá đơn thành công'
	END
	ELSE 
	BEGIN
		print N'Không thể xoá do vi phạm điều kiện'
		rollback transaction
	END

-- 14.Trị giá của một hóa đơn là tổng thành tiền (số lượng*đơn giá) của các chi tiết thuộc hóa đơn đó.
-- HOADON (SOHD * , NGHD, MAKH, MANV, TRIGIA)
-- CTHD (SOHD*,MASP*,SL)
-- SANPHAM (MASP*,TENSP, DVT, NUOCSX, GIA)
-- Vm hd thuộc HOADON, Vm ct thuộc CTHD, Vm sp thuộc SANPHAM: hd.TriGia = ct.SL * sp.GIA
-- HOADON: Thêm -, Xoá -, Sửa -
-- CTHD: Thêm +, Xoá +, Sửa + (SL)
-- SANPHAM: Thêm -, Xoá -, Sửa + (GIA)
--DROP TRIGGER tong_tri_gia_hoa_don_insert_delete
GO
CREATE TRIGGER tong_tri_gia_hoa_don_insert_delete ON CTHD
AFTER INSERT,DELETE
AS
	UPDATE HOADON 
	SET TRIGIA = ( SELECT SUM(SL*GIA) FROM CTHD JOIN SANPHAM SP ON SP.MASP = CTHD.MASP WHERE CTHD.SOHD = HOADON.SOHD)
	WHERE SOHD IN (	SELECT DISTINCT SOHD FROM inserted 
					UNION
					SELECT DISTINCT SOHD FROM deleted )

GO
CREATE TRIGGER tong_tri_gia_hoa_don_update ON CTHD
AFTER UPDATE
AS
IF (UPDATE(SL))
BEGIN
	UPDATE HOADON
	SET TRIGIA = ( SELECT SUM(SL*GIA) FROM CTHD JOIN SANPHAM SP ON SP.MASP = CTHD.MASP WHERE HOADON.SOHD = CTHD.SOHD GROUP BY CTHD.SOHD)
	WHERE SOHD IN (SELECT SOHD FROM inserted )
END	

INSERT INTO CTHD(SOHD,MASP,SL) VALUES(1001,'ST10',10)
DELETE FROM CTHD WHERE SOHD = 1001 AND MASP = 'ST10' AND SL = 10

GO
CREATE TRIGGER gia_sanpham_update ON SANPHAM
AFTER UPDATE
AS
IF (UPDATE(GIA))
BEGIN
	UPDATE HOADON
	SET TRIGIA = ( SELECT SUM(SL * GIA) FROM CTHD JOIN SANPHAM SP ON SP.MASP = CTHD.MASP WHERE HOADON.SOHD = CTHD.SOHD GROUP BY CTHD.SOHD)
	WHERE SOHD IN ( SELECT HD.SOHD FROM HOADON HD
					JOIN CTHD ON CTHD.SOHD = HD.SOHD
					JOIN SANPHAM SP ON SP.MASP = CTHD.MASP
					WHERE CTHD.MASP IN (SELECT MASP FROM inserted) )
END

UPDATE SANPHAM 
SET GIA = GIA*2
WHERE MASP = 'BC02'

UPDATE SANPHAM
SET GIA = 5000
WHERE MASP = 'BC02'