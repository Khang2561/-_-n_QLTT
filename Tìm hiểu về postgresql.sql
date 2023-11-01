CREATE TABLE HangSX(
	MaHangSX varchar(10) not null,
	TenHangSX VARCHAR(20),
	CONSTRAINT PF_HangSX PRIMARY KEY (MaHangSX)
);

CREATE TABLE NuocSX(
	MaNuocSX varchar(10) not null,
	TenNuocSX VARCHAR(20),
	CONSTRAINT PF_NuocSX PRIMARY KEY (MaNuocSX)
);

CREATE TABLE TheLoai(
	MaTheLoai varchar(10) not null,
	TenTheLoai varchar(20),
	CONSTRAINT PF_TheLoai PRIMARY KEY (MaTheLoai)
);

CREATE TABLE Phim(
	MaPhim VARCHAR(10) NOT NULL,
	TenPhim VARCHAR(50),
	MaNuocSX VARCHAR(10) NOT NULL,
	MaHangSX VARCHAR(10) NOT NULL,
	DaoDien VARCHAR(20),
	MaTheLoai VARCHAR(10) NOT NULL,
	NgayKhoiChieu DATE,
	NgayKetThuc DATE,
	TongThu money  DEFAULT 0,
	CONSTRAINT PK_Phim primary key (MaPhim),
	CONSTRAINT FK_MaHangSX foreign key (MaHangSX) REFERENCES HangSX(MaHangSX),
	CONSTRAINT FK_MaNuocSX foreign key (MaNuocSX) REFERENCES NuocSX(MaNuocSX),
	CONSTRAINT FK_TheLoai foreign key (MaTheLoai) REFERENCES TheLoai(MaTheLoai)
);

CREATE TABLE RAP(
	MaRap varchar(10) not null,
	TenRap varchar(50),
	DiaChi varchar(100),
	DienThoai varchar(10),
	SoPhong varchar(10)  DEFAULT 0,
	TongSoGhe int  DEFAULT 0,
	CONSTRAINT FK_RAP PRIMARY KEY (MaRap)
);
CREATE TABLE GioChieu(
	MaGioChieu varchar(10) not null,
	MaRap varchar(10),
	XuatChieu time,
	CONSTRAINT PK_GioChieu PRIMARY KEY(MaGioChieu),
	CONSTRAINT FK_MaRap FOREIGN KEY(MaRap) references RAP(MaRap)	
);

CREATE TABLE PhongChieu(
	MaPhong varchar(10) not null primary key,
	MaRap varchar(10) not null,
	TenPhong varchar(50),
	TongSoGhe int  DEFAULT 0,
	constraint FK_MARAP1 foreign key (MaRap) references RAP(MaRap)
);

CREATE TABLE LichChieu(
	MaShow varchar(10) not null,
	MaPhim varchar(10) not null,
	MaRap varchar(10) not null,
	MaPhong varchar(10) not null,
	NgayChieu date,
	MaGioChieu varchar(10) not null,
	GiaVe money  DEFAULT 0,
	SoVeDaBan int  DEFAULT 0,
	TongTien money  DEFAULT 0,
	CONSTRAINT PF_LichChieu3 primary key (MaShow),
	CONSTRAINT FK_MaPhim3 foreign key (MaPhim) REFERENCES Phim(MaPhim),
	CONSTRAINT FK_MaPhong3 foreign key (MaPhong) REFERENCES PhongChieu(MaPhong),
	constraint fk_MaRap3 foreign key (MaRap) REFERENCES RAP(MaRap),
	constraint fk_MaGioChieu3 foreign key (MaGioChieu) REFERENCES GioChieu(MaGioChieu)
);

CREATE TABLE Ve(
	MaVe varchar(10) not null primary key,
	MaRap varchar(10) not null,
	MaPhong varchar(10) not null,
	MaShow varchar(10) not null,
	MaGhe varchar(10) not null ,
	TrangThai varchar(10),
	constraint fk_MaPhong foreign key(MaPhong) references PhongChieu(MaPhong),
	constraint fk_MaRap2 foreign key (MaRap) references RAP(MaRap)
);


alter table Ve add constraint fk_MaShow3 foreign key (MaShow) references LichChieu(MaShow);


