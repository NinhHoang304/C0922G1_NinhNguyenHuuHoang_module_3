create database if not exists product_management;
use product_management;

create table phieu_xuat(
	so_px int primary key auto_increment,
    ngay_xuat date
);

create table phieu_nhap(
	so_pn int primary key auto_increment,
    ngay_nhap date
);

create table nha_cc(
	ma_ncc int primary key auto_increment,
    ten_ncc varchar(45),
    dia_chi varchar(45)
);

create table sdt(
	id int primary key auto_increment,
	sdt int,
    ref_ma_ncc int,
    foreign key(ref_ma_ncc) references nha_cc(ma_ncc)
);

create table don_dh(
	so_dh int primary key auto_increment,
    ngay_dh date,
    ref_ma_ncc int,
    foreign key(ref_ma_ncc) references nha_cc(ma_ncc)
);

create table vat_tu(
	ma_vtu int primary key auto_increment,
    ten_vtu varchar(45)
);

create table xuat_vtu(
	so_px_id int,
    ma_vtu_id int,
	dg_xuat double,
    sl_xuat int,
    primary key(so_px_id, ma_vtu_id),
    foreign key(so_px_id) references phieu_xuat(so_px),
    foreign key(ma_vtu_id) references vat_tu(ma_vtu)
);

create table nhap_vtu(
	so_pn_id int,
    ma_vtu_id int,
	dg_nhap double,
    sl_nhap int,
    primary key(so_pn_id, ma_vtu_id),
    foreign key(so_pn_id) references phieu_nhap(so_pn),
    foreign key(ma_vtu_id) references vat_tu(ma_vtu)
);

create table don_dh_vtu(
	so_dh_id int,
    ma_vtu_id int,
    primary key(so_dh_id, ma_vtu_id),
    foreign key(so_dh_id) references don_dh(so_dh),
    foreign key(ma_vtu_id) references vat_tu(ma_vtu)
);
