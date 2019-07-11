set serveroutput on
DECLARE
	var1 number;  
	i_response_description int_ques_response.response_description%type;
	i_question_id interview_questions.question_id%type;
    rows_affected number;
    FOREIGN_KEY_CONSTRAINT_VIOLATED EXCEPTION;
    PRAGMA EXCEPTION_INIT(FOREIGN_KEY_CONSTRAINT_VIOLATED, -2291);

BEGIN

    INT_QUES_RESPONSE_FUNC(&i_question_id, '&i_response_description',rows_affected);
    dbms_output.put_line('Number of Rows Affected: ' || to_char(rows_affected));
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
   
END;
/