#!/usr/bin/python
# -*- coding: utf-8 -*-

import scribus

with open("doc.txt", "wb") as o:
    for name in sorted(dir(scribus)):
        o.write("\n")
        o.write("#" * 40)
        o.write("\n")
        o.write(name)
        o.write("\n")
        element = getattr(scribus, name)
        if hasattr(element, "__doc__"):
            doc = element.__doc__
            o.write(str(doc))

