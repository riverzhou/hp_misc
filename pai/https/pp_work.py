#!/usr/bin/python3

from time               import sleep

from pp_config          import pp_config

from pp_sslworker       import *

machine = proto_machine()

key_val = {}
key_val['bidno']        = pp_config['user_name']
key_val['passwd']       = pp_config['user_pass']
key_val['group']        = 1
key_val['mcode']        = machine.mcode
key_val['login_image']  = machine.image

if __name__ == '__main__':
        proc_ssl_login.send(key_val, None)
        sleep(5)
 
                
