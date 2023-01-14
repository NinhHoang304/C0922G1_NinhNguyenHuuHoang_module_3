create database quan_ly_thu_vien;
use quan_ly_thu_vien;

create table sach(
	ma_sach varchar(45) primary key,
    ten_sach varchar(45),
    tac_gia varchar(45),
    mo_ta varchar(45),
    so_luong int
);

create table hoc_sinh(
	ma_hoc_sinh varchar(45) primary key,
    ho_ten varchar(45),
    lop varchar(45)
);

create table the_muon_sach(
	ma_muon_sach varchar(45),
    ma_sach varchar(45),
    foreign key(ma_sach) references sach(ma_sach) on delete cascade,
    ma_hoc_sinh varchar(45),
    foreign key(ma_hoc_sinh) references hoc_sinh(ma_hoc_sinh) on delete cascade,
    trang_thai bit(1),
    ngay_muon date,
    ngay_tra date
);