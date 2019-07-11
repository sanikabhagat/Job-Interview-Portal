set echo off
set serveroutput on
set verify off
set define '&'

prompt
prompt 'Enter NUID'
accept nuid char 
prompt 'Enter JOB ID'
accept job_id number
prompt 'Enter Interview Question'
accept question char
prompt 'Enter Difficulty Level'
accept difficulty char
prompt 'Enter the Technology 1'
accept technology_list_1 char
prompt 'Enter the Technology 2'
accept technology_list_2 char
prompt
             
DECLARE
    var1 number;   
    domain varchar2(40); 
    CHECK_CONSTRAINT_VIOLATED EXCEPTION;
    PRAGMA EXCEPTION_INIT(CHECK_CONSTRAINT_VIOLATED, -2290);
    FOREIGN_KEY_CONSTRAINT_VIOLATED EXCEPTION;
    PRAGMA EXCEPTION_INIT(FOREIGN_KEY_CONSTRAINT_VIOLATED, -2291);
   BEGIN
      SELECT DOMAIN into domain FROM JOB_DETAILS where job_id = '&job_id' ; 
      INSERT into INTERVIEW_QUESTIONS(NUID,JOB_ID,QUESTION_DESCRIPTION,DIFFICULTY_LEVEL,TECHNOLOGIES,DOMAIN,POSTED_DATE) values ('&nuid',&job_id,'&question','&difficulty',technology_list_type(technology_type('&technology_list_1'),technology_type('&technology_list_2')),domain,SYSDATE);
    var1 := SQL%ROWCOUNT;
    if (var1 = 1) then

        commit;
        dbms_output.put_line('Number of Rows affected: ' || var1);
    else 
        rollback;
    end if;
    EXCEPTION
    WHEN NO_DATA_FOUND THEN 
    dbms_output.put_line('Please enter valid details');
    WHEN CHECK_CONSTRAINT_VIOLATED THEN
    dbms_output.put_line('Insert failed due to check constraint violation');
    WHEN FOREIGN_KEY_CONSTRAINT_VIOLATED THEN
    dbms_output.put_line('Insert failed due to foreign key constraint violation');
END;  

/