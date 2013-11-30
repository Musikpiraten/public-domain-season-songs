% ****************************************************************
% *** Created on Thu Feb 03 22:24:02 CET 2011 by Wolfgang Pilz ***
% ****************************************************************

% *** Vorspann                                                 ***
\version "2.12.3"
\include "deutsch.ly"
\include "default.ly"

%#(set-default-paper-size "a5")
%#(set-global-staff-size 16)

\header {
	title = "Morgen, Kinder, wird’s was geben"
 	composer = "Melodie: Carl Gottlieb Hering (1809)"
 	poet = "Text: Martin Friedrich Philipp Bartsch (1795)"
  	tagline = ""
}


% ****************************************************************
% *** Text und Melodie                                         ***
% ****************************************************************
 
Melodie = \relative c'         
  { 	
 % Type notes here 
  \repeat volta 2 {
    g'4 d e d | e8( g) fis( a) g4 d |
    \break
    h' h8( c) d4 h | c h a2 |
  }
  \break
  c4 c e e | a, a d2 |
  \break
  g,4 g c c | h8( a) g( fis) g2 \bar "|."
}


Akkorde = \chordmode { \germanChords
 g2 c4 d:7 c d:7 g2
 g1 c4 g4 d2:7
 c1 d2:7 g g c  g4 d:7 g2
}

Text = \lyricmode {
  \set stanza = "1."
  Mor -- gen, Kin -- der, wird’s was ge -- ben,
  mor -- gen wer -- den wir uns freun;
  Ein -- mal wer -- den wir noch wach,
  hei -- ßa, dann ist Weih -- nachts -- tag!
}
Wdh = \lyricmode {
  welch ein Ju -- bel, welch ein Le -- ben
  wird in __ un -- serm Hau -- se sein!
}
% ****************************************************************
% *** Generierung                                              ***
% ****************************************************************

\score{
  <<
    \new ChordNames {\Akkorde}
    \new Voice = "Melodie" {
      %      \autoBeamOff
      \clef violin
      \key g \major
      \time 4/4
      \Melodie
    }
    \new Lyrics = Strophe \lyricsto Melodie \Text
        \new Lyrics = Strophe \lyricsto Melodie \Wdh
  >>
  %\midi {}
}

\markup {
	\fill-line{
		\hspace #0.1
		\column {\hspace #0.3
			\line {
				\bold "2."
				\column {
					"Wie wird dann die Stube glänzen"
					"von der großen Lichterzahl,"
					"schöner als bei frohen Tänzen"
					"ein geputzter Kronensaal!"
					"Wisst ihr noch vom vorgen Jahr,"
					"wie’s am Weihnachtsabend war?"
				}
			}
			\hspace #0.1
			\line {
				\bold "4."
				\column {
					"Wisst ihr noch den großen Wagen"
					"und die schöne Jagd von Blei?"
					"Unsre Kleiderchen zum Tragen"
					"und die viele Näscherei?"
					"Meinen fleißgen Sägemann"
					"mit der Kugel unten dran?"
				}
			}
		}
		\hspace #0.1
		\column {\hspace #0.3
			\line {
				\bold "3."
				\column {
					"Wisst ihr noch mein Reiterpferdchen,"
					"Malchens nette Schäferin?"
					"Jettchens Küche mit dem Herdchen"
					"und dem blank geputzten Zinn?"
					"Heinrichs bunten Harlekin"
					"mit der gelben Violin?"
				}
			}
			\hspace #0.1
			\line {
				\bold "5."
				\column {
					"Welch ein schöner Tag ist morgen,"
					"viele Freuden hoffen wir!"
					"Unsre lieben Eltern sorgen"
					"lange, lange schon dafür."
					"O gewiss, wer sie nicht ehrt,"
					"ist der ganzen Lust nicht wert!"
				}
			}
		}
		\hspace #0.1
	}
}
