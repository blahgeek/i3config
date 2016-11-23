#!/usr/bin/env python
# -*- coding: utf-8 -*-
# By i@BlahGeek.com at 11/13/2016

from datetime import datetime

class Py3status:

    format = '%Y%m%d-%H%M%S'
    cache_timeout = 10

    def date(self):
        now = datetime.now()
        return {
                   'full_text': now.strftime(self.format),
                   'cached_until': self.py3.time_in(self.cache_timeout),
               }
