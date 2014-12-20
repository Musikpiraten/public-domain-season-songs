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
        if hasattr(element, "__class__"):
            for n in filter(lambda x: x[0] != "_", sorted(dir(element))):
                o.write("\n")
                o.write("- " * 20)
                o.write("\n")
                o.write(n)
                e = getattr(element, n)
                if hasattr(e, "__doc__"):
                    o.write(str(e.__doc__))

