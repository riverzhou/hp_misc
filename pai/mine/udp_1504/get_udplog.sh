#!/bin/sh

scp -P 9999 -i /root/.ssh/id_rsa_101.227.248.51  root@101.227.248.51:/river/udp_log.1.tgz . 
scp -P 9999 -i /root/.ssh/id_rsa_180.153.47.191  root@180.153.47.191:/river/udp_log.2.tgz . 
scp -P 9999 -i /root/.ssh/id_rsa_180.153.42.129  root@180.153.42.129:/river/udp_log.3.tgz . 
scp -P 9999 -i /root/.ssh/id_rsa_101.227.246.215 root@101.227.246.215:/river/udp_log.4.tgz . 
scp -P 9999 -i /root/.ssh/id_rsa_121.40.168.145  root@121.40.168.145:/river/udp_log.5.tgz . 
scp -P 9999 -i /root/.ssh/id_rsa_120.26.43.197   root@120.26.43.197:/river/udp_log.6.tgz . 
scp -P 9999 -i /root/.ssh/id_rsa_121.42.51.7     root@121.42.51.7:/river/udp_log.7.tgz . 

