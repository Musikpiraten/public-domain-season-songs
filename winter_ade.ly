% Dieses Notenblatt wurde erstellt von Michael Nausch
% Kontakt: michael@nausch.org (PGP public-key 0x2384C849) 

\version "2.14.2"
\header {
  title = "Winter ade"			 	  % Die Überschrift der Noten wird zentriert gesetzt.
  subtitle = " "                                  % weitere zentrierte Überschrift.
  poet = "Text: Hoffmann von Fallersleben"        % Name des Dichters, linksbündig unter dem Unteruntertitel.
  meter = ""                                      % Metrum, linksbündig unter dem Dichter.
  composer = "Melodie: fränkisches Volkslied" % Name des Komponisten, rechtsbüngig unter dem Unteruntertitel.
  arranger = ""                                   % Name des Bearbeiters/Arrangeurs, rechtsbündig unter dem Komponisten.
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

akkorde = \chordmode {
  f2 c4:7 f2. f2 c4:7 f2.
  f4 c:7 f4 c2.:7 c:7 f  
  f2 c4:7 f2. f2 c4:7 f2.
}

melodie = \relative c' {
  \clef "treble"
  \time 3/4
  \tempo 4 = 110
  \key f\major
  \autoBeamOff
	a'4 a4 g4 f2. a4 a4 g4 f2. \breathe
	a4 bes4 c4 c4 bes8 ([a8]) bes4 g4 a4 bes4 bes4 a8 ([g8]) a4 \breathe 
	a4 a4 bes4 c2. a4 a4 g4 f2.
   \bar "|."
}

text = \lyricmode {
  \set stanza = "1."
	Win -- ter a -- de! Schei -- den tut weh.
	A -- ber dein Schei -- den macht, daß mir das Her -- ze lacht.
	Win -- ter a -- de! Schei -- den tut weh.
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
        \line { \bold "  2. "
          \column {
	  		"Winter ade! Scheiden tut weh."
			"Gerne vergess ich dein,"
			"kannst immer ferne sein."
			"Winter ade! Scheiden tut weh."
			" "
          }
        }
      }
% { ab hier auskommentieren, wenn es nur eine Spalte sein soll
      \hspace #0.1    % horizontaler Abstand zwischen den Spalten
          \column {       % zweite Spalte rechts
        \line {
          \bold "  3. "
          \column {
			"Winter ade! Scheiden tut weh."
			"Gehst du nicht bald nach Haus,"
			"lacht dich der Kuckuck aus."
			"Winter ade! Scheiden tut weh."
			" "
          }
        }
        \hspace #0.1
        \line {
          \bold "   "
          \column {
                        " "
          }
        }
        }
% } % bis hier auskommentieren, wenn es nur eine Spalte sein soll
      \hspace #0.1  % Spalte vom linken Rand
        }
  }
}
