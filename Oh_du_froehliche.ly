\version "2.12.3"

\include "default.ly"

\header {
  title="O du fröhliche"
  composer="Musik: Sizilien (vor 1788)"
  poet=\markup { \column { "Text: " } \column { "Str. 1 Johannes Daniel Falk (1816)""Str. 2 & 3 Heinrich Holzschuher (1829)" } }
  tagline = ""
}


Melodie=\relative c' {
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


Akkorde= \chordmode {
	\germanChords
  d2 g d1 d2 g d1 d2 a b1:m fis2:m e a1
  a a:7 d1*2 b1:m g2 a d a d1
}

Text=\lyricmode {
  \set stanza = "1."
  O du fröh -- li -- che, o du se -- li -- ge,
  gna -- den -- brin -- gen -- de Weih -- nachts -- zeit!
  Welt ging ver -- lo -- ren, Christ ist ge -- bo -- ren:
  Freu -- e, freu -- e dich, oh Chri -- sten -- heit!
}



\score{
  <<
    \new ChordNames {\Akkorde}
    \new Voice = "Melodie" {
      \autoBeamOff
      \clef violin
      \key d\major
      \time 4/4
      \Melodie
    }
    \new Lyrics = Strophe \lyricsto Melodie \Text
  >>
  %\midi{}
}

\markup {
    \column {
      \line {
	\bold "2."
        \column {
          "O du fröhliche, o du selige,"
	  "gnadenbringende Weihnachtszeit!"
	  "Christ ist erschienen, uns zu versühnen:"
	  "Freue, freue dich, o Christenheit!"
	}
	\bold "3."
        \column {
          "O du fröhliche, o du selige,"
	  "gnadenbringende Weihnachtszeit!"
	  "Himmlische Heere jauchzen dir Ehre:"
	  "Freue, freue dich, o Christenheit!"
        }
      }
  }
}

 % some settings % vim: sw=2 et