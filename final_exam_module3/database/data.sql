use quan_ly_thu_vien;

insert into sach(ma_sach, ten_sach, tac_gia, mo_ta, so_luong) values
("S-0001", "Số đỏ", "Vũ trọng phụng", "nhân vật chính là Xuân tóc đỏ...", 10),
("S-0002", "Truyện kiều", "Nguyễn Du", "cuộc đời Thuý Kiều", 15),
("S-0003", "Truyện 01", "Nguyễn Du", "codegym", 0);

insert into hoc_sinh(ma_hoc_sinh, ho_ten, lop) values
("HS-0001", "Nguyễn Hoàng", "C09"),
("HS-0002", "Quân Hùng", "C08"),
("HS-0003", "Đại Tài", "C07");

insert into the_muon_sach(ma_muon_sach, ma_sach, ma_hoc_sinh, trang_thai, ngay_muon, ngay_tra) values
("MS-0001", "S-0001", "HS-0001", 1, '2022-03-15', '2022-03-17'),
("MS-0002", "S-0002", "HS-0002", 0, '2022-04-15', '2022-04-17'),
("MS-0003", "S-0003", "HS-0003", 1, '2022-05-15', '2022-05-17');