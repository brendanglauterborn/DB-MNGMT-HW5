DROP TABLE IF EXISTS SPJ;
DROP TABLE IF EXISTS J;
DROP TABLE IF EXISTS P;
DROP TABLE IF EXISTS S;


CREATE TABLE J (
j_num VARCHAR(2) NOT NULL PRIMARY KEY,
jname varchar(20) NOT NULL,
city varchar(20) not null
);

CREATE TABLE P (
p_num VARCHAR(2) NOT NULL PRIMARY KEY,
pname varchar(20) NOT NULL,
color varchar(20) not null,
weight int not null,
city varchar(20)
);

create table S (
s_num varchar(2) not null primary key,
sname varchar(20) not null,
`status` int not null,
city varchar(20) not null
);

create table SPJ (
s_num varchar(2) not null,
p_num varchar(2) not null,
j_num varchar(2) not null,
qty int not null,
primary key (s_num, p_num, j_num),
foreign key (s_num) references S(s_num),
foreign key (p_num) references P(p_num),
foreign key (j_num) references J(j_num)
);

insert into J (j_num, jname, city) values
('j1', 'Sorter', 'Paris'),
('j2', 'Punch', 'Rome'),
('j3', 'Reader', 'Athens'),
('j4', 'Console', 'Athens'),
('j5', 'Collator', 'London'),
('j6', 'Terminal', 'Oslo'),
('j7', 'Tape', 'London');

insert into P values
('p1', 'Nut', 'Red', 12,'London'),
('p2', 'Bolt', 'Green', 17,'Paris'),
('p3', 'Screw', 'Blue', 17,'Rome'),
('p4', 'Screw', 'Red', 14,'London'),
('p5', 'Cam', 'Blue', 12,'Paris'),
('p6', 'Cog', 'Red', 19,'London');

insert into S values
('s1', 'Smith', 20, 'London'),
('s2', 'Jones', 10, 'Paris'),
('s3', 'Blake', 30, 'Paris'),
('s4', 'Clark', 20, 'London'),
('s5', 'Adams', 30, 'Athens');

insert into SPJ values 
('s1', 'p1', 'j1', '200'),
('s1', 'p1', 'j4', '700'),
('s2', 'p3', 'j1', '400'),
('s2', 'p3', 'j2', '200'),
('s2', 'p3', 'j3', '200'),
('s2', 'p3', 'j4', '500'),
('s2', 'p3', 'j5', '600'),
('s2', 'p3', 'j6', '400'),
('s2', 'p3', 'j7', '800'),
('s2', 'p5', 'j2', '100'),
('s3', 'p3', 'j1', '200'),
('s3', 'p4', 'j2', '500'),
('s4', 'p6', 'j3', '300'),
('s4', 'p6', 'j7', '300'),
('s5', 'p1', 'j4', '100'),
('s5', 'p2', 'j2', '200'),
('s5', 'p2', 'j4', '100'),
('s5', 'p3', 'j4', '200'),
('s5', 'p4', 'j4', '800'),
('s5', 'p5', 'j4', '400'),
('s5', 'p5', 'j5', '500'),
('s5', 'p5', 'j7', '100'),
('s5', 'p6', 'j2', '200'),
('s5', 'p6', 'j4', '500');







