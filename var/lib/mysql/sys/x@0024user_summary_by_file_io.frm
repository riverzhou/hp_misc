TYPE=VIEW
query=select `x$user_summary_by_file_io_type`.`user` AS `user`,sum(`x$user_summary_by_file_io_type`.`total`) AS `ios`,sum(`x$user_summary_by_file_io_type`.`latency`) AS `io_latency` from `sys`.`x$user_summary_by_file_io_type` group by `x$user_summary_by_file_io_type`.`user` order by sum(`x$user_summary_by_file_io_type`.`latency`) desc
md5=da25b30f9a2a3134933ea450556969fd
updatable=0
algorithm=1
definer_user=root
definer_host=localhost
suid=0
with_check_option=0
timestamp=2014-06-22 00:20:00
create-version=1
source=SELECT user, \n       SUM(total) AS ios,\n       SUM(latency) AS io_latency \n  FROM x$user_summary_by_file_io_type\n GROUP BY user\n ORDER BY SUM(latency) DESC
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `x$user_summary_by_file_io_type`.`user` AS `user`,sum(`x$user_summary_by_file_io_type`.`total`) AS `ios`,sum(`x$user_summary_by_file_io_type`.`latency`) AS `io_latency` from `sys`.`x$user_summary_by_file_io_type` group by `x$user_summary_by_file_io_type`.`user` order by sum(`x$user_summary_by_file_io_type`.`latency`) desc
