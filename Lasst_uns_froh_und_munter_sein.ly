\version "2.12.3"

\include "default.ly"

\header {
  title="Lasst uns froh und munter sein"
  composer="Musik: Volksweise"
  poet="Text: Aus dem Hunsrück (19. Jh.)"
  tagline = ""
}


Melodie=\relative c' {
	a'4 a4 a8[ b8] a8[ g8]
	fis4 fis4 fis4 r4
	g4 g4 g8[ a8] g8[ fis8] \break
	e4 e4 e4 r4
	d4 e4 fis4 g4
	a8. b16 a8 b8 a2 \break
	d4 a4 a8[ b8] a8[ g8]
	fis4 e4 a2
	d4 a4 a8[ b8] a8[ g8]
	fis4 e4 d2
	\bar "|."
}


Akkorde= \chordmode {
	\set chordChanges = ##t
	d4 d d8 d d d d4 d d s
	a:7 a:7 a8:7 a:7 a:7 a:7 a4:7 a:7 a:7 s
	d4 a d d d8. d16 d8 d d2 d4 d d8 d d d
	d4 d a2:7 d4 d a8 a a a d4 a d2
}

Text=\lyricmode {
	\set stanza = #"1."
	Lasst uns froh und mun -- ter sein
	und uns recht von Her -- zen freu’n!
	Lus -- tig, lus -- tig, tra -- la -- la -- la -- la,
	bald ist Nik -- laus -- a -- bend da,
	bald ist Nik -- laus -- a -- bend da!
}


\score{
  <<
    \new ChordNames {\Akkorde}
    \new Voice = "Melodie" {
      \autoBeamOff
      \clef treble
      \key d \major
      \time 4/4
      \tempo 4 = 100
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
      \line { \bold "2."
        \column {
          "Dann stell ich den Teller raus," 
          "Niklaus legt gewiss was drauf."
          \bold "Refrain:" "Lustig, lustig…"
        }
      }
      \hspace #0.1 
      \line { \bold "3."
        \column {
          "Wenn ich schlaf, dann träume ich:" 
          "Jetzt bringt Niklaus was für mich."
          \bold "Refrain:" "Lustig, lustig…"
        }
      }
    }
    \hspace #0.1  
     \column {
      \line { \bold "4."
        \column {
          "Wenn ich aufgestanden bin,"
          "lauf ich schnell zum Teller hin."
          \bold "Refrain:" "Lustig, lustig…"
        }
      }
      \hspace #0.1 
      \line { \bold "5."
        \column {
          "Niklaus ist ein guter Mann," 
          "dem man nicht genug danken kann."
          \bold "Refrain:" "Lustig, lustig…"
        }
      }
    }
  \hspace #0.1 
  }
}

 % some settings % vim: sw=2 et
