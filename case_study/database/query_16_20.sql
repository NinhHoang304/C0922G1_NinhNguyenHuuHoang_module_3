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
