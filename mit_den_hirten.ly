\version "2.12.3"

\include "default.ly"

\header {
  title="Mit den Hirten will ich gehen"
  composer="Melodie: August Rische (1819–1906)"
  poet="Text: Emil Quandt (1835–1911)"
  tagline = ""
}

dcaf = {
	\once \override Score.RehearsalMark #'break-visibility = #end-of-line-visible
	\once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
	\mark "D.C. al Fine"
}

fine = {
	\once \override Score.RehearsalMark #'break-visibility = #end-of-line-visible
	\once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
	\mark "Fine"
}

Melodie=\relative c' {
    \time 3/4
    \partial 4
    bes'8 c8 |
    bes4 g4 g8 aes8 |
    g4 f4 f8 g8 |
    aes4 f4 bes8 aes8 |
    aes4 g4 g8 bes8 |
    ees4 ees4 d8 c8 |
    bes2 g8 g8 |
    c4 aes4 f8 f8 |
    ees2
    \bar "|."
}


Akkorde= \chordmode {
  \set chordChanges = ##t
    ees4 | 
    ees2 ees4 |
    ees4 bes2 |
    bes2 bes4 |
    bes4 ees2 |
    aes2 aes4 |
    ees2 ees4 |
    aes2 bes4 |
    ees2
}


Text=\lyricmode {
	\set stanza = "1."
	Mit den Hir -- ten will ich ge -- hen,
    mei -- nen Hei -- land zu be -- se -- hen,
    mei -- nen lie -- ben heil' -- gen Christ,
    der für mich ge -- bo -- ren ist.
}


\score{
  <<
    \new ChordNames {\Akkorde}
    \new Voice = "Melodie" {
      \autoBeamOff
      \clef treble
      \key es \major
      \time 3/4
      \Melodie
    }
    \new Lyrics = Strophe \lyricsto Melodie \Text
  >>
   \layout{}
   \midi {\context { \Score tempoWholesPerMinute = #(ly:make-moment 110 4) } }
}

\markup {
    \column {
        \hspace #0.1     % schafft ein wenig Platz zu den Noten
        \fill-line {
            \hspace #0.05
            \column {
                \hspace #0.1
                \line {
                    \bold "2."
                    \column {
                        "Mit den Engeln will ich singen,"
                        "Gott zur Ehre soll es klingen"
                        "von dem Frieden, den Er gibt,"
                        "jedem Herzen, das Ihn liebt."
                    }
                }
                \vspace #0.3
                \hspace #0.1
                \line {
                    \bold "3."
                    \column {
                        "Mit den Weisen will ich geben,"
                        "was ich Höchstes hab im Leben."
                        "Geb zu seligem Gewinn"
                        "ihm das Leben selber hin."
                    }
                }
            }
            \hspace #0.1
            \column {
                \hspace #0.3
                \line {
                    \bold "4."
                    \column {
                        "Mit Maria will ich sinnen"
                        "ganz verschwiegen und tief innen"
                        "über dem Geheimnis zart:"
                        "Gott im Fleisch geoffenbart."
                    }
                }
                \vspace #0.3
                \hspace #0.1
                \line {
                    \bold "5."
                    \column {
                        "Mit Dir selber, mein Befreier,"
                        "will ich halten Weihnachtsfeier;"
                        "komm, ach komm ins Herz hinein,"
                        "lass es deine Krippe sein!"               
                    }
                }
            }
            \hspace #0.1  % Spalte vom linken Rand
        }
    }
}


 % some settings % vim: sw=2 et
