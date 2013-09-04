#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from sys import stdin

p, q = (round(float(x) * 100) for x in stdin.read().split())

n = 1

while True:
	a = (n * q - 1) // 10000
	if n * p < a * 10000 < n * q:
		break
	n += 1

print(n)

