#!/usr/bin/env python3
# -*- coding: utf-8 -*-


def is_palindrome(s):
    return s == s[::-1]


s = 0
for i in range(1, 1000000):
    decimal = str(i)
    binary = bin(i)[2:]
    if is_palindrome(decimal) and is_palindrome(binary):
        print(i, binary)
        s += i

print("Sum:", s)
