\version "2.12.2"


\layout {
  indent = #0
}

        \header
        {
                opus = "Deutsches Volkslied (um 1800)"
                title = "Still, Still, Still"
        } %%header
\score 
{
	
	<<
	\chords { f2 a:m d:m g:m c f c2 c2 f f c c f f f a:m d:m g:m c f2 }
	
	\relative c''
	{ 
		\clef "treble"
		\key f \major
		\time 3/2
		c4 (f4) a,4 (c4) f,4  f8 (a8) 
		g4 g8 (bes8) e,4  e8 (g8) f4 r8 f8
		\time 2/2
		g4  g8 (a8) bes4 g4 
		a4  a8 (bes8) c4 a4 
		g4  g8 (a8) bes4 g4 
		a4  a8 (bes8) c4 a4 \breathe 
		\time 3/2
		c4 (f4) a,4 (c4) f,4  f8 (a8) 
		g4 g8 (bes8) e,4  e8 (g8) f2
		 \bar "|."
	}
	\addlyrics {
	Still, still, still, weils Kind- lein schla- fen will!
	Ma- ri- a tut es nie- der- sin- gen,
	ih- re keu- sche Brust dar- brin- gen.
	Still, still, still, weils Kind- lein schla- fen will!
	}
	
	>>	
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
"Still, still, still weils Kindlein schlafen will."
        }
      }
      \hspace #0.1
      \line {
        \bold "4."
        \column {
"Groß, groß, groß, die Lieb’ ist übergroß."
"Gott hat den Himmelsthron verlassen"
"und muss reisen auf den Straßen."
"Groß, groß, groß, die Lieb’ ist übergroß."  
        }
      }
    }
    \hspace #0.1
    \column {
      \line {
        \bold "3."
        \column {
"Wir, wir, wir, wir rufen all zu Dir."
"Tu uns des Himmels Reich aufschliessen,"
"wenn wir einmal sterben müssen."
"Wir, wir, wir, wir rufen all zu Dir."  
        }
      }
    }
    \hspace #0.1
}

\markuplines {
  \italic {
    \line {
      Gesetzt von Richard Zillmann (http://www.notenschleuder.de)
      \general-align #Y #DOWN {
        \epsfile #X #3 #"publicdomain.eps"
      }
    }
  }
}