INSERT INTO HangSX (MaHangSX,TenHangSX) VALUES (N'OF11', N'Original Film');
INSERT INTO HangSX (MaHangSX,TenHangSX) VALUES (N'WD12', N'Walt Disney Pictures');
INSERT INTO HangSX (MaHangSX,TenHangSX) VALUES (N'AP13', N'Arunuchai Panupan');
INSERT INTO HangSX (MaHangSX,TenHangSX) VALUES (N'CV14', N'Công ty VAA');
INSERT INTO HangSX (MaHangSX,TenHangSX) VALUES (N'LH15', N'Lý Hải Production');
INSERT INTO HangSX (MaHangSX,TenHangSX) VALUES (N'PQ16', N'ProductionQ');
INSERT INTO HangSX (MaHangSX,TenHangSX) VALUES (N'CH17', N'Creative House');
INSERT INTO HangSX (MaHangSX,TenHangSX) VALUES (N'DD18', N'Phim ảnh Đại Đồng');
INSERT INTO HangSX (MaHangSX,TenHangSX) VALUES (N'DT19', N'Phim ảnh Điện Thông');
INSERT INTO HangSX (MaHangSX,TenHangSX) VALUES (N'VC20', N'Vinod Chopra Films');

INSERT INTO NuocSX(MaNuocSX, TenNuocSX) VALUES (N'USA', N'Mỹ');
INSERT INTO NuocSX(MaNuocSX, TenNuocSX) VALUES (N'TL', N'Thái Lan');
INSERT INTO NuocSX(MaNuocSX, TenNuocSX) VALUES (N'VN', N'Việt Nam');
INSERT INTO NuocSX(MaNuocSX, TenNuocSX) VALUES (N'HQ', N'Hàn Quốc');
INSERT INTO NuocSX(MaNuocSX, TenNuocSX) VALUES (N'TQ', N' Trung Quốc');
INSERT INTO NuocSX(MaNuocSX, TenNuocSX) VALUES (N'AD', N'Ấn Độ');


INSERT INTO TheLoai (MaTheLoai, TenTheLoai) VALUES (N'AC01', N'Hành động');
INSERT INTO TheLoai (MaTheLoai, TenTheLoai) VALUES (N'AV02', N'Phiêu lưu');
INSERT INTO TheLoai (MaTheLoai, TenTheLoai) VALUES (N'HH03', N'Hài hước');
INSERT INTO TheLoai (MaTheLoai, TenTheLoai) VALUES (N'RM04', N'Lãng mạn');
INSERT INTO TheLoai (MaTheLoai, TenTheLoai) VALUES (N'HD05', N'Hài hành động');
INSERT INTO TheLoai (MaTheLoai, TenTheLoai) VALUES (N'KD06', N'Kinh dị');
INSERT INTO TheLoai (MaTheLoai, TenTheLoai) VALUES (N'TL07', N'Tâm lý');
INSERT INTO TheLoai (MaTheLoai, TenTheLoai) VALUES (N'TC08', N'Tình cảm');
INSERT INTO TheLoai (MaTheLoai, TenTheLoai) VALUES (N'RM09', N'Lãng mạn');

