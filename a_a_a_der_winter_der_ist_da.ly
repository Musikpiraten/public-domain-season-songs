% Dieses Notenblatt wurde erstellt von Michael Nausch
% Kontakt: michael@nausch.org (PGP public-key 0x2384C849) 

\version "2.14.2"

\header {
  title = "A, a, a, der Winter, der ist da"   % Die Überschrift der Noten wird zentriert gesetzt.
  subtitle = " "                              % weitere zentrierte Überschrift.
  poet = "Text: Hoffmann von Fallersleben (1850)" % Name des Dichters, linksbündig unter dem Unteruntertitel.
  meter = ""                                  % Metrum, linksbündig unter dem Dichter.
  composer = "Melodie: sächsisches Volkslied" % Name des Komponisten, rechtsbüngig unter dem Unteruntertitel.
  arranger = ""                               % Name des Bearbeiters/Arrangeurs, rechtsbündig unter dem Komponisten.
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
  \germanChords
	f2 d:m a:m s4 bes4 f4 s4 c:7 s4 f2 s2
	s2 bes4 s4 f4 s4 c:7 s4 f4 s4 bes4 s4 f4 s4 c:7 s4
	f2 d:m a:m s4 bes4 f4 s4 c:7 s4 f2
}

melodie = \relative c' {
  \clef "treble"
  \time 4/4
  \tempo 4 = 110
  \key f\major
  \autoBeamOff
	f2 a c r4 bes a a g g f2 r c'4 c bes bes a a g g \breathe c c bes bes a a g g \breathe 
	f2 a2 c r4 bes a a g g f2 r
  \bar "|."
}

text = \lyricmode {
  \set stanza = "1."
	A, a, a, der Win -- ter, der ist da!
	Herbst und Som -- mer sind ver -- gan -- gen, 
	Win -- ter, der hat an -- ge -- fan -- gen.
	A, a, a, der Win -- ter, der ist da!
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
                        "E, e, e, er bringt uns Eis und Schnee!"
                        "Malt uns gar zum Zeitvertreiben"
                        "Blumen an die Fensterscheiben."
                        "E, e, e, er bringt uns Eis und Schnee!"
			" "
          }
        }
        \hspace #0.1  % vertikaler Abstand zwischen den Strophen 
        \line { \bold "  3. "
          \column {
                        "I, i, i, vergiß die Armen nie!"
                        "Wenn Du liegst im warmen Kissen,"
                        "denk an die, die frieren müssen."
                        "I, i, i, vergiß die Armen nie!"
			" "
                  }
                }
      }
% { ab hier auskommentieren, wenn es nur eine Spalte sein soll
      \hspace #0.1    % horizontaler Abstand zwischen den Spalten
          \column {       % zweite Spalte rechts
        \line {
          \bold "  4. "
          \column {
                        "O, o, o, wie sind die Kinder froh!"
                        "sehen jede Nacht im Traume"
                        "sich schon unterm Weihnachtsbaume."
                        "O, o, o, wie sind die Kinder froh!"
			" "
          }
        }
        \hspace #0.1
        \line {
          \bold "  5. "
          \column {
                        "U, u, u, jetzt weiß ich, was ich tu!"
                        "Hol den Schlitten aus dem Keller,"
                        "und dann geht es schnell und schneller."
                        "U, u, u, jetzt weiß ich, was ich tu!"
			" "
          }
        }
        }
% } % bis hier auskommentieren, wenn es nur eine Spalte sein soll
      \hspace #0.1  % Spalte vom linken Rand
        }
  }
}


