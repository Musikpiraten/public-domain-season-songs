% Dieses Notenblatt wurde erstellt von Peter Crighton [http://www.petercrighton.de]
%
% Kontakt: PeteCrighton@googlemail.com

\version "2.12.3"
\header {
  title = "Leise rieselt der Schnee"
  poet = "Text: Eduard Ebel (1895)"
  composer = "Melodie: Eduard Ebel (um 1900)"
}
\layout {
  indent = #0
}
akkorde = \chordmode {
  f4. c f2. bes f c4. c:7 d2.:m g4.:m c f2.
}
melodie = \relative c' {
  \clef "treble"
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
  weih -- nacht -- lich glän -- zet der Wald: __
  Freu -- e dich, Christ -- kind kommt bald. __
}
\score {
  <<
    \new ChordNames { \akkorde }
    \new Voice = "Lied" { \melodie }
    \new Lyrics \lyricsto "Lied" { \text }
  >>
}
\markup {
    \column {
      \line {
	\bold "2."
        \column {
          "In den Herzen ist's warm,"
	  "still schweigt Kummer und Harm,"
	  "Sorge des Lebens verhallt:"
	  "Freue dich, Christkind kommt bald!"
	}
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
