set echo off
set serveroutput on
set verify off
set define '&'

prompt
prompt 'Enter NUID'
accept nuid char 
prompt 'Enter First Name'
accept first_name char
prompt 'Enter Last Name'
accept last_name char
prompt 'Enter Email ID'
accept email char
prompt 'Enter Password'
accept password char
prompt 'Confirm Password'
accept confirm_password char
prompt
             
DECLARE    
	user_record USER_INFO%rowtype;         
	var1 number;
BEGIN   
	if REGEXP_LIKE ('&email','^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$')  then
	if (instr('&email','northeastern.edu') > 0 or instr('&email','neu.edu') > 0) then
	if('&password'='&confirm_password') then
      
    INSERT into USER_INFO values ('&nuid','&first_name','&last_name','&email','&password');
    var1 := SQL%ROWCOUNT;
    if (var1 = 1) then

    	commit;
    	dbms_output.put_line('Number of Rows affected: ' || var1);
    else 
    	rollback;
    end if;
    else
    dbms_output.put_line('The Passwords should match');
    end if;
    else
    dbms_output.put_line('The Email ID should be university Email ID');
    end if;
    else
    dbms_output.put_line('Please enter valid email');
    end if;
END;  

/