set datestyle = DMY;
INSERT INTO Phim (MaPhim, TenPhim, MaHangSX, DaoDien,MaTheLoai,MaNuocSX , NgayKhoiChieu, NgayKetThuc, TongThu) VALUES (N'FF01', N'Fast and Furious 10', N'OF11', N'Louis Leterrier', N'AC01','USA', to_date('19/05/2023', 'dd/mm/yyyy'), to_date('19/06/2023', 'dd/mm/yyyy'), 0 );
INSERT INTO Phim (MaPhim, TenPhim, MaHangSX, DaoDien,MaTheLoai,MaNuocSX , NgayKhoiChieu, NgayKetThuc, TongThu) VALUES (N'LM02', N'The Little Mermaid',  N'WD12', N'Rob Marshall', N'AV02','USA', to_date('26/05/2023', 'dd/mm/yyyy'), to_date('26/07/2023', 'dd/mm/yyyy'), 0);
INSERT INTO Phim (MaPhim, TenPhim, MaHangSX, DaoDien,MaTheLoai,MaNuocSX , NgayKhoiChieu, NgayKetThuc, TongThu) VALUES (N'LD03', N'Love Destiny',  N'AP13', N'Pawat Panangkasri', N'HH03','USA', to_date('19/10/2022', 'dd/mm/yyyy'), to_date('19/11/2022', 'dd/mm/yyyy'), 0);
INSERT INTO Phim (MaPhim, TenPhim, MaHangSX, DaoDien,MaTheLoai,MaNuocSX , NgayKhoiChieu, NgayKetThuc, TongThu) VALUES (N'CB04', N'Cô ba Sài Gòn',  N'CV14', N'Trần Bửu Lộc', N'RM04','VN', to_date('14/10/2017', 'dd/mm/yyyy'), to_date('20/06/2018', 'dd/mm/yyyy'), 0);
INSERT INTO Phim (MaPhim, TenPhim, MaHangSX, DaoDien,MaTheLoai,MaNuocSX , NgayKhoiChieu, NgayKetThuc, TongThu) VALUES (N'LA05', N'Lật mặt 1', N'LH15', N'Lý Hải', N'HD05','VN', to_date('15/05/2015', 'dd/mm/yyyy'), to_date('18/07/2019', 'dd/mm/yyyy'), 0);
INSERT INTO Phim (MaPhim, TenPhim, MaHangSX, DaoDien,MaTheLoai,MaNuocSX , NgayKhoiChieu, NgayKetThuc, TongThu) VALUES (N'MA06', N'Chuyện ma đô thị',  N'PQ16', N'Hong Won Ki', N'KD06','TL', to_date('13/05/2022', 'dd/mm/yyyy'), to_date('13/08/2022', 'dd/mm/yyyy'),0);
INSERT INTO Phim (MaPhim, TenPhim, MaHangSX, DaoDien,MaTheLoai,MaNuocSX , NgayKhoiChieu, NgayKetThuc, TongThu) VALUES (N'MG07', N'Người môi giới',  N'CH17', N'Kore-eda Hirokazu', N'TL07','VN', to_date('14/11/2021', 'dd/mm/yyyy'), to_date('15/08/2022', 'dd/mm/yyyy'), 0);
INSERT INTO Phim (MaPhim, TenPhim, MaHangSX, DaoDien,MaTheLoai,MaNuocSX , NgayKhoiChieu, NgayKetThuc, TongThu) VALUES (N'LN08', N'Lạc lối ở Nga',  N'DD18', N'Zheng Xu', N'TC08', 'AD',to_date('14/05/2020', 'dd/mm/yyyy'), to_date('17/02/2021', 'dd/mm/yyyy'), 0);
INSERT INTO Phim (MaPhim, TenPhim, MaHangSX, DaoDien,MaTheLoai,MaNuocSX , NgayKhoiChieu, NgayKetThuc, TongThu) VALUES (N'HL09', N'Hôn lễ của em',  N'DT19', N'Tian Han', N'RM09','HQ', to_date('16/07/2021', 'dd/mm/yyyy'), to_date('16/09/2021', 'dd/mm/yyyy'), 0);
INSERT INTO Phim (MaPhim, TenPhim, MaHangSX, DaoDien,MaTheLoai,MaNuocSX , NgayKhoiChieu, NgayKetThuc, TongThu)VALUES (N'TT10', N'Tru tiên',  N'DT19', N'Trình Tiểu Đồng', N'AC01','TQ', to_date('24/12/2019', 'dd/mm/yyyy'), to_date('25/12/2020', 'dd/mm/yyyy'),0);
INSERT INTO Phim (MaPhim, TenPhim, MaHangSX, DaoDien,MaTheLoai,MaNuocSX , NgayKhoiChieu, NgayKetThuc, TongThu) VALUES (N'CN11', N'3 chàng ngốc',  N'VC20', N'Rajkumar Hirani', N'HH03','TL', to_date('25/12/2009', 'dd/mm/yyyy'), to_date('21/12/2010', 'dd/mm/yyyy'), 0);


INSERT INTO RAP (MaRap, TenRap, DiaChi,  SoPhong, TongSoGhe) VALUES 
('CGV01', 'CGV Hùng Vương Plaza', 'Hùng Vương, Phường 11, Quận 5, TP.HCM',  0, 0),
('BHD02', 'BHD Star Vũng Tàu', '8 Lê Duẩn, Phường 1, Vũng Tàu', 0, 0),
('GAL03', 'Galaxy Quảng Trị', 'Lô B1, Khu đô thị mới Đông Hà, phường Đông Giang, TP Đông Hà, tỉnh Quảng Trị', 0, 0),
('CGV04', 'CGV Vincom Plaza Hà Tĩnh', 'Số 1 Lê Lợi, phường Đức Thọ, TP Hà Tĩnh',  0, 0)

