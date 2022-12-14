create database if not exists student_management;
use student_management;
-- tạo bảng dữ liệu student
create table students(
	id int primary key,
    studentName varchar(50),
    studentAge int,
    country varchar(80)
);
-- tạo bảng dữ liệu class
create table class (
	id int primary key,
    `name` varchar(50)
);

-- thêm mới dữ liệu cho bảng
insert into class values (1, "C08"), (2, "C09"), (3, "C10"), (4, "C11");
insert into students values 
(1, "Hoang", 26, "Da Nang"),
(2, "Quan", 21, "Hue"),
(3, "Tai", 22, "Quang Nam"),
(4, "Nhan", 20, "Gia Lai");

-- chỉnh sửa dữ liệu bằng id
update students set studentName = "Hoang01" where id = 1;
-- chỉnh sửa dữ liệu bằng các trường thuộc tính khác
set sql_safe_updates = 0;
update students set studentName = "Hoang" where studentName = "Hoang01";
set sql_safe_updates = 1;

-- xoá dữ liệu
delete from students where id = 2;

-- thêm 1 cột dữ liệu
alter table students add column(`point` int);

-- xoá 1 cột dữ liệu
alter table students drop column point;

-- hiển thị bảng
select * from class;
select * from students;


