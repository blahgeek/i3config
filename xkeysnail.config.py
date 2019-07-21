#! /usr/bin/env python
# -*- coding: utf-8 -*-

import re
from xkeysnail.transform import (define_keymap, K, Key,
                                 define_multipurpose_modmap,
                                 define_modmap)


# define_multipurpose_modmap({
#     Key.CAPSLOCK: [Key.MENU, 199]
# })

TERM_APP_PATTERN = re.compile('bqterm|konsole', re.I)

define_keymap(lambda s: not TERM_APP_PATTERN.search(s), {
    K('Super-t'): K('Ctrl-t'),
    K('Super-c'): K('Ctrl-c'),
    K('Super-v'): K('Ctrl-v'),
    K('Super-w'): K('Ctrl-w'),
    K('Super-a'): K('Ctrl-a'),
    K('Super-p'): K('Ctrl-p'),
    K('Super-z'): K('Ctrl-z'),
    K('Super-n'): K('Ctrl-n'),
    K('Super-f'): K('Ctrl-f'),
    K('Super-r'): K('Ctrl-r'),
})
