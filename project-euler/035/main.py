#!/usr/bin/env python3
# -*- coding: utf-8 -*-

MAX = 10 ** 6 + 1


def shifts(s):
    return (s[i:] + s[:i] for i in range(len(s)))


# Eratothenes
is_prime = [True] * MAX
for i in range(2, MAX):
    if is_prime[i]:
        for k in range(i ** 2, MAX, i):
            is_prime[k] = False

# Circular primes
count = 0
for i in range(2, MAX):
    if is_prime[i]:
        ps = [is_prime[int(s)] for s in shifts(str(i))]
        if sum(ps) == len(ps):
            print(i)
            count += 1

print("Count:", count)
