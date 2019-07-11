create table EXT_TAB_JOB_DESC (
JOB_ID NUMBER not null enable,
JOB_TITLE VARCHAR2(100) not null enable,
COMPANY_NAME VARCHAR2(100) not null enable,
DOMAIN VArCHAR2(100) not null enable
)
organization external
(
type oracle_loader
default directory job_desc_dir
access parameters
(
records delimited by newline
badfile 'ext_tab_job_desc.bad'
logfile 'ext_tab_job_desc.log'
fields terminated by ','
missing field values are null
)
location ('Job_Description.csv')
);