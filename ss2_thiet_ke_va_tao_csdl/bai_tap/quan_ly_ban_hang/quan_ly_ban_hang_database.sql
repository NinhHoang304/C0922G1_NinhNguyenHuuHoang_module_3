create database if not exists sale_management;
use sale_management;

create table customer(
	c_id int primary key auto_increment,
    c_name varchar(45),
    c_age int
);

create table orders(
	o_id int primary key auto_increment,
    o_date date,
    o_total_price double,
    c_id int,
    foreign key(c_id) references customer(c_id)
);

create table product(
	p_id int primary key auto_increment,
    p_name varchar(45),
    p_price double
);

create table order_detail(
	o_id int,
    p_id int,
    od_qty varchar(45),
    primary key(o_id, p_id),
    foreign key(o_id) references orders(o_id),
    foreign key(p_id) references product(p_id)
);