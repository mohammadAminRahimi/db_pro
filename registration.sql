delimiter $$
drop procedure if exists registration$$
create procedure registration(n_id varchar(12), userName varchar(30), pass varchar(30),
				firstName varchar(30), lastName varchar(30),deposit1 int, occupy varchar(30),
                unis varchar(30), id varchar(12))
begin 
	declare flag int default 0;
	declare flag1 int default 1;
	declare done int default 0;
    declare un varchar(30);
    
    declare cur1 cursor for
		select user_name
        from account;
        
	declare continue handler for not found set done=1;
    
    open cur1;
    emp_loop: loop
		fetch cur1 into un;
        if done=1 then
			leave emp_loop;
        end if;
        
        if lower(un)=lower(userName) then
			set flag = 1;
            select 'user name exists, please choose another user name';
			leave emp_loop;
		end if;
    end loop emp_loop;
    close cur1;
    
	if length(userName) <6 then
		set flag = 1;
		select 'user name too short';
	end if;
    
    if pass regexp '[0-9]' and pass regexp'[a-z]|[A-Z]' and  length(pass)>8 then
		set flag1 =0;
	else
		select "password is incorrect, please choose another password";
    end if;
    
	
    if flag !=1 and flag1 !=1 then
		case occupy 
			when "student" then
				insert into account(national_number,user_name, password,
                first_name, last_name, deposit, creation_date )
                values(n_id,userName, md5(pass), firstName, lastName, deposit1, now());
                insert into student(stu_number , university , national_number)
                values( id, unis , n_id);
				select "hello";
			when "professor" then
				select "hello";
			when "normal" then
				select "hello";
			else
				select "case not found";
		end case;
    end if;
end$$

call registration("3j434232","min5432", "j4t823awz" , "first" , "last", 2 
, "student" ,"univ", "433253")$$
select * from  student;
select * from account;

