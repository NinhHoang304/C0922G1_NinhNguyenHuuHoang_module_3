use furama_database;

-- 11.	hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng
-- có ten_loai_khach là “diamond” và có dia_chi ở “vinh” hoặc “quảng ngãi”.
select 
	dvdk.ma_dich_vu_di_kem, 
    dvdk.ten_dich_vu_di_kem
from loai_khach lk
join khach_hang kh on kh.ma_loai_khach = lk.ma_loai_khach
join hop_dong hd on hd.ma_khach_hang = kh.ma_khach_hang
join hop_dong_chi_tiet hdct on hdct.ma_hop_dong = hd.ma_hop_dong
join dich_vu_di_kem dvdk on dvdk.ma_dich_vu_di_kem = hdct.ma_dich_vu_di_kem
where lk.ten_loai_khach regexp 'diamond' and kh.dia_chi regexp 'vinh|quảng ngãi';

-- 12.	hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng),
-- ten_dich_vu, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở hop_dong_chi_tiet),
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 
-- nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
select 
    hd.ma_hop_dong,
    nv.ho_ten as nhan_vien,
    kh.ho_ten as khach_hang,
    kh.so_dien_thoai,
    dv.ma_dich_vu,
    dv.ten_dich_vu,
    dv.ten_dich_vu,
    ifnull(sum(so_luong), 0) as so_luong_dich_vu_di_kem,
    hd.ngay_dat_coc as tien_dat_coc
from hop_dong hd
join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where hd.ma_dich_vu 
		not in (select ma_dich_vu from hop_dong
        where (year(ngay_lam_hop_dong) = 2021))
        and month(ngay_lam_hop_dong) between 10 and 12
group by hd.ma_hop_dong;

-- 13.	hiển thị thông tin các dịch vụ đi kèm được sử dụng nhiều nhất bởi các khách hàng đã đặt phòng. 
-- (lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
select 
    d.ma_dich_vu_di_kem,
    d.ten_dich_vu_di_kem,
    sum(so_luong) as so_luong_dv_di_kem
from dich_vu_di_kem d 
join hop_dong_chi_tiet h on h.ma_dich_vu_di_kem = d.ma_dich_vu_di_kem
group by h.ma_dich_vu_di_kem
having sum(so_luong) = (select max(so_luong) from hop_dong_chi_tiet);

-- 14.	hiển thị thông tin tất cả các dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung 
-- (được tính dựa trên việc count các ma_dich_vu_di_kem).
select 
    d.ma_dich_vu_di_kem,
    d.ten_dich_vu_di_kem,
    sum(so_luong) as so_lan_su_dung
from dich_vu_di_kem d 
join hop_dong_chi_tiet h on h.ma_dich_vu_di_kem = d.ma_dich_vu_di_kem
group by h.ma_dich_vu_di_kem
having sum(so_luong) = (select min(so_luong) from hop_dong_chi_tiet);

-- 15.	hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai, dia_chi 
-- mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.
select 
    n.ma_nhan_vien,
    n.ho_ten,
    t.ten_trinh_do,
    b.ten_bo_phan,
    n.so_dien_thoai,
    n.dia_chi
from nhan_vien n
join trinh_do t on n.ma_trinh_do = t.ma_trinh_do
join bo_phan b on n.ma_bo_phan = b.ma_bo_phan
join hop_dong h on n.ma_nhan_vien = h.ma_nhan_vien
group by h.ma_nhan_vien
having count(h.ma_nhan_vien) <= 3
