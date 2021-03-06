#!/usr/bin/env python3

from struct     import pack, unpack, pack_into, unpack_from

def sub_time(time2, time1):
        h1 , m1, s1 = time1.split(':')
        h2 , m2, s2 = time2.split(':')
        h1 , m1, s1 = int(h1), int(m1), int(s1)
        h2 , m2, s2 = int(h2), int(m2), int(s2)
        return ((h2-h1)*3600 + (m2-m1)*60 + (s2-s1))

def add_time(time):
        h , m, s = time.split(':')
        h , m, s = int(h), int(m), int(s)
        s += 1
        if s == 60 :
                s = 0
                m += 1
                if m == 60 :
                        m = 0
                        h += 1
                        if h == 24 : 
                                h = 0
        return  ('%.2d:%.2d:%.2d' % (h,m,s))

def decode_ack(buff):
        len0 = len(buff)
        len1 = len0 // 4
        len2 = len0 % 4
        if len2 != 0: len1 += 1
        buff += b'\0\0\0\0'
        data = bytearray(len0 + 4)
        view = memoryview(data)
        buff = memoryview(buff)
        for i in range(len1) :
                offset = i*4
                pack_into('i', view, offset, ~unpack_from('i', buff, offset)[0])
        data = bytes(data[0:len0])
        return data

def parse_info_a(info):
        p1 = info.find('<INFO>') + len('<INFO>')
        p2 = info.find('</INFO>')
        info = info[p1:p2]
        #print(info)
        info = info.split('^')
        return 'A',info[9],info[11],info[10], info[12]

def parse_info_b(info):
        p1 = info.find('<INFO>') + len('<INFO>')
        p2 = info.find('</INFO>')
        info = info[p1:p2]
        #print(info)
        info = info.split('^')
        return 'B',info[9],info[10],info[11]

def parse_info_c(info):
        p1 = info.find('<INFO>') + len('<INFO>')
        p2 = info.find('</INFO>')
        info = info[p1:p2]
        #print(info)
        return 'C', info

def parse_info_unknow(info):
        #print(info)
        return 'F', info

def parse_info(info):
        if '<TYPE>INFO</TYPE><INFO>A' in info : return parse_info_a(info)
        if '<TYPE>INFO</TYPE><INFO>B' in info : return parse_info_b(info)
        if '<TYPE>INFO</TYPE><INFO>C' in info : return parse_info_c(info)
        return parse_info_unknow(info)

def write_result_a_full(res, time, number):
        string = '%s - %s\n' % (time, number)
        res['a_full'].write(string.encode())
        return True

def write_result_a_60(res, time, number):
        end_time = '10:31:00'
        if sub_time(time, end_time)   > 0 : return None
        string = '%s - %s\n' % (time, number)
        res['a_60'].write(string.encode())
        return True

def write_result_b_30(res, time, price):
        start_time = '11:29:30'
        if sub_time(time, start_time) < 0 : return None
        string = '%s - %s\n' % (time, price)
        res['b_30'].write(string.encode())
        return True

def write_result_b_60(res, time, price):
        start_time = '11:29:00'
        if sub_time(time, start_time) < 0 : return None
        string = '%s - %s\n' % (time, price)
        res['b_60'].write(string.encode())
        return True

def write_result_a(res, time, number):
        write_result_a_full(res, time, number)
        write_result_a_60(res, time, number)

def write_result_b(res, time, price):
        write_result_b_30(res, time, price)
        write_result_b_60(res, time, price)

def write_result_c(res, string):
        res['c'].write(string.encode())

def write_result_f(res, string):
        res['f'].write(string.encode())

def proc_result_a(res, result):
        last_time   = None
        last_number = None
        for parse in result:
                if parse[0] != 'A' :  continue
                time   = parse[1]
                number = parse[3]
                if last_time == None :
                        last_time   = time
                        last_number = number
                        write_result_a(res, time, number)
                        continue
                delta_time = sub_time(time, last_time)
                if delta_time <= 0 :
                        continue
                if delta_time >  1 :
                        lost_time = last_time
                        for i in range(delta_time - 1) :
                                lost_time = add_time(lost_time)
                                write_result_a(res, lost_time, last_number)
                last_time   = time
                last_number = number
                write_result_a(res, time, number)
        return True

def proc_result_b(res, result):
        last_time   = None
        last_price  = None
        for parse in result:
                if parse[0] != 'B' : continue
                time   = parse[1]
                price  = parse[2]
                if last_time == None :
                        last_time   = time
                        last_price  = price 
                        write_result_b(res, time, price)
                        continue
                delta_time = sub_time(time, last_time)
                if delta_time <= 0 :
                        continue
                if delta_time >  1 :
                        lost_time = last_time
                        for i in range(delta_time - 1) :
                                lost_time = add_time(lost_time)
                                write_result_b(res, lost_time, last_price)
                last_time   = time
                last_price  = price 
                write_result_b(res, time, price)
        return True

def proc_result_c(res, result):
        for parse in result:
                if parse[0] != 'C' : continue
                write_result_c(res, parse[1])
        return True

def proc_result_f(res, result):
        for parse in result:
                if parse[0] != 'F' : continue
                write_result_f(res, parse[1])
        return True

def parse_ack():
        req             = open('udp.req', 'rb')
        ack             = open('udp.ack', 'rb')

        while True:
                head = req.read(4)
                if not head : break
                head = unpack('i', head)[0]
                print(head)
                body  = req.read(head)
                info  = decode_ack(body).decode('gb18030').strip()
                print(info)
'''
        while True:
                head = ack.read(4)
                if not head : break
                head = unpack('i', head)[0]
                print(head)
                body  = ack.read(head)
                info  = decode_ack(body).decode('gb18030').strip()
                print(info)
'''


if __name__ == '__main__' :
        parse_ack()


