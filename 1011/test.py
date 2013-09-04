#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from os import system


for x in range(1, 10000):
	p, q = x / 100, (x + 1) / 100
	run_str = 'echo {} {} | python3 main.py'.format(p, q)
	print(run_str)
	system(run_str)
