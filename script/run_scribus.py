#!/usr/bin/python
# -*- coding: utf-8 -*-

import time
import json
import os
import math
import scribus
import simplebin
from collections import defaultdict

DATA_FILE = "data.json"
CACHE_FILE = "cache.json"
MANUEL_PROCESSING_FILE = "manual_processing.json"
FILES = "lily_output/"
FAST = False  # use this to debug
EFFECTIVE_PAGE_HEIGHT = 250
SPACING_SONGS = 10
SPACING_HEADLINE_SONG = 20
SPACING_SONG_TEXT = 5
PAGE_NUM_HEIGHT = 5
BASELINE_GRID = 5


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
        counter += 1
        width, old_height = scribus.getSize(textbox)
        if scribus.textOverflows(textbox):
            scribus.sizeObject(width, old_height + step, textbox)
        else:
            scribus.sizeObject(width, old_height - step, textbox)
            step = step * 0.5
        overflows = scribus.textOverflows(textbox)


def new_page():
    scribus.newPage(-1)
    scribus.gotoPage(scribus.pageCount())
    add_page_number()

def add_page_number():
    page_num = scribus.pageCount()
    page_width, page_height, margin_top, margin_left, margin_right, margin_bottom = page_size_margin(page_num)
    textbox = scribus.createText(margin_left, page_height-margin_bottom, page_width-margin_left-margin_right, PAGE_NUM_HEIGHT)
    scribus.setStyle("pagenumber_{}".format(get_style_suffix()), textbox)
    scribus.insertText(str(page_num), 0, textbox)
    scribus.deselectAll()

def page_size_margin(page_num):
    size = scribus.getPageNSize(page_num)
    margin = scribus.getPageNMargins(page_num)
    return size + margin

def get_style_suffix():
    page_num = scribus.pageCount()
    style_suffix = "r" # is this really the right way? is there no shortcut provided by scribus?
    if page_num % 2 == 0:
        style_suffix = "l"
    return style_suffix

def load_song(data, offset, settings):
    page_num = scribus.pageCount()
    page_width, page_height, margin_top, margin_left, margin_right, margin_bottom = page_size_margin(page_num)
    start_point = margin_top + offset

    new_width = page_width - margin_left - margin_right
    if not FAST:
        scribus.placeEPS(os.path.join(FILES, data["filename"]), 0, 0)
        eps = scribus.getSelectedObject()
        eps_width, eps_height = scribus.getSize(eps)
        #scribus.scaleGroup(new_width/eps_width)
        scribus.sizeObject(new_width, eps_height * (new_width/eps_width))
        scribus.moveObjectAbs(margin_left, start_point+SPACING_HEADLINE_SONG, eps)
        eps_width, eps_height = scribus.getSize(eps)
    else:
        eps_height = 0

    scribus.deselectAll()
    textbox = scribus.createText(margin_left, start_point, new_width, 20)

    style_suffix = get_style_suffix()

    if data["composer"]:
        scribus.deselectAll()
        scribus.insertText(u"{}\n".format(data["composer"]), 0, textbox)
        scribus.selectText(0, 1, textbox)
        scribus.setStyle("subline_{}".format(style_suffix), textbox)

    if data["poet"]:
        scribus.deselectAll()
        scribus.insertText(u"{}\n".format(data["poet"]), 0, textbox)
        scribus.selectText(0, 1, textbox)
        scribus.setStyle("subline_{}".format(style_suffix), textbox)

    scribus.deselectAll()
    scribus.insertText(u"{}\n".format(data["name"]), 0, textbox)
    scribus.selectText(0, 1, textbox)
    scribus.setStyle("headline_{}".format(style_suffix), textbox)

    textbox = scribus.createText(margin_left, start_point + eps_height + SPACING_HEADLINE_SONG + SPACING_SONG_TEXT, new_width, 50)
    scribus.setStyle("text", textbox)
    text = data["text"]
    text = [t.strip() for t in text if t.strip() != ""]
    num_chars = 0
    num_line_total = len(text)
    no_new_line = False
    for num_line, line in enumerate(text):
        if line.strip == "":
            continue
        if line.isdigit():
            first_char = "\n"
            if num_line == 0:
                first_char = ""
            no_new_line = True
            line = u"{}{}.\t".format(first_char, line)
            scribus.insertText(line, -1, textbox)
            scribus.deselectAll()
            scribus.selectText(num_chars, len(line), textbox)
            #scribus.setStyle("num", textbox) # no character styles available
            #scribus.setFontSize(5, textbox)  # TODO: testing only # BUG?
            scribus.setFont("Linux Libertine O Bold", textbox)
            num_chars += len(line)
        else:
            if no_new_line:
                first_char = ""
            else:
                first_char = chr(28)
            no_new_line = False
            line = u"{}{}".format(first_char, line)
            scribus.insertText(line, -1, textbox)
            scribus.deselectAll()
            scribus.selectText(num_chars, len(line), textbox)
            #scribus.setStyle("text", textbox)
            num_chars += len(line)

    scribus.setColumnGap(5, textbox)
    columns = settings.get("columns", 2)
    scribus.setColumns(columns, textbox)
    fit_height(textbox)
    text_width, text_height = scribus.getSize(textbox)
    text_left, text_top = scribus.getPosition(textbox)
    return text_top + text_height - start_point + SPACING_SONGS, page_num


