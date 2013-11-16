#!/usr/bin/env python
# -*- coding: utf-8 -*-

import re
import subprocess
from collections import Counter
from topdf import get_files, process_file

replacemap = [
    (u'ä', 'ae'), (u'ü', 'ue'), (u'ö', 'oe'), (u'ß', 'ss'),
]


def is_single_voice(filename, filenames):
    if filename.lower().endswith("chorsatz.ly"):
        return False
    if filename.lower().endswith("einstimmig.ly"):
        return True
    if filename == "tochter-zion-freue-dich.ly":
        return True  # grrrr
    other_filenames = [f for f in filenames if f != filename]
    for f in other_filenames:
        if filename.replace(".ly", "") in f:
            if f.lower().endswith("chorsatz.ly"):
                return True

if __name__ == '__main__':
    ok = []
    filenames = get_files()
    new_filenames = []
    for filename in sorted(filenames):
        status = process_file(filename, dryrun=True)
        name = status["data"]["name"]
        new_filename = name.lower()
        new_filename = re.sub("[,.–]", "", new_filename)
        for search, replace in replacemap:
            new_filename = new_filename.replace(search, replace)
        new_filename = re.sub("[^a-z0-9-]+", "_", new_filename)
        new_filename = "{}{}.ly".format(
            new_filename,
            "-einstimmig" if is_single_voice(filename, filenames) else "",
        )
        if filename == new_filename:
            ok.append(filename)
        else:
            if False:
                subprocess.call(
                    [
                        "git",
                        "mv",
                        filename,
                        new_filename,
                    ], cwd="../")
        new_filenames.append(new_filename)
        print(u"{: >53} -> {}".format(filename, new_filename))
    print("\nalready {} files are named corretly, "
          "{} files should be renamed".format(len(ok), len(filenames)-len(ok)))
    print "duplicated filenamse:", [
        name for name, count
        in Counter(new_filenames).iteritems()
        if count > 1
    ]
