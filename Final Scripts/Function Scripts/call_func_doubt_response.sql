set serveroutput on
DECLARE
	rows_affected NUMBER := 0;
	i_response_description doubt_response.response_description%type;
	i_doubt_id doubt_response.doubt_id%type;
  
BEGIN

    rows_affected := DOUBT_RESPONSE_FUNC(&doubt_id, '&i_response_description');
    dbms_output.put_line('Number of Rows Affected: ' || to_char(rows_affected));
END;
/