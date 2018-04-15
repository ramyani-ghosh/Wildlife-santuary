drop database wildlife;
create database wildlife;
\c wildlife


create table employee(
	emp_id varchar(10) primary key,
	name varchar(20) NOT NULL,
	job_title varchar(15) NOT NULL,
	salary decimal(5,2) NOT NULL,
	yearsofexp int
);

create table zone(
	name varchar(20),
	pin varchar(6) primary key
);

create table manager(
	mgr_id varchar(10) primary key,
	zone_pin varchar(6) NOT NULL,
	foreign key(zone_pin) references zone(pin),
	foreign key(mgr_id) references employee(emp_id)
);


create table species(
	habitat varchar(20),
	zone_pin varchar(6),
	sp_name varchar(20) primary key,
	status varchar(15) NOT NULL,
	foreign key(zone_pin) references zone(pin)
);
create table animal(
	animal_id varchar(10) primary key,
	species varchar(20) NOT NULL,
	zone_pin varchar(6) NOT NULL,
	name varchar(20),
	foreign key(zone_pin) references zone(pin),
	foreign key(species) references species(sp_name)
);

create table package(
	cost decimal(8,2) NOT NULL,
	type varchar(10) NOT NULL,
	zone_covered varchar(6),
	pkg_id varchar(10) primary key
);

create table tourist(
	name varchar(20),
	t_no varchar(10) primary key,
	pkg_id varchar(10) NOT NULL,
	entry_date date NOT NULL,
	exit_date date NOT NULL,
	size int,
	foreign key(pkg_id) references package(pkg_id)
);
create table bill(
	bill_id varchar(10) primary key,
	t_no varchar(10) NOT NULL,
	status varchar(4) /*avl/navl*/ NOT NULL,
	mode_of_pay varchar(3) /*CC/C/O*/,
	pkg_id varchar(10),
	total decimal(8,2) NOT NULL,
	foreign key(t_no) references tourist(t_no)
);
create table tour_guide(
	t_id varchar(10) primary key,
	zone_pin varchar(6),
	t_no varchar(10) NOT NULL,
	foreign key(zone_pin) references zone(pin),
	foreign key(t_no) references tourist(t_no),
	foreign key(t_id) references employee(emp_id)
);

insert into animal values('1243412774','tiger','gra201','qwerty1');
insert into animal values('5973287523','tiger','gra201','qwerty2');
insert into animal values('8159274329','deer','gra203','qwerty3');
insert into animal values('8574922819','deer','gra203','qwerty4');
insert into animal values('5414572389','rhino','gra204','qwerty5');
insert into animal values('2457892893','rhino','gra204','qwerty6');

insert into zone values('alpha','gra201');
insert into zone values('beta','gra203');
insert into zone values('gamma','gra204');
