#!/usr/bin/env python
# -*- coding: utf-8 -*-

"""
parses the input folder for .ly files, makes some costum modifikation to the ly file, writes a pdf + some extracted data
"""


import subprocess
import os
import sys
import re
import shutil
from optparse import OptionParser

######################

inFolder = "../"
outFolder = "pdfs"
outFolderText = "texts"
filenames = []

no_songs = ['default.ly']


parser = OptionParser()
parser.add_option("-r", "--remove", dest="remove", action="store_true", default=False,
                  help="remove old pdfs")
parser.add_option("-f", "--filter", dest="filter",
                  help="only renders files that contain FILTER", metavar="FILTER")
parser.add_option("-d", "--dryrun", action="store_true", dest="dryrun", default=False,
                  help="don't render files with lilypond, just check if parsing files will work and generate list.txt")

(options, args) = parser.parse_args()

if options.remove:
    shutil.rmtree(outFolder)

if not os.path.exists(outFolder):
    os.mkdir(outFolder)

if not os.path.exists(outFolderText):
    os.mkdir(outFolderText)

files = filter(lambda x: re.match(".*\.ly$", x), os.listdir(inFolder))
files = filter(lambda x: x not in no_songs, files)

if options.filter:
    print "#" * 80
    print "# filter for " + options.filter + "!"
    print "# files without filtering:", len(files)
    files = filter(lambda x: options.filter in x, files)
    print "# files now:", len(files)
    print "#" * 80

for ly in files:
    infile = os.path.join(inFolder, ly)
    print "-" * 80
    print "trying", infile
    print "- " * 40
    inp = open(infile, 'rb')
    outp = open("temp.ly", 'wb')
    outp.write("""

\header{{
    tagline = " " %remove the »Music engraving by LilyPond 2.14.2—www.lilypond.org«
}}

\paper {{
  myStaffSize = #20
  %{{
     run
         lilypond -dshow-available-fonts blabla
     to show all fonts available in the process log.
  %}}

  #(define fonts
    (make-pango-font-tree "DejaVu Sans"
                          "DejaVu Sans"
                          "DejaVu Sans Mono"
    (/ myStaffSize 20)))
    %system-system-spacing #'stretchability = #0
    %ragged-last-bottom = ##t
    %ragged-bottom = ##t
    %print-page-number = ##f
    #(set-paper-size "a4")
}}""".format(margin = 0)
)

    tw = inp.read()
    tw = tw.replace(u"\ufeff".encode("utf-8"), "")
    print("removing lines:")
    inpaper = False
    filename = None
    name = None
    markup = False
    markupc = 0
    texxt = ""
    composer = poet = ""
    for line in tw.split("\n"):
        r = re.match(r'\W*title\W*=\W*"([^"]+)"' , line)
        rcomposer = re.match(r'\W*composer\W*=\W*"([^"]+)"' , line)
        rpoet = re.match(r'\W*poet\W*=\W*"([^"]+)"' , line)
        komplizierter_poet = re.findall(r'"([^"]+)"', line)
        if inpaper or "\paper" in line:
            inpaper = True
            if "}" in line:
                inpaper = False
            print "----", line
        if markup or re.findall(r"^\s*\\markup", line):
            markup = True
            if "{" in line:
                markupc += 1
            if "}" in line:
                markupc -= 1
            if markupc == 0:
                markup = False

            if r"\bold" in line:
                num = re.findall(r'"\s*(\d+)\s*\.?\s*"', line);
                if num:
                    texxt = texxt[:-1] +  "\r" + num[0] + ".\t"
                else:
                    print "\n".join([line]*20)
            else:
                m = re.match(r'\s*"([^"]*)"\s*', line)
                if m:
                    texxt += m.groups()[0] + "\n"

            outp.write(line + "\n")
        elif r and len(r.groups()) == 1:
            filename = r.groups()[0]
            name = filename.decode("utf-8")
            filename = filename.decode("utf-8")
            filename = filename.replace(u"’", "_").replace(u"…", "_")
            while filename in [a[0] for a in filenames]:
                filename = filename + "-"
            print "----", line
        elif rcomposer and len(rcomposer.groups()) == 1:
            composer = rcomposer.groups()[0].decode("utf-8")
        elif rpoet and len(rpoet.groups()) == 1:
            poet = rpoet.groups()[0].decode("utf-8")
        elif "set-global-staff-size" in line:
            print "----", line
        elif "set-default-paper-size" in line:
            print "----", line
        elif "opus" in line:
            print "----", line
        elif r"\tempo" in line:
            print "----", line
        elif "copyright" in line and "=" in line and "\"" in line:
            print "----", line
        elif "subtitle" in line and "=" in line:
            print "----", line
        #elif "\hspace #0.1" in line:
        #    print "- - ", line
        #    outp.write("\hspace #5")
        elif "poet" in line and komplizierter_poet:
            print komplizierter_poet
            komplizierter_poet = map(lambda x: x.decode("utf-8"), komplizierter_poet)
            gr = u"\n".join(komplizierter_poet[1:])
            poet = u"{0} {1}".format(komplizierter_poet[0], gr)
            print type(poet), poet
        else:
            outp.write(line + "\n")
    print "#" * 80
    textf = open(os.path.join(outFolderText, filename + ".txt"), "wb")
    textf.write(texxt[:-1])
    print texxt[:-1]
    print "#" * 80
    filenames.append((filename, name, poet.replace("\n", "\\n"), composer.replace("\n", "\\n")))

    inp.close()
    outp.flush()
    outp.close()

    outfile = os.path.join(outFolder, filename)

    print " -" * 40
    print "extracted data:"
    for var in ("outfile", "filename", "name", "poet", "composer"):
        print u"{0}: '{1}'".format(var.rjust(10), locals()[var])
    print " -" * 40

    if (not options.dryrun):
        print "LILYPOND:"
        cl = ["lilypond", "-I", os.path.abspath("../"), "-o", outfile, "temp.ly"]
        status = subprocess.call(cl)
        if os.path.exists(outfile + ".ps"):
            os.remove(outfile + ".ps")
        if os.path.exists(outfile + ".midi"):
            os.remove(outfile + ".midi")
        print (str(status) + " ") * 40
        print "END LILYPOND"

if not options.filter:
    print "liste"
    import codecs
    f = open("list.txt", "wb")
    f.write( codecs.BOM_UTF8 )
    f.write("@pdf\tname\n")
    for filename, name, poet, composer in filenames:
        #f.write( + u"\t" + + u"\n")
        f.write( filename.encode("utf-8")+".pdf")
        f.write("\t")
        f.write(name.encode("utf-8"))
        f.write("\t")
        f.write(poet.encode("utf-8"))
        f.write("\t")
        f.write(composer.encode("utf-8"))
        f.write("\n")
    f.flush()
    f.close()

