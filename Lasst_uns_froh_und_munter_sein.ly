% Created on Mon Nov 15 16:37:41 CET 2010
\version "2.12.3"

\header {
	title = "Lasst uns froh und munter sein" 
	poet = "Text: Aus dem Hunsrück (19. Jh.), Autor unbekannt" 
	composer =  "Musik: unbekannter Komponist"

}

\include "deutsch.ly"

\layout {
  indent = #0
}
verseI= \lyricmode {
	\set stanza = #"1."	
	Lasst uns froh _  und _ mun -- ter sein
	und uns recht _ von _ Her -- zen freu'n!
	Lus -- tig, lus -- tig, tra -- la -- la -- la -- la,
	bald ist Nik - laus - a -- bend da,
	bald ist Nik - laus - a -- bend da!
}


staffVoice = \new Staff {
	\numericTimeSignature
	\time 4/4
	%\set Staff.instrumentName = "Voice"
	\set Staff.midiInstrument = "voice oohs"
	\key d \major
	\clef treble
	
	\relative c' { 	
		\context Voice = "melodyVoi" {
			\dynamicUp		
 % Type notes here 
 	%\autoBeamOff
 	\tempo 4 = 100
 	a'4 a4 a8 h8 a8 g8
 	fis4 fis4 fis4 r4
        \break
 	g4 g4 g8 a8 g8 fis8 
 	e4 e4 e4 r4
        \break
 	d4 e4 fis4 g4
 	a8. h16 a8 h8 a2
        \break
 	d4 a4 a8 h8 a8 g8
 	fis4 e4 a2
        \break
 	d4 a4 a8 h8 a8 g8
 	fis4 e4 d2
		}
	}

}


harmonies = \new ChordNames \chordmode {
	\germanChords
}

\score {
	<<
		\harmonies
		\staffVoice
		\context Lyrics = "lmelodyVoiLI" \lyricmode { \lyricsto "melodyVoi" \verseI }
		
	>>
	
	\midi {
	}

  \layout {
  }
}
\markup {
  \fill-line {
    \hspace #0.1 
     \column {
      \line { \bold "2."
        \column {
          "Dann stell ich den Teller raus," 
          "Niklaus legt gewiss was drauf."
          \bold "Refrain:" "Lustig, lustig ..."
        }
      }
      \hspace #0.1 
      \line { \bold "3."
        \column {
          "Wenn ich schlaf, dann träume ich:" 
          "Jetzt bringt Niklaus was für mich."
          \bold "Refrain:" "Lustig, lustig ..."
        }
      }
    }
    \hspace #0.1  
     \column {
      \line { \bold "4."
        \column {
          "Wenn ich aufgestanden bin,"
          "lauf ich schnell zum Teller hin."
          \bold "Refrain:" "Lustig, lustig ..."
        }
      }
      \hspace #0.1 
      \line { \bold "5."
        \column {
          "Niklaus ist ein guter Mann," 
          "dem man nicht genug danken kann."
          \bold "Refrain:" "Lustig, lustig ..."
        }
      }
    }
  \hspace #0.1 
  }
}


\markuplines {
  \italic {
    \line {
      Gesetzt von David Herrmann
      \general-align #Y #DOWN {
        \epsfile #X #3 #"publicdomain.eps"
      }
    }
  }
}
