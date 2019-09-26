#!/bin/sh

scp -P 9999 -i /root/.ssh/id_rsa_101.227.240.158 root@101.227.240.158:/river/log_*.tgz . 
scp -P 9999 -i /root/.ssh/id_rsa_180.153.42.15   root@180.153.42.15:/river/log_*.tgz . 
scp -P 9999 -i /root/.ssh/id_rsa_180.153.46.209  root@180.153.46.209:/river/log_*.tgz . 
#scp -P 9999 -i /root/.ssh/id_rsa_121.41.72.124   root@121.41.72.124:/river/log_*.tgz . 
