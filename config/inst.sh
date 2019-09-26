#!/bin/sh

apt-get -y update
apt-get -y dist-upgrade

apt-get -y install ntp
apt-get -y install git
apt-get -y install colordiff
apt-get -y install openssl
apt-get -y install redis-server redis-tools 
apt-get -y install python3-pip python3-setuptools
#apt-get -y install python3-coverage

#apt-get -y install python3-tk python3-pil python-pil-doc python3-pil.imagetk python3-dev
#apt-get -y install python3-lxml

apt-get -y install make
apt-get -y install gcc
apt-get -y install g++
#apt-get -y install libssl-dev libssl-doc
#apt-get -y install libxml2 libxml2-dev libxml2-doc libxml2-utils

#apt-get -y install fonts-wqy-microhei fonts-wqy-zenhei
#apt-get -y install tcl8.6 tk8.6
#apt-get -y install mysql-client-5.6 mysql-server-5.6
#apt-get -y install nginx
#apt-get -y install uwsgi uwsgi-core uwsgi-plugin-python3 uwsgi-extra 

apt-get -y dist-upgrade

pip3 install hiredis

#easy_install3 redis hiredis 

#easy_install3 redis hiredis mysql-connector-python flask pygal

