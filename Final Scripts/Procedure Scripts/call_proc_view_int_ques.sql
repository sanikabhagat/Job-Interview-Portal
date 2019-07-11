DECLARE
	type iq_out_record is record(
	i_question_id interview_questions.question_id%type,
	i_job_id interview_questions.job_id%type,
    i_question_description interview_questions.question_description%type,
    i_difficulty_level interview_questions.difficulty_level%type,
    i_posted_date interview_questions.posted_date%type
	);

	iq_out iq_out_record;
	i_domain interview_questions.domain%type;
	i_int_ques_refcursor SYS_REFCURSOR;


BEGIN
    DBMS_OUTPUT.PUT_LINE('QUESTION ID     JOB_ID     QUESTION DESCRIPTION                               DIFFICULTY LEVEL     POSTED DATE');
    DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------------------------------------------------');

    view_interview_questions('&i_domain', i_int_ques_refcursor);

    FETCH i_int_ques_refcursor INTO iq_out;

    while i_int_ques_refcursor%FOUND
    
    loop 
    	DBMS_OUTPUT.PUT_LINE(iq_out.i_question_id || '               ' || iq_out.i_job_id || '     ' || iq_out.i_question_description || '       '|| iq_out.i_difficulty_level || '              '||iq_out.i_posted_date);
    	FETCH i_int_ques_refcursor INTO iq_out;
    	

    end loop;
    if i_int_ques_refcursor%ROWCOUNT=0 THEN
    dbms_output.put_line('Please enter a valid Domain Name');
	CLOSE i_int_ques_refcursor;
    end if;
EXCEPTION 
    WHEN NO_DATA_FOUND THEN
    dbms_output.put_line('No records');
END;
/