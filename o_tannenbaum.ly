\version "2.12.3"

\include "default.ly"

\header {
  title="O Tannenbaum"
  composer="Melodie: Volkslied (16. Jh.)"
  poet=\markup { \column { "Text: " } \column { "Str. 1 Joachim August Zarnack (1819)""Str. 2 u. 3 Ernst Anschütz (1824)" } }
  tagline = ""
}


Melodie=\relative c' {
	\autoBeamOn
 	\partial 4 c 
 	f8. f16 f4. g8
	a8. a16 a4. a8
	g8 a bes4 e,
	g f r8 c'
	c a d4. c8
	c bes bes4. bes8
	bes g c4. bes8
	bes a a4. c,8
	f8. f16 f4. g8
	a8. a16 a4. a8
	g8 a bes4 e,
	g f
	\bar "|."
}


Akkorde= \chordmode {
  
  s4 f1. c2. f1. c1. f1. f2. c2. f2
}

Text=\lyricmode {
	\set stanza = #"1."	
	O Tan -- nen -- baum, o Tan -- nen -- baum,
	wie grün sind dei -- ne Blät- ter!
	Du grünst nicht nur zur Som -- mer -- zeit,
	nein, auch im Win -- ter, wenn es schneit._
	Oh Tan -- nen -- baum, oh Tan -- nen- baum,
	wie grün sind dei -- ne Blät -- ter!
}


\score{
  <<
    \new ChordNames {\Akkorde}
    \new Voice = "Melodie" {
      \autoBeamOff
      \clef violin
      \key f \major
      \time 3/4
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
	"O Tannenbaum, o Tannenbaum,"
	"du kannst mir sehr gefallen!"
	"Wie oft hat schon zur Winterszeit"
	"ein Baum von dir mich hoch erfreut!"
	"O Tannenbaum, o Tannenbaum,"
	"du kannst mir sehr gefallen!"
	}
	\bold "3."
        \column {
	"O Tannenbaum, o Tannenbaum,"
	"dein Kleid will mich was lehren:"
	"Die Hoffnung und Beständigkeit"
	"gibt Mut und Kraft zu jeder Zeit!"
	"O Tannenbaum, o Tannenbaum,"
	"dein Kleid will mich was lehren!"
        }
    }
  }
}

 % some settings % vim: sw=2 et
