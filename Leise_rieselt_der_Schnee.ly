\version "2.12.3"

\include "default.ly"

\header {
  title = "Leise rieselt der Schnee"
  poet = ""
  composer = "Text & Musik: Eduard Ebel"
}


akkorde = \chordmode {
  f4. c f2. bes f c4. c:7 d2.:m g4.:m c f2.
}
melodie = \relative c' {
  \autoBeamOff
  \clef treble
  \time 6/8
  \key f\major
  a'4 a8 g a g | f4.~ f4 r8 |
  f4 d8 f e d | c4.~ c4 r8 |
  g'8 fis g bes a g | f4.~ f4 r8 |
  g8. d16 d8 e d e | f4.~ f4 r8 \bar "|."
}
text = \lyricmode {
  \set stanza = "1."
  Lei -- se rie -- selt der Schnee,
  still und starr liegt der See, __
  weih -- nacht -- lich glän -- zet der Wald:
  Freu -- e dich, Christ -- kind kommt bald. __
}
\score {
  <<
    \new ChordNames { \akkorde }
    \new Voice = "Lied" { \melodie }
    \new Lyrics \lyricsto "Lied" { \text }
  >>
  \layout{}
  \midi{}
}


\markup {
  \fill-line {
    \column {
      \hspace #0.1
      \line {
        \bold "2."
        \column {
          "In den Herzen ist’s warm,"
	  "still schweigt Kummer und Harm,"
	  "Sorge des Lebens verhallt:"
	  "Freue dich, Christkind kommt bald!"
	}
      }
      \hspace #0.1
      \line {
	\bold "3."
        \column {
	  "Bald ist heilige Nacht;"
	  "Chor der Engel erwacht;"
	  "Horch nur, wie lieblich es schallt:"
	  "Freue dich, Christkind kommt bald!"
        }
      }
    }
  }
}
