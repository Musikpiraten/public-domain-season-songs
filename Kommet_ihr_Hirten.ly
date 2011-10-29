% Dieses Notenblatt wurde erstellt von Peter Crighton [http://www.petercrighton.de]
%
% Kontakt: PeteCrighton@googlemail.com

\version "2.12.3"
\header {
  title = "Kommet, ihr Hirten"
  poet = "Text: Karl Riedel (1870)"
  composer = "Melodie: Olmütz (1847)"
}

\layout {
  indent = #0
}

akkorde = \chordmode {
  f2 bes4 f2 bes4 f2 c4 f2. f1*5/4 c4 f1*5/4 c4 f2 c4 f2.
}
melodie = \relative c' {
  \clef "treble"
  \time 3/4
  \key f\major
  #(override-auto-beam-setting '(end * * * *) 2 4)
  \repeat volta 2 {
    c'4 c8( a) d( bes) | c4 c8( a) d( bes) |
    c4 a8( c) g( a) | f2.
  }
  \break
  f4 a8 f a c | f,4 a8 f g c, |
  f4 a8 f a c | f,4 a8 f g c, |
  c'4 a8( c) g( a) | f2. \bar "|."
}
text = \lyricmode {
  \set stanza = "1."
  Kom -- met, ihr Hir -- ten, ihr Män -- ner und Fraun,
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
}
\markup {
    \column {
      \line {
	\bold "2."
        \column {
          "Lasset uns sehen in Bethlehems Stall,"
	  "was uns verheißen der himmlische Schall;"
	  "was wir dort finden, lasset uns künden,"
	  "lasset uns preisen in frommen Weisen."
	  "Halleluja!"
	}
	\bold "3."
        \column {
          "Wahrlich, die Engel verkündigen heut"
	  "Bethlehems Hirtenvolk gar große Freud:"
	  "Nun soll es werden Friede auf Erden,"
	  "den Menschen allen ein Wohlgefallen."
	  "Ehre sei Gott!"
        }
      }
    }
}

\markuplines {
  \italic {
    \line {
      Gesetzt von Peter Crighton
      \general-align #Y #DOWN {
        \epsfile #X #3 #"publicdomain.eps"
      }

    }
  }
}
