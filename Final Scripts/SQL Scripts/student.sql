	set echo off
set serveroutput on
set verify off
set define '&'

prompt
prompt 'Do you want to:'
accept tab prompt '(P)ost (V)iew Int Ques, (R)esp to Ques or (D)oubt, (A)sk Doubt, (I)nt Ques by you, (T)ips'
prompt

declare

	selection varchar2(1) := upper(substr('&tab',1,1));

begin
	if selection = 'P' then
	dbms_output.put_line('Go to post_interview_question.sql Script');
	-- Here the post_interview_question.sql script should come
	elsif selection = 'V' then
	dbms_output.put_line('Go to view_interview_questions.sql Script');
	-- Here the script of view_interview_questions.sql should come
	elsif selection = 'R' then
	dbms_output.put_line('Go to question_response.sql Script');
	-- Here the question_response.sql script should come
	elsif selection = 'A' then
	dbms_output.put_line('Go to post_doubt.sql Script');
	-- Here the script of post_doubt.sql should come
	elsif selection = 'I' then
	dbms_output.put_line('Go to your_interview_questions.sql Script');
	-- Here the script of your_interview_questions.sql should come
	elsif selection = 'T' then
	dbms_output.put_line('Go to interview_tips_tricks.sql Script');
	-- Here the script of interview_tips_tricks.sql should come
	else
	dbms_output.put_line('Please enter valid options');
	end if;
end;
/

