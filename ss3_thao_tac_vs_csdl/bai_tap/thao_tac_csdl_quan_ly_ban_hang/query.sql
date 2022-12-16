use quan_ly_ban_hang;

-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select o.o_id, o.o_date, o.o_total_price from orders o;

-- Hiển thị danh sách các khách hàng đã mua hàng, 
-- và danh sách sản phẩm được mua bởi các khách
select distinct c.c_name, p.p_name from customer c join orders o join product p join order_detail od 
on c.c_id = o.c_id and od.o_id = o.o_id and od.p_id = p.p_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select distinct c.c_name from customer c where c.c_id
not in (select o.c_id from orders o where o.o_id);

-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn.
-- Giá bán của từng loại được tính = odQTY*pPrice)
select o.o_id, o.o_date, od.od_qty * p.p_price as price  from orders o join product p join order_detail od 
on od.o_id = o.o_id and od.p_id = p.p_id;


