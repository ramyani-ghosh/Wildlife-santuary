

create table employee(
	emp_id char(8) primary key,
	name varchar(20) NOT NULL,
	job_title varchar(15) NOT NULL,
	salary decimal(10,2) NOT NULL,
	dob date NOT NULL,
	gender char(1),
	yearsofexp int
);

create table zone(
	name varchar(20),
	type varchar(20),
	pin varchar(6) primary key
);

create table manager(
	mgr_id char(8) primary key,
	zone_pin varchar(6) NOT NULL default 'gra001',
	contact_no varchar(10) UNIQUE NOT NULL,
	foreign key(mgr_id) references employee ON delete Cascade,
	foreign key(zone_pin) references zone(pin) ON Delete SET default
);

create table species(
	habitat varchar(20),
	name varchar(20) primary key,
	status varchar(15) NOT NULL
);

create table animal(
	animal_id char(10) primary key,
	sp_name varchar(20) NOT NULL,
	zone_pin varchar(6) NOT NULL,
	name varchar(20),
	gender char(1),
	foreign key(sp_name) references species(name) ON delete cascade
);

create table package(
	cost decimal(8,2) NOT NULL,
	type varchar(10) NOT NULL,
	number_of_zones_covered int,
	pkg_id char(4) primary key
);

create table tour_guide(
	t_id char(8) primary key,
	tic_no char(5),
	mgr_id varchar(6),
	contact_no char(5) NOT NULL,
	-- foreign key(zone_pin) references zone(pin),
	foreign key(t_id) references employee(emp_id)
);
create table tourist(
	name varchar(20),
	t_no char(5) primary key,
	pkg_id varchar(10) NOT NULL,
	entry_date date NOT NULL,
	tour_id char(8) default '21374382',
	size int,
	foreign key(pkg_id) references package(pkg_id),
	foreign key(tour_id) references tour_guide(t_id) ON Delete set default
);

create table bill(
	bill_id char(7) primary key,
	t_no char(5) NOT NULL,
	status varchar(4) /*avl/navl*/ NOT NULL,
	mode_of_pay varchar(3) /*CC/C/O*/,
	total decimal(8,2) NOT NULL,
	foreign key(t_no) references tourist(t_no) ON Delete Cascade
);




