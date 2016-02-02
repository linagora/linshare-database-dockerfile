-- Default script for database creation

-- DROP DATABASE IF EXISTS linshare;
-- DROP DATABASE IF EXISTS linshare_data;
-- 
-- CREATE DATABASE linshare
--   WITH OWNER = linshare
--        ENCODING = 'UTF8'
--        TABLESPACE = pg_default
--        LC_COLLATE = 'en_US.utf8'
--        LC_CTYPE = 'en_US.utf8'
--        CONNECTION LIMIT = -1;
-- 
 CREATE DATABASE linshare_data
   WITH OWNER = linshare
        ENCODING = 'UTF8'
        TABLESPACE = pg_default
        LC_COLLATE = 'en_US.utf8'
        LC_CTYPE = 'en_US.utf8'
        CONNECTION LIMIT = -1;

GRANT ALL ON DATABASE linshare TO linshare;
GRANT ALL ON DATABASE linshare_data TO linshare;

