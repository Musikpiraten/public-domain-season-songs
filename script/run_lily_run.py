#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
parses the input folder for .ly files, makes some costum modifikation to the ly
file, writes a pdf + some extracted data
"""


import subprocess
import json
import os
import re
import shutil
from optparse import OptionParser

######################

inFolder = "../"
outFolder = "pdfs"
FOLDER_TEMP = "temp"
FILENAME_TEMP = "temp.ly"
DATA = "data.json"

no_songs = ['default.ly']


def process_file(ly, dryrun):
    filename = ly.rsplit(".", 2)[0]
    infile = os.path.join(inFolder, ly)
    inp = open(infile, 'rb')
    with open(os.path.join(FOLDER_TEMP, FILENAME_TEMP), 'wb') as outp:
        outp.write("""
    \header{{
        tagline = " " %remove the »Music engraving by LilyPond«
    }}

    \paper {{
      myStaffSize = #20
      %{{
         run
             lilypond -dshow-available-fonts blabla
         to show all fonts available in the process log.
      %}}

      #(define fonts
        (make-pango-font-tree "Linux Libertine"
                              "Linux Libertine"
                              "Linux Libertine Mono"
        (/ myStaffSize 20)))
        %system-system-spacing #'stretchability = #0
        %ragged-last-bottom = ##t
        %ragged-bottom = ##t
        %print-page-number = ##f
        #(set-paper-size "a4")
    }}
    """.format(margin=0))

        tw = inp.read()
        tw = tw.decode("utf-8")
        tw = tw.replace(u"\ufeff", "")
        inpaper = False
        name = None
        removed_lines = []
        markup = False
        markupc = 0
        song_text = []
        composer = poet = ""
        for line in tw.split("\n"):
            r = re.match(r'\W*title\W*=\W*"([^"]+)"', line)
            rcomposer = re.match(r'\W*composer\W*=\W*"([^"]+)"', line)
            rpoet = re.match(r'\W*poet\W*=\W*"([^"]+)"', line)
            komplizierter_poet = re.findall(r'"([^"]+)"', line)
            if inpaper or "\paper" in line:
                inpaper = True
                if "}" in line:
                    inpaper = False
                removed_lines.append(line)
            if markup or re.findall(r"^\s*\\markup", line):
                markup = True
                markupc += line.count("{")
                markupc -= line.count("}")
                if markupc == 0:
                    markup = False
                if r"\bold" in line:
                    num = re.findall(r'"\s*(\d+)\s*\.?\s*"', line)
                    if num:
                        song_text.append(num[0])
                    else:
                        line = re.sub(
                            '["{}]',
                            "",
                            re.sub(r"\\.*?[{ ]", "", line)
                        )
                        song_text.append(line)
                else:
                    m = re.match(r'\s*"([^"]*)"\s*', line)
                    if m:
                        song_text.append(m.groups()[0])
                    else:
                        removed_lines.append(line)
            elif r and len(r.groups()) == 1:
                name = r.groups()[0]
                removed_lines.append(line)
            elif rcomposer and len(rcomposer.groups()) == 1:
                composer = rcomposer.groups()[0]
            elif rpoet and len(rpoet.groups()) == 1:
                poet = rpoet.groups()[0]
            elif "set-global-staff-size" in line:
                removed_lines.append(line)
            elif "tagline" in line:
                removed_lines.append(line)
            elif "set-default-paper-size" in line:
                removed_lines.append(line)
            elif "version" in line:
                removed_lines.append(line)
            elif "opus" in line:
                removed_lines.append(line)
            elif r"\tempo" in line:
                removed_lines.append(line)
            elif "copyright" in line and "=" in line and "\"" in line:
                removed_lines.append(line)
            elif "subtitle" in line and "=" in line:
                removed_lines.append(line)
            elif "poet" in line and komplizierter_poet:
                #print komplizierter_poet
                komplizierter_poet = map(lambda x: x, komplizierter_poet)
                gr = u"\n".join(komplizierter_poet[1:])
                poet = u"{0} {1}".format(komplizierter_poet[0], gr)
                #print type(poet), poet
            else:
                outp.write(line.encode("utf-8"))
                outp.write("\n")

        inp.seek(0)
        file_content = inp.read()
        inp.close()

    to_return = {}

    ext = "eps"
    if (not dryrun):
        cl = [
            "lilypond",
            #"-V",
            "-I",
            os.path.abspath("../"),
            "--ps",
            "-d",
            "point-and-click=#f",
            "-dbackend=eps",
            "-o",
            "tmp",  # TODO: GLOBAL VARIABLE FOR THIS!
            FILENAME_TEMP
        ]
        sub = subprocess.Popen(
            cl,
            stdout=subprocess.PIPE,
            stderr=subprocess.PIPE,
            cwd=FOLDER_TEMP,
        )
        status = sub.wait()

        to_return.update({
            "lilypond": status,
            "lilypond_stdout": sub.stdout.read(),
            "lilypond_stderr": sub.stderr.read(),
        })

        shutil.copy(
            os.path.join(FOLDER_TEMP, "tmp.{}".format(ext)),
            os.path.join(outFolder, "{}.{}".format(filename, ext))
        )

    to_return.update({
        "file_content": file_content,
        "removed_lines": removed_lines,
        "data": {
            "filename": "{}.{}".format(filename, ext),
            "name": name,
            "poet": poet,
            "composer": composer,
            "text": song_text,
        },
        "lilypond": -1,
    })
    return to_return


def get_files():
    files = filter(lambda x: re.match(".*\.ly$", x), os.listdir(inFolder))
    files = filter(lambda x: x not in no_songs, files)
    return files

if __name__ == '__main__':
    parser = OptionParser()
    parser.add_option(
        "-v", "--verbose", dest="verbose", action="count", default=0,
        help="increment verbose level")
    parser.add_option(
        "-r", "--remove", dest="remove", action="store_true", default=False,
        help="remove old pdfs")
    parser.add_option(
        "-f", "--filter", dest="filter",
        help="only renders files that contain FILTER", metavar="FILTER")
    parser.add_option(
        "-d", "--dryrun", action="store_true", dest="dryrun", default=False,
        help="don't render files with lilypond, just check if parsing files "
             "will work and generate list.txt")

    (options, args) = parser.parse_args()

    if options.remove:
        shutil.rmtree(outFolder)

    for folder in (outFolder, FOLDER_TEMP):
        if not os.path.exists(folder):
            os.mkdir(folder)

    files = get_files()

    data = {}

    if options.filter:

        data = {}
        if os.path.exists(DATA):
            with open(DATA, "rb") as datafile:
                try:
                    data = json.load(datafile)
                except:
                    pass
        print "! filter for " + options.filter + "!"
        print "! files without filtering:", len(files)
        files = filter(lambda x: options.filter in x, files)
        print "! files now: {}\n".format(len(files))

    for ly in files:
        status = process_file(ly, options.dryrun)
        data[ly] = status["data"]
        print("{:.<60} {}{}{}".format(
            ly,
            "C" if status["data"].get("composer", "") else " ",
            "P" if status["data"].get("poet", "") else " ",
            "N" if status["data"].get("name", "") else " ",
        ))
        if options.verbose > 0:
            for key in sorted(status["data"]):
                print u"    {: <20} : {}".format(key, status["data"][key])
        if options.verbose > 0:
            print "    removed lines:"
            print "   ", "    \n".join(status["removed_lines"])
        if status["lilypond"] == 1:
            if status.get("file_content", False):
                for line_number, line in enumerate(status["file_content"].splitlines()):
                    print "{:0<3}: {}".format(line_number, line)
            print status["lilypond_stdout"]
            print status["lilypond_stderr"]
            print "\n\n\nLILYPOND FAILED\n\n"
            break

    with open(DATA, "wb") as datafile:
        json.dump(data, datafile, indent=2)
