#!/usr/bin/python
# -*- coding: utf-8 -*-

import time
import json
import os
import scribus
import simplebin

DATA_FILE = "data.json"
SIZES_FILE = "sizes.json"
FILES = "pdfs/"
FAST = False  # use this to debug
EFFECTIVE_PAGE_HEIGHT = 250
SPACING = 10


def init():
    scribus.openDoc("init.sla")
    scribus.saveDocAs("/tmp/{}.sla".format(time.time()))
    scribus.setUnit(scribus.UNIT_MM)


def front_matter():
    # load pages from other document
    if not os.path.exists("front_matter.sla"):
        print "not front matter, file not found!"
        return
    scribus.openDoc("front_matter.sla")
    pages = scribus.pageCount()
    scribus.closeDoc()
    scribus.importPage(
        "front_matter.sla",  # filename
        tuple(range(1, pages+1)),  # range of pages to import
        1,  # insert (1) or replace(0)
        0,  # where to insert
    )
    scribus.gotoPage(pages+1)
    print scribus.getAllStyles()


def fit_height(textbox):
    # come to a state that the text box does not overflow:
    width, height = scribus.getSize(textbox)
    to_add = height
    while scribus.textOverflows(textbox):
        scribus.sizeObject(width, height + to_add, textbox)
        to_add = to_add * 2

    # reduce height
    step = height/2
    overflows = False
    counter = 0
    while step > 0.05 or overflows:
        print "."
        counter += 1
        width, old_height = scribus.getSize(textbox)
        if scribus.textOverflows(textbox):
            scribus.sizeObject(width, old_height + step, textbox)
        else:
            scribus.sizeObject(width, old_height - step, textbox)
            step = step * 0.5
        overflows = scribus.textOverflows(textbox)
    print "needed {} steps".format(counter)


def new_page():
    scribus.newPage(-1)
    scribus.gotoPage(scribus.pageCount())


def load_song(data, offset):
    page_width, page_height = scribus.getPageSize()
    margin_top, margin_left, margin_right, margin_bottom = scribus.getPageMargins()
    start_point = margin_top + offset

    new_width = page_width - margin_left - margin_right
    if not FAST:
        scribus.placeEPS(os.path.join(FILES, data["filename"]), 0, 0)
        eps = scribus.getSelectedObject()
        eps_width, eps_height = scribus.getSize(eps)
        #scribus.scaleGroup(new_width/eps_width)
        scribus.sizeObject(new_width, eps_height * (new_width/eps_width))
        scribus.moveObjectAbs(margin_left, start_point+10, eps)
        eps_width, eps_height = scribus.getSize(eps)
    else:
        eps_height = 0

    scribus.deselectAll()
    textbox = scribus.createText(margin_left, start_point, new_width, 20)

    scribus.deselectAll()
    scribus.insertText(u"{}\n".format(data["composer"]), 0, textbox)
    scribus.selectText(0, 1, textbox)
    scribus.setStyle("subline", textbox)

    scribus.deselectAll()
    scribus.insertText(u"{}\n".format(data["poet"]), 0, textbox)
    scribus.selectText(0, 1, textbox)
    scribus.setStyle("subline", textbox)

    scribus.deselectAll()
    scribus.insertText(u"{}\n".format(data["name"]), 0, textbox)
    scribus.selectText(0, 1, textbox)
    scribus.setStyle("headline", textbox)

    textbox = scribus.createText(margin_left, start_point + eps_height + 20, new_width, 50)
    scribus.setStyle("text", textbox)
    text = data["text"]
    text = [t.strip() for t in text if t.strip() != ""]
    num_chars = 0
    num_line_total = len(text)
    for num_line, line in enumerate(text):
        if line.isdigit():
            line = u"{}\t".format(line)
            scribus.insertText(line, -1, textbox)
            scribus.deselectAll()
            scribus.selectText(num_chars, len(line), textbox)
            #scribus.setStyle("num", textbox)
            #scribus.setFontSize(5, textbox)  # TODO: testing only # BUG?
            num_chars += len(line)
        else:
            if num_line_total != num_line + 1:
                line = u"{}\n".format(line)
            scribus.insertText(line, -1, textbox)
            scribus.deselectAll()
            scribus.selectText(num_chars, len(line), textbox)
            #scribus.setStyle("text", textbox)
            num_chars += len(line)

    scribus.setColumnGap(5, textbox)
    scribus.setColumns(2, textbox)
    fit_height(textbox)
    text_width, text_height = scribus.getSize(textbox)
    text_left, text_top = scribus.getPosition(textbox)
    return text_top + text_height - start_point + 10 # margin

if __name__ == "__main__":
    sizes = {}
    try:
        with open(SIZES_FILE, "rb") as sizes_file:
            sizes = json.load(sizes_file)
    except:
        pass

    with open(DATA_FILE, "rb") as data_file:
        songs_data = json.load(data_file)

    scribus.statusMessage("Running script...")
    scribus.progressReset()
    scribus.progressTotal(len(songs_data))

    init()
    front_matter()

    # trying to get the best sorting
    # setting all songs to the max height
    all_songs = dict(zip(songs_data.keys(), [EFFECTIVE_PAGE_HEIGHT] * len(songs_data)))
    # update according to cache
    for song_name, height in sizes.iteritems():
        all_songs[song_name] = min(height, EFFECTIVE_PAGE_HEIGHT)
    # let's get the best sorting
    songs_combined = simplebin.best_fit(all_songs, EFFECTIVE_PAGE_HEIGHT)
    # sorting the songs alphabetic
    songs_sorted = sorted(songs_combined, key=lambda x: x[0])

    for songs in songs_sorted:
        current_pos = 0
        for filename in songs:
            data = songs_data[filename]
            height = load_song(data, current_pos)
            current_pos += height
            sizes[filename] = height
            scribus.progressSet(1)
        new_page()

    if scribus.haveDoc():
        scribus.setRedraw(True)
        scribus.statusMessage("")
        scribus.progressReset()

    with open(SIZES_FILE, "wb") as sizes_file:
        json.dump(sizes, sizes_file, indent=2)

#scribus.createCharStyle("headline", "Linux Libertine O Regular", 20)
#scribus.createParagraphStyle("pt", 0, 25, 0, charstyle="testing")
