--tao co so du lieu QLDT
create database QLDT
--tao bang giao vien
create table GIAOVIEN
(
	MAGV char(5) primary key,
	HOTEN nvarchar(50),
	LUONG money,
	PHAI tinyint,
	NGSINH date,
	DIACHI nvarchar(100),
	GVQLCM char(5),
	MABM char(5)
)
--tao bang khoa
create table KHOA
(
	MAKHOA char(5) primary key,
	TENKHOA nvarchar(50),
	NAMTL date,
	PHONG varchar(10),
	DIENTHOAI char(10),
	TRUONGKHOA char(5),
	NGAYNHANCHUC date
)
--tao bang khoa
create table BOMON
(
	MABM char(5) primary key,
	TENBM nvarchar(50),
	PHONG varchar(10),
	DIENTHOAI char(10),
	TRUONGBM char(5),
	MAKHOA char(5),
	NGAYNHANCHUC date
)
--tao bang giao vien DT
create table GV_DT
(
	MAGV char(5),
	DIENTHOAI char(10),
	primary key(MAGV, DIENTHOAI)
)
--tao bang nguoi than
create table NGUOITHAN
(
	MAGV char(5),
	TEN nvarchar(50),
	NGAYSINH date,
	PHAI tinyint,
	primary key(MAGV, TEN)
)
--tao bang nguoi than
create table CHUDE
(
	MACD char(5) primary key,
	TENCD nvarchar(50)
)
--tao bang de tai
create table DETAI
(
	MADT char(5) primary key,
	TENDT nvarchar(50),
	CAPQL char(50),
	KINHPHI money,
	NGAYBD date,
	NGAYKT date,
	MACD char(5),
	GVCNDT char(5)
)
--tao bang cong viec
create table CONGVIEC
(
	MADT char(5),
	SOTT int,
	TENCV nvarchar(50),
	NGAYBD date,
	NGAYKT date,
	primary key(MADT, SOTT)
)

--tao bang tham gia de tai
create table THAMGIADT
(
	MAGV char(5),
	MADT char(5),
	STT int,
	PHUCAP money,
	KETQUA nvarchar(50),
	primary key(MAGV, MADT, STT)
)

--tao foreign key bang giao vien
--foreign key GVQLCM bang GIAOVIEN
alter table GIAOVIEN add constraint FK_GIAOVIEN_GIAOVIEN
foreign key (GVQLCM) references GIAOVIEN (MAGV)
--foreign key TRUONGKHOA bang KHOA
alter table KHOA add constraint FK_KHOA_GIAOVIEN
foreign key (TRUONGKHOA) references GIAOVIEN (MAGV)
--foreign key TRUONGBM bang BOMON
alter table BOMON add constraint FK_BOMON_GIAOVIEN
foreign key (TRUONGBM) references GIAOVIEN (MAGV)
--foreign key MAGV bang GV_DT
alter table GV_DT add constraint FK_GV_DT_GIAOVIEN
foreign key (MAGV) references GIAOVIEN (MAGV)
--foreign key MAGV bang NGUOITHAN
alter table NGUOITHAN add constraint FK_NGUOITHAN_GIAOVIEN
foreign key (MAGV) references GIAOVIEN (MAGV)
--foreign key GVCNDT bang NGUOITHAN
alter table DETAI add constraint FK_DETAI_GIAOVIEN
foreign key (GVCNDT) references GIAOVIEN (MAGV)
--foreign key MAGV bang THAMGIADT
alter table THAMGIADT add constraint FK_THAMGIADT_GIAOVIEN
foreign key (MAGV) references GIAOVIEN (MAGV)

--tao foreign key bang bo mon
--foreign key MABM
alter table GIAOVIEN add constraint FK_GIAOVIEN_BOMON
foreign key (MABM) references BOMON (MABM)

--tao foreign key bang khoa
--foreign key MAKHOA
alter table BOMON add constraint FK_BOMON_KHOA
foreign key (MAKHOA) references KHOA (MAKHOA)

--tao foreign key bang chu de
--foreign key MACD
alter table DETAI add constraint FK_DETAI_CHUDE
foreign key (MACD) references CHUDE (MACD)

--tao foreign key bang de tai
--foreign key MADT
alter table CONGVIEC add constraint FK_CONGVIEC_DETAI
foreign key (MADT) references DETAI (MADT)

--tao foreign key bang cong viec
--foreign key MADT
alter table THAMGIADT add constraint FK_THAMGIADT_CONGVIEC
foreign key (MADT, STT) references CONGVIEC (MADT, SOTT)