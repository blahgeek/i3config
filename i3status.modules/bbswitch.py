#!/usr/bin/env python
# -*- coding: utf-8 -*-
# By i@BlahGeek.com at 11/11/2016


class Py3status:

    text_on = 'ON'
    text_off = 'OFF'

    cache_timeout = 10

    def bbswitch(self):
        with open('/proc/acpi/bbswitch', 'r') as f:
            state = f.read()
        state = 'ON' in state
        return {
                   'full_text': self.text_on if state else self.text_off,
                   'color': self.py3.COLOR_ON if state else self.py3.COLOR_OFF,
                   'cached_until': self.py3.time_in(self.cache_timeout),
               }

