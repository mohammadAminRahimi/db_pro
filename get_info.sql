delimiter $$
drop procedure if exists get_info$$
create procedure get_info(hashed_tag char(32))

begin
	declare fname varchar(30) default "";
	declare lname varchar(30) default "";
	declare nid varchar(30) default "";
    declare nid_t varchar(30) default"";
	declare depo int default 0;
	declare uname varchar(32) default "";
	declare uname_t varchar(30) default "";
    declare occupy varchar(30) default "";
	declare uni varchar(30) default "";
	declare hashed char(32) default "";
	declare unid varchar(30) default "";
	declare done int default 0;

    declare cur1 cursor for
		select 	national_number, user_name, hashed_tag, first_name, last_name, deposit 
        from account;
        
        
       --  
-- 	declare cur2 cursor for
-- 		select 	national_number, university, pro_id
--         from professor;
--         
-- 	declare cur3 cursor for
-- 		select 	national_number, university, stu_number
--         from student;
--         
-- 	declare cur4 cursor for
-- 		select 	national_number, occupation
--         from normal;
--        
   	declare continue handler for not found set done=1;

	select "hello";
	open cur1;
    emp_loop: loop
		fetch cur1 into nid, uname_t, hashed, fname, lname, depo;
        select uname_t;
        if done=1 then
			leave emp_loop;
        end if;
        
	
        
        if  hashed=hashed_tag then
			leave emp_loop;
		end if;

    end loop emp_loop;
    close cur1;
    
	select "hello";

-- 	open cur2;
--     emp_loop: loop

-- 		fetch cur2 into nid_t, uni, unid;
--         if done=1 then

-- 			leave emp_loop;
--         end if;
--         if  nid_t=nid then

-- 			leave emp_loop;
-- 		end if;
--     end loop emp_loop;
--     close cur2;
--     

-- 	open cur3;
--     emp_loop: loop
-- 		fetch cur3 into nid_t, uni, unid;
--         if done=1 then
-- 			leave emp_loop;
--         end if;
--         if  nid_t=nid then
-- 			leave emp_loop;
-- 		end if;
--     end loop emp_loop;
--     close cur3;
--     
    select * from account;

	select nid, uname_t, hashed, fname, lname, depo, unid;
    
end$$


call get_info("97d0df5f683adb92e3c0f54588283f3e")$$