use furama;

-- display all customer list --
select * from customer;

-- delete customer --
delete from customer where id = 10;

-- insert customer --

-- update customer --
update customer set customer_type_id = 4,  name = "Hoang", day_of_birth="1970-11-07", gender=1, id_card = 9182383,
	phone_number=098234532, email="lkasjdl9782@gmail.com",address="2222 nguyen hung" where id = 1;
    
-- search customer by name and customer type --
select * from customer c join customer_type ct on c.customer_type_id = ct.id where c.name like "%Hoang%" and ct.name like "%Silver%";

-- select customer by id --
select * from customer where id = 1;

-- display all customer type --
select * from customer_type;