def create_toc(data):
    if not scribus.objectExists("TOC"):
        new_page()
        page_width, page_height, margin_top, margin_left, margin_right, margin_bottom = page_size_margin(page_num)
        toc = scribus.createText(margin_left, margin_top, page_width-margin_right-margin_left, page_height-margin_top-margin_bottom)
        scribus.setNewName("TOC", toc)
        scribus.insertText("provide a textframe with name 'TOC' in front_matter.sla and i will not create the toc at the end of the document", 0, "TOC")

    text = "\n".join(("{}\t{}".format(title, pagenum) for (title, pagenum) in data))
    scribus.insertText(text, -1, "TOC")


def add_songs(all_songs, songs_double_page, manual_processing, songs_data, cache):
    # let's get the best sorting
    songs_combined = simplebin.best_fit(all_songs, EFFECTIVE_PAGE_HEIGHT)
    # sorting the songs alphabetic
    songs_sorted = sorted(songs_combined, key=lambda x: x[0])

    # make sure the double page will be added on the left side
    page_num = scribus.pageCount()
    for double_page in songs_double_page:
        if not double_page in all_songs:
            continue
        offset = songs_sorted.index([double_page])
        songs_sorted.insert(offset+1, None) # add a empty page after the song
        if (page_num + offset) % 2 != 0: # song is on right side, empty side on the left side.
            songs_sorted.insert(offset, songs_sorted.pop(offset+2)) # move next song before the double page
            # TODO: what if double sided song is last song?

    for songs in songs_sorted:
        current_pos = 0
        if songs == None: # we added this for a song that should be set on double page
            new_page()
            continue
        for filename in songs:
            if not manual_processing[filename].get("show", True):
                continue
            data = songs_data[filename]
            height, page_num = load_song(data, current_pos, manual_processing[filename])
            current_pos += math.ceil(height/BASELINE_GRID) * BASELINE_GRID
            cache[filename]["height"] = round(height, 2)
            cache[filename]["page"] = page_num
            scribus.progressSet(1)
        if current_pos != 0:
            new_page()

def main():
    cache = defaultdict(dict)
    try:
        with open(CACHE_FILE, "rb") as cache_file:
            cache = defaultdict(dict, json.load(cache_file))
    except:
        pass

    with open(DATA_FILE, "rb") as data_file:
        songs_data = json.load(data_file)

    with open(MANUEL_PROCESSING_FILE, "rb") as manual_file:
        manual_processing = defaultdict(dict, json.load(manual_file))

    scribus.statusMessage("Running script...")
    scribus.progressReset()
    scribus.progressTotal(len(songs_data))

    init()
    front_matter()
    add_page_number()

    # trying to get the best sorting
    # setting all songs to the max height
    all_songs = dict(zip(songs_data.keys(), [EFFECTIVE_PAGE_HEIGHT] * len(songs_data)))
    # update according to cache
    for song_name, data in cache.iteritems():
        all_songs[song_name] = min(data.get("height", EFFECTIVE_PAGE_HEIGHT), EFFECTIVE_PAGE_HEIGHT)
    # let's see which songs should be set on a double sided page:
    songs_double_page = filter(lambda x: manual_processing[x].get("double_page", False), manual_processing)
    for double_page in songs_double_page:
        all_songs[double_page] = EFFECTIVE_PAGE_HEIGHT # all double page songs should get a whole page despite their height

    appendix_filter = lambda a_s, boolean : {k:v for k,v in a_s.iteritems() if manual_processing[k].get("appendix", False) == boolean}

    main_songs = appendix_filter(all_songs, False)
    add_songs(main_songs, songs_double_page, manual_processing, songs_data, cache)

    appendix_songs = appendix_filter(all_songs, True)
    add_songs(appendix_songs, songs_double_page, manual_processing, songs_data, cache)


    toc = []
    for filename in filter(lambda s: manual_processing[s].get("show", True), all_songs.keys()):
        toc.append((songs_data[filename]["name"], cache[filename].get("page", "XX")))
    toc.sort(key=lambda (x,y): x)
    create_toc(toc)

    if scribus.haveDoc():
        scribus.setRedraw(True)
        scribus.statusMessage("")
        scribus.progressReset()

    with open(CACHE_FILE, "wb") as cache_file:
        json.dump(cache, cache_file, indent=2)

if __name__ == "__main__":
    main()
