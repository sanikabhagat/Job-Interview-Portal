set serveroutput on

DECLARE
  CURSOR tip_trick_cursor
  IS
    SELECT
      ID, CATEGORY, DESCRIPTION
    FROM
      EXTERNAL_ADMIN.INTERVIEW_TIPS_TRICKS;
BEGIN
  DBMS_OUTPUT.PUT_LINE('ID  CATEGORY      TIPS AND TRICKS');
  FOR each_rec IN tip_trick_cursor
  LOOP
    DBMS_OUTPUT.PUT_LINE(each_rec.id || '   ' || each_rec.category || '  ' || each_rec.description );
  END LOOP;
END;
/