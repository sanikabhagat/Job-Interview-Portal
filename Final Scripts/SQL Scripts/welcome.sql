set echo off
set serveroutput on
set verify off
set define '&'

prompt
prompt 'Welcome! Do you want to:'
accept tab prompt '(L)ogin, or (S)ignUp: '
prompt

declare

	selection varchar2(1) := upper(substr('&tab',1,1));

begin
	if selection = 'L' then
	dbms_output.put_line('Go to login.sql Script');
	-- Here the login.sql script should come
	elsif selection = 'S' then
	dbms_output.put_line('Go to signup.sql Script');
	-- Here the script of signup.sql should come
	else
	dbms_output.put_line('Please enter valid options');
	end if;
end;
/