-- Cập nhập tổng số ghế và tổng số phòng chiếu của 1 rạp khi thêm xóa sửa 
CREATE OR REPLACE FUNCTION SoPhongRap_func() 
RETURNS TRIGGER 
AS $$
BEGIN
    IF TG_OP = 'INSERT' OR TG_OP = 'UPDATE' THEN
        UPDATE RAP
        SET TongSoGhe = (
                SELECT SUM(TongSoGhe) 
                FROM PhongChieu 
                WHERE PhongChieu.MaRap = RAP.MaRap
            ),
            SoPhong = (
                SELECT COUNT(*) 
                FROM PhongChieu 
                WHERE PhongChieu.MaRap = RAP.MaRap
            );
    ELSIF TG_OP = 'DELETE' THEN
        DECLARE 
            MaRapVar VARCHAR(10);
        BEGIN
            SELECT MaRap INTO MaRapVar FROM RAP WHERE RAP.MaRap = OLD.MaRap LIMIT 1;
            UPDATE RAP
            SET TongSoGhe = (
                SELECT sum(PhongChieu.TongSoGhe) 
                FROM PhongChieu 
                WHERE MaRap = MaRapVar
            ),SoPhong = (
                SELECT count(*) 
                FROM PhongChieu 
                WHERE MaRap = MaRapVar
            )
            WHERE MaRap = MaRapVar;
        END;
    END IF;
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;


CREATE TRIGGER SoPhongRap
AFTER INSERT OR UPDATE OR DELETE ON PhongChieu
FOR EACH ROW
EXECUTE FUNCTION SoPhongRap_func();

DROP TRIGGER IF EXISTS sophongrap ON PhongChieu;

select * from PhongChieu
SELECT * FROM RAP
DELETE FROM PhongChieu Where MaPhong ='PC01'
INSERT INTO PhongChieu (MaPhong, MaRap,TongSoGhe) VALUES('PC01', 'CGV01',  200);
INSERT INTO PhongChieu (MaPhong, MaRap,TongSoGhe) VALUES('PC02', 'CGV01',  200);
INSERT INTO PhongChieu (MaPhong, MaRap,TongSoGhe) VALUES('PC03', 'CGV01',  200);
INSERT INTO PhongChieu (MaPhong, MaRap,TongSoGhe) VALUES('PB01', 'BHD02',  180);
INSERT INTO PhongChieu (MaPhong, MaRap,TongSoGhe) VALUES('PB02', 'BHD02',  200);
INSERT INTO PhongChieu (MaPhong, MaRap,TongSoGhe) VALUES('PG01', 'GAL03',  150);
INSERT INTO PhongChieu (MaPhong, MaRap,TongSoGhe) VALUES('PG02', 'GAL03',  150);
INSERT INTO PhongChieu (MaPhong, MaRap,TongSoGhe) VALUES('PV01', 'CGV04',  200);
INSERT INTO PhongChieu (MaPhong, MaRap,TongSoGhe) VALUES('PV02', 'CGV04',  200);

INSERT INTO GioChieu (MaGioChieu, MaRap, XuatChieu) VALUES ('GC01', 'CGV01', '8:00');
INSERT INTO GioChieu (MaGioChieu, MaRap, XuatChieu) VALUES ('GC02', 'CGV01', '10:00');
INSERT INTO GioChieu (MaGioChieu, MaRap, XuatChieu) VALUES ('GC03', 'CGV01', '11:00');
INSERT INTO GioChieu (MaGioChieu, MaRap, XuatChieu) VALUES ('GB01', 'BHD02', '8:00');
INSERT INTO GioChieu (MaGioChieu, MaRap, XuatChieu) VALUES ('GB02', 'BHD02', '11:00');
INSERT INTO GioChieu (MaGioChieu, MaRap, XuatChieu) VALUES ('GG01', 'GAL03', '10:00');
INSERT INTO GioChieu (MaGioChieu, MaRap, XuatChieu) VALUES ('GG02', 'GAL03','11:00');
INSERT INTO GioChieu (MaGioChieu, MaRap, XuatChieu) VALUES ('GV01', 'CGV04', '8:00');
INSERT INTO GioChieu (MaGioChieu, MaRap, XuatChieu) VALUES ('GV02', 'CGV04', '10:00');


