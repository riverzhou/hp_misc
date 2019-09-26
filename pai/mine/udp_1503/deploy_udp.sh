#!/bin/sh

#scp -P 9999 -i /root/.ssh/id_rsa_101.227.248.51  root@101.227.248.51:/river/fd/*.tgz . 
#scp -P 9999 -i /root/.ssh/id_rsa_180.153.47.191  root@180.153.47.191:/river/fd/*.tgz . 
#scp -P 9999 -i /root/.ssh/id_rsa_180.153.42.129  root@180.153.42.129:/river/fd/*.tgz . 
#scp -P 9999 -i /root/.ssh/id_rsa_121.41.119.220  root@121.41.119.220:/river/fd/*.tgz . 

scp -P 9999 -i /root/.ssh/id_rsa_101.227.248.51  fd_log.tgz	root@101.227.248.51:/river/fd/
scp -P 9999 -i /root/.ssh/id_rsa_180.153.47.191  fd_log.tgz	root@180.153.47.191:/river/fd/
scp -P 9999 -i /root/.ssh/id_rsa_180.153.42.129  fd_log.tgz	root@180.153.42.129:/river/fd/
scp -P 9999 -i /root/.ssh/id_rsa_121.41.119.220  fd_log.tgz	root@121.41.119.220:/river/fd/

