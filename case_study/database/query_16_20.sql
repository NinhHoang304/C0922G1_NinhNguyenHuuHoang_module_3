use furama_database;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

-- Hiển thị những nhân viên chưa có hợp đồng
select n.ma_nhan_vien, n.ho_ten 
from nhan_vien n
left join hop_dong h on n.ma_nhan_vien = h.ma_nhan_vien
where n.ma_nhan_vien not in (select ma_nhan_vien from hop_dong group by ma_nhan_vien);
-- Lệnh xoá những nhân viên chưa có hợp đồng
set sql_safe_updates = 0;
delete from nhan_vien n
where n.ma_nhan_vien not in (select ma_nhan_vien from hop_dong group by ma_nhan_vien);
set sql_safe_updates = 1;
-- Hiển thị danh sách nhân viên sau khi xoá
select * from nhan_vien;

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond, 
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.
-- Tạo view
create view w_khach_hang as 
select 
    kh.ma_khach_hang,
    kh.ho_ten,
    lk.ten_loai_khach,
    hd.ma_hop_dong,
    dv.ten_dich_vu,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    ifnull(dv.chi_phi_thue + sum(hdct.so_luong * dvdk.gia),
            dv.chi_phi_thue) as tong_tien
from
    khach_hang kh
        left join
    loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
        left join
    hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
        left join
    hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
        left join
    dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
        left join
    dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
group by kh.ma_khach_hang , hd.ma_hop_dong
order by kh.ma_khach_hang asc;
-- Sử dụng view lấy điều kiện
select ma_khach_hang from w_khach_hang 
where tong_tien > 1000000 and ten_loai_khach regexp 'Platinium';
-- update
update khach_hang 
set ma_loai_khach = 1 
where ma_khach_hang 
in (select ma_khach_hang from w_khach_hang where tong_tien > 1000000 and ten_loai_khach regexp 'Platinium');
-- xem lại thay đổi trong danh sách
select * from khach_hang;

