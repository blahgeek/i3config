#!/usr/bin/env python
# -*- coding: utf-8 -*-
# @Author: BlahGeek
# @Date:   2016-12-16
# @Last Modified by:   BlahGeek
# @Last Modified time: 2016-12-18


import os


class Py3status:

    modes = (
             ('Text0', ''),
             ('Text1', '')
            )

    _selected = 0
    _active = 0

    def custom_mode(self):
        response = {
            'cached_until': self.py3.CACHE_FOREVER,
            'full_text': self.modes[self._selected][0],
        }
        if self._selected == self._active:
            response['color'] = self.py3.COLOR_GOOD
        return response

    def on_click(self, event):
        btn = event['button']
        if btn == 1:  # left click
            self._selected = (self._selected + 1) % len(self.modes)
        elif btn == 3:
            self._active = self._selected
            cmd = self.modes[self._active][1]
            if cmd:
                os.system(cmd)
