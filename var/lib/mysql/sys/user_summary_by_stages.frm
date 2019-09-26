TYPE=VIEW
query=select `performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER` AS `user`,`performance_schema`.`events_stages_summary_by_user_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_stages_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,`sys`.`format_time`(`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `wait_sum`,`sys`.`format_time`(`performance_schema`.`events_stages_summary_by_user_by_event_name`.`AVG_TIMER_WAIT`) AS `wait_avg` from `performance_schema`.`events_stages_summary_by_user_by_event_name` where ((`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER` is not null) and (`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` <> 0)) order by `performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`,`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc
md5=c1c369f98e8034bea3eafdccf37c817b
updatable=1
algorithm=2
definer_user=root
definer_host=localhost
suid=0
with_check_option=0
timestamp=2014-06-22 00:20:00
create-version=1
source=SELECT user,\n       event_name,\n       count_star AS total,\n       sys.format_time(sum_timer_wait) AS wait_sum, \n       sys.format_time(avg_timer_wait) AS wait_avg \n  FROM performance_schema.events_stages_summary_by_user_by_event_name\n WHERE user IS NOT NULL \n   AND sum_timer_wait != 0 \n ORDER BY user, sum_timer_wait DESC
client_cs_name=utf8
connection_cl_name=utf8_general_ci
view_body_utf8=select `performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER` AS `user`,`performance_schema`.`events_stages_summary_by_user_by_event_name`.`EVENT_NAME` AS `event_name`,`performance_schema`.`events_stages_summary_by_user_by_event_name`.`COUNT_STAR` AS `total`,`sys`.`format_time`(`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT`) AS `wait_sum`,`sys`.`format_time`(`performance_schema`.`events_stages_summary_by_user_by_event_name`.`AVG_TIMER_WAIT`) AS `wait_avg` from `performance_schema`.`events_stages_summary_by_user_by_event_name` where ((`performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER` is not null) and (`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` <> 0)) order by `performance_schema`.`events_stages_summary_by_user_by_event_name`.`USER`,`performance_schema`.`events_stages_summary_by_user_by_event_name`.`SUM_TIMER_WAIT` desc
