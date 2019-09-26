TYPE=VIEW
query=select `information_schema`.`ROUTINES`.`ROUTINE_SCHEMA` AS `db`,`information_schema`.`ROUTINES`.`ROUTINE_TYPE` AS `object_type`,count(0) AS `count` from `INFORMATION_SCHEMA`.`ROUTINES` group by `information_schema`.`ROUTINES`.`ROUTINE_SCHEMA`,`information_schema`.`ROUTINES`.`ROUTINE_TYPE` union select `information_schema`.`TABLES`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`information_schema`.`TABLES`.`TABLE_TYPE` AS `TABLE_TYPE`,count(0) AS `COUNT(*)` from `INFORMATION_SCHEMA`.`TABLES` group by `information_schema`.`TABLES`.`TABLE_SCHEMA`,`information_schema`.`TABLES`.`TABLE_TYPE` union select `information_schema`.`STATISTICS`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,concat(\'INDEX (\',`information_schema`.`STATISTICS`.`INDEX_TYPE`,\')\') AS `CONCAT(\'INDEX (\', INDEX_TYPE, \')\')`,count(0) AS `COUNT(*)` from `INFORMATION_SCHEMA`.`STATISTICS` group by `information_schema`.`STATISTICS`.`TABLE_SCHEMA`,`information_schema`.`STATISTICS`.`INDEX_TYPE` union select `information_schema`.`TRIGGERS`.`TRIGGER_SCHEMA` AS `TRIGGER_SCHEMA`,\'TRIGGER\' AS `TRIGGER`,count(0) AS `COUNT(*)` from `INFORMATION_SCHEMA`.`TRIGGERS` group by `information_schema`.`TRIGGERS`.`TRIGGER_SCHEMA` union select `information_schema`.`EVENTS`.`EVENT_SCHEMA` AS `EVENT_SCHEMA`,\'EVENT\' AS `EVENT`,count(0) AS `COUNT(*)` from `INFORMATION_SCHEMA`.`EVENTS` group by `information_schema`.`EVENTS`.`EVENT_SCHEMA` order by `DB`,`OBJECT_TYPE`
md5=a92f9892f2454c8efc6ae27886a0f6cb
updatable=0
algorithm=1
definer_user=root
definer_host=localhost
suid=0
with_check_option=0
timestamp=2014-06-22 00:20:00
create-version=1
source=SELECT ROUTINE_SCHEMA AS db, ROUTINE_TYPE AS object_type, COUNT(*) AS count FROM INFORMATION_SCHEMA.ROUTINES GROUP BY ROUTINE_SCHEMA, ROUTINE_TYPE\n UNION \nSELECT TABLE_SCHEMA, TABLE_TYPE, COUNT(*) FROM INFORMATION_SCHEMA.TABLES GROUP BY TABLE_SCHEMA, TABLE_TYPE\n UNION\nSELECT TABLE_SCHEMA, CONCAT(\'INDEX (\', INDEX_TYPE, \')\'), COUNT(*) FROM INFORMATION_SCHEMA.STATISTICS GROUP BY TABLE_SCHEMA, INDEX_TYPE\n UNION\nSELECT TRIGGER_SCHEMA, \'TRIGGER\', COUNT(*) FROM INFORMATION_SCHEMA.TRIGGERS GROUP BY TRIGGER_SCHEMA\n UNION\nSELECT EVENT_SCHEMA, \'EVENT\', COUNT(*) FROM INFORMATION_SCHEMA.EVENTS GROUP BY EVENT_SCHEMA\nORDER BY DB, OBJECT_TYPE
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `information_schema`.`ROUTINES`.`ROUTINE_SCHEMA` AS `db`,`information_schema`.`ROUTINES`.`ROUTINE_TYPE` AS `object_type`,count(0) AS `count` from `INFORMATION_SCHEMA`.`ROUTINES` group by `information_schema`.`ROUTINES`.`ROUTINE_SCHEMA`,`information_schema`.`ROUTINES`.`ROUTINE_TYPE` union select `information_schema`.`TABLES`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,`information_schema`.`TABLES`.`TABLE_TYPE` AS `TABLE_TYPE`,count(0) AS `COUNT(*)` from `INFORMATION_SCHEMA`.`TABLES` group by `information_schema`.`TABLES`.`TABLE_SCHEMA`,`information_schema`.`TABLES`.`TABLE_TYPE` union select `information_schema`.`STATISTICS`.`TABLE_SCHEMA` AS `TABLE_SCHEMA`,concat(\'INDEX (\',`information_schema`.`STATISTICS`.`INDEX_TYPE`,\')\') AS `CONCAT(\'INDEX (\', INDEX_TYPE, \')\')`,count(0) AS `COUNT(*)` from `INFORMATION_SCHEMA`.`STATISTICS` group by `information_schema`.`STATISTICS`.`TABLE_SCHEMA`,`information_schema`.`STATISTICS`.`INDEX_TYPE` union select `information_schema`.`TRIGGERS`.`TRIGGER_SCHEMA` AS `TRIGGER_SCHEMA`,\'TRIGGER\' AS `TRIGGER`,count(0) AS `COUNT(*)` from `INFORMATION_SCHEMA`.`TRIGGERS` group by `information_schema`.`TRIGGERS`.`TRIGGER_SCHEMA` union select `information_schema`.`EVENTS`.`EVENT_SCHEMA` AS `EVENT_SCHEMA`,\'EVENT\' AS `EVENT`,count(0) AS `COUNT(*)` from `INFORMATION_SCHEMA`.`EVENTS` group by `information_schema`.`EVENTS`.`EVENT_SCHEMA` order by `DB`,`OBJECT_TYPE`