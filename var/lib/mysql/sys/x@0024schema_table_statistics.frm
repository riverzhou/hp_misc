TYPE=VIEW
query=select `pst`.`OBJECT_SCHEMA` AS `table_schema`,`pst`.`OBJECT_NAME` AS `table_name`,`pst`.`SUM_TIMER_WAIT` AS `total_latency`,`pst`.`COUNT_FETCH` AS `rows_fetched`,`pst`.`SUM_TIMER_FETCH` AS `fetch_latency`,`pst`.`COUNT_INSERT` AS `rows_inserted`,`pst`.`SUM_TIMER_INSERT` AS `insert_latency`,`pst`.`COUNT_UPDATE` AS `rows_updated`,`pst`.`SUM_TIMER_UPDATE` AS `update_latency`,`pst`.`COUNT_DELETE` AS `rows_deleted`,`pst`.`SUM_TIMER_DELETE` AS `delete_latency`,sum(`fsbi`.`COUNT_READ`) AS `io_read_requests`,sum(`fsbi`.`SUM_NUMBER_OF_BYTES_READ`) AS `io_read`,sum(`fsbi`.`SUM_TIMER_READ`) AS `io_read_latency`,sum(`fsbi`.`COUNT_WRITE`) AS `io_write_requests`,sum(`fsbi`.`SUM_NUMBER_OF_BYTES_WRITE`) AS `io_write`,sum(`fsbi`.`SUM_TIMER_WRITE`) AS `io_write_latency`,sum(`fsbi`.`COUNT_MISC`) AS `io_misc_requests`,sum(`fsbi`.`SUM_TIMER_MISC`) AS `io_misc_latency` from (`performance_schema`.`table_io_waits_summary_by_table` `pst` left join `performance_schema`.`file_summary_by_instance` `fsbi` on(((`pst`.`OBJECT_SCHEMA` = `extract_schema_from_file_name`(`fsbi`.`FILE_NAME`)) and (`pst`.`OBJECT_NAME` = `extract_table_from_file_name`(`fsbi`.`FILE_NAME`))))) group by `pst`.`OBJECT_SCHEMA`,`pst`.`OBJECT_NAME` order by `pst`.`SUM_TIMER_WAIT` desc
md5=6618c46d702df6d0f3de38af822c6aed
updatable=0
algorithm=1
definer_user=root
definer_host=localhost
suid=0
with_check_option=0
timestamp=2014-06-22 00:20:00
create-version=1
source=SELECT pst.object_schema AS table_schema,\n       pst.object_name AS table_name,\n       pst.sum_timer_wait AS total_latency,\n       pst.count_fetch AS rows_fetched,\n       pst.sum_timer_fetch AS fetch_latency,\n       pst.count_insert AS rows_inserted,\n       pst.sum_timer_insert AS insert_latency,\n       pst.count_update AS rows_updated,\n       pst.sum_timer_update AS update_latency,\n       pst.count_delete AS rows_deleted,\n       pst.sum_timer_delete AS delete_latency,\n       SUM(fsbi.count_read) AS io_read_requests,\n       SUM(fsbi.sum_number_of_bytes_read) AS io_read,\n       SUM(fsbi.sum_timer_read) AS io_read_latency,\n       SUM(fsbi.count_write) AS io_write_requests,\n       SUM(fsbi.sum_number_of_bytes_write) AS io_write,\n       SUM(fsbi.sum_timer_write) AS io_write_latency,\n       SUM(fsbi.count_misc) AS io_misc_requests,\n       SUM(fsbi.sum_timer_misc) AS io_misc_latency\n  FROM performance_schema.table_io_waits_summary_by_table AS pst\n  LEFT JOIN performance_schema.file_summary_by_instance AS fsbi\n    ON pst.object_schema = extract_schema_from_file_name(fsbi.file_name)\n   AND pst.object_name = extract_table_from_file_name(fsbi.file_name)\n GROUP BY pst.object_schema, pst.object_name\n ORDER BY pst.sum_timer_wait DESC
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `pst`.`OBJECT_SCHEMA` AS `table_schema`,`pst`.`OBJECT_NAME` AS `table_name`,`pst`.`SUM_TIMER_WAIT` AS `total_latency`,`pst`.`COUNT_FETCH` AS `rows_fetched`,`pst`.`SUM_TIMER_FETCH` AS `fetch_latency`,`pst`.`COUNT_INSERT` AS `rows_inserted`,`pst`.`SUM_TIMER_INSERT` AS `insert_latency`,`pst`.`COUNT_UPDATE` AS `rows_updated`,`pst`.`SUM_TIMER_UPDATE` AS `update_latency`,`pst`.`COUNT_DELETE` AS `rows_deleted`,`pst`.`SUM_TIMER_DELETE` AS `delete_latency`,sum(`fsbi`.`COUNT_READ`) AS `io_read_requests`,sum(`fsbi`.`SUM_NUMBER_OF_BYTES_READ`) AS `io_read`,sum(`fsbi`.`SUM_TIMER_READ`) AS `io_read_latency`,sum(`fsbi`.`COUNT_WRITE`) AS `io_write_requests`,sum(`fsbi`.`SUM_NUMBER_OF_BYTES_WRITE`) AS `io_write`,sum(`fsbi`.`SUM_TIMER_WRITE`) AS `io_write_latency`,sum(`fsbi`.`COUNT_MISC`) AS `io_misc_requests`,sum(`fsbi`.`SUM_TIMER_MISC`) AS `io_misc_latency` from (`performance_schema`.`table_io_waits_summary_by_table` `pst` left join `performance_schema`.`file_summary_by_instance` `fsbi` on(((`pst`.`OBJECT_SCHEMA` = `extract_schema_from_file_name`(`fsbi`.`FILE_NAME`)) and (`pst`.`OBJECT_NAME` = `extract_table_from_file_name`(`fsbi`.`FILE_NAME`))))) group by `pst`.`OBJECT_SCHEMA`,`pst`.`OBJECT_NAME` order by `pst`.`SUM_TIMER_WAIT` desc
