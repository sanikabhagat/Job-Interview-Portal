set echo off
set serveroutput on
set verify off
set define '&'

prompt
prompt 'Enter Email ID'
accept email char
prompt 'Enter Password'
accept password char
prompt
             
DECLARE             
	user_record USER_INFO%rowtype;
	row_count number; 
BEGIN   
	select * into user_record from USER_INFO where EMAIL='&email' and PASSWORD='&password';

	row_count:=SQL%ROWCOUNT;
	if (row_count=1) then
	dbms_output.put_line('Welcome '||user_record.FIRST_NAME||' '||user_record.LAST_NAME);
	if(instr(user_record.EMAIL,'northeastern.edu') > 0) then
	dbms_output.put_line('Go to faculty.sql Script');
	-- Here the script of faculty.sql should come
	else 
	dbms_output.put_line('Go to student.sql Script');
	-- Here the script of student.sql should come
	end if;
	else
	dbms_output.put_line('No records found');
	end if;
	
EXCEPTION
when NO_DATA_FOUND then
	dbms_output.put_line('Please enter valid credentials');
END;  

/
