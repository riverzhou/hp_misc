#!/usr/bin/env python3

#==========================================================

from threading          import Thread, Event, Lock, Semaphore
from queue              import Queue, LifoQueue, Empty
from traceback          import print_exc
from time               import sleep
from http.client        import HTTPSConnection, HTTPConnection


#==========================================================

def shake(ip):
        try:  
                handler = HTTPSConnection(ip)
                handler._http_vsn = 10
                handler._http_vsn_str = 'HTTP/1.0'
        except:
                print_exc()

shake('tblogin.alltobid.com')
sleep(3)
