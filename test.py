# -*- coding: utf-8 -*-

import random
import string

ra = random.randint(6, 16)
salt = ''.join(random.sample(string.ascii_letters + string.digits, ra))

print(salt)
