#!/usr/bin/python3.4
# -*-coding:Utf-8 -*

import scipy.special as sps
import numpy as np
import math
import random as rand

for k in range(100):
	petitVolume = np.random.zipf(1.2)
	print petitVolume