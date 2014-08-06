#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Author: Artem Tabolin <artemtab@yandex.ru>

from sys import setrecursionlimit
setrecursionlimit(100000)


class Treap:
    """
    Cartesian tree implementation.

    >>> a = Treap(1, 5)
    >>> b = Treap(4, 0)
    >>> c = Treap(2, 3)
    >>> d = Treap(6, 2)
    >>> ac = Treap.merge(a, c)
    >>> bd = Treap.merge(b, d)
    >>> t = Treap.merge(ac, bd)
    >>> t
      |-(1, 5)
    |-(2, 3)
    (4, 0)
    |-(6, 2)
    >>> l, r = Treap.split(t, 2)
    >>> l
    |-(1, 5)
    (2, 3)
    >>> r
    (4, 0)
    |-(6, 2)
    >>> vertices = [(3, 1), (4, 3), (6, 5), (5, 2), (4, 0), (0, 5), (1, 6), (1, 2), (2, 4), (2, 3)]
    >>> vertices.sort(key=lambda x: (x[0], -x[1]))
    >>> Treap.from_sorted_list(vertices)
        |-(0, 5)
        | |-(1, 6)
      |-(1, 2)
      | | |-(2, 4)
      | |-(2, 3)
    |-(3, 1)
    | |-(4, 3)
    (4, 0)
    |-(5, 2)
      |-(6, 5)
    """

    def __init__(self, x, y, info=None, left=None, right=None):
        self.x = x
        self.y = y
        self.info = info
        self.left = left
        self.right = right

    def to_asci(self):
        l_repr = self.left.to_asci() if self.left is not None else []
        r_repr = self.right.to_asci() if self.right is not None else []
        result = []

        f = False
        for i, s in enumerate(l_repr):
            is_root = s[0] == '('
            f = f or is_root
            if is_root:
                result.append("|-" + s)
            elif f:
                result.append("| " + s)
            else:
                result.append("  " + s)

        result.append("({}, {})".format(self.x, self.y))

        f = False
        for i, s in enumerate(r_repr):
            is_root = s[0] == '('
            f = f or is_root
            if is_root:
                result.append("|-" + s)
            elif f:
                result.append("  " + s)
            else:
                result.append("| " + s)

        return result

    def __repr__(self):
        return "\n".join(self.to_asci())

    @staticmethod
    def from_sorted_list(pairs, left=0, right=None):
        if right is None:
            right = len(pairs)

        if left + 1 == right:
            return Treap(*pairs[left])
        else:
            middle = (left + right) // 2
            l_treap = Treap.from_sorted_list(pairs, left, middle)
            r_treap = Treap.from_sorted_list(pairs, middle, right)
            return Treap.merge(l_treap, r_treap)

    @staticmethod
    def split(node, key):
        if node is None:
            return (None, None)
        elif node.x <= key:
            r_left, r_right = Treap.split(node.right, key)
            return (Treap(node.x, node.y, node.info, node.left, r_left), r_right)
        else:
            l_left, l_right = Treap.split(node.left, key)
            return (l_left, Treap(node.x, node.y, node.info, l_right, node.right))

    @staticmethod
    def merge(node_l, node_r):
        if node_l is None:
            return node_r
        elif node_r is None:
            return node_l
        elif node_l.y < node_r.y:
            return Treap(node_l.x, node_l.y, node_l.info, node_l.left, Treap.merge(node_l.right, node_r))
        else:
            return Treap(node_r.x, node_r.y, node_r.info, Treap.merge(node_l, node_r.left), node_r.right)


def get_tree_nodes(t, parent=None, nodes=None):
    if nodes is None:
        nodes = []
    if t is not None:
        nodes.append((t, parent))
        get_tree_nodes(t.left, t, nodes)
        get_tree_nodes(t.right, t, nodes)
    return nodes



#if __name__ == "__main__":
    #import doctest
    #doctest.testmod()


n = int(input())
pairs = [tuple(map(int, input().split())) + (i + 1,) for i in range(n)]
pairs.sort(key=lambda x: (x[0], -x[1]))

t = Treap.from_sorted_list(pairs)
nodes = get_tree_nodes(t)
nodes.sort(key=lambda x: x[0].info)

print("YES")
for node in nodes:
    parent = node[1].info if node[1] is not None else 0
    left = node[0].left.info if node[0].left is not None else 0
    right = node[0].right.info if node[0].right is not None else 0
    print(parent, left, right)
