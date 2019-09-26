#!/usr/bin/env python3

from time       import time, sleep, localtime, mktime, strptime, strftime
from datetime   import datetime

#image_filename  = 'time_image_content.txt'
image_filename  = 'time_image_content_1035.txt'
#image_filename  = 'time_image_content_1045.txt'
#image_filename  = 'time_image_content_1055.txt'

#bid_filename    = 'time_bid_count.txt'

bid_filename    = '45_bid_time_first_all.txt'
#bid_filename    = '45_bid_time_second_all.txt'

#bid_filename    = '45_bid_time_first.txt'
#bid_filename    = '45_bid_time_second.txt'

#================================================================================================

def time_sub(end, begin):
        e = datetime.timestamp(datetime.strptime('1970-01-01 '+end,   '%Y-%m-%d %H:%M:%S.%f'))
        b = datetime.timestamp(datetime.strptime('1970-01-01 '+begin, '%Y-%m-%d %H:%M:%S.%f'))
        #print(e,b)
        return "%.6f" % (e-b)


def image():
        image_f = open(image_filename, 'r')
        while True:
                line = image_f.readline()
                if not line or line.strip() == '':
                        break
                data = line.split()
                '''
                for i in range(12):
                        print(i, data[i])
                '''
                machine      = data[0].strip().split('_')[0]
                req_time     = data[3].strip()
                ack_time     = data[6].strip()
                server_group = data[11].strip().strip("'").split('.')[0]
                delay_time   = time_sub(ack_time, req_time)
                print('imagecode', machine, server_group, req_time, ack_time, delay_time)
        image_f.close()

def bid():
        bid_f   = open(bid_filename, 'r')
        while True:
                line = bid_f.readline()
                if not line or line.strip() == '':
                        break
                data = line.split()
                '''
                for i in range(12):
                        print(i, data[i])
                '''
                machine      = data[0].strip().split('_')[0]
                req_time     = data[3].strip()
                ack_time     = data[6].strip()
                server_group = data[11].strip().strip("'").split('.')[0]
                delay_time   = time_sub(ack_time, req_time)
                print('imagecode', machine, server_group, req_time, ack_time, delay_time)
        bid_f.close()

#image()
bid()

