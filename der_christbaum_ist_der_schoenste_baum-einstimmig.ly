\version "2.12.3"
\header {
    mutopiatitle = "Der Christbaum ist der schönste Baum"
    mutopiacomposer = ""
    mutopiapoet = "Traditional"
    mutopiainstrument = "SATB"
    date = "19th century"
    source = "Das Buch der Weihnachtslieder. Bremen, 1896"
    style = "Chanson"
    maintainer = "David Herrmann"
    maintainerEmail = "hedavid@arcor.de"
    lastupdated = "2011/Nov/30"
    title = "Der Christbaum ist der schönste Baum"
    poet = "Text: Norddeutsches Volkslied"
    composer = "Melodie: Volksweise"
    footer = ""
    tagline = ""
}

\include "deutsch.ly"
\include "default.ly"

verseeins= \lyricmode {
	\set stanza = #"1."
	Der Christbaum2 ist4 der4 schöns -- te Baum,
	den wir auf Er -- den ken -- nen; ___
	Im Gar -- ten klein, im eng -- sten Raum,
	wie lieb -- lich blüht der Wun -- der -- baum,
	wenn sei -- ne Blümchen2 bren2 -- nen,4
	wenn sei -- ne Blümchen2 bren2 -- nen,4 ja bren1 -- nen.2.
}

Akkorde = \chords {
	\germanChords
	\set chordChanges = ##t
	\partial 4
	s4
	f f f f
	f4. f8 f4 c
	d:m f c f
	c c s c
	f f d4. d8
	g8:m g:m g:m g:m g4:m g:m
	c c c4. c8
	f f f f f4 f
	b c d:m c
	f2 f4 c
	f c f f
	f2 f4 b
	f2 c
	f s4
}

Melodie =
	\relative c' {
	\clef "treble"
	\key f \major
	\time 4/4
	\partial 4
	c4 |
	a' f b g |
	c4. b8 a4 g |
	f c b' a |
	a g r c |
	c a d4. c8 |
	c b b a b4 b |
	b g c4. b8 |
	b a a g a4 c, |
	d e f g |
	a2 f4 e |
	f g a b |
	c2 a4 d |
	c2 b a r4
	\bar "|."
	}

\score{
    \context ChoirStaff {
        <<
	\new ChordNames { \Akkorde }
        \new Staff { \Melodie }
        \new Lyrics {\verseeins }
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
   \fill-line{
    \hspace #0.1 
     \column {
      \line { \bold "2."
        \column {
          "Dann sieh, in dieser Wundernacht"
          "ist einst der Herr geboren;"
          "Der Heiland, der uns selig macht"
          "hätt’ er den Himmel nicht gebracht,"
          \line {
            \char ##x1D106
            "wär alle Welt verloren,"
            \char ##x1D107
          }
          "verloren."
        }
      }
      \hspace #0.1 
      \line { \bold "3."
        \column {
          "Doch nun ist Freud’ und Seligkeit,"
          "ist jede Nacht voll Kerzen."
          "Auch dir, mein Kind, ist das bereit’"
          "dein Jesus schenkt dir alles heut’"
          \line {
            \char ##x1D106
            "gern wohl es dir im Herzen,"
            \char ##x1D107
          }
          "im Herzen."
        }
     }}
    \hspace #0.1  
     \column {
      \line { \bold "4."
        \column {
          "O lass ihn ein, es ist kein Traum."
          "Er wählt dein Herz zum Garten."
          "Will pflanzen in den engen Raum"
          "den allerschönsten Wunderbaum"
          \line {
            \char ##x1D106
            "und seiner treulich warten,"
            \char ##x1D107
          }
          "ja warten."
        }
      }
    }
  \hspace #0.1 
  }
}
