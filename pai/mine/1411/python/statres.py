#!/usr/bin/env python3

from time       import time, sleep, localtime, mktime, strptime, strftime
from datetime   import datetime

from operator   import itemgetter

#image_filename  = 'time_image_content.txt'
#image_filename  = 'time_image_content_1035.txt'
#image_filename  = 'time_image_content_1045.txt'
#image_filename  = 'time_image_content_1055.txt'

#bid_filename    = 'time_bid_count.txt'

#bid_filename    = '45_bid_time_first_all.txt'
#bid_filename    = '45_bid_time_second_all.txt'

#bid_filename    = '45_bid_time_first.txt'
#bid_filename    = '45_bid_time_second.txt'

result_1 = '1_result.txt'
result_2 = '2_result.txt'

#================================================================================================

dict_worker     = {}

dict_result     = {}

dict_policy     = {'A':{}, 'B':{}, 'C':{}, 'D':{}, 'E':{}}

dict_machine    = {
        1:'A',
        2:'B',
        3:'C',
        4:'D',
        5:'E',
        6:'A',
        7:'B',
        8:'C',
        9:'D',
        10:'E',
        11:'A',
        }


#===============================================================================================

def time_sub(end, begin):
        e = datetime.timestamp(datetime.strptime('1970-01-01 '+end,   '%Y-%m-%d %H:%M:%S.%f'))
        b = datetime.timestamp(datetime.strptime('1970-01-01 '+begin, '%Y-%m-%d %H:%M:%S.%f'))
        #print(e,b)
        return "%.6f" % (e-b)

def result_get(filename):
        global dict_result
        res_f   = open(filename, 'r')
        node    = filename.split('_')[0]
        while True:
                line = res_f.readline()
                if not line or line.strip() == '':
                        break
                data        = line.split(':')
                machine     = data[0].strip().split('.')[0].strip().split('_')[0]
                p           = dict_machine[int(machine)]
                data        = line.split(' : ')
                price       = data[1].strip().split('.')[0].strip()
                data        = line.split('client ')
                bidno       = data[1].strip().split()[0].strip()
                worker      = node + '_' + machine

                if price not in dict_result:
                        dict_result[price] = []
                dict_result[price].append((node, machine, bidno, p))

                if price not in dict_policy[p]:
                        dict_policy[p][price] = []
                dict_policy[p][price].append((node, machine, bidno, p))
                
                if worker not in dict_worker:
                        dict_worker[worker] = {}
                if price not in dict_worker[worker]:
                        dict_worker[worker][price] = []
                dict_worker[worker][price].append((node, machine, bidno, p))

                #print(node, machine, price, bidno, dict_machine[m])
        res_f.close()

def result_print(result):
        dict_stat = {}
        for price in result:
                dict_stat[price] = len(result[price])
        list_stat = sorted(dict_stat.items(), key=itemgetter(1), reverse=True)
        count = 0
        for s in list_stat:
                print(s[1], '\t', s[0])
                count += int(s[1])
        print('total : %d record' % count)
        print()

def policy_print(result):
        for p in sorted(result.keys()):
                print('Policy : %s' % p)
                result_print(result[p])

def worker_print(result):
        for w in sorted(result.keys()):
                print('Worker: %s' % w)
                result_print(result[w])

def reset():
        global dict_result, dict_policy, dict_worker
        dict_worker     = {}
        dict_result     = {}
        dict_policy     = {'A':{}, 'B':{}, 'C':{}, 'D':{}, 'E':{}}

def main():
        print('all:')
        print('--------------------------------------------')
        reset()
        result_get(result_1)
        result_get(result_2)
        result_print(dict_result)
        policy_print(dict_policy)
        worker_print(dict_worker)

        return

        print('node 1:')
        print('--------------------------------------------')
        reset()
        result_get(result_1)
        result_print(dict_result)
        policy_print(dict_policy)
        worker_print(dict_worker)

        print('node 2:')
        print('--------------------------------------------')
        reset()
        result_get(result_2)
        result_print(dict_result)
        policy_print(dict_policy)
        worker_print(dict_worker)

#===============================================================================================

main()


