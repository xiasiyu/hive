-- Upgrade MetaStore schema from 3.1.0 to 4.0.0
-- HIVE-19416
ALTER TABLE "APP"."TBLS" ADD WRITEID_LIST CLOB;
ALTER TABLE "APP"."TBLS" ADD TXN_ID bigint DEFAULT 0;
ALTER TABLE "APP"."PARTITIONS" ADD WRITEID_LIST CLOB;
ALTER TABLE "APP"."PARTITIONS" ADD TXN_ID bigint DEFAULT 0;

-- This needs to be the last thing done.  Insert any changes above this line.
UPDATE "APP".VERSION SET SCHEMA_VERSION='4.0.0', VERSION_COMMENT='Hive release version 4.0.0' where VER_ID=1;

