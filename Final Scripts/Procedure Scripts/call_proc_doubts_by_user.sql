DECLARE
	type d_out_record is record(
	i_doubt_id doubts.doubt_id%type,
    i_doubt_description doubts.doubt_description%type,
    i_domain doubts.domain%type,
    i_posted_date doubts.posted_date%type
	);

	d_out d_out_record;
	i_nuid interview_questions.nuid%type;
	i_doubts_user_refcursor SYS_REFCURSOR;


BEGIN
   DBMS_OUTPUT.PUT_LINE('DOUBT ID     DOUBT DESCRIPTION                               DOMAIN     POSTED DATE');
DBMS_OUTPUT.PUT_LINE('-----------------------------------------------------------------------------------------------------------------');

    doubts_by_user('&i_nuid', i_doubts_user_refcursor);

    FETCH i_doubts_user_refcursor INTO d_out;

    while i_doubts_user_refcursor%FOUND
    
    loop 
    	DBMS_OUTPUT.PUT_LINE(d_out.i_doubt_id || '               ' || d_out.i_doubt_description || '     ' || d_out.i_domain || '       '||d_out.i_posted_date);
    	FETCH i_doubts_user_refcursor INTO d_out;
    	

    end loop;
    if i_doubts_user_refcursor%ROWCOUNT=0 THEN
    dbms_output.put_line('Please enter valid NUID');
	CLOSE i_doubts_user_refcursor;
    end if;
    EXCEPTION 
    WHEN NO_DATA_FOUND THEN
    dbms_output.put_line('No records');
END;
/
