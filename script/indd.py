#!/usr/bin/python -u
# -*- coding: utf-8 -*-

"""
this is pfusch, sorry!
"""

#####!export VERSIONER_PYTHON_PREFER_32_BIT=yes && python indd_01.py

from appscript import *
import os
import time
import sys


color_multi_page_pdf = False


f = open("list.txt", "rb")

print "los geht es!"

data = {}
for i, line in enumerate(f.readlines()):
    if i == 0:
        continue
    line = line.decode("utf-8")
    filename, name, poet, composer = line.split("\t")

    from CoreGraphics import *
    pdf_filename = "pdfs/" + filename
    print u"\r{0}".format(pdf_filename.ljust(80, ".")),
    sys.stdout.flush()
    pdf = CGPDFDocumentCreateWithProvider(CGDataProviderCreateWithFilename(pdf_filename.encode("utf-8")))
    pages = pdf.getNumberOfPages()

    data.update({filename.strip(): dict(name=name.strip(), pagenum=pages, poet=poet, composer=composer)})

print u"\r done!                                "

inD = app('Adobe InDesign CS3')
doc = inD.active_document
ui = doc.get()

#DocAViewPref = ui.view_preference
#hMeas = DocAViewPref.horizontal_measurement_units.get()
#vMeas = DocAViewPref.vertical_measurement_units.get()
#DocAViewPref.horizontal_measurement_units.set(k.points)
#DocAViewPref.vertical_measurement_units.set(k.points)
#ui.view_preferences = DocAViewPref

o_style_name = filter(lambda x: x.name.get() == 'name', ui.all_object_styles.get())[0]
o_style_info = filter(lambda x: x.name.get() == 'infos', ui.all_object_styles.get())[0]
o_text_info = filter(lambda x: x.name.get() == 'text', ui.all_object_styles.get())[0]

# delete all info and name objs
print "deleting ...",
for tpage in ui.pages.get():
    for pg in tpage.page_items.get():
        if pg.content_type.get() == k.text_type:
            if pg.applied_object_style.name.get() == 'infos':
                pg.delete()
            elif pg.applied_object_style.name.get() == 'name':
                pg.delete()
            elif pg.applied_object_style.name.get() == 'text':
                pg.delete()
print "done"

for num, tpage in enumerate(ui.pages.get()):
    #print num
    side = tpage.side.get()
    #side = tpage.index.get()
    for pg in tpage.page_items.get():
        ## handling pdfs::
        if pg.content_type.get() == k.graphic_type:
            for pdf in pg.all_graphics.get():
                filename = pdf.item_link.file_path.get().encode("utf-8").split(":")[-1]
                #pg.visible_bounds.set((25,25,287,195)) # position vom rahmen
                # do not touch! der rahmen wird vorgegeben, der rest entsprechend angeordnet!
                pdf_rahmen_top = pg.visible_bounds.get()[0]


                for text in tpage.text_frames.get():
                    if text.applied_object_style.name.get() == 'text':
                        print "{0}\t{1}".format(filename, text.visible_bounds.get()[2]-15)


                if True:
                    pdf.horizontal_scale.set(87)
                    pdf.vertical_scale.set(87)

                    # position und größe vom inhatl
                    top, left, bottom, right = pdf.visible_bounds.get()
                    width = right-left
                    height = bottom-top
                    print filename, "\t", height
                    pdf.visible_bounds.set((pdf_rahmen_top, 22.5, pdf_rahmen_top+height, 22.5+width))

                    # create textfields for names
                    textfield = inD.make(new=k.text_frame, at=tpage)
                    textfield.applied_object_style.set(o_style_name)

                    textfield.text.set(data[filename.decode("utf-8")]['name'])

                    textfield.visible_bounds.set((pdf_rahmen_top - 10,25,pdf_rahmen_top - 6,195))

                    if data[filename.decode("utf-8")]['pagenum'] > 1 and color_multi_page_pdf:
                        textfield.fill_color.set("ggg")

                    # create textfields for infos
                    poet = data[filename.decode("utf-8")]['poet'].strip()
                    composer = data[filename.decode("utf-8")]['composer'].strip()
                    infotext = []
                    if poet:
                        infotext.append(poet)
                    if composer:
                        infotext.append(composer)
                    infotext = "\n".join(infotext)

                    dy = -2

                   # if side == k.right_hand:
                   #     textbounds = (dy+185,20,dy+195,138)
                   # else:
                   #     textbounds = (dy+185,-138,dy+195,-20)
                    textbounds = (pdf_rahmen_top - 5,25,pdf_rahmen_top + 5,195)

                    textfield = inD.make(new=k.text_frame, at=tpage)
                    textfield.applied_object_style.set(o_style_info)
                    textfield.visible_bounds.set(textbounds)
                    textfield.text.set(infotext)

                    #textfeld für den text:
                    f = open("texts/{0}.txt".format(".".join(filename.split(".")[:-1])), "rb")
                    texxt = f.read().decode("utf-8").strip(); f.close();
                    textfield = inD.make(new=k.text_frame, at=tpage)
                    textfield.applied_object_style.set(o_text_info)
                    textfield.visible_bounds.set((pdf_rahmen_top + 20, 25, pdf_rahmen_top + 100, 195))
                    textfield.text.set(texxt)


    

            
            #print textfield.fill_color.get()

                    
        #elif pg.content_type.get() == k.text_type:
            #pg.text.set("assda")
       # for telement in tgroup.page_items.get():
       #     if(telement.class_.get() == k.text_frame):
       #         # ein textfeld
       #         if (telement.applied_object_style.name.get() == "ARCH_export"):
       #         # ein textfeld auf dem der objekt-stil "Arch_export" angewendet wurde
       #             filename = telement.contents.get()
       #             if (type(filename).__name__  == 'unicode'):
       #             # außer text ist nix drin im textfeld -> wir können exportieren!
       #                 print "detected %s" % filename # dateiname
       #                 bb = tgroup.visible_bounds.get()                        

       #                 print "%s, %s" % (round(bb[0]), round(bb[1]))
       #                 # d.h. jetzt können wir tgroup exportieren:
       #                 url = "%s/%s.pdf"% (folder, filename)
       #                 urlpng = "%s/%s.png"% (folder, filename)
       #                 # first lets select and copy the group we want to export:
       #                 inD.active_document.set(ui)
       #                 ui.select(tgroup)
       #                 inD.copy()

#DocAViewPref.horizontal_measurement_units.set(hMeas[0])
#DocAViewPref.vertical_measurement_units.set(vMeas[0])
#ui.view_preferences = DocAViewPref
