\version "2.12.3"

\include "default.ly"

\header {
  title="Am Weihnachtsbaume die Lichter brennen"
  composer="Musik: Traditionell (19. Jhdt)"
  poet="Text: Hermann Kletke (1841)"
  tagline = ""
}


Melodie=\relative c' {
    c8 c8 e8 | g4( e8) g c a | % 1
    g4 e8 g a g \break | % 2
    f4 d g8 g | % 3
    e4 r8 e e g | % 4
    f4 d8 f f a \break | % 5
    g4 e8 e e g | % 6
    f4 d g8 g ^\markup {\upright  "3"}      | % 7
    e4 r8 \bar "|." 
}


Akkorde= \chordmode {
    c2.. f4 c2. d2:m g4 c2. f2/c g4 c2. f4 f4:m g4:4 c4
}

Text=\lyricmode {
    \set stanza = " 1. " Am Weih -- nachts -- baume  die Lich -- ter  bren -- nen,  wie glänzt er fest -- lich,  lieb und mild,
    als spräch’ er: „Wollt ihr in mir er -- ken -- nen  ge -- treu -- er  Hoff -- nung  stil -- les  Bild!“
}


\score{
  <<
    \new ChordNames {\Akkorde}
    \new Voice = "Melodie" {
    \autoBeamOff
    \clef treble
    %staffkeysig
    \key c \major
    %bartimesig:
    \time 3/4
    \partial 8*3
    \Melodie
    }
    \new Lyrics = Strophe \lyricsto Melodie \Text
  >>
  %\midi{}
}


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
"kein Auge hat sie kommen seh’n,"
"sie gehn zum Weihnachtstisch und beten,"
"und wenden wieder sich und geh’n."
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

% some settings % vim: sw=2 et
