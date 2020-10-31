#! /usr/bin/env python
# -*- coding: utf-8 -*-

import re
from xkeysnail.transform import (define_keymap, K, Key,
                                 define_multipurpose_modmap,
                                 define_modmap)


define_modmap({
    Key.LEFT_CTRL: Key.LEFT_ALT,
    Key.LEFT_ALT: Key.LEFT_CTRL,
    Key.LEFT_META: Key.LEFT_META,
    Key.CAPSLOCK: Key.RIGHT_META,
})

# define_multipurpose_modmap({
#     Key.CAPSLOCK: [Key.RIGHT_META, Key.LEFT_META]
# })
