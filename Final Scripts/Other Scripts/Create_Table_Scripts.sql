!--Create table scripts:

CREATE TABLE INTERVIEW_QUES 
(
  INTERVIEW_QUES_ID NUMBER GENERATED BY DEFAULT AS IDENTITY
, JOB_ID NUMBER NOT NULL 
, INTERVIEW_QUESTION LONG NOT NULL 
, DIFFICULTY_LEVEL VARCHAR2(20) NOT NULL 
, TECHNOLOGIES VARCHAR2(20) NOT NULL 
, DATE_POSTED DATE NOT NULL 
);
