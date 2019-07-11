set echo off
set serveroutput on
set verify off
set define '&'

prompt
prompt 'Enter NUID'
accept nuid char 
prompt 'Enter Doubt'
accept doubt char
prompt 'Enter Domain'
accept domain char
prompt
             
DECLARE
    var1 number;   
    FOREIGN_KEY_CONSTRAINT_VIOLATED EXCEPTION;
    PRAGMA EXCEPTION_INIT(FOREIGN_KEY_CONSTRAINT_VIOLATED, -2291);
    CHECK_CONSTRAINT_VIOLATED EXCEPTION;
    PRAGMA EXCEPTION_INIT(CHECK_CONSTRAINT_VIOLATED, -2290);

   BEGIN
      INSERT into DOUBTS(NUID,DOUBT_DESCRIPTION,DOMAIN, POSTED_DATE) values ('&nuid','&doubt',upper('&domain'),SYSDATE);
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
    WHEN FOREIGN_KEY_CONSTRAINT_VIOLATED THEN
    dbms_output.put_line('Insert failed due to foreign key constraint violation');
    WHEN CHECK_CONSTRAINT_VIOLATED THEN
    dbms_output.put_line('Insert failed due to Invalid Domain');
END;  

/