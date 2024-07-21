# https://inventwithpython.com/recursion/chapter10.html

import os
filename = '/home/browni/LasthrimProjection/freya.txt'
ctimestamp = os.path.getctime(filename)
import time
st = time.localtime(ctimestamp)
print(time.asctime(st))
print(time.gmtime(ctimestamp))