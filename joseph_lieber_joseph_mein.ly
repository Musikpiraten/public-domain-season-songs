% Für das Projekt "Gemeinfreie Weihnachtslieder 2011" der Musikpiraten e.V.
% Webseite http://musik.klarmachen-zum-aendern.de/
% Dieses Notenblatt wurde bearbeitet von Ingo Felger [www.facebook.com/Tschilp] 
% Kontakt: chirp@ulmo.org

\version "2.12.3"
\include "deutsch.ly"
\include "default.ly"

\header {
    title = "Joseph, lieber Joseph mein"
    composer = "Text und Melodie: Traditionell"
}


SongMelody = \relative c' {
    \key f \major 
    \time 6/8 
    c'4 a8 f4 a8      | % 1
    c4 d8 c4.      | % 2
    c4 a8 f4 a8      | % 3
    c4 d8 c4.      | % 4
    b4 b8 b4 c8      | % 5
    b4 a8 g4 a8      | % 6
    c4 a8 f4 a8       | % 7
    g4 f8 g4 a8      | % 8
    f4. f4.
}

SongChords = \chordmode { \set chordChanges = ##t \germanChords
f1 b8 f1*11/8 b8 f4. c1.:7 f2. c4. c:7 f2
}

SongText = \lyricmode { \set stanza = " 1. "
Jo -- seph,  lie -- ber  Jo -- seph  mein, hilf mir wieg’n mein Kin -- de -- lein,
Gott, der wird dein Loh -- ner  sein im Him -- mel -- reich,  der Jung -- frau  Sohn Ma -- ri -- a.
}

\score { 
  << 
  \new ChordNames { \SongChords }
  \new Voice = "melodie" {
    \autoBeamOff
    \clef violin
    \SongMelody
    \bar "|."
  }
  \new Lyrics \lyricsto "melodie" { \SongText } 
  >>
  %\layout{}
  %\midi{}
} 

  
\markup {
  \hspace #0.1
  \column {
    \line {
      \bold "2."
      \column {
"Joseph, lieber Joseph mein,"
"hilf mir wieg’n mein Kindelein,"
"Gott, der wird dein Lohner sein"
"im Himmelreich, der Jungfrau Sohn Maria."
      }
    }
    \hspace #0.1
    \line {
      \bold "3."
      \column {
"Gerne, lieb’ Maria mein,"
"helf ich dir wieg’n das Kindelein."
"dass Gott müss’ mein Lohner sein"
"im Himmelreich, der Jungfrau Sohn Maria."
      }
    }
  }
  \hspace #0.1
  \column {
    \line {
      \bold "4."
      \column {
"Freu dich nun, o Christenschar,"
"der himmlische König klar"
"nahm die Menschheit offenbar,"
"den uns gebar die reine Magd Maria."
      }
    }
    \hspace #0.1
    \line {
      \bold "5."
      \column {
"Süßer Jesu, auserkor’n,"
"weißt wohl, dass wir war’n verlor’n,"
"still uns deines Vaters Zorn,"
"dich hat gebor’n die reine Magd Maria."
      }
    }
  }
  \hspace #0.1
}


