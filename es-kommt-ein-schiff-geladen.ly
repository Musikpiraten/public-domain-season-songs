\version "2.12.3"


\include "default.ly"

\header {
  title = "Es kommt ein Schiff geladen"
  composer = "Traditionell"
  poet = "Johannes Tauler und Daniel Sudermann"
  tagline = ""
}

Melodie = \relative c'{
  \clef violin
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
    c8[( bes a g]) f4 g ^\markup {\upright  ""} 
    a4 g f e 
    d2 \bar"|."
  } % end of last bar in partorvoice
  
Text = \lyricmode {
    \set stanza = " 1. "
    Es kommt ein Schiff, ge -- la -- den bis an sein höchs -- ten  Bord,
    trägt Got -- tes  Sohn voll Gna --  den, des Va -- ters  e -- wigs  Wort.
  }
  
  
Akkorde = \chordmode { 
    s4
    d2.:m a2.:m d1.:m g2.:m d2:m c4 f1. b2 c2 d2:m f4 c4 d4:m a4 d4:m
  } %%end of chordlist 
  
  
  
  
  \score { 
    << 
      \new ChordNames { \Akkorde } 
      
      \new Voice = "Melodie" {
        \Melodie 
      }
      
      \new Lyrics = Strophe\lyricsto Melodie  \Text
      
    >>
    %\midi{}
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
  
  