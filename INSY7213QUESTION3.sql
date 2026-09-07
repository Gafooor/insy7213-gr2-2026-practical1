CREATE USER John
IDENTIFIED BY Johnch2026;

GRANT CREATE SESSION TO John;

GRANT SELECT ANY TABLE TO John;


CREATE USER Hannah
IDENTIFIED BY Hannahch2026;

GRANT CREATE SESSION TO Hannah;

GRANT INSERT ANY TABLE TO Hannah;

SELECT username
FROM dba_users
WHERE username IN ('JOHN', 'HANNAH');

SELECT grantee, privilege
FROM dba_sys_privs
WHERE grantee IN ('JOHN', 'HANNAH');