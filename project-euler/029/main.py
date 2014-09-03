#!/usr/bin/env python3
# -*- coding: utf-8 -*-

MIN_A = MIN_B = 2
MAX_A = MAX_B = 100

is_power = {}
for a in range(MIN_A, MAX_A + 1):
    for b in range(MIN_B, MAX_B + 1):
        is_power[a ** b] = True

print(len(is_power))
