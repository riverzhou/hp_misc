TYPE=VIEW
query=select if(isnull(`information_schema`.`processlist`.`ID`),concat(substring_index(`performance_schema`.`threads`.`NAME`,\'/\',-(1)),\':\',`performance_schema`.`events_waits_history_long`.`THREAD_ID`),concat(`information_schema`.`processlist`.`USER`,\'@\',`information_schema`.`processlist`.`HOST`,\':\',`information_schema`.`processlist`.`ID`)) AS `thread`,`performance_schema`.`events_waits_history_long`.`OBJECT_NAME` AS `file`,`performance_schema`.`events_waits_history_long`.`TIMER_WAIT` AS `latency`,`performance_schema`.`events_waits_history_long`.`OPERATION` AS `operation`,`performance_schema`.`events_waits_history_long`.`NUMBER_OF_BYTES` AS `requested` from ((`performance_schema`.`events_waits_history_long` join `performance_schema`.`threads` on((`performance_schema`.`events_waits_history_long`.`THREAD_ID` = `performance_schema`.`threads`.`THREAD_ID`))) left join `information_schema`.`processlist` on((`performance_schema`.`threads`.`PROCESSLIST_ID` = `information_schema`.`processlist`.`ID`))) where ((`performance_schema`.`events_waits_history_long`.`OBJECT_NAME` is not null) and (`performance_schema`.`events_waits_history_long`.`EVENT_NAME` like \'wait/io/file/%\')) order by `performance_schema`.`events_waits_history_long`.`TIMER_START`
md5=383e8b23227c5c066a4eb4b739d1d979
updatable=0
algorithm=2
definer_user=root
definer_host=localhost
suid=0
with_check_option=0
timestamp=2014-06-22 00:20:00
create-version=1
source=SELECT IF(id IS NULL, \n             CONCAT(SUBSTRING_INDEX(name, \'/\', -1), \':\', thread_id), \n             CONCAT(user, \'@\', host, \':\', id)\n          ) thread, \n       object_name file, \n       timer_wait AS latency, \n       operation, \n       number_of_bytes AS requested\n  FROM performance_schema.events_waits_history_long \n  JOIN performance_schema.threads USING (thread_id)\n  LEFT JOIN information_schema.processlist ON processlist_id = id\n WHERE object_name IS NOT NULL\n   AND event_name LIKE \'wait/io/file/%\'\n ORDER BY timer_start
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select if(isnull(`information_schema`.`processlist`.`ID`),concat(substring_index(`performance_schema`.`threads`.`NAME`,\'/\',-(1)),\':\',`performance_schema`.`events_waits_history_long`.`THREAD_ID`),concat(`information_schema`.`processlist`.`USER`,\'@\',`information_schema`.`processlist`.`HOST`,\':\',`information_schema`.`processlist`.`ID`)) AS `thread`,`performance_schema`.`events_waits_history_long`.`OBJECT_NAME` AS `file`,`performance_schema`.`events_waits_history_long`.`TIMER_WAIT` AS `latency`,`performance_schema`.`events_waits_history_long`.`OPERATION` AS `operation`,`performance_schema`.`events_waits_history_long`.`NUMBER_OF_BYTES` AS `requested` from ((`performance_schema`.`events_waits_history_long` join `performance_schema`.`threads` on((`performance_schema`.`events_waits_history_long`.`THREAD_ID` = `performance_schema`.`threads`.`THREAD_ID`))) left join `information_schema`.`processlist` on((`performance_schema`.`threads`.`PROCESSLIST_ID` = `information_schema`.`processlist`.`ID`))) where ((`performance_schema`.`events_waits_history_long`.`OBJECT_NAME` is not null) and (`performance_schema`.`events_waits_history_long`.`EVENT_NAME` like \'wait/io/file/%\')) order by `performance_schema`.`events_waits_history_long`.`TIMER_START`