INSERT INTO LichChieu (MaShow, MaPhim, MaRap, MaPhong, NgayChieu, MaGioChieu, GiaVe, SoVeDaBan, TongTien) VALUES
('LS01', 'FF01', 'CGV01', 'PC01', '19/05/2023', 'GC01', 100000, 0,0),
('LS02', 'FF01', 'CGV01', 'PC02', '19/05/2023', 'GC01', 100000, 0, 0),
('LS03', 'FF01', 'CGV01', 'PC03', '19/05/2023', 'GC02', 150000, 0, 0),
('LS04', 'FF01', 'CGV01', 'PC01', '20/05/2023', 'GC03', 100000, 0, 0),
('LS05', 'LM02', 'BHD02', 'PB01', '26/05/2023', 'GB01', 120000, 0, 0),
('LS06', 'LM02', 'BHD02', 'PB02', '26/05/2023', 'GB01', 120000, 0, 0),
('LS07', 'LM02', 'GAL03', 'PG01', '26/05/2023', 'GG01', 100000, 0, 0),
('LS08', 'LD03', 'CGV04', 'PV01', '19/10/2022', 'GV01', 80000, 0,0),
('LS09', 'LD03', 'CGV04', 'PV02', '19/10/2022', 'GV02', 80000, 0, 0),
('LS10', 'FF01', 'CGV01', 'PV02', '02/06/2023', 'GV02', 80000, 0, 0),
('LS11', 'LD03', 'CGV01', 'PV01', '19/10/2022', 'GV02', 80000, 0, 0),
('LS12', 'LD03', 'CGV01', 'PV02', '19/11/2022', 'GV02', 100000, 0, 0),
('LS13', 'MA06', 'CGV01', 'PV01', '13/05/2022', 'GV02', 80000, 0, 0),
('LS14', 'MA06', 'CGV01', 'PV01', '19/06/2022', 'GV01', 100000, 0, 0),
('LS15', 'MA06', 'CGV01', 'PV02', '23/07/2022', 'GV01', 80000, 0, 0),
('LS16', 'MA06', 'CGV01', 'PV01', '13/08/2022', 'GV02', 100000, 0, 0),
('LS20', 'LD03', 'CGV04', 'PV01', '19/10/2022', 'GV02', 80000, 0, 0),
('LS21', 'LD03', 'CGV04', 'PV02', '19/11/2022', 'GV02', 120000, 0, 0),
('LS22', 'MA06', 'CGV04', 'PV01', '13/05/2022', 'GV02', 100000, 0, 0),
('LS23', 'MA06', 'CGV04', 'PV01', '19/06/2022', 'GV01', 90000, 0, 0),
('LS24', 'MA06', 'CGV04', 'PV02', '23/07/2022', 'GV01', 80000, 0, 0),
('LS25', 'MA06', 'CGV04', 'PV01', '13/08/2022', 'GV02', 100000, 0, 0),
('LS30', 'LD03', 'BHD02', 'PV01', '19/10/2022', 'GV02', 50000, 0, 0),
('LS31', 'LD03', 'BHD02', 'PV02', '19/11/2022', 'GV02', 120000, 0, 0),
('LS32', 'MA06', 'BHD02', 'PV01', '13/05/2022', 'GV02', 100000, 0, 0),
('LS33', 'MA06', 'BHD02', 'PV01', '19/06/2022', 'GV01', 90000, 0, 0),
('LS34', 'MA06', 'BHD02', 'PV02', '23/07/2022', 'GV01', 12000, 0, 0),
('LS35', 'MA06', 'BHD02', 'PV01', '13/08/2022', 'GV02', 100000, 0, 0),
('LS40', 'LD03', 'GAL03', 'PV01', '19/10/2022', 'GV02', 50000, 0, 0),
('LS41', 'LD03', 'GAL03', 'PV02', '19/11/2022', 'GV02', 100000, 0, 0),
('LS42', 'MA06', 'GAL03', 'PV01', '13/05/2022', 'GV02', 100000, 0, 0),
('LS43', 'MA06', 'GAL03', 'PV01', '19/06/2022', 'GV01', 80000, 0, 0),
('LS44', 'MA06', 'GAL03', 'PV02', '23/07/2022', 'GV01', 10000, 0, 0),
('LS45', 'MA06', 'GAL03', 'PV01', '13/08/2022', 'GV02', 7000, 0, 0),
('LS51', 'MG07', 'CGV01', 'PV01', '01/01/2022', 'GV01', 100000, 0, 0),
('LS52', 'MG07', 'CGV01', 'PV01', '03/02/2022', 'GV01', 120000, 0, 0),
('LS53', 'MG07', 'CGV01', 'PV02', '10/03/2022', 'GV02', 100000, 0, 0),
('LS54', 'MG07', 'CGV01', 'PV02', '04/04/2022', 'GV01', 80000, 0, 0),
('LS55', 'CN11', 'CGV01', 'PV01', '01/09/2022', 'GV01', 100000, 0, 0),
('LS56', 'CN11', 'CGV01', 'PV02', '01/12/2022', 'GV02', 80000, 0, 0),
('LS61', 'MG07', 'CGV04', 'PV01', '01/01/2022', 'GV01', 80000, 0, 0),
('LS62', 'MG07', 'CGV04', 'PV01', '03/02/2022', 'GV01', 90000, 0, 0),
('LS63', 'MG07', 'CGV04', 'PV02', '10/03/2022', 'GV02', 75000, 0, 0),
('LS64', 'MG07', 'CGV04', 'PV02', '04/04/2022', 'GV01', 80000, 0, 0),
('LS65', 'CN11', 'CGV04', 'PV01', '01/09/2022', 'GV01', 100000, 0, 0),
('LS66', 'CN11', 'CGV04', 'PV02', '01/12/2022', 'GV02', 90000, 0, 0),
('LS71', 'MG07', 'BHD02', 'PV01', '01/01/2022', 'GV01', 12000, 0, 0),
('LS72', 'MG07', 'BHD02', 'PV01', '03/02/2022', 'GV01', 80000, 0, 0),
('LS73', 'MG07', 'BHD02', 'PV02', '10/03/2022', 'GV02', 75000, 0, 0),
('LS74', 'MG07', 'BHD02', 'PV02', '04/04/2022', 'GV01', 65000, 0, 0),
('LS75', 'CN11', 'BHD02', 'PV01', '01/09/2022', 'GV01', 120000, 0, 0),
('LS76', 'CN11', 'BHD02', 'PV02', '01/12/2022', 'GV02', 80000, 0, 0),
('LS81', 'MG07', 'GAL03', 'PV01', '01/01/2022', 'GV01', 80000, 0, 0),
('LS82', 'MG07', 'GAL03', 'PV01', '03/02/2022', 'GV01', 120000, 0, 0),
('LS83', 'MG07', 'GAL03', 'PV02', '10/03/2022', 'GV02', 80000, 0, 0),
('LS84', 'MG07', 'GAL03', 'PV02', '04/04/2022', 'GV01', 65000, 0, 0),
('LS85', 'CN11', 'GAL03', 'PV01', '01/09/2022', 'GV01', 100000, 0, 0),
('LS86', 'CN11', 'GAL03', 'PV02', '01/12/2022', 'GV02', 90000, 0, 0)

