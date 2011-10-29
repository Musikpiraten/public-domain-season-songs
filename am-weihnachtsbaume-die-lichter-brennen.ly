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
    title = "Am Weihnachtsbaume die Lichter brennen"
    composer = "Traditionell (19. Jhdt)"
    poet = "Hermann Kletke (1841)"
    }

AvoiceAA = \relative c'{
    \set Staff.instrumentName = #""
    \set Staff.shortInstrumentName = #""
    \clef treble
    %staffkeysig
    \key c \major 
    %bartimesig: 
    \time 3/4 
    \partial 8*3
    c8 c8 e8 | g4( e8) g c a | % 1
    g4 e8 g a g      | % 2
    f4 d g8 g      | % 3
    e4 r8 e e g      | % 4
    f4 d8 f f a      | % 5
    g4 e8 e e g | % 6
    f4 d g8 g ^\markup {\upright  "3"}      | % 7
    e4 r8 \bar "|." 
}% end of last bar in partorvoice

      ApartAverseA = \lyricmode { \set stanza = " 1. " Am Weih -- nachts -- baume  die Lich -- ter  bren -- nen,  wie glänzt er fest -- lich,  lieb und mild, als spräch' er: 'Wollt ihr in mir er -- ken -- nen  ge -- treu -- er  Hoff -- nung  stil -- les  Bild!' }
theChords = \chordmode { 
    c2.. f4 c2. d2:m g4 c2. f2/c g4 c2. f4 f4:m g4:4 c4 }%%end of chordlist 


\score { 
    << 
    \new ChordNames { \theChords } 
        \context Staff = ApartA << 
            \context Voice = AvoiceAA \AvoiceAA
        >>

         \context Lyrics = ApartAverseA\lyricsto AvoiceAA  \ApartAverseA


  >>

  %% Boosey and Hawkes, and Peters, have barlines spanning all staff-groups in a score,
  %% Eulenburg and Philharmonia, like Lilypond, have no barlines between staffgroups.
  %% If you want the Eulenburg/Lilypond style, comment out the following line:
  \layout {
    indent = #0
    \context {\Score }}
}%% end of score-block 

\markup {
  \fill-line {
    \hspace #0.1
    \column {
      \line {
        \bold "2."
        \column {
"Die Kinder stehen mit hellen Blicken,"
"das Auge lacht, es lacht das Herz,"
"oh fröhlich seliges Entzücken!"
"Die Alten schauen himmelwärts."
        }
      }
      \hspace #0.1
      \line {
        \bold "4."
        \column {
"Gesegnet seid, ihr alten Leute,"
"gesegnet sei, du kleine Schar!"
"Wir bringen Gottes Segen heute"
"dem braunen wie dem weißen Haar."
        }
      }
      \hspace #0.1
      \line {
        \bold "6."
        \column {
"Kein Ohr hat ihren Spruch vernommen,"
"unsichtbar jedes Menschen Blick"
"sind sie gegangen wie gekommen,"
"doch Gottes Segen blieb zurück."
        }
      }
    }
    \hspace #0.1
    \column {
      \line {
        \bold "3."
        \column {
"Zwei Engel sind hereingetreten,"
"kein Auge hat sie kommen seh'n,"
"sie gehn zum Weihnachtstisch und beten,"
"und wenden wieder sich und geh'n."
        }
      }
      \hspace #0.1
      \line {
        \bold "5."
        \column {
"Zu guten Menschen, die sich lieben,"
"schickt uns der Herr als Boten aus,"
"und seid ihr treu und fromm geblieben,"
"wir treten wieder in dies Haus."
        }
      }
    }
    \hspace #0.1
  }
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
