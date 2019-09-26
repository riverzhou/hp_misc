#!/bin/sh

scp -P 9999 -i /root/.ssh/id_rsa_101.227.248.51  root@101.227.248.51:/river/udp_log.1.tgz .
scp -P 9999 -i /root/.ssh/id_rsa_180.153.47.191  root@180.153.47.191:/river/udp_log.2.tgz .
scp -P 9999 -i /root/.ssh/id_rsa_180.153.42.129  root@180.153.42.129:/river/udp_log.3.tgz .
scp -P 9999 -i /root/.ssh/id_rsa_121.41.119.220  root@121.41.119.220:/river/udp_log.5.tgz .

