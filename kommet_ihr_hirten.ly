\version "2.12.3"

\include "default.ly"

\header {
  title = "Kommet, ihr Hirten"
  poet = "Text: Karl Riedel"
  composer = "Melodie: Olmütz"
  tagline = ##f
}



akkorde = \chordmode {
  f2 bes4 f2 bes4 f2 c4 f2. f1*5/4 c4 f1*5/4 c4 f2 c4 f2.
}
melodie = \relative c' {
  \clef treble
  \time 3/4
  \key f\major
  \autoBeamOff
  \repeat volta 2 {
    c'4 c8([ a)] d[( bes)] | c4 c8[( a)] d[( bes)] |
    c4 a8[( c)] g[( a)] | f2.
  }
  \break
  f4 a8 f a c | f,4 a8 f g c, |
  f4 a8 f a c | f,4 a8 f g c, |
  c'4 a8[( c)] g[( a)] | f2. \bar "|."
}
text = \lyricmode {
  \set stanza = "1."
  Kom -- met, ihr Hir -- ten, ihr Män -- ner und Frau’n,
  Chris -- tus, der Herr, ist heu -- te ge -- bo -- ren,
  den Gott zum Hei -- land euch hat er -- ko -- ren.
  Fürch -- tet __ euch nicht!
}
wdh = \lyricmode {
  kom -- met, das lieb -- li -- che Kind -- lein zu __ schaun,
}
\score {
  <<
    \new ChordNames { \akkorde }
    \new Voice = "Lied" { \melodie }
    \new Lyrics \lyricsto "Lied" { \text }
    \new Lyrics \lyricsto "Lied" { \wdh }
  >>
  \layout{}
  %\midi {\context {  \Score  tempoWholesPerMinute = #(ly:make-moment 110 4)  } }
}

\markup {
  \fill-line {
    \column {
      \hspace #0.1
      \line {
	\bold "2."
        \column {
          "Lasset uns sehen in Bethlehems Stall,"
	  "was uns verheißen der himmlische Schall;"
	  "was wir dort finden, lasset uns künden,"
	  "lasset uns preisen in frommen Weisen."
	  "Halleluja!"
	}
      }
      \hspace #0.1
      \line {
	\bold "3."
        \column {
          "Wahrlich, die Engel verkündigen heut’"
	  "Bethlehems Hirtenvolk gar große Freud:"
	  "Nun soll es werden Friede auf Erden,"
	  "den Menschen allen ein Wohlgefallen."
	  "Ehre sei Gott!"
        }
      }
    }
  }
}
