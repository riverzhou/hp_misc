#!/usr/bin/env python3

from mysql.connector    import connect
from redis              import StrictRedis
from traceback          import print_exc

from pp_config          import pp_config

#=============================================================

class mysql_db():
        global  pp_config
        ip      = pp_config['mysql_ip']
        port    = pp_config['mysql_port']
        user    = pp_config['mysql_user']
        passwd  = pp_config['mysql_pass']
        db      = pp_config['mysql_db']

        def connect_mysql(self):
                try:
                        return connect(host = self.ip, port = self.port, user = self.user, password = self.passwd, database = self.db)
                except:
                        print_exc()
                        return None

        def __init__(self):
                self.mysql    = self.connect_mysql()
                if self.mysql == None : return None
                self.cursor = self.mysql.cursor()
                print('mysql connect succeed')

        def insert(self, table, data, commit=True):
                sql = ('INSERT INTO %s ' % table) + ('(datetime, info) VALUES (%s, %s)')
                #print(sql)
                self.cursor.execute(sql, data)
                if commit == True : self.mysql.commit()
                print(table,'instert ok.')

        def insert_list(self, table, list_data, commit=True):
                sql = ('INSERT INTO %s ' % table) + ('(datetime, info) VALUES (%s, %s)')
                #print(sql)
                self.cursor.executemany(sql, list_data)
                if commit == True : self.mysql.commit()
                print(table,'instert ok.')

        def read(self, table):
                sql = ('SELECT * FROM  %s ' % table)
                self.cursor.execute(sql)
                print(table,'read ok.')
                return self.cursor.fetchall()

        def clean_table(self, table):
                self.mysql.commit()
                #sql = 'DELETE FROM %s' % table
                sql = 'TRUNCATE TABLE %s' % table
                #print(sql)
                self.cursor.execute(sql)
                self.mysql.commit()
                print(table,'clean ok.')

        def close(self):
                self.cursor.close()
                self.mysql.close()

        def flush(self):
                self.mysql.commit()
                self.close()


class my_db(mysql_db):
        def __init__(self, db):
                self.db = db
                mysql_db.__init__(self)


#=========================================================

stable1 = 'udp_11'
stable2 = 'udp_15'
source_db = 'pp_14_06_29'
dtable  = 'format_origin_2014_06_29'

def covert(source):
        return (str(source[1]), source[2])


def main():
        global  pp_config
        mdb = mysql_db()
        sdb = my_db(source_db)

        s_list= sdb.read(stable1)
        d_list= list(map(covert, s_list))
        mdb.insert_list(dtable, d_list)
        print('date 1 saved into mysql.')

        s_list= sdb.read(stable2)
        d_list= list(map(covert, s_list))
        mdb.insert_list(dtable, d_list)
        print('date 2 saved into mysql.')

        mdb.flush()

if __name__ == '__main__' :
        try:
                main()
        except  KeyboardInterrupt:
                pass
        except:
                print_exc()
        finally:
                print()

