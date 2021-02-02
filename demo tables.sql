 -- **********************
drop table if exists student;
drop table if exists normal;
drop table if exists professor;
drop table if exists account;
create table account(
	national_number varchar(12),
    user_name varchar(20) not null,
    password char(32) not null,
    hashed_tag char(32),
    hashed_tag_update date,
    first_name varchar(20) not null,
    last_name varchar(20) not null,
    deposit int default 0,
    creation_date date,
    unique (user_name),
    primary key(national_number)
);
 -- **********************
create table professor(
	pro_id varchar(12),
    university varchar(40),
    national_number varchar(12),
    primary key(national_number),
    foreign key(national_number) references account(national_number) on delete cascade
);
 -- **********************
create table student(
	stu_number varchar(12),
    university varchar(40),
    national_number varchar(12),
    primary key(national_number),
    foreign key(national_number) references account(national_number)
);
 -- **********************
create table normal(
    occupation varchar(40),
    national_number varchar(12),
    primary key(national_number),
    foreign key(national_number) references account(national_number)
);

select * from account natural join professor;
select * from account natural join student;
select * from account natural join normal;