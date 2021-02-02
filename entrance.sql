-- drop table if exists user;
-- create table user(
-- user_name varchar(30),
-- password char(32),
-- entrance_date datetime,
-- hashed_tag char(32),
-- primary key(user_name)
-- );

-- insert into user(user_name, password) values('amin1',(md5('j4t823awz')));

delimiter $$
drop procedure if exists entrance$$
create procedure entrance( username varchar(30), pass varchar(30))
begin
	declare u varchar(30) default "";
    declare p char(32);
    declare d datetime;
    declare hashed char(32);
    
    select user_name,password into u,p
    from account
    where user_name = username;
    select * from account;
    select username;
    SELECT u,p;
    
    if u="" then
		select "there is no such a user";
    else
		if md5(pass)=p then
			select "you entered succesffully";
            set d=now();
            set hashed = md5(concat(u,pass,d));
            select d, hashed;
            update account
            set hashed_tag_update=d, hashed_tag = md5(hashed)
            where u=user_name;            
		else
			select "wrong password", md5(pass),p;
        end if;
    end if;
end$$


call entrance("amin5432", "j4t823awz")$$

select * from account$$















-- drop table if exists m;
-- create table m( var int unique);
-- insert into m values(1);
-- insert into m values(null);
-- insert into m values(null);
-- select * from m;