-- trigger cập nhập số vé đã bán, doanh thu của 1 lịch chiếu 
CREATE OR REPLACE FUNCTION SoVeDaBan_func() 
RETURNS TRIGGER 
AS $$
BEGIN
    UPDATE LichChieu
    SET SoVeDaBan = (
        SELECT COUNT(*) 
        FROM Ve 
        WHERE Ve.MaShow = LichChieu.MaShow 
        AND TrangThai = 'Đã bán'
    );
    UPDATE LichChieu
    SET TongTien = (GiaVe * SoVeDaBan);
    
    RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER SoVeDaBan
AFTER INSERT OR UPDATE ON Ve
FOR EACH ROW
EXECUTE FUNCTION SoVeDaBan_func();

delete from Ve
delete from LichChieu

INSERT INTO Ve (MaVe, MaRap, MaPhong, MaShow, MaGhe, TrangThai) VALUES ('V001', 'CGV01', 'PC01', 'LS01', 'G01', 'Đã bán');
INSERT INTO Ve (MaVe, MaRap, MaPhong, MaShow, MaGhe, TrangThai) VALUES('V002', 'CGV01', 'PC01', 'LS01', 'G02', 'Đã bán');
INSERT INTO Ve (MaVe, MaRap, MaPhong, MaShow, MaGhe, TrangThai) VALUES('V003', 'CGV01', 'PC01', 'LS01', 'G03', 'Chưa bán');
INSERT INTO Ve (MaVe, MaRap, MaPhong, MaShow, MaGhe, TrangThai) VALUES('V004', 'CGV01', 'PC01', 'LS01', 'G04', 'Chưa bán');
INSERT INTO Ve (MaVe, MaRap, MaPhong, MaShow, MaGhe, TrangThai) VALUES('V005', 'CGV01', 'PC01', 'LS01', 'G05', 'Chưa bán');
INSERT INTO Ve (MaVe, MaRap, MaPhong, MaShow, MaGhe, TrangThai) VALUES('V006', 'CGV01', 'PC01', 'LS01', 'G07', 'Đã bán');
INSERT INTO Ve (MaVe, MaRap, MaPhong, MaShow, MaGhe, TrangThai) VALUES('V007', 'CGV01', 'PC02', 'LS01', 'A08', 'Đã bán');
INSERT INTO Ve (MaVe, MaRap, MaPhong, MaShow, MaGhe, TrangThai) VALUES('V008', 'CGV01', 'PC03', 'LS01', 'F09', 'Đã bán');
INSERT INTO Ve (MaVe, MaRap, MaPhong, MaShow, MaGhe, TrangThai) VALUES('V009', 'CGV01', 'PC01', 'LS01', 'L010', 'Chưa bán');
INSERT INTO Ve (MaVe, MaRap, MaPhong, MaShow, MaGhe, TrangThai) VALUES('V010', 'CGV01', 'PC01', 'LS01', 'L011', 'Đã bán');
INSERT INTO Ve (MaVe, MaRap, MaPhong, MaShow, MaGhe, TrangThai) VALUES('V011', 'BHD02', 'PC01', 'LS01', 'G01', 'Đã bán');
INSERT INTO Ve (MaVe, MaRap, MaPhong, MaShow, MaGhe, TrangThai) VALUES('V012', 'BHD02', 'PC02', 'LS01', 'G02', 'Đã bán');
INSERT INTO Ve (MaVe, MaRap, MaPhong, MaShow, MaGhe, TrangThai) VALUES('V013', 'BHD02', 'PC03', 'LS01', 'G03', 'Chưa bán');
INSERT INTO Ve (MaVe, MaRap, MaPhong, MaShow, MaGhe, TrangThai) VALUES('V014', 'BHD02', 'PC01', 'LS01', 'G04', 'Chưa bán');
INSERT INTO Ve (MaVe, MaRap, MaPhong, MaShow, MaGhe, TrangThai) VALUES('V015', 'BHD02', 'PC02', 'LS01', 'G05', 'Chưa bán');
INSERT INTO Ve (MaVe, MaRap, MaPhong, MaShow, MaGhe, TrangThai) VALUES('V016', 'BHD02', 'PC03', 'LS01', 'G07', 'Đã bán');
INSERT INTO Ve (MaVe, MaRap, MaPhong, MaShow, MaGhe, TrangThai) VALUES('V017', 'BHD02', 'PC01', 'LS01', 'A08', 'Đã bán');
INSERT INTO Ve (MaVe, MaRap, MaPhong, MaShow, MaGhe, TrangThai) VALUES('V018', 'BHD02', 'PC02', 'LS01', 'F09', 'Đã bán');
INSERT INTO Ve (MaVe, MaRap, MaPhong, MaShow, MaGhe, TrangThai) VALUES('V019', 'BHD02', 'PC03', 'LS01', 'L010', 'Chưa bán');
INSERT INTO Ve (MaVe, MaRap, MaPhong, MaShow, MaGhe, TrangThai) VALUES('V020', 'BHD02', 'PC01', 'LS01', 'L011', 'Đã bán');
select * from LichChieu
select * from Phim
-- tạo index cho các bảng 
create index index_phim on Phim using BTREE(MaPhim);
create index index_rap on RAP using BTREE(MaRap);
create index index_ve on Ve using BTREE(MaVe);
--store procedure
--store procedure tim ve xem phim
 

