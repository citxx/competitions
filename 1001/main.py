#!/usr/bin/env python3
# -*- coding: utf-8 -*-

from sys import stdin


print(*reversed([int(x) ** 0.5 for x in stdin.read().split()]), sep="\n")

