use quan_ly_ban_hang;

insert into customer (c_name, c_age) values
('Minh Quan', 10),
('Ngoc Oanh', 20),
('Hong Ha', 50);

insert into orders (o_date, o_total_price, c_id) values
('2006-3-21', null , 1),
('2006-3-23', null , 2),
('2006-3-16', null , 1);

insert into product (p_name, p_price) values
('May Giat', 3),
('Tu Lanh', 5),
('Dieu Hoa', 7),
('Quat', 1),
('Bep Dien', 2);

insert into order_detail (o_id, p_id, od_qty) values
(1, 1 , 3),
(1, 3 , 7),
(1, 4 , 2),
(2, 1 , 1),
(3, 1 , 8),
(2, 5 , 4),
(2, 3 , 3);

