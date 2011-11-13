\version "2.12.3"

\include "default.ly"

\header {
  title="Still, still, still"
  composer=""
  poet="Text & Musik: Volkslied aus dem Salzburger Land (19. Jh.)"
  tagline = ""
}


Melodie=\relative c'' {
		\clef "treble"
		\key f\major
		\time 4/4
		
		c4( f4) a,4( c4) f,4 f8( a8) g4 g8( bes8)
		e,4 e8( g8) f4 r8 f8 g4 g8( a8) bes4 g4 \break
		a4 a8( bes8) c4 a4 g4 g8( a8) bes4 g4 a4 a8( bes8) c4 a4
		c4( f4) a,4( c4) f,4 f8( a8) g4 g8( bes8) e,4 e8( g8) f4 r4
		
}


Akkorde= \chordmode {
f2 a:m d:m g:m c f c1 f c f f2 a:m d:m g:m c f2
}

Text=\lyricmode {
  \set stanza = "1."
	Still, Still, still, weil's Kind -- lein schla -- fen will.
	Ma -- ri -- a tut es nie -- der -- sing -- en,
	ih -- re keu -- sche Brust dar -- brin -- gen.
	Still, still, still, weil's Kind -- lein schla -- fen will.
}


\score{
  <<
    \new ChordNames {\Akkorde}
    \new Voice = "Melodie" {
      \autoBeamOff
      \clef violin
      \key f\major
      \time 4/4
      \Melodie
    }
    \new Lyrics = Strophe \lyricsto Melodie \Text
  >>
  %\midi{}
}

\markup {
    \hspace #0.1
    \column {
      \line {
        \bold "2."
        \column {
  "Still, still, still weil’s Kindlein schlafen will."
"Die Englein tun schön jubilieren,"
"bei dem Kripplein musizieren."
"Still, still, still weil's Kindlein schlafen will."
        }
      }
      \hspace #0.1
      \line {
        \bold "4."
        \column {
		
"Wir, wir, wir, wir rufen all zu Dir."
"Tu uns des Himmels Reich aufschließen,"
"wenn wir einmal sterben müssen."
"Wir, wir, wir, wir rufen all zu Dir."  
        }
      }
    }
    \hspace #0.1
    \column {
      \line {
        \bold "3."
        \column {
"Groß, groß, groß, die Lieb’ ist übergroß."
"Gott hat den Himmelsthron verlassen"
"und muss reisen auf den Straßen."
"Groß, groß, groß, die Lieb’ ist übergroß." 
        }
      }
    }
    \hspace #0.1
}

 % some settings % vim: sw=2 et