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












