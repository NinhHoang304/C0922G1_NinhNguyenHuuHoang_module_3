use furama_database;

-- 21.	Tạo khung nhìn có tên là v_nhan_vien để lấy được thông tin của tất cả các nhân viên có địa chỉ là “Hải Châu”
-- và đã từng lập hợp đồng cho một hoặc nhiều khách hàng bất kì với ngày lập hợp đồng là “12/12/2019”.
create view v_nhan_vien as
select n.* 
from nhan_vien n
join hop_dong h on n.ma_nhan_vien = h.ma_nhan_vien
where n.dia_chi regexp 'Hải Châu' 
and ngay_lam_hop_dong regexp '2019-12-12';

-- 22.	Thông qua khung nhìn v_nhan_vien thực hiện cập nhật địa chỉ thành “Liên Chiểu”
-- đối với tất cả các nhân viên được nhìn thấy bởi khung nhìn này.
set sql_safe_updates = 0;
update v_nhan_vien set dia_chi = 'Liên Chiểu';
select * from nhan_vien;

-- 23.	Tạo Stored Procedure sp_xoa_khach_hang dùng để xóa thông tin của một khách hàng nào đó
-- với ma_khach_hang được truyền vào như là 1 tham số của sp_xoa_khach_hang.
delimiter // 
create procedure sp_xoa_khach_hang(IN p_id int)
begin
	delete from khach_hang
    where p_id = ma_khach_hang;
end //
delimiter ;
call sp_xoa_khach_hang(1);
select * from khach_hang;

-- 24.	Tạo Stored Procedure sp_them_moi_hop_dong dùng để thêm mới vào bảng hop_dong
-- với yêu cầu sp_them_moi_hop_dong phải thực hiện kiểm tra tính hợp lệ của dữ liệu bổ sung,
-- với nguyên tắc không được trùng khóa chính và đảm bảo toàn vẹn tham chiếu đến các bảng liên quan.

delimiter // 
create procedure sp_them_moi_hop_dong(
	IN p_ma_hop_dong int, 
    IN p_ngay_lam_hop_dong datetime, 
    IN p_ngay_ket_thuc datetime,
	IN p_ngay_dat_coc double, 
    IN p_ma_nhan_vien int, 
    IN p_ma_khach_hang int, 
    IN p_ma_dich_vu int)
begin
	declare existing int default null;
    
    select h.ma_khach_hang
    into existing
    from hop_dong h
    join nhan_vien n on h.ma_nhan_vien = n.ma_nhan_vien
    join khach_hang k on h.ma_khach_hang = k.ma_khach_hang
    join dich_vu d on h.ma_dich_vu = d.ma_dich_vu
    where ma_hop_dong = p_ma_hop_dong
    or p_ma_nhan_vien not between 1 and 10
    or p_ma_khach_hang not between 1 and 10
    or p_ma_dich_vu not between 1 and 6;
    -- and n.ma_nhan_vien <> p_ma_nhan_vien
    -- and k.ma_khach_hang <> p_ma_khach_hang
    -- and d.ma_dich_vu <> p_ma_dich_vu;
    
	if existing is not null then
		select 'existed or invalid, try again';
	else
		set foreign_key_checks=0;
		insert into hop_dong values
        (p_ma_hop_dong,p_ngay_lam_hop_dong,p_ngay_ket_thuc,p_ngay_dat_coc,p_ma_nhan_vien,p_ma_khach_hang,p_ma_dich_vu);
        set foreign_key_checks=1;
	end if;
end //
delimiter ;
call sp_them_moi_hop_dong(16, '2020-12-08', '2020-12-08', 0, 10, 1, 3);
select * from hop_dong;

-- 25.	Tạo Trigger có tên tr_xoa_hop_dong khi xóa bản ghi trong bảng hop_dong
-- thì hiển thị tổng số lượng bản ghi còn lại có trong bảng hop_dong ra giao diện console của database.
-- Lưu ý: Đối với MySQL thì sử dụng SIGNAL hoặc ghi log thay cho việc ghi ở console.

-- ghi log
create table `history`(
	id int primary key auto_increment,
    total int
);
-- trigger
delimiter // 
create trigger tr_xoa_hop_dong
after delete on hop_dong
for each row
begin
	insert into `history`(total) 
    values ((select count(ma_hop_dong) from hop_dong));
end //
delimiter ;
-- delete
delete from hop_dong where ma_hop_dong = 1;
-- display total record in table hop_dong
select id, total as tong_so_luong_record_con_lai from `history`;