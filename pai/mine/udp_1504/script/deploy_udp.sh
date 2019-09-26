#!/bin/sh

scp -P 9999 -i /root/.ssh/id_rsa_101.227.248.51  /river/udp_log.tgz root@101.227.248.51:/river/ 
scp -P 9999 -i /root/.ssh/id_rsa_180.153.47.191  /river/udp_log.tgz root@180.153.47.191:/river/ 
scp -P 9999 -i /root/.ssh/id_rsa_180.153.42.129  /river/udp_log.tgz root@180.153.42.129:/river/ 
scp -P 9999 -i /root/.ssh/id_rsa_101.227.246.215 /river/udp_log.tgz root@101.227.246.215:/river/ 
scp -P 9999 -i /root/.ssh/id_rsa_121.40.168.145  /river/udp_log.tgz root@121.40.168.145:/river/ 
scp -P 9999 -i /root/.ssh/id_rsa_120.26.43.197   /river/udp_log.tgz root@120.26.43.197:/river/ 
scp -P 9999 -i /root/.ssh/id_rsa_121.42.51.7     /river/udp_log.tgz root@121.42.51.7:/river/ 

