% Dieses Notenblatt wurde erstellt von Peter Crighton [http://www.petercrighton.de]
%
% Kontakt: PeteCrighton@googlemail.com

\version "2.12.3"
\header {
  title = "Stille Nacht, heilige Nacht"
  poet = "Text: Joseph Mohr (1816)"
  composer = "Melodie: Franz Xaver Gruber (1818)"
}
\layout {
  indent = #0
}
akkorde = \chordmode {
  d1. a2.:7 d  g d g d a:7 d d4. a:7 d2.
}
melodie = \relative c' {
  \clef "treble"
  \time 6/8
  \key d\major
  a'8.( b16) a8 fis4. | a8. b16 a8 fis4. |
  e'4 e8 cis4. | d4 d8 a4. |
  b4 b8 \slurDashed d8.( cis16) b8 | a8.( b16) a8 fis4. |
  b4 b8 d8.( cis16) b8 | a8.( b16) a8 fis4. |
  cis'4 cis8 e8. d16 cis8 | \slurSolid d4.( fis4.) |
  d8.( a16) fis8 a8. g16 e8 | d4. (d4) r8 \bar "|."
}
text = \lyricmode {
  \set stanza = "1."
  Stil -- le Nacht, hei -- li -- ge Nacht!
  Al -- les schläft, ein -- sam wacht
  \set ignoreMelismata = ##t nur das trau -- te, hoch -- hei -- li -- ge Paar.
  Hol -- der Kna -- be im lock -- i -- gen Haar,
  \unset ignoreMelismata schlaf in himm -- li -- scher Ruh,
  schlaf -- in himm -- li -- scher Ruh.
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
          "Stille Nacht, heilige Nacht!"
	  "Gottes Sohn, o wie lacht"
	  "Lieb aus deinem göttlichen Mund"
	  "Da uns schlägt die rettende Stund,"
	  "Christ, in deiner Geburt,"
	  "Christ, in deiner Geburt."
	}
	\bold "3."
        \column {
	  "Stille Nacht, heilige Nacht!"
	  "Hirten erst kundgemacht,"
	  "Durch der Engel Halleluja."
	  "Tönt es laut von fern und nah:"
	  "Christ, der Retter ist da,"
	  "Christ, der Retter ist da."
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
