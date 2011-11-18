\version "2.12.3"

\include "default.ly"

\header {
  title="Kling, Glöckchen, klingelingeling"
  composer="Musik: Benedikt Widman (1884) / Volkslied"
  poet="Text: Karl Enslin (ca. 1850)"
  tagline = ""
}


Melodie=\relative c'' {
  c2 a4 bes4 c8 d c d c2 bes g4 c a1 \break
  g4 g a f a2 g bes4 bes c g bes2 a
  g4 g a b c2 g a4 d c b d2 c 
  c2 a4 bes4 c8 d c d c2 bes g4 c a1
  \bar "|."
}


Akkorde= \chordmode {
	\germanChords
  f1 s1 c1:7 f c2:7 f1 c2:7 bes2 c1:7 f2
  g1 c1:7 d2:m g1 c2:7 f1 s1 c1:7 f
}

Text=\lyricmode {
	\set stanza = #"1. "
 	Kling, Glöck -- chen, klin -- ge -- lin -- ge -- ling,
	kling, Glöck -- chen, kling!
	Lasst mich ein, ihr Kin -- der,
	ist so kalt der Win -- ter,
	öff -- net mir die Tür -- en,
	lasst mich nicht er -- frie -- ren!
	Kling, Glöck -- chen, klin -- ge -- lin -- ge -- ling,
	kling, Glöck -- chen, kling!
	
	}


\score{
  <<
    \new ChordNames {\Akkorde}
    \new Voice = "Melodie" {
      \autoBeamOn
      \clef violin
      \key f \major
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
    "Kling, Glöckchen, klingelingeling,"
	"Kling, Glöckchen, kling!"
	"Mädchen, hört, und Bübchen,"
	"macht mir auf das Stübchen,"
	"bring euch viele Gaben,"
	"sollt euch dran erlaben."
	"Kling, Glöckchen, klingelingeling,     "
	"kling, Glöckchen, kling!"
	}
	\bold "3."
        \column {
	"Kling, Glöckchen, klingelingeling,"
	"kling, Glöckchen, kling!"
	"Hell erglühn die Kerzen,"
	"öffnet mir die Herzen!"
	"Will drin wohnen fröhlich,"
	"frommes Kind, wie selig."
	"Kling, Glöckchen, klingelingeling,"
	"kling, Glöckchen, kling!"
        }
      }
  }
}

 % some settings % vim: sw=2 et
