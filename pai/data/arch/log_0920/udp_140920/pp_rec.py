#!/usr/bin/env python3

from udp_proto  import proto_udp
from pp_log     import printer

price_limit   = 72600
number_limit  = 8300
number_people = 122219
date          = '2014年9月20日'

proto = proto_udp()

def make_a(k_v):
        global price_limit, number_limit
        key_val = {}
        key_val['systime']  = k_v['systime']
        key_val['lowtime']  = k_v['ltime']
        key_val['number']   = k_v['number']
        key_val['price']    = price_limit
        key_val['date']     = date
        key_val['number_limit'] = number_limit
        key_val['price_limit']  = price_limit
        return proto.udp_make_a_info(key_val)

def make_b(k_v):
        global number_people, number_limit
        key_val = {}
        key_val['systime']  = k_v['systime']
        key_val['lowtime']  = k_v['ltime']
        key_val['number']   = number_people
        key_val['price']    = k_v['price']
        key_val['date']     = date
        key_val['number_limit'] = number_limit
        return proto.udp_make_b_info(key_val)

def main():
        f = open('140920.txt')
        while True:
                line = f.readline()
                if not line:
                        break
                log = line.strip().lstrip('{').rstrip('}')
                #print(log)
                info = log.split(',')
                k_v = {}
                for data in info:
                        element = data.split(': ')
                        if len(element) <= 1:
                                break
                        key = element[0].strip().strip('\'')
                        val = element[1].strip().strip('\'')
                        k_v[key] = val
                if k_v['code'] == 'A':
                        output = make_a(k_v)
                if k_v['code'] == 'B':
                        output = make_b(k_v)
                print(output)
                printer.warning(output)
                #break
        f.close()
        printer.wait_for_flush()

#===============================================

main()


