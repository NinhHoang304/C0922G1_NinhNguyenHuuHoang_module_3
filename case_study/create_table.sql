create database if not exists furama_resort_final;

use furama_resort_final;

-- employee --
create table position (
	id int primary key auto_increment,
	name varchar(45)
);

create table education_degree (
	id int primary key auto_increment,
    name varchar(45)
);

create table division (
	id int primary key auto_increment,
    name varchar(45)
);

create table employee (
	id int primary key auto_increment,
    name varchar(45),
    date_of_birth date,
    id_card varchar(45),
    salary double,
    phone_number varchar(45),
    email varchar(45),
    address varchar(45),
    position_id int,
    foreign key(position_id) references position (id),
    education_degree_id int,
    foreign key(education_degree_id) references education_degree(id) on delete cascade,
    division_id int,
    foreign key(division_id) references division(id) on delete cascade
);

-- customer --
create table customer_type (
	id int primary key auto_increment,
    name varchar(45)
);

create table customer (
	id int primary key auto_increment,
    name varchar(45),
    date_of_birth date,
    gender BIT(1),
    id_card varchar(45),
    phone_number varchar(45),
    email varchar(45),
    address varchar(45),
    customer_type_id int,
    foreign key(customer_type_id) references customer_type(id) on delete cascade
);

-- facility --
create table facility_type(
	id int primary key auto_increment,
    name varchar(45)
);

create table rent_type(
	id int primary key auto_increment,
    name varchar(45)
);

create table facility(
	id int primary key auto_increment,
    name varchar(45),
    area int,
    cost double,
    max_people int,
    standard_room varchar(45),
    description_orther_convenience varchar(45),
    pool_area double,
    number_of_floors int,
    facility_free text,
    rent_type_id int,
    foreign key(rent_type_id) references rent_type(id) on delete cascade,
    facility_type_id int,
    foreign key(facility_type_id) references facility_type(id) on delete cascade
);

-- attach_facility --

create table attach_facility(
	id int primary key auto_increment,
    name varchar(45),
    cost double,
    unit varchar(10),
    `status` varchar(45)
);

-- contract --

create table contract(
	id int primary key auto_increment,
    start_date datetime,
    end_date datetime,
    deposit double,
    employee_id int,
    foreign key(employee_id) references employee(id) on delete cascade,
    customer_id int,
    foreign key(customer_id) references customer(id) on delete cascade,
    facility_id int,
    foreign key(facility_id) references facility(id) on delete cascade
);

-- contract_detail --
create table contract_detail(
	id int primary key auto_increment,
    quantity int,
    contract_id int,
    foreign key(contract_id) references contract(id) on delete cascade,
    attach_facility_id int,
    foreign key(attach_facility_id) references attach_facility(id) on delete cascade
);
