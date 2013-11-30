=========
Scripting
=========

If you want to build your own pdf you will need:

* `lilypond <http://lilypond.org/>`
* `scribus <http://scribus.net/>` (1.5.0)
* `python <http://python.org/``
* `linux libertine <http://www.linuxlibertine.org/>`

Run ``run_lily_run.py`` first. This will create eps files from the lilypond
source code and place them in the folder ``lily_output``. After this you will
have to run ``run_scribus.py`` from within scribus twice. The first run is
needed to calculate the space needed for each song. They will be combined for
saving some space in the second run.

You may also create a file called ``front_matter.sla`` and place it in this
folder. The pages of this document will be copied to the created document. If
you name one text frame ``TOC`` the table of contents will be put in this text
frame.

If you don't like the fonts used, you have to change ``init.sla``,
``run_lily_run.py`` and finally ``run_scribus.py``.
