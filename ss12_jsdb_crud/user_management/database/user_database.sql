CREATE DATABASE user_management;
USE user_management;

create table users (
 id int primary key auto_increment,
 name varchar(120) NOT NULL,
 email varchar(220) NOT NULL,
 country varchar(120)
);

insert into users(name, email, country) values('Minh','minh@codegym.vn','Viet Nam');
insert into users(name, email, country) values('Kante','kante@che.uk','Kenia');

select * from users;

update users set name = "Hoang",email= "Hoang@gmail.com", country ="My" where id = 3;

select * from users order by name;

-- ps display list user
delimiter //
create procedure display_list_user()
begin
    select * from users;
end //
delimiter ;
call display_list_user();

-- ps update user
delimiter //
create procedure update_user(IN p_name varchar(50),  IN p_email varchar(50),  IN p_country varchar(50),IN p_id int)
begin
    update users set name = p_name, email = p_email, country = p_country where id = p_id;
end //
delimiter ;
call update_user(3, "Quan", "Quandis", "My");

-- ps delete user
delimiter //
create procedure delete_user(IN p_id int)
begin
    delete from users where id = p_id;
end //
delimiter ;
call delete_user(7);

create table Permision(

id int primary key,

name varchar(50)

);

create table User_Permision(

permision_id int,

user_id int

);

insert into Permision(id, name) values(1, 'add');

insert into Permision(id, name) values(2, 'edit');

insert into Permision(id, name) values(3, 'delete');

insert into Permision(id, name) values(4, 'view');










