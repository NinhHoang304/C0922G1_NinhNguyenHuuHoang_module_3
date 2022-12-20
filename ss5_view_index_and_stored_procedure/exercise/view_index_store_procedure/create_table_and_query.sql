-- Bước 1: Tạo cơ sở dữ liệu demo
create database products_management;
use products_management;
-- Bước 2: Tạo bảng Products với các trường dữ liệu sau:
create table products(
	id int primary key auto_increment,
    product_code varchar(45),
    product_name varchar(45),
    product_price double,
    product_amount int,
    product_description varchar(45),
    product_status varchar(45)
);
-- Chèn một số dữ liệu mẫu cho bảng Products.
insert into products (product_code, product_name,
 product_price, product_amount, product_description, product_status) values
 ('C01', 'Iphone', 2000, 20, 'Black', 'OnSale'),
 ('C02', 'SamSung', 1500, 20, 'Red', 'OnSale'),
 ('C03', 'Oppo', 1000, 15, 'Yellow', 'OnSale'),
 ('C04', 'Xiaomi', 1000, 10, 'Blue', 'OnSale'),
 ('C05', 'Sony', 1200, 10, 'Black', 'OnSale');
 
 -- B3
 -- Tạo Unique Index trên bảng Products (sử dụng cột productCode để tạo chỉ mục)
create unique index i_product_code on products(product_code);
-- Tạo Composite Index trên bảng Products (sử dụng 2 cột productName và productPrice)
 create index i_name_and_price on products(product_name, product_price);
 -- Sử dụng câu lệnh EXPLAIN để biết được câu lệnh SQL của bạn thực thi như nào
explain select * from products where product_code = 'C01';
-- So sánh câu truy vấn trước và sau khi tạo index
select * from products where product_code = 'C01';

-- B4
-- Tạo view lấy về các thông tin: productCode, productName, productPrice, productStatus từ bảng products.
create view w_products as
select product_code, product_name, product_price, product_status from products;
-- Tiến hành sửa đổi view
select * from w_products;
delete from w_products where product_code = 'C01';
-- Tiến hành xoá view
drop view w_products;

-- B5
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product
delimiter //
create procedure get_all_products()
begin
	select * from products;
end //
delimiter ;
call get_all_products();

-- Tạo store procedure thêm một sản phẩm mới
delimiter //
create procedure add_new_product(IN id int, IN product_code varchar(45),IN product_name varchar(45),
 IN product_price double, IN product_amount int, IN product_description varchar(45), IN product_status varchar(45))
begin
	insert into products values (id, product_code, product_name, product_price, product_amount, product_description, product_status);
end //
delimiter ;
call add_new_product(6, 'C06', 'B-Phone', 5000, 20, 'Black', 'saleOff');

-- Tạo store procedure sửa thông tin sản phẩm theo id
delimiter //
create procedure edit_product(IN p_id int)
begin
	update products set product_name = 'Asus'
    where id = p_id;
end //
delimiter ;
call edit_product(1);

-- Tạo store procedure xoá sản phẩm theo id
delimiter //
create procedure delete_product(IN p_id int)
begin
	delete from products
    where id = p_id;
end //
delimiter ;
call delete_product(1);