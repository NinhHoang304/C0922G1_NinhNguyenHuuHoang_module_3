use furama_database;

-- 26.	Tạo Trigger có tên tr_cap_nhat_hop_dong khi cập nhật ngày kết thúc hợp đồng, 
-- cần kiểm tra xem thời gian cập nhật có phù hợp hay không, với quy tắc sau: 
-- Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày. 
-- Nếu dữ liệu hợp lệ thì cho phép cập nhật, nếu dữ liệu không hợp lệ thì in ra thông báo 
-- “Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày” trên console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.

-- ghi log
create table update_check_in(
	id int primary key auto_increment,
    old_update datetime,
    new_update datetime
);
-- trigger
delimiter //
create trigger tr_cap_nhat_hop_dong
after update on hop_dong
for each row
begin
	insert into update_check_in(old_update, new_update)
    values (old.ngay_lam_hop_dong, new.ngay_lam_hop_dong);
end //
delimiter ;
-- procedure
delimiter //
create procedure update_check_in(IN p_id int, IN p_date datetime)
begin
    declare existing datetime default null;
    
    select ngay_lam_hop_dong
    into existing
    from hop_dong
    where ma_hop_dong = p_id and day(ngay_ket_thuc) - day(p_date) < 2;
    
    if existing is not null then
    select 'Ngày kết thúc hợp đồng phải lớn hơn ngày làm hợp đồng ít nhất là 2 ngày';
    else
    update hop_dong set ngay_lam_hop_dong = p_date where ma_hop_dong = p_id;
    end if;
end //
delimiter ;
-- update
call update_check_in(2, '2020-07-10 00:00:00');
-- check list after update
select * from update_check_in;
select * from hop_dong;

-- 27.	Tạo Function thực hiện yêu cầu sau:
-- a.	Tạo Function func_dem_dich_vu: Đếm các dịch vụ đã được sử dụng với tổng tiền là > 2.000.000 VNĐ.

-- function func_dem_dich_vu
delimiter //
create function func_dem_dich_vu(p_tong_tien double)
returns int
deterministic
begin
	declare `count` int default 0;
    if p_tong_tien > 2000000 then
    set `count` = `count` + 1;
    else
    set `count` = 0;
    end if;
    return `count`;
end //
delimiter ;
-- create view get tong_tien
create view w_tong_tien as 
select 
    kh.ma_khach_hang,
    hd.ma_hop_dong,
    dv.ten_dich_vu,
    ifnull(dv.chi_phi_thue + sum(hdct.so_luong * dvdk.gia),dv.chi_phi_thue) as tong_tien
from khach_hang kh
left join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
group by kh.ma_khach_hang , hd.ma_hop_dong
order by kh.ma_khach_hang asc;
-- check view
select * from w_tong_tien;
-- view + function
select ten_dich_vu, func_dem_dich_vu(tong_tien) as `count`
from w_tong_tien
group by ma_khach_hang, tong_tien, ten_dich_vu
having `count` <> 0;
-- create view count
create view w_count as
select ten_dich_vu, func_dem_dich_vu(tong_tien) as `count`
from w_tong_tien
group by ma_khach_hang, tong_tien, ten_dich_vu
having `count` <> 0;
-- use view count get dich_vu > 2.000.000
select ten_dich_vu, count(`count`) as so_luong from w_count
group by ten_dich_vu;

-- b.Tạo Function func_tinh_thoi_gian_hop_dong: Tính khoảng thời gian dài nhất tính từ lúc bắt đầu làm hợp đồng
-- đến lúc kết thúc hợp đồng mà khách hàng đã thực hiện thuê dịch vụ 
-- (lưu ý chỉ xét các khoảng thời gian dựa vào từng lần làm hợp đồng thuê dịch vụ, không xét trên toàn bộ các lần làm hợp đồng). 
-- Mã của khách hàng được truyền vào như là 1 tham số của function này.
delimiter //
create function func_tinh_thoi_gian_hop_dong(p_id int)
returns int
deterministic
begin
	declare result int default 0;
	if (select ma_hop_dong from hop_dong where p_id = ma_hop_dong) then 
    set result = datediff((select ngay_ket_thuc from hop_dong where p_id) a, 
							(select ngay_lam_hop_dong from hop_dong where p_id) b);
    end if;
    return result;
end //
delimiter ;
-- use function
select *, func_tinh_thoi_gian_hop_dong(2) as total_day from hop_dong; 











