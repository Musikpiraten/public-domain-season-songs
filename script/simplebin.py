#!/usr/bin/python
# -*- coding: utf-8 -*-

"""
simple 1D Bin Sorting Algorithm implemented in pure Python
"""

class Bin(object):
    def __init__(self, max_size):
        self.max_size = max_size
        self.elements = []

    def get_size(self):
        return sum((v for k, v in self.elements))

    def get_distance(self, value):
        return self.max_size - (self.get_size() + value)

    def enough_place_for(self, value):
        return self.get_distance(value) >= 0

    def add(self, key, value):
        if not self.enough_place_for(value):
            raise Exception("not enough space: my size:{}, max_size:{}, wanted to add:{}".format(self.get_size(), self.max_size, value))
        self.elements.append((key, value))


def best_fit(data, size):
    out = []
    sorted_data = sorted(
        [(k, v) for k, v in data.iteritems()],
        key=lambda (k, v): v, reverse=True)
    for key, value in sorted_data:
        enough_place_in = []
        for b in out:
            if b.enough_place_for(value):
                enough_place_in.append(b)

        if enough_place_in:
            best_fit = sorted(
                enough_place_in, key=lambda b: b.get_distance(value))[0]
            best_fit.add(key, value)
        else:
            new_bin = Bin(size)
            new_bin.add(key, value)
            out.append(new_bin)

    to_return = []
    for b in out:
        to_return.append([key for key, value in b.elements])
        #to_return.append(b.elements) # better for debugging
    return to_return


if __name__ == '__main__':
    print best_fit(dict(a=1, b=2, c=3, d=4, e=5, f=6, g=7, h=8, i=9), 10)
    print best_fit(dict(a=4, b=4, c=4, d=4, e=4, f=2, g=2, h=8, i=2), 10)
