#!/usr/bin/env python3

price_limit   = 72600
number_limit  = 7400
number_people = 135000

#================================================================================

class proto_udp():
        def decode(self, data):
                buff = b''
                len0 = len(data)
                len1 = len0 // 4
                len2 = len0 % 4
                if len2 != 0:
                        len1 += 1
                for i in range(4 - len2):
                        data += b'0'
                for i in range(len1) :
                        buff += pack('i', ~unpack('i', data[i*4:i*4+4])[0])
                buff = buff[0:len0]
                return buff

        def encode(self, data):
                buff = b''
                len0 = len(data)
                len1 = len0 // 4
                len2 = len0 % 4
                if len2 != 0:
                        len1 += 1
                for i in range(4 - len2):
                        data += b'0'
                for i in range(len1) :
                        buff += pack('i', ~unpack('i', data[i*4:i*4+4])[0])
                buff = buff[0:len0]
                return buff

        def udp_make_format_ack(self, key_val):
                return ( (
                        '<xml><TYPE>FORMAT</TYPE><INFO>\r\n' +
                        '拍卖会：%1%\r\n' +
                        '投放额度数：%2%\r\n' +
                        '本场拍卖会警示价：%3%\r\n' +
                        '拍卖会起止时间：%4%至%5%\r\n' +
                        '首次出价时段：%6%至%7%\r\n' +
                        '修改出价时段：%8%至%9%\r\n' +
                        '\r\n' +
                        '          目前为首次出价时段\r\n' +
                        '系统目前时间：%10%\r\n' +
                        '目前已投标人数：%11%\r\n' +
                        '目前最低可成交价：%12%\r\n' +
                        '最低可成交价出价时间：%13%\r\n' +
                        '#\r\n' +
                        '拍卖会：%1%\r\n' +
                        '投放额度数：%2%\r\n' +
                        '目前已投标人数：%3%\r\n' +
                        '拍卖会起止时间：%4%至%5%\r\n' +
                        '首次出价时段：%6%至%7%\r\n' +
                        '修改出价时段：%8%至%9%\r\n' +
                        '\r\n' +
                        '          目前为修改出价时段\r\n' +
                        '系统目前时间：%10%\r\n' +
                        '目前最低可成交价：%11%\r\n' +
                        '最低可成交价出价时间：%12%\r\n' +
                        '目前修改价格区间：%13%至%14%</INFO><xml>'
                        ).encode('gb18030') ,
                        key_val['addr']
                        )

        def parse_ack(self, string):
                key_val = {}
                try:
                        xml_string = '<XML>' + string.strip() + '</XML>'
                        root = ElementTree.fromstring(xml_string)
                        for child in root:
                                key_val[child.tag] = child.text
                except :
                        print(string)
                print(string)
                #print(sorted(key_val.items()))
                #print('')
                return key_val


        def udp_make_x_info(self, key_val):
                '''
                <TYPE>INFO</TYPE><INFO>C2014年5月24日上海市个人非营业性客车额度投标拍卖会尚未开始。
                起止时间为：
                2014年5月24日10时30分0秒
                到2014年5月24日11时30分0秒

                系统目前时间：10:20:06</INFO>
                '''
                info = ( (
                        '\n<TYPE>INFO</TYPE><INFO>C%s上海市个人非营业性客车额度投标拍卖会尚未开始。\r\n起止时间为：\r\n%s10时30分0秒\r\n到%s11时30分0秒\r\n\r\n系统目前时间：%s</INFO>\n\n\n\n\n\n\t\t\t'
                        ) % (
                        key_val['date'],
                        key_val['date'],
                        key_val['date'],
                        key_val['systime']
                        ) )
                #print(info)
                return info

        def udp_make_y_info(self, key_val):
                '''
                <TYPE>INFO</TYPE><INFO>C2014年5月24日上海市个人非营业性客车额度投标拍卖会已经结束，稍后发布拍卖会结果，请等待！


                拍卖会结果也可通过本公司网站WWW.ALLTOBID.COM进行查询。</INFO>
                '''
                info = ( (
                        '\n<TYPE>INFO</TYPE><INFO>C%s上海市个人非营业性客车额度投标拍卖会已经结束，稍后发布拍卖会结果，请等待！\r\n\r\n拍卖会结果也可通过本公司网站WWW.ALLTOBID.COM进行查询。</INFO>\n\n\n\n\n\n\t\t\t'
                        ) % (
                        key_val['date']
                        ) )
                #print(info)
                return info

        def udp_make_a_info(self, key_val):
                '''
                <TYPE>INFO</TYPE><INFO>A2014年5月24日上海市个人非营业性客车额度投标拍卖会^7400^72600^10:30^11:30^10:30^11:00^11:00^11:30^10:30:13^8891^72600^10:30:13</INFO>
                '''
                info = ( (
                        '\n<TYPE>INFO</TYPE><INFO>A%s上海市个人非营业性客车额度投标拍卖会^%s^%s^10:30^11:30^10:30^11:00^11:00^11:30^%s^%s^%s^%s</INFO>\n\n\n\n\n\n\t\t\t'
                        ) % (
                        key_val['date'],
                        key_val['number_limit'],
                        key_val['price_limit'],
                        key_val['systime'],
                        key_val['number'],
                        key_val['price'],
                        key_val['lowtime']
                        ) )
                #print(info)
                return info

        def udp_make_b_info(self, key_val):
                '''
                <TYPE>INFO</TYPE><INFO>B2014年5月24日上海市个人非营业性客车额度投标拍卖会^7400^114121^10:30^11:30^10:30^11:00^11:00^11:30^11:00:14^72600^10:30:12^72300^72900</INFO>
                '''
                info = ( (
                        '\n<TYPE>INFO</TYPE><INFO>B%s上海市个人非营业性客车额度投标拍卖会^%s^%s^10:30^11:30^10:30^11:00^11:00^11:30^%s^%s^%s^%s^%s</INFO>\n\n\n\n\n\n\t\t\t'
                        ) % (
                        key_val['date'],
                        key_val['number_limit'],
                        key_val['number'],
                        key_val['systime'],
                        key_val['price'],
                        key_val['lowtime'],
                        str(int(key_val['price']) - 300),
                        str(int(key_val['price']) + 300),
                        ) )
                #print(info)
                return info

#------------------------------------------------------