CREATE OR REPLACE FUNCTION VE_THONGTIN_function(MaVeInput VARCHAR(10))
RETURNS TABLE (
    MaVe VARCHAR(10), 
    MaPhong VARCHAR(10), 
    NgayChieu DATE, 
    MaGhe VARCHAR(10), 
    GiaVe money, 
    XuatChieu TIME, 
    TenRap VARCHAR(50), 
    MaRap VARCHAR(10), 
    DiaChi VARCHAR(100), 
    TenPhim VARCHAR(50)
)
AS $$
BEGIN
    RETURN QUERY
    SELECT 
        VE.MaVe,
        LC.MaPhong,
        LC.NgayChieu,
        Ve.MaGhe,
        LC.GiaVe,
        GC.XuatChieu,
        RAP.TenRap,
        RAP.MaRap,
        RAP.DiaChi,
        P.TenPhim 
    FROM 
        Ve AS VE 
        LEFT JOIN LichChieu AS LC ON LC.MaShow = VE.MaShow
        LEFT JOIN GioChieu AS GC ON GC.MaGioChieu=LC.MaGioChieu
        LEFT JOIN RAP ON LC.MaRap=RAP.MaRap 
        LEFT JOIN Phim AS P ON P.MaPhim=LC.MaPhim
    WHERE 
        VE.TrangThai = 'Đã bán' 
        AND VE.MaVe=MaVeInput;
END;
$$ LANGUAGE plpgsql;




DROP FUNCTION VE_THONGTIN_function

SELECT * FROM VE_THONGTIN_function('V001');

