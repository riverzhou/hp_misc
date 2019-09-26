TYPE=VIEW
query=select `s2`.`avg_us` AS `avg_us`,(sum(`s1`.`cnt`) / (select count(0) from `performance_schema`.`events_statements_summary_by_digest`)) AS `percentile` from (`sys`.`x$ps_digest_avg_latency_distribution` `s1` join `sys`.`x$ps_digest_avg_latency_distribution` `s2` on((`s1`.`avg_us` <= `s2`.`avg_us`))) group by `s2`.`avg_us` having (`percentile` > 0.95) order by `percentile` limit 1
md5=84b5594ef4c78690b95e66f825799d33
updatable=0
algorithm=1
definer_user=root
definer_host=localhost
suid=0
with_check_option=0
timestamp=2014-06-22 00:20:00
create-version=1
source=SELECT s2.avg_us avg_us,\n       SUM(s1.cnt)/(SELECT COUNT(*) FROM performance_schema.events_statements_summary_by_digest) percentile\n  FROM sys.x$ps_digest_avg_latency_distribution AS s1\n  JOIN sys.x$ps_digest_avg_latency_distribution AS s2\n    ON s1.avg_us <= s2.avg_us\n GROUP BY s2.avg_us\nHAVING percentile > 0.95\n ORDER BY percentile\n LIMIT 1
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `s2`.`avg_us` AS `avg_us`,(sum(`s1`.`cnt`) / (select count(0) from `performance_schema`.`events_statements_summary_by_digest`)) AS `percentile` from (`sys`.`x$ps_digest_avg_latency_distribution` `s1` join `sys`.`x$ps_digest_avg_latency_distribution` `s2` on((`s1`.`avg_us` <= `s2`.`avg_us`))) group by `s2`.`avg_us` having (`percentile` > 0.95) order by `percentile` limit 1
