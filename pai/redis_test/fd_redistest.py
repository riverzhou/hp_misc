#!/usr/bin/env python3

from threading              import Event, Lock
from time                   import sleep, time
from datetime               import datetime
from traceback              import print_exc, format_exc

from pp_log                 import printer
from pp_baseclass           import pp_thread
from pp_baseredis           import pp_redis, pp_redis_init, pp_redis_connect_print

from fd_decode              import decode_worker, fd_decode_init
from fd_log                 import logger

#===========================================================

def time_sub(end, begin):
        e = datetime.timestamp(datetime.strptime(end,   '%Y-%m-%d %H:%M:%S.%f'))
        b = datetime.timestamp(datetime.strptime(begin, '%Y-%m-%d %H:%M:%S.%f'))
        return e-b

def getsleeptime(interval):
        return  interval - time()%interval

class fd_decode(pp_thread):

        def __init__(self, client, count, sid, picture):
                super().__init__()
                self.client             = client
                self.count              = count
                self.sid                = sid
                self.picture            = picture
                self.event_finish       = Event()
                self.flag_timeout       = False
                self.lock_timeout       = Lock()
                self.type_decode        = 'A'
                self.timeout_decode     = 10

        def main(self):
                try:
                        self.do_decode()
                except  KeyboardInterrupt:
                        pass
                except:
                        printer.critical(format_exc())

        def do_decode(self):
                global decode_worker
                decode_worker.put_request(self.sid, self.type_decode, self.timeout_decode, self.picture)
                printer.info('%s,%s,%s,%s' % (self.sid, self.type_decode, self.timeout_decode, self.picture))
                number = decode_worker.get_result(self.sid)
                printer.info('%s,%s' % (self.sid, number))
                #self.lock_timeout.acquire()
                #if self.flag_timeout == False:
                #        self.client.number_bid[self.count] = number
                #self.lock_timeout.release()
                self.event_finish.set()
                return

        def wait_for_finish(self, timeout = None):
                waittime = timeout if timeout != None else self.timeout_decode
                if self.event_finish.wait(waittime+2) == True:                  # XXX 多等待2秒
                        return True
                else:
                        self.lock_timeout.acquire()
                        self.flag_timeout = True
                        self.lock_timeout.release()
                        printer.error('client %s bid %d fd_decode Timeout' % (self.client.bidno, self.count))
                        sleep(0)
                        return False


def main():
        for i in range(300):
                sleep(0.5)
                sleep(getsleeptime(1))
                picture = datetime.strftime(datetime.now(), '%Y-%m-%d %H:%M:%S.%f')
                sid = '%.32d' % i
                thread_decode = fd_decode(None, None, sid, picture)
                thread_decode.start()


if __name__ == "__main__":
        pp_redis_init()
        fd_decode_init()
        try:
                main()
        except  KeyboardInterrupt:
                print()
        except:
                print_exc()
        sleep(5)
        printer.wait_for_flush()
        logger.wait_for_flush()