----------------------------------------------------
CREATE OR REPLACE FUNCTION TimVe(
    TenPhimInput varchar(50)
) RETURNS TABLE (
    TenPhim varchar(50), 
    TenRap varchar(50), 
    DiaChi varchar(100), 
    NgayChieu DATE, 
    GiaVe money, 
    SoVeConTrong INT
) AS
$$
BEGIN
    IF NOT EXISTS (SELECT * FROM Phim WHERE Phim.TenPhim = TenPhimInput) THEN
        RAISE EXCEPTION 'Tên phim không có xuất chiếu trong các hệ thống rạp';
    END IF;
    
    RETURN QUERY
    SELECT 
        Phim.TenPhim, 
        RAP.TenRap, 
        RAP.DiaChi, 
        LichChieu.NgayChieu, 
        LichChieu.GiaVe, 
        COUNT(Ve.MaVe)::int as "So ve con trong"
    FROM 
        Ve
        LEFT JOIN LichChieu ON Ve.MaShow = LichChieu.MaShow
        LEFT JOIN Phim ON Phim.MaPhim = LichChieu.MaPhim
        LEFT JOIN RAP ON LichChieu.MaRap = RAP.MaRap
    WHERE 
        Phim.TenPhim = TenPhimInput AND Ve.TrangThai = 'Chưa bán'
    GROUP BY 
        Phim.TenPhim, 
        RAP.TenRap, 
        RAP.DiaChi, 
        LichChieu.NgayChieu, 
        LichChieu.GiaVe;
END
$$ LANGUAGE plpgsql;

drop function TimVe

SELECT * FROM TimVe('Fast and Furious 10');
--------------------------------------------
--VIEW
CREATE MATERIALIZED VIEW DOANH_THU_2022 AS
SELECT RAP.MARAP,RAP.TENRAP,EXTRACT (MONTH FROM LC.NGAYCHIEU) AS "Tháng", SUM(LC.TONGTIEN) AS "Doanh Thu"
FROM LichChieu as LC
LEFT JOIN RAP ON RAP.MARAP = LC.MARAP
WHERE EXTRACT (YEAR FROM LC.NGAYCHIEU) = 2022
GROUP BY RAP.MARAP, RAP.TENRAP,EXTRACT(MONTH FROM LC.NGAYCHIEU);
SELECT * FROM DOANH_THU_2022

REFRESH MATERIALIZED VIEW DOANH_THU_2022;

set datestyle = DMY;
INSERT INTO LichChieu (MaShow, MaPhim, MaRap, MaPhong, NgayChieu, MaGioChieu, GiaVe, SoVeDaBan, TongTien) VALUES
('LS98','FF01', 'CGV01', 'PC01', '19/05/2022 ','GC01', 100000, 100,10000000);

SELECT * FROM LICHCHIEU
---------------------------------------------
-- cap quyen va phan quyen
CREATE user KH1 WITH PASSWORD  '123' login;
CREATE user KH2 WITH PASSWORD  '123' login;
CREATE user KH3 WITH PASSWORD  '123' login;
CREATE user nv1 WITH PASSWORD  '123' login;
CREATE user nv2 WITH PASSWORD  '123' login;
CREATE user ql1 WITH PASSWORD '123' login;
CREATE user gd WITH PASSWORD '123' login;

--role
create role khachhang
create role nhanvien;
create role quanli;
create role giamdoc;
--phan quyen
GRANT select on Ve to khachhang ;
GRANT select   on LichChieu to khachhang;
GRANT select   on GioChieu to khachhang ;
GRANT select    on PhongChieu to khachhang ;

GRANT select ,insert  , update,  delete  on Ve to nhanvien ;
GRANT select   on LichChieu to nhanvien;
GRANT select   on GioChieu to nhanvien ;
GRANT select    on PhongChieu to nhanvien ;

GRANT select ,insert  , update,  delete  on LichChieu to quanli;
GRANT select ,insert  , update,  delete  on Ve to quanli ;
GRANT select ,insert  , update,  delete  on GioChieu to quanli ;
GRANT select ,insert  , update,  delete  on PhongChieu to quanli ;

GRANT ALL PRIVILEGES ON GioChieu to giamdoc with grant option;
GRANT ALL PRIVILEGES ON LichChieu to giamdoc with grant option;
GRANT ALL PRIVILEGES ON PhongChieu to giamdoc with grant option;
GRANT ALL PRIVILEGES ON Ve to giamdoc with grant option;
GRANT ALL PRIVILEGES ON HangSX to giamdoc;
GRANT ALL PRIVILEGES ON NuocSX to giamdoc;
GRANT ALL PRIVILEGES ON Phim to giamdoc;
GRANT ALL PRIVILEGES ON RAP to giamdoc;
GRANT ALL PRIVILEGES ON TheLoai to giamdoc;

DENY   select ,insert  , update,  delete  On LichChieu to nhanvien;

REVOKE   select ,insert  , update  On LichChieu to nhanvien;
----add user vao role
GRANT khachhang TO KH1;
GRANT  khachhang to KH2;
GRANT khachhang to KH3;
GRANT  nhanvien to nv1;
GRANT  nhanvien to nv2;
GRANT quanli to ql1;
GRANT giamdoc to gd;
