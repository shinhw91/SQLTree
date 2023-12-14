-- °´Ã¼ ±ÇÇÑ
SELECT *
FROM hr.employees;

CREATE TABLE aaa (
               aa number (2));

INSERT INTO aaa
VALUES (1);

INSERT INTO aaa
VALUES (2);

COMMIT;

GRANT SELECT
ON aaa
TO skj;

-- Run SQL Command Line
-- conn skj/lion
-- select * from yedam.aaa;