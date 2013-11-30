% Dieses Notenblatt wurde erstellt von Michael Nausch
% Kontakt: michael@nausch.org (PGP public-key 0x2384C849) 

\version "2.14.2"

\header {
  title = "Vom Himmel hoch, ihr Englein kommt"	  % Die Überschrift der Noten wird zentriert gesetzt.
  poet = "Text: geistl. Wiegenlied (um 1700)"	  % Name des Dichters, linksbündig unter dem Unteruntertitel.
  composer = "Melodie: Kölner Gesangbuch (1625)"	  % Name des Komponisten, rechtsbüngig unter dem Unteruntertitel.
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

akkorde = \transpose d f \chordmode {
  \germanChords
  \partial 4
	%s4 d2. a d s a d a d s a d2 a4 d2. a2 b4:m d2 g4 d2. a2. s2 g4 d2. g2 a4 d2. b:m d s2 a4 d2 
	s4 d2. a d s a d a d s a d2 a4 d2. a2 g4 d2 g4 d2. a2. s2 g4 d2. g2 a4 d2. g d s2 a4 d2
}

melodie = \transpose d f \relative c' {
  \clef "treble"
  \time 3/4
  \tempo 4 = 120
  \key d\major
  \autoBeamOff
  \partial 4
	fis4 fis4 (e) d a'2 fis4 d (e) fis d2. \breathe a' fis a fis \breathe \break d4 e fis a g fis d2 cis4 d2 \breathe a'4 \break
	a2 g4 fis2 b4 a (g) fis e2 \breathe a4 e (fis) g \break a2 d,4 d2 cis4 d2 \breathe g4 g (fis) e fis (g) a fis2 e4 d2
  \bar "|."
}

text = \lyricmode {
  \set stanza = "1."
	Vom Him -- mel hoch, ihr Eng -- lein kommt! Ei -- a, ei -- a, su -- sa -- ni, su -- sa -- ni,
	su -- sa -- ni! Kommt, singt und springt, kommt, pfeif und trombt!
	Al -- le -- lu -- ja, al -- le -- lu -- ja. Von Je -- sus singt und Ma -- ri -- a.
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
			"Kommt ohne Instrumenten nit,"
			"Eia, eia, susani, susani, susani!"
			"Bringt Lauten, Harfen, Geigen mit."
			"Alleluja, alleluja."
			"Von Jesus singt und Maria."
			" "
          }
        }
        \hspace #0.1  % vertikaler Abstand zwischen den Strophen 
        \line { \bold "  3. "
          \column {
                        "Das Lautenspiel muß lauten süß,"
                        "eia, eia, susani, susani, susani!"
                        "Davon das Kindlein schlafen müß."
                        "Alleluja, alleluja."
                        "Von Jesus singt und Maria."
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
                        "Singt Fried' den Menschen weit und breit."
                        "Eia, eia, susani, susani, susani!"
                        "Gott Preis und Ehr in Ewigkeit."
                        "Alleluja, alleluja."
                        "Von Jesus singt und Maria."
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
