TYPE=VIEW
query=select substring_index(`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME`,\'/\',-(2)) AS `event_name`,`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`file_summary_by_event_name`.`MIN_TIMER_WAIT` AS `min_latency`,`performance_schema`.`file_summary_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency`,`performance_schema`.`file_summary_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency`,`performance_schema`.`file_summary_by_event_name`.`COUNT_READ` AS `count_read`,`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` AS `total_read`,ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` / `performance_schema`.`file_summary_by_event_name`.`COUNT_READ`),0) AS `avg_read`,`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE` AS `count_write`,`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` AS `total_written`,ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` / `performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE`),0) AS `avg_written`,(`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` + `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`) AS `total_requested` from `performance_schema`.`file_summary_by_event_name` where ((`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME` like \'wait/io/file/%\') and (`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` > 0)) order by (`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` + `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`) desc
md5=3170ffe4f88ec1c734150b05acabc10c
updatable=1
algorithm=2
definer_user=root
definer_host=localhost
suid=0
with_check_option=0
timestamp=2014-06-22 00:20:00
create-version=1
source=SELECT SUBSTRING_INDEX(event_name, \'/\', -2) AS event_name,\n       count_star AS total,\n       sum_timer_wait AS total_latency,\n       min_timer_wait AS min_latency,\n       avg_timer_wait AS avg_latency,\n       max_timer_wait AS max_latency,\n       count_read,\n       sum_number_of_bytes_read AS total_read,\n       IFNULL(sum_number_of_bytes_read / count_read, 0) AS avg_read,\n       count_write,\n       sum_number_of_bytes_write AS total_written,\n       IFNULL(sum_number_of_bytes_write / count_write, 0) AS avg_written,\n       sum_number_of_bytes_write + sum_number_of_bytes_read AS total_requested\n  FROM performance_schema.file_summary_by_event_name\n WHERE event_name LIKE \'wait/io/file/%\' \n   AND count_star > 0\n ORDER BY sum_number_of_bytes_write + sum_number_of_bytes_read DESC
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select substring_index(`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME`,\'/\',-(2)) AS `event_name`,`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` AS `total`,`performance_schema`.`file_summary_by_event_name`.`SUM_TIMER_WAIT` AS `total_latency`,`performance_schema`.`file_summary_by_event_name`.`MIN_TIMER_WAIT` AS `min_latency`,`performance_schema`.`file_summary_by_event_name`.`AVG_TIMER_WAIT` AS `avg_latency`,`performance_schema`.`file_summary_by_event_name`.`MAX_TIMER_WAIT` AS `max_latency`,`performance_schema`.`file_summary_by_event_name`.`COUNT_READ` AS `count_read`,`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` AS `total_read`,ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ` / `performance_schema`.`file_summary_by_event_name`.`COUNT_READ`),0) AS `avg_read`,`performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE` AS `count_write`,`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` AS `total_written`,ifnull((`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` / `performance_schema`.`file_summary_by_event_name`.`COUNT_WRITE`),0) AS `avg_written`,(`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` + `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`) AS `total_requested` from `performance_schema`.`file_summary_by_event_name` where ((`performance_schema`.`file_summary_by_event_name`.`EVENT_NAME` like \'wait/io/file/%\') and (`performance_schema`.`file_summary_by_event_name`.`COUNT_STAR` > 0)) order by (`performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_WRITE` + `performance_schema`.`file_summary_by_event_name`.`SUM_NUMBER_OF_BYTES_READ`) desc