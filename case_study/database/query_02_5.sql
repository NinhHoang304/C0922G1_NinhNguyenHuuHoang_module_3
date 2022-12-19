use furama_database;

-- 2.hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu
-- là một trong các ký tự “h”, “t” hoặc “k” và có tối đa 15 kí tự.
select * from nhan_vien 
where substring_index(ho_ten, ' ', -1) rlike '^[h|t|k]'
having char_length(ho_ten) <= 15;

-- 3.hiển thị thông tin của tất cả khách hàng
-- có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “đà nẵng” hoặc “quảng trị”.
select * from khach_hang 
where floor(datediff(current_date, ngay_sinh) / 365.25) between 18 and 50
having dia_chi regexp 'Đà Nẵng|Quảng Trị';

-- 4.đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. 
-- kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- chỉ đếm những khách hàng nào có tên loại khách hàng là “diamond”.
select 
    kh.ma_khach_hang,
    kh.ho_ten,
    count(hd.ma_khach_hang) as so_lan_dat_phong
from
    khach_hang kh
        join
    loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
        join
    hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
where
    lk.ten_loai_khach regexp 'Diamond'
group by hd.ma_khach_hang
order by so_lan_dat_phong asc;

-- 5.hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc, tong_tien 
-- (với tổng tiền được tính theo công thức như sau: chi phí thuê + số lượng * giá, với số lượng và giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) 
-- cho tất cả các khách hàng đã từng đặt phòng. (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
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
