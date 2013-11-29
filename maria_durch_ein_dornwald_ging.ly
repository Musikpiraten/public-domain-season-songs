% Dieses Notenblatt wurde erstellt von Michael Nausch
% Kontakt: michael@nausch.org (PGP public-key 0x2384C849) 

\version "2.14.2"
\header {
  title = "Maria durch ein Dornwald ging"     % Die Überschrift der Noten wird zentriert gesetzt. 
  poet = "Volkslied, aus dem 17.Jhd."	                      % Name des Dichters, linksbündig unter dem Unteruntertitel. 
  tagline = "Diese Noten sind frei kopierbar für jedermann – erstellt für www.ebersberger-liedersammlung.de" 
	    				      % Zentriert unten auf der letzten Seite.
%  copyright = "Diese Noten sind frei kopierbar für jedermann – erstellt für www.ebersberger-liedersammlung.de"
	    				      % Zentriert unten auf der ersten Seite (sollten tatsächlich zwei 
					      %	seiten benötigt werden"
}

% Seitenformat und Ränder definieren
\paper {
  #(set-paper-size "a4")    % Seitengröße auf DIN A4 setzen.
  after-title-space = 2\cm  % Die Größe des Abstands zwischen der Überschrift und dem ersten Notensystem.
  bottom-margin = 5\mm      % Der Rand zwischen der Fußzeile und dem unteren Rand der Seite.
  top-margin = 10\mm        % Der Rand zwischen der Kopfzeile und dem oberen Rand der Seite.

  left-margin = 22\mm       % Der Rand zwischen dem linken Seitenrand und dem Beginn der Systeme/Strophen.
  line-width = 175\mm       % Die Breite des Notensystems.
}


\layout {
  indent = #0
} 


% Akkorde für die Gitarrenbegleitung
akkorde = \transpose g a \chordmode {
  \germanChords
	s4 g4.:m f8 ees4 d c2:m d g:m c:m
	d1 g2:m bes c:m f
	ees g:m f d ees4. f8 g4:m d:m g2.:m
}


melodie= \transpose g c \relative c'' {
        \clef "treble"
        \key g \major
        \time 4/4
        \tempo 4 = 110
        \autoBeamOff
	\partial 4
	b4 e4. fis8 g4 b g fis8 ([e8]) fis2 \breathe g4 g8 g a2 \break
	b2 r4 g8 ([a8]) b4. a8 b4 c8 ([b8]) a4. g8 a4 \breathe b8 ([a8]) g4. fis8
	g8 g a g fis4. e8 fis2 \breathe e4. fis8 g4 b4 g8 ([fis]) e2
	\bar "|."
}


text = \lyricmode {
  \set stanza = "1."
	Ma -- ri -- a durch ein' Dorn -- wald ging. Ky -- rie e -- lei -- son.
	Ma -- ri -- a durch ein' Dorn -- wald ging, der hat in sie -- ben Jahr
	kein  Laub ge -- trag'n. Je -- sus und Ma -- ri -- a!
}


\score {
  <<
    \new ChordNames { \akkorde }
    \new Voice = "Lied" { \melodie }
    \new Lyrics \lyricsto "Lied" { \text }
  >>
  \midi { }
  \layout { }
}

\markup {
	\column {
    \hspace #0.1     % schafft ein wenig Platz zur den Noten
    \fill-line {
      \hspace #0.1  % Spalte vom linken Rand, auskommentieren, wenn nur eine Spalte
	  \column {      % erste Spalte links
        \line {	\bold "  2. "
          \column {
			"Was trug Maria unter ihrem Herzen?"
			"Kyrieleison!"
			"Ein kleines Kindlein ohne Schmerzen,"
			"das trug Maria unter ihrem Herzen!"
			"Jesus und Maria."
			" "
          }
        }
        \hspace #0.1  % vertikaler Abstand zwischen den Strophen 
        \line { \bold "  3. "
          \column {
			"Da hab'n die Dornen Rosen getragen."
			"Kyrieleison!"
			"Als das Kindlein durch den Wald getragen,"
			"da haben die Dornen Rosen getragen!"
			"Jesus und Maria."
			" "
		  }
		}
        \hspace #0.1  % vertikaler Abstand zwischen den Strophen 
        \line { \bold "  4. "
          \column {
            		"Wie soll dem Kind sein Name sein?"
			"Kyrieleison!"
			"Der Name, der soll Christus sein,"
			"das war von Anfang der Name sein!"
			"Jesus und Maria."
			" "
		  }
		}
      }
% { ab hier auskommentieren, wenn es nur eine Spalte sein soll
      \hspace #0.1    % horizontaler Abstand zwischen den Spalten
	  \column {       % zweite Spalte rechts
        \line {
          \bold "  5. "
          \column {
            		"Wer soll dem Kind sein Täufer sein?"
			"Kyrieleison!"
			"Das soll der Sankt Johannes sein,"
			"der soll dem Kind sein Täufer sein!"
			"Jesus und Maria."
			" "
          }
        }
        \hspace #0.1
        \line {
          \bold "  6. "
          \column {
            		"Was kriegt das Kind zum Patengeld?"
			"Kyrieleison!"
			"Den Himmel und die ganze Welt,"
			"das kriegt das Kind zum Patengeld!"
			"Jesus und Maria."
			" "
          }
        }
        \hspace #0.1
        \line {
          \bold "  7. "
          \column {
            		"Wer hat erlöst die Welt allein?"
			"Kyrieleison!"
			"Das hat getan das Christkindlein,"
			"das hat erlöst die Welt allein!"
			"Jesus und Maria."
			" "
          }
        }
      }
% } % bis hier auskommentieren, wenn es nur eine Spalte sein soll
      \hspace #0.1  % Spalte vom linken Rand
	}
  }
}


