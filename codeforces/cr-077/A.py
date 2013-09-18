#!/usr/bin/env python

n = int(raw_input())

f_words = []
for i in range(n):
    f_words.append(raw_input().lower())

original_name = raw_input()
letter = raw_input()

name = original_name.lower()
mark = [False for i in name]

for word in f_words:
    k = len(word)
    end = name
    while True:
        i = end.find(word)
        if i == -1:
            break
        mark[i:i + k] = [True] * k
        end = end[i + 1:]

new_name = original_name
for i, v in enumerate(mark):
    if v:
        new_name = new_name[:i] + letter + new_name[i + 1:]

print new_name
