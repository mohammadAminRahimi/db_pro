create table publisher(
	p_name varchar(30),
    address varchar(100),
    website varchar(50),
    primary key(p_name)
);

-- ******************* 
create table book(
	book_id varchar(12),
    volume_no int,
	title varchar(30),
	category varchar(30),
	pages int,
    prices int,
    publisher_name varchar(30),
    primary key(book_id, volume_no),
    foreign key(publisher_name) references publisher(p_name)
    
);
 -- **********************
create table writer_name(
	book_id varchar(12),
    volume_no int,
	w_name varchar(30),
    primary key(book_id, volume_no, w_name),
    foreign key(book_id, volume_no) references book(book_id, volume_no)    
);
 -- **********************
-- create table branch(
-- 	id varchar(12),
--     address varchar(100),
--     phone_number varchar(12),
--     primary key(id)
-- );
-- **********************
-- create table libraryStorage(
-- 	s_name varchar(20),
--     branch_id varchar(12),
--     primary key(s_name, branch_id),
--     foreign key(branch_id) references branch(id)
-- );
-- **********************
create table book_issue(
	book_issue_id varchar(12),
	-- branch_id varchar(12),
	-- s_name varchar(12),
	book_id varchar(12),
	volume_no int,
    primary key(book_issue_id, book_id, volume_no),
    -- foreign key(branch_id, s_name) references libraryStorage(branch_id, s_name),
    foreign key(book_id, volume_no) references book(book_id, volume_no)
);
 -- **********************
create table account(
	national_number varchar(12),
    user_name varchar(20) not null,
    password varchar(20) not null,
    hashed_tage varchar(30),
    hashed_tag_update date,
    first_name varchar(20),
    last_name varchar(20),
    deposit int,
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
    foreign key(national_number) references account(national_number)
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
 -- **********************
create table acc_addr(
	address varchar(100),
    national_number varchar(12),
    primary key(address, national_number),
    foreign key(national_number) references account(national_number)
);
 -- **********************
create table acc_phone(
	phone_no varchar(12),
    national_number varchar(12),
    primary key(phone_no, national_number),
    foreign key(national_number) references account(national_number)
);
 -- **********************
create table borrow(
	borrow_id varchar(12),
    national_number varchar(12),
    price int,
    return_date date,
    creation_date date,
	book_issue_id varchar(12),
	book_id varchar(12),
	volume_no int,
    primary key(borrow_id),
    foreign key(book_issue_id, book_id, volume_no) references book_issue(book_issue_id, book_id, volume_no),
    foreign key(national_number) references account(national_number)
);