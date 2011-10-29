% Dieses Notenblatt wurde erstellt von Peter Crighton [http://www.petercrighton.de] 
%
% Kontakt: PeteCrighton@googlemail.com

\version "2.12.3"
\header {
  title = "Oh du fröhliche"
  poet = \markup { \column { "Text: " } \column { "Str. 1 Johannes Daniel Falk (1816)""Str. 2 & 3 Heinrich Holzschuher (1829)" } }
  composer = "Melodie: Sizilien (vor 1788)"
}
\layout {
  indent = #0
}
akkorde = \chordmode {
  d2 g d1 d2 g d1 d2 a b1:m fis2:m e a1
  a a:7 d1*2 b1:m g2 a d a d1
}
melodie = \relative c' {
  \clef "treble"
  \time 4/4
  \key d\major
  a'2 b | a4. g8 fis4( g) |
  a2 b | a4. g8 fis4( g) |
  a2 a | b cis4 d |
  cis2 b | a1 |
  e4.( fis8) e4 fis | g4.( a8) g2 |
  fis4.( g8) fis4 g | a4.( b8) a2 |
  d4( cis) b( a) | d b a g |
  fis2 e | d1 \bar "|."
}
text = \lyricmode {
  \set stanza = "1."
  Oh du fröh -- li -- che, __ oh du se -- li -- ge, __
  gna -- den -- brin -- gen -- de Weih -- nachts -- zeit!
  Welt ging ver -- lo -- ren, Christ ist ge -- bo -- ren:
  Freu -- e, __ freu -- e dich, oh Chri -- sten -- heit!
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
          "Oh du fröhliche, oh du selige,"
	  "gnadenbringende Weihnachtszeit!"
	  "Christ ist erschienen, uns zu versühnen:"
	  "Freue, freue dich, oh Christenheit!"
	}
	\bold "3."
        \column {
          "Oh du fröhliche, oh du selige,"
	  "gnadenbringende Weihnachtszeit!"
	  "Himmlische Heere jauchzen dir Ehre:"
	  "Freue, freue dich, oh Christenheit!"
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
