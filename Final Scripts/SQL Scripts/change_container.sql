declare
begin
EXECUTE IMMEDIATE 'alter session set container = EXTERNAL_PDB';
end;
/