-- insert into employee values('82184134','Chandrashekhar','Manager','70000.00','10/23/1972','M','20');
-- insert into employee values('76142312','Rajeev','Manager','90000.00','05/12/1965','M','25');
-- insert into employee values('89143234','Arnab','Manager','50000.00','12/02/1975','M','26');
-- insert into employee values('89423782','Rohini','Manager','70000.00','04/10/1972','F','19');
-- insert into employee values('23987438','Raghav','Manager','60000.00','02/14/1976','M','20');
-- insert into employee values('31276841','Sriram','Manager','60000.00','05/12/1976','M','20');
-- insert into employee values('21374382','Hari','Guide','40000.00','02/28/1985','M','10');
-- insert into employee values('17468389','Kiran','Guide','40000.00','06/16/1986','F','11');
-- insert into employee values('43688237','Guru','Guide','45000.00','01/20/1980','M','15');
-- insert into employee values('26489332','Rishi','Guide','45000.00','03/25/1981','M','15');
-- insert into employee values('74256837','Raghu','Guide','43000.00','11/17/1984','M','12');
--
-- insert into zone values('alpha','Grassland','gra001');
-- insert into zone values('beta','Forest','for001');
-- insert into zone values('delta','Forest','for002');
-- insert into zone values('sigma','Forest','for003');
-- insert into zone values('gamma','Grassland','gra002');
-- insert into zone values('kappa','Grassland','gra003');
-- insert into zone values('mu','River','riv001');
--
-- insert into manager values('76142312','gra001','9964972436');
-- insert into manager values('89143234','gra002','7743897433');
-- insert into manager values('82184134','for001','9432642373');
-- insert into manager values('89423782','for002','8326499853');
-- insert into manager values('23987438','for003','8579428598');
-- insert into manager values('31276841','riv001','8923792131');
--
-- insert into species values('Grassland','Tiger','Endangered');
-- insert into species values('Forest','Deer','Normal');
-- insert into species values('Grassland','Rhino','Endangered');
-- insert into species values('Grassland','Lion','Endangered');
-- insert into species values('Forest','Panda','Normal');
-- insert into species values('Forest','Elephant','Normal');
-- insert into species values('River','Crocodile','Normal');
-- insert into species values('Grassland','Cheetah','Endangered');
--
-- insert into animal values('1243412774','Tiger','gra001','Sher Khan','M');
-- insert into animal values('5973287523','Tiger','gra001','Tigger','F');
-- insert into animal values('9431412412','Tiger','gra001','Richard','M');
-- insert into animal values('1934270952','Tiger','gra001','Parker','M');
-- insert into animal values('1498219823','Cheetah','gra001','Duma','M');
-- insert into animal values('2938742123','Cheetah','gra001','Alexandra','F');
-- insert into animal values('3298472913','Cheetah','gra001','Roy','M');
-- insert into animal values('8159274329','Deer','for001','Bambi','M');
-- insert into animal values('8574922819','Deer','for001','Harini','F');
-- insert into animal values('4932784232','Deer','for001','Dear','F');
-- insert into animal values('3824961282','Deer','for001','Mayhem','M');
-- insert into animal values('8932743982','Deer','for001','Rudolf','M');
-- insert into animal values('2074582758','Panda','for002','Jack','M');
-- insert into animal values('7523876383','Panda','for002','Jim','M');
-- insert into animal values('8357283572','Panda','for002','Jill','F');
-- insert into animal values('5837283524','Elephant','for003','Marshall','M');
-- insert into animal values('8547932384','Elephant','for003','Mike','M');
-- insert into animal values('8574982383','Elephant','for003','Shanti','F');
-- insert into animal values('2368476234','Elephant','for003','Mustang','M');
-- insert into animal values('3295048233','Bear','for003','Baloo','M');
-- insert into animal values('8394729321','Bear','for003','Winnie','F');
-- insert into animal values('3029473249','Bear','for003','Pooh','M');
-- insert into animal values('5414572389','Rhino','gra002','Ted','M');
-- insert into animal values('2457892893','Rhino','gra002','Betty','F');
-- insert into animal values('5269384832','Rhino','gra002','Ridick','M');
-- insert into animal values('7843943982','Lion','gra002','Alex','M');
-- insert into animal values('6947658767','Lion','gra002','Kiara','F');
-- insert into animal values('8457982548','Lion','gra002','Pan','F');
-- insert into animal values('8947239842','Crocodile','riv001','Akon','M');
-- insert into animal values('1829478122','Crocodile','riv001','Betty','F');
-- insert into animal values('7432985722','Crocodile','riv001','Bity','F');
-- insert into animal values('1142738473','Crocodile','riv001','Tiktok','F');
-- insert into animal values('8193474318','Tortoise','riv001','Jiminy','M');
-- insert into animal values('2376482347','Tortoise','riv001','Timothy','M');
-- insert into animal values('7836427312','Tortoise','riv001','Nancy','F');
-- insert into animal values('7463748632','Tortoise','riv001','Vicky','F');
-- insert into animal values('1284961292','Tortoise','riv001','Kalki','F');
--
--
-- insert into package values('15000.00','Platinum',5,'plat');
-- insert into package values('10000.00','Gold',3,'gold');
-- insert into package values('8000.00','Silver',2,'silv');
-- insert into package values('5000.00','Bronze',1,'bron');
--
-- insert into tourist values('Rakesh','12846','gold','04/03/2018','4');
-- insert into tourist values('Suresh','89174','bronze','04/03/2018','2');
--
-- insert into tour_guide values('17468389','12846');
-- insert into tour_guide values('43688237','89174');
--
-- --alter table animal add foreign key (zone_pin) references zone(pin);
--
-- --alter table manager add foreign key (zone_pin) references zone(pin);
-- --alter table manager add foreign key (mgr_id) references employee(emp_id);
--
-- --alter table tourist add foreign key (pkg_id) references package(pkg_id);
--
-- --alter table bill add foreign key (t_no) references tourist(t_no);
