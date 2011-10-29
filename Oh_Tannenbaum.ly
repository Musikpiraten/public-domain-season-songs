% Created on Mon Nov 15 16:37:41 CET 2010
\version "2.12.3"

\header {
	title = "Oh Tannenbaum!" 
	poet = "Text: J. A. Zarnack (1777–1827), E. Anschütz (1780–1861)" 
	composer =  "Musik: Volksweise"
}

\include "deutsch.ly"

\layout {
  indent = #0
}

verseI= \lyricmode {
	\set stanza = #"1."	
	Oh Tan -- nen -- baum, oh Tan -- nen -- baum,
	wie grün sind dei -- ne Blät- ter!
	Du grünst nicht nur zur Som -- mer -- zeit,
	nein, auch im Win -- ter, wenn es schneit._
	Oh Tan -- nen -- baum, oh Tan -- nen- baum,
	wie grün sind dei -- ne Blät -- ter!
}
 
verseII= \lyricmode {
	\set stanza = #"2."	
	Oh Tan -- nen -- baum, oh Tan -- nen -- baum,
	du kannst mir sehr ge -- fal -- len!
	Wie oft hat schon zur Win-- ters -- zeit
	ein Baum von dir mich hoch er -- freut!
	Oh Tan -- nen -- baum, oh Tan -- nen -- baum,
	du kannst mir sehr ge -- fal -- len!
}
 
verseIII= \lyricmode {
	\set stanza = #"3."	
	Oh Tan -- nen -- baum, oh Tan -- nen -- baum,
	dein Kleid will mich was leh -- ren:
	Die Hoff- nung und Be -- stän -- dig -- keit
	gibt Mut und Kraft zu je -- der Zeit!
	Oh Tan -- nen -- baum, oh Tan -- nen -- baum,
	dein Kleid will mich was leh -- ren!
}
 

staffVoice = \new Staff {
	\time 3/4
	%\set Staff.instrumentName = "Voice"
	\set Staff.midiInstrument = "voice oohs"
	\key f \major
	\clef treble
	
	\relative c' { 	
		\context Voice = "melodyVoi" {
			\dynamicUp		
 % Type notes here 
 	\autoBeamOff
 	\partial 4 c^\mf 
 	f8. f16 f4 g
	a8. a16 a4. a8
	g8 a b4 e,
	g f r8 c'
	c a d4. c8
	c b b4. b8
	b g c4. b8
	b a a4 c,^\markup {\italic più \dynamic f}
	f8. f16 f4 g
	a8. a16 a4. a8
	g8 a b4 e,
	g f
		}
	
	\bar "|."
	}

}
staffPiano = \new PianoStaff {
	\set PianoStaff.midiInstrument = #"acoustic grand"
	%\set PianoStaff.instrumentName = #"Piano"
				<<
		\context Staff = "RH" {  % Right hand 
			\clef treble
			\key f \major
			\relative c' {
				\partial 4 c4
				<a c f>8. <a c f>16 <a c f>4 <c e g>4
				<c f a>8. <c f a>16 <c f a>4. <c f a>8
				<d g>8 <d fis a>8 <d g b>4 <c e>4
				<c e g>4 <c a f'>4 r8 <c f c'>8 
				
				<f c' c,>8 <c f a>8 <<{d'4. c8} \\ {d,2} \\ {f4 fis4}>>
				<< {c'8 b8} \\ {<d, g>4} >> << {b'4. b8} \\ {<d, g>2}>>
				<< {b'8 g8} \\ <g c,>4>> <<{c4. b8} \\ {<g e>4 <g c,>4}>>
				<< {<b g>8 <a f>8} \\ c,4>> <c f a>4 c4
				<a c f>8. <a c f>16 <a c f>4 <c e g>4
				<c f a>8. <c f a>16 <c f a>4. <c f a>8
				<d g>8 <d fis a>8 <d g b>4 <c e d>4
				<b c e g>4 <c a f'>4
				
			}
		}
		\context Staff = "LH" {  % Left hand 			
			\clef bass
			\key f \major
			\relative c {
				\partial 4 c4^\mf
				<c f f,>8. <c f f,>16 <c f f,>4 <c c,>4
				<f f,>8. <f f,>16 <f f,>4. <f f,>8
				<b, b'>8 <a a'>8 <g g'>4 <c b'>4
				<b' f>4 <e, f,>4 r8 <a, a'>8
				
				<a a'>8 <f f'>8 <b b'>4 <a a'>4
				<g g'>4 <g g,>4 <g g'>8 <f f'>8
				<e e'>8 <d d'>8 <c c'>4 <e e'>4 
				<f f'>4 <f f,>4 c'4^\markup {\italic più \dynamic f}
				<c f f,>8. <c f f,>16 <c f f,>4 <c c,>4
				<f f,>8. <f f,>16 <f f,>4. <a a,>8
				<b, b'>8 <a a'>8 <g g'>4 c4
				<c c,>4 <f f,>4
			}
		}
	>>
}


harmonies = \new ChordNames \chordmode {
	\germanChords
}

\score {
	<<
		\harmonies
		\staffVoice
		\context Lyrics = "lmelodyVoiLI" \lyricmode { \lyricsto "melodyVoi" \verseI }
		
		\context Lyrics = "lmelodyVoiLII" \lyricmode { \lyricsto "melodyVoi" \verseII }
		
		\context Lyrics = "lmelodyVoiLIII" \lyricmode { \lyricsto "melodyVoi" \verseIII }
		
		\staffPiano
	>>
	
	\midi {
	}

  \layout {
  }
}

\paper {
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
