#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re


class Py3status:

    format = 'ddcutil {level}'
    cache_timeout = 10
    button_down = 5
    button_up = 4
    brightness_delta = 5
    brightness_min = 0
    brightness_max = 100

    def _get_level(self):
        output = self.py3.command_output(['sudo', 'ddcutil', 'getvcp', '10'])
        m = re.search(r'current value =\s*(\d+),', output)
        return int(m.group(1))

    def _set_level(self, level):
        self.py3.command_output(['sudo', 'ddcutil', 'setvcp', '10', str(level)])

    def ddcutil(self):
        level = self._get_level()
        full_text = self.py3.safe_format(self.format, {'level': level})

        return {
            'cached_until': self.py3.time_in(self.cache_timeout),
            'full_text': full_text
        }

    def on_click(self, event):
        level = self._get_level()
        button = event["button"]
        if button == self.button_up:
            level += self.brightness_delta
            if level > self.brightness_max:
                level = self.brightness_max
        elif button == self.button_down:
            level -= self.brightness_delta
            if level < self.brightness_min:
                level = self.brightness_min
        self._set_level(level)
