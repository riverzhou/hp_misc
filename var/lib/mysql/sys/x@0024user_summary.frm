TYPE=VIEW
query=select `performance_schema`.`accounts`.`USER` AS `user`,sum(`stmt`.`total`) AS `statements`,sum(`stmt`.`total_latency`) AS `statement_latency`,(sum(`stmt`.`total_latency`) / sum(`stmt`.`total`)) AS `statement_avg_latency`,sum(`stmt`.`full_scans`) AS `table_scans`,sum(`io`.`ios`) AS `file_ios`,sum(`io`.`io_latency`) AS `file_io_latency`,sum(`performance_schema`.`accounts`.`CURRENT_CONNECTIONS`) AS `current_connections`,sum(`performance_schema`.`accounts`.`TOTAL_CONNECTIONS`) AS `total_connections`,count(distinct `performance_schema`.`accounts`.`HOST`) AS `unique_hosts` from ((`performance_schema`.`accounts` join `sys`.`x$user_summary_by_statement_latency` `stmt` on((`performance_schema`.`accounts`.`USER` = `stmt`.`user`))) join `sys`.`x$user_summary_by_file_io` `io` on((`performance_schema`.`accounts`.`USER` = `io`.`user`))) where (`performance_schema`.`accounts`.`USER` is not null) group by `performance_schema`.`accounts`.`USER`
md5=aef50b7b5ed88d375d6a5a41d48fa38a
updatable=0
algorithm=1
definer_user=root
definer_host=localhost
suid=0
with_check_option=0
timestamp=2014-06-22 00:20:00
create-version=1
source=SELECT accounts.user,\n       SUM(stmt.total) AS statements,\n       SUM(stmt.total_latency) AS statement_latency,\n       SUM(stmt.total_latency) / SUM(stmt.total) AS statement_avg_latency,\n       SUM(stmt.full_scans) AS table_scans,\n       SUM(io.ios) AS file_ios,\n       SUM(io.io_latency) AS file_io_latency,\n       SUM(accounts.current_connections) AS current_connections,\n       SUM(accounts.total_connections) AS total_connections,\n       COUNT(DISTINCT host) AS unique_hosts\n  FROM performance_schema.accounts\n  JOIN sys.x$user_summary_by_statement_latency AS stmt ON accounts.user = stmt.user\n  JOIN sys.x$user_summary_by_file_io AS io ON accounts.user = io.user\n WHERE accounts.user IS NOT NULL\n GROUP BY accounts.user
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `performance_schema`.`accounts`.`USER` AS `user`,sum(`stmt`.`total`) AS `statements`,sum(`stmt`.`total_latency`) AS `statement_latency`,(sum(`stmt`.`total_latency`) / sum(`stmt`.`total`)) AS `statement_avg_latency`,sum(`stmt`.`full_scans`) AS `table_scans`,sum(`io`.`ios`) AS `file_ios`,sum(`io`.`io_latency`) AS `file_io_latency`,sum(`performance_schema`.`accounts`.`CURRENT_CONNECTIONS`) AS `current_connections`,sum(`performance_schema`.`accounts`.`TOTAL_CONNECTIONS`) AS `total_connections`,count(distinct `performance_schema`.`accounts`.`HOST`) AS `unique_hosts` from ((`performance_schema`.`accounts` join `sys`.`x$user_summary_by_statement_latency` `stmt` on((`performance_schema`.`accounts`.`USER` = `stmt`.`user`))) join `sys`.`x$user_summary_by_file_io` `io` on((`performance_schema`.`accounts`.`USER` = `io`.`user`))) where (`performance_schema`.`accounts`.`USER` is not null) group by `performance_schema`.`accounts`.`USER`
