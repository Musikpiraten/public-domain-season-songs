\version "2.12.3"

\include "default.ly"

\header {
  title="Morgen kommt der Weihnachtsmann"
  composer="Melodie: Frz. Volkslied"
  poet="Text: Hoffmann von Fallersleben (um 1840)"
  tagline = ""
}


Melodie=\relative c'' {
    g4 g d' d
    e e d2
    c4 c b b
    a2 g
    \break
    d'4 d c c 
    b b a2
    d4 d c c 
    b b a2
    \break
    g4 g d' d 
    e e d2
    c4 c b b 
    a2 g  
	  \bar "|."
}


Akkorde= \chordmode {
  g1 c2 g d:7 g d:7 g g d:7 g d:7 g d:7 g d:7 g1 c2 g d:7 g d:7 g
}

Text=\lyricmode {
	\set stanza = #"1. "
 	Mor -- gen kommt der Weih -- nachts -- mann, 
	kommt mit sei -- nen Ga -- ben. 
	Trom- mel, Pfei- fe und Ge -- wehr, 
	Fahn und Sä- bel und noch mehr, 
	ja ein gan -- zes Krie -- ges -- heer, 
	möcht ich ger -- ne ha -- ben. 
}


\score{
  <<
    \new ChordNames {\Akkorde}
    \new Voice = "Melodie" {
      \autoBeamOff
      \clef violin
      \key g \major
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
	"Bring' uns, lieber Weihnachtsmann,   "
	"Bring' auch morgen, bringe"
	"Musketier und Grenadier,"
	"Zottelbär und Panthertier,"
	"Ross und Esel, Schaf und Stier,"
	"Lauter schöne Dinge."
	}
	\bold "3."
        \column {
	"Doch du weißt ja unsern Wunsch,"
	"Kennest unsere Herzen."
	"Kinder, Vater und Mama,"
	"Auch sogar der Großpapa,"
	"Alle, alle sind wir da,"
	"Warten dein mit Schmerzen."
        }
      }
  }
}

 % some settings % vim: sw=2 et
