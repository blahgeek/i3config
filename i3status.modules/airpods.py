#!/usr/bin/env python
# -*- coding: utf-8 -*-

# @Author: blahgeek
# @Date:   2017-02-20
# @Last modified by:   blahgeek
# @Last modified time: 2017-02-20


import subprocess


class Py3status:

    text_on = 'ON'
    text_off = 'OFF'

    cache_timeout = 10

    def airpods(self):
        output = subprocess.check_output(['ponymix', '--short'],
                                         universal_newlines=True)
        if any(map(lambda x: x.startswith('sink') and 'bluez_sink' in x,
                   output.split('\n'))):
            state = True
        else:
            state = False

        return {
                   'full_text': self.text_on if state else self.text_off,
                   'color': self.py3.COLOR_ON if state else self.py3.COLOR_OFF,
                   'cached_until': self.py3.time_in(self.cache_timeout),
               }
