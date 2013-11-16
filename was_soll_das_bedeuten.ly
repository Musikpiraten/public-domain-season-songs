% Dieses Notenblatt wurde erstellt von David Göhler
% Kontakt: pirat@online.de

\version "2.14.2"
\header {
  title = "Was soll das bedeuten" 	 	  % Die Überschrift der Noten wird zentriert gesetzt.
  % subtitle = " "                                  % weitere zentrierte Überschrift.
  %  poet = "Text: "        			  % Name des Dichters, linksbündig unter dem Unteruntertitel.
  meter = ""                                      % Metrum, linksbündig unter dem Dichter.
  composer = "schlesisches Volkslied" 		  % Name des Komponisten, rechtsbüngig unter dem Unteruntertitel.
  arranger = " "                                   % Name des Bearbeiters/Arrangeurs, rechtsbündig unter dem Komponisten.
  tagline = "Diese Noten sind frei kopierbar für jedermann – erstellt für www.ebersberger-liedersammlung.de"
                                                  % Zentriert unten auf der letzten Seite.
%  copyright = "Diese Noten sind frei kopierbar für jedermann – erstellt für www.ebersberger-liedersammlung.de"
                                                  % Zentriert unten auf der ersten Seite (sollten tatsächlich zwei
                                                  % seiten benötigt werden"
}

% Seitenformat und Ränder definieren
\paper {
  #(set-paper-size "a4")    % Seitengröße auf DIN A4 setzen.
  after-title-space = 1\cm  % Die Größe des Abstands zwischen der Überschrift und dem ersten Notensystem.
  bottom-margin = 5\mm      % Der Rand zwischen der Fußzeile und dem unteren Rand der Seite.
  top-margin = 10\mm        % Der Rand zwischen der Kopfzeile und dem oberen Rand der Seite.

  left-margin = 22\mm       % Der Rand zwischen dem linken Seitenrand und dem Beginn der Systeme/Strophen.
  line-width = 175\mm       % Die Breite des Notensystems.
}


\layout {
  indent = #0
}


akkorde = \chordmode { \germanChords
  s4
  \repeat "volta" 2 {
  	g2 d4 c2 g4 d2 c4
  }
  \alternative {
  	{ d2 s4}
  	{ d2 s4 }
  }
  d2. g2. g2. d2. g2 c4 d2 g4 c g d g2
}

melodie = \relative c' {
  \clef "treble"
  \time 3/4
  \tempo 4 = 100
  \key g\major
  \partial 4
  \autoBeamOn
    g'8( a) 
	\repeat "volta" 2 {
		b4 b a8( b) c4 c b8( c) d4 d c8( b)
	} 
    \alternative { {  a2\breathe  g8( a) } {  a2 r4 } } \break
	a4 a8( g) a( c) b2 r4 b4 b8( a) b( c) a2\breathe d8( c) \break
	b4 d c8( b) a( b) c4 b8( a) g( a) b4 a g2
  \bar "|."
}

text = \lyricmode {
 \set stanza = "1."
	Was soll das be -- deu -- ten, es ta -- get ja schon? Ich 2.
	\skip 2. Schaut nur da -- her! Schaut nur da -- her!
	Wie glän -- zen die Stern -- lein, je län -- ger, je mehr.
}

wdh = \lyricmode {
  \skip 4 weiß wohl, es geht erst um Mit -- ter -- nacht \skip 2. \skip 4 rum.
}

\score {
  <<
    \new ChordNames { \akkorde }
    \new Voice = "Lied" { \melodie }
    \new Lyrics \lyricsto "Lied" { \text }
    \new Lyrics \lyricsto "Lied" { \wdh }
  >>
  \layout { }
}

\score {
  \unfoldRepeats
  <<
	\new ChordNames { \akkorde }
	\new Voice = "Lied" { \melodie }
  >>	
  \midi { }
}


\markup {
    \column {
      \hspace #0.3
      \line {
 		\bold "  2. "
        \column {
			"Treibt zusammen, treibt zusammen die Schäflein fürbass,"
			"Treibt zusammen, treibt zusammen, dort zeig ich euch was:"
			"Dort in dem Stall, dort in dem Stall,"
			"werd't Wunderding sehn, treibt zusammen einmal."
			" "
		}
      }
     \hspace #0.1
      \line {
        \bold "  3. "
        \column {
			"Ich hab nur ein wenig von weitem geguckt,"
			"da hat mir mein Herz schon vor Freuden gehupft."
			"Ein schönes Kind, ein schönes Kind"
			"liegt dort in der Krippe bei Esel und Rind."
			" "
		}
      }
      \hspace #0.1
      \line {
        \bold "  4. "
        \column {
			"Ein herziger Vater, der steht auch dabei,"
			"ein' wunderschön Jungfrau kniet auch auf dem Heu."
			"Um und um singt's, um und um klingt's;"
			"man sieht ja kein Lichtlein, so um und um brinnt's."
			" "
        }
      }
      \hspace #0.1
      \line {
        \bold "  5. "
        \column {
			"Das Kindlein, das zittert vor Kälte und Frost,"
			"ich dacht' mir: I wer hat's denn also verstoßt,"
			"dass man auch heut', dass man auch heut'"
			"ihm sonst keine and're Herberg' anbeut?"
			" "
        }
      }
      \hspace #0.1
      \line {
        \bold "  6. "
        \column {
			"So gehet und nehmet ein Lämmlein vom Gras"
			"und bringet dem schönen Christkindlein etwas!"
			"Geht nur fein sacht, geht nur fein sacht,"
			"auf dass ihr dem Kindlein kein' Unruh' nicht macht."
			" "
        }
      }
	}
}

%{
\markuplines {
  \italic {
    \line {
      Gesetzt von Michael Nausch aka Django
      \general-align #Y #DOWN {
        \epsfile #X #3 #"publicdomain.eps"
      }
    }
  }
}
%}
