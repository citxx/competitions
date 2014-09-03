#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from itertools import permutations

pan_digital_product = {}
for p in permutations("123456789"):
    s = "".join(p)
    for i in range(1, 7):
        for j in range(i + 1, 8):
            a, b, c = int(s[:i]), int(s[i:j]), int(s[j:])
            if a * b == c:
                print(a, '*', b, '=', c)
                pan_digital_product[c] = True

print("Sum:", sum(pan_digital_product.keys()))
