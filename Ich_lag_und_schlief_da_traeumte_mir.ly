\version "2.12.3"
\header {
    mutopiatitle = "Ich lag und schlief, da träumte mir"
    mutopiacomposer = ""
    mutopiapoet = "Traditional, German: Hoffmann von Fallersleben"
    mutopiainstrument = "SATB"
    date = "19th century"
    source = "Das Buch der Weihnachtslieder. Bremen, 1´896"
    style = "Chanson"
    maintainer = "David Herrmann"
    maintainerEmail = "hedavid@arcor.de"
    lastupdated = "2011/Nov/30"
    title = "Ich lag und schlief, da träumte mir"
    poet = "Hoffmann von Fallersleben (1798-1872)"
    composer = "Volksweise"

    tagline = \markup{
    	    \column{}}
    footer = ""
}

\layout {
  indent = #0
}

\include "deutsch.ly"

verseeins= \lyricmode {
	\set stanza = #"1."
	Ich lag und schlief, da träum -- te mir
	ein wun -- der -- schö -- ner Traum:2. 
	Es4 stand4 auf4 un -- serm Tisch vor mir
	ein hoh -- er Weih -- nachts -- baum.
}
 

upper = 
    \relative c' {
    \slurDown
    \clef "treble"
    \key d\major
    \override Staff.TimeSignature   #'style = #'numbered
    \time 4/4
    \partial 4 
    << {d8 fis8} \\ {d4} >>
    <<{a'4 a fis d} \\ {d4 d d d}>>
    << {e8 d8 e8 fis8 e4 d8 fis8} \\ {cis4 cis4 cis4 d4}>>
    << {a'4 a4 fis4 d4} \\ {d4 d4 d4 d4} >>
    << {e2} \\ {cis2} >> r4 <<{a'8 cis8} \\ {cis,8 e8}>>
    << {e'4 e4 cis4 e4} \\ {g,4 g4 g4 e4} >>
    << {a4. d8 d4 a8 cis8}\\{d,4. fis8 fis4 cis8 e8}>>
    << {e'4 e4 cis a} \\ {g4 g g g}>>
    << {d'2} \\ {fis,2}>> r4
    \bar "|."
    }
    

lower = 
    \relative c {
    \clef "bass"
    \key d\major
    \override Staff.TimeSignature   #'style = #'numbered
    \time 4/4
    \partial 4
    
    << {fis4} \\ {d4} >>
    << {fis4 fis4 a4 fis4} \\ {d d d d} >>
    << {g4 g g fis} \\ {a, a a d}>>
    << {fis fis a a} \\ {d, d d fis} >>
    << {a2} \\ {a2} >> r4 << {a4} \\ {a,4} >>
    << {cis'4 cis4 e4 cis4} \\ {a4 a a a8 g8} >>
    << {d'4. a8 a4 a} \\ {fis4. d8 d4 a'} >>
    << {cis cis e cis} \\ {a, a a' a} >>
    << {a2} \\ {d,2}>> r4
    
    \bar "|."
    }

\score{ 
    \context ChoirStaff {
        <<
        \new Staff { \upper }
        \new Lyrics {\verseeins }
        \new Staff { \lower }
        >>
    }

\layout{ \context{
           \Voice 
        }
         \context{
           \Staff  } 
	}


  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 120 4)
      }
    }
}
\markup {
    \hspace #0.1 
     \column {
      \line { \bold "2."
        \column {
          "Und bunte Lichter ohne Zahl,"
          "Die brannten rings umher,"
          "Die Zweige waren allzumal"
          "Von goldnen Äpfeln schwer."
        }
      }
      \hspace #0.1 
      \line { \bold "3."
        \column {
          "Und Zuckerpuppen hingen dran;"
          "Das war mal eine Pracht!"
          "Da gabs, was ich nur wünschen kann"
          "Und was mir Freude macht."
        }
      }
      \hspace #0.1 
      \line { \bold "4."
        \column {
          "Und als ich nach dem Baume sah"
          "Und ganz verwundert stand,"
          "Nach einem Apfel griff ich da,"
          "Und alles, alles schwand."
        }
      }
    }
    \hspace #0.1  
     \column {
      \line { \bold "5."
        \column {
          "Da wacht ich auf aus meinem Traum"
          "Und dunkel wars um mich:"
          "Du lieber, schöner Weihnachtsbaum,"
          "Sag an, wo find ich dich?"
        }
      }
      \hspace #0.1 
      \line { \bold "6."
        \column {
          "Da war es just, als rief er mir:"
          "„Du darfst nur artig sein,"
          "Dann steh ich wiederum vor dir —"
          "Jetzt aber schlaf nur ein!“"
        }
      }
      \hspace #0.1 
      \line { \bold "7."
        \column {
          "„Und wenn du folgst und artig bist,"
          "Dann ist erfüllt dein Traum,"
          "Dann bringet dir der heilge Christ"
          "Den schönsten Weihnachtsbaum.“"
        }
      }
    }
  \hspace #0.1 
}


\paper {
}


\markuplines {
  \italic {
            \column {"Der Notensatz basiert auf dem Satz aus „Das Buch der Weihnachtslieder“, 1896." 
                    "Von David Herrmann in Lilypond gesetzt."}
            }
      \general-align #Y #DOWN {
        \epsfile #X #3 #"publicdomain.eps"
  }
}