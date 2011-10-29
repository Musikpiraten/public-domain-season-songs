%=============================================
%   created by MuseScore Version: 0.9.6
%          Mittwoch, 17. November 2010
%=============================================

\version "2.12.0"



#(set-default-paper-size "a4")

\paper {
  line-width    = 190\mm
  left-margin   = 10\mm
  top-margin    = 10\mm
  bottom-margin = 20\mm
  indent = 0 \mm 
  %%set to ##t if your score is less than one page: 
  ragged-last-bottom = ##t 
  ragged-bottom = ##f  
  %% in orchestral scores you probably want the two bold slashes 
  %% separating the systems: so uncomment the following line: 
  %% system-separator-markup = \slashSeparator 
  }

\header {
    title = "Es kommt ein Schiff geladen"
    composer = "Traditionell"
    poet = "Johannes Tauler (1300 - 1361) und Daniel Sudermann (1550 - 1631) "
    }

AvoiceAA = \relative c'{
    \set Staff.instrumentName = #""
    \set Staff.shortInstrumentName = #""
    \clef treble
    %staffkeysig
    \key f \major 
    %barkeysig: 
    \key f \major 
    %bartimesig: 
    \time 6/4 
    \partial 4
    d4     d2 d4 e2 e4      | % 1
    f( g a) a2 a4      | % 2
    g2 g4 d2 e4      | % 3
    f2. ^\markup{\musicglyph #"four four meter"} f4 
    a4 c d d 
    c8  (bes a g) f4 g ^\markup {\upright  ""} 
    a4 g f e 
    d2. r4 r2 
}% end of last bar in partorvoice

      ApartAverseA = \lyricmode { \set stanza = " 1. " Es kommt ein Schiff, ge -- la -- den bis an sein höchs -- ten  Bord, trägt Got -- tes  Sohn voll Gna --  den, des Va -- ters  e -- wigs  Wort. }
theChords = \chordmode { 
                    s4             d2.:m a2.:m d1.:m g2.:m d2:m c4 f1. b2 c2 d2:m f4 c4 d4:m a4 d4:m }%%end of chordlist 


\score { 
    << 
    \new ChordNames { \theChords } 
        \context Staff = ApartA << 
            \context Voice = AvoiceAA \AvoiceAA
        >>

         \context Lyrics = ApartAverseA\lyricsto AvoiceAA  \ApartAverseA



      \set Score.skipBars = ##t
      %%\set Score.melismaBusyProperties = #'()
      \override Score.BarNumber #'break-visibility = #end-of-line-invisible %%every bar is numbered.!!!
      %% remove previous line to get barnumbers only at beginning of system.
       #(set-accidental-style 'modern-cautionary)
      \set Score.markFormatter = #format-mark-box-letters %%boxed rehearsal-marks
       \override Score.TimeSignature #'style = #'() %%makes timesigs always numerical
      %% remove previous line to get cut-time/alla breve or common time 
      \set Score.pedalSustainStyle = #'mixed 
       %% make spanners comprise the note it end on, so that there is no doubt that this note is included.
       \override Score.TrillSpanner #'(bound-details right padding) = #-2
      \override Score.TextSpanner #'(bound-details right padding) = #-1
      %% Lilypond's normal textspanners are too weak:  
      \override Score.TextSpanner #'dash-period = #1
      \override Score.TextSpanner #'dash-fraction = #0.5
      %% lilypond chordname font, like mscore jazzfont, is both far too big and extremely ugly (olagunde@start.no):
      \override Score.ChordName #'font-family = #'roman 
      \override Score.ChordName #'font-size =#0 
      %% In my experience the normal thing in printed scores is maj7 and not the triangle. (olagunde):
      \set Score.majorSevenSymbol = \markup {maj7}
  >>

  %% Boosey and Hawkes, and Peters, have barlines spanning all staff-groups in a score,
  %% Eulenburg and Philharmonia, like Lilypond, have no barlines between staffgroups.
  %% If you want the Eulenburg/Lilypond style, comment out the following line:
  \layout {\context {\Score \consists Span_bar_engraver}}
}%% end of score-block 


\markup {
    \hspace #0.1
    \column {
      \line {
        \bold "2."
        \column {
"Das Schiff geht still im Triebe,"
"es trägt ein teure Last;"
"das Segel ist die Liebe,"
"der Heilig Geist der Mast."         
        }
      }
      \hspace #0.1
      \line {
        \bold "4."
        \column {
"Zu Bethlehem geboren"
"im Stall ein Kindelein,"
"gibt sich für uns verloren;"
"gelobet muss es sein."
        }
      }
      \hspace #0.1
      \line {
        \bold "6."
        \column {
"Danach mit ihm auch sterben"
"und geistlich auferstehn,"
"Ewigs Leben zu erben,"
"wie an ihm ist geschehn. "
        }
      }
    }
    \hspace #0.1
    \column {
      \line {
        \bold "3."
        \column {
"Der Anker haft’ auf Erden,"
"da ist das Schiff am Land."
"Gott's Wort tut uns Fleisch werden,"
"der Sohn ist uns gesandt."
        }
      }
      \hspace #0.1
      \line {
        \bold "5."
        \column {
"Und wer dies Kind mit Freuden"
"umfangen, küssen will,"
"muss vorher mit ihm leiden"
"groß Pein und Marter viel."
        }
      }
    }
    \hspace #0.1
}

\markuplines {
  \italic {
    \line {
      Gesetzt für http://www.kinder-wollen-singen.de
      \general-align #Y #DOWN {
        \epsfile #X #3 #"publicdomain.eps"
      }
    }
  }
}
#(set-global-staff-size 20)
