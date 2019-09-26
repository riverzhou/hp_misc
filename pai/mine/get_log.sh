#!/bin/sh

scp -P 9999 -i /root/.ssh/id_rsa_101.227.240.158 root@101.227.240.158:/river/log_*.tgz . 
scp -P 9999 -i /root/.ssh/id_rsa_180.153.42.15   root@180.153.42.15:/river/log_*.tgz . 
scp -P 9999 -i /root/.ssh/id_rsa_180.153.46.209  root@180.153.46.209:/river/log_*.tgz . 
scp -P 9999 -i /root/.ssh/id_rsa_101.227.247.193 root@101.227.247.193:/river/log_*.tgz . 
scp -P 9999 -i /root/.ssh/id_rsa_121.43.227.53   root@121.43.227.53:/river/log_*.tgz . 
scp -P 9999 -i /root/.ssh/id_rsa_120.26.42.252   root@120.26.42.252:/river/log_*.tgz . 
scp -P 9999 -i /root/.ssh/id_rsa_114.215.150.238 root@114.215.150.238:/river/log_*.tgz . 
