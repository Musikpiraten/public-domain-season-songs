% Dieses Notenblatt wurde erstellt von David Göhler
% Kontakt: pirat@online.de

\version "2.14.2"
\header {
  title = "A B C, die Katze lief im Schnee"
  subtitle = " "
  poet = "Volkslied"
  tagline = "Diese Noten sind frei kopierbar für jedermann – erstellt für www.ebersberger-liedersammlung.de"
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
  d2 d2 a:7 d g a g a g d a:7 d
}

melodie = \relative c' {
  \clef "treble"
  \time 2/4
  \tempo 4 = 100
  \key d\major
%  \partial 4
  \autoBeamOff
	d4 fis a r8 d a8. g16 fis8 e d4 r8 a'\break
	g fis e d cis d e \breathe a g fis e d cis d e \breathe d\break
	g8. g16 fis8 d b'8. b16 a8 \breathe d a8. g16 fis8 e d4 r4
  \bar "|."
}

text = \lyricmode {
 \set stanza = "1."
	A, B, C, die Kat -- ze lief im Schnee, und
	als sie dann nach Hau -- se kam, da hatt' sie wei -- ße Stie -- fel an, o 
	je -- mi -- ne, o je -- mi -- ne, die Kat -- ze lief im Schnee.
}

wdh = \lyricmode {
  
}

\score {
  <<
    \new ChordNames { \akkorde }
    \new Voice = "Lied" { \melodie }
    \new Lyrics \lyricsto "Lied" { \text }
    %\new Lyrics \lyricsto "Lied" { \wdh }
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
    \hspace #0.1     % schafft ein wenig Platz zur den Noten
    \line {          % \fill-line bei 2-spaltigem Satz 
      \hspace #0.1  % Spalte vom linken Rand, auskommentieren, wenn nur eine Spalte
	  \column {      % erste Spalte links
        \line {	\bold "  2. "
          \column {
		   "A B C, die Katze lief zur Höh!"
		   "Sie leckt ihr kaltes Pfötchen rein,"
		   "und putzt sich auch die Stiefelein,"
		   "und ging nicht mehr, und ging nicht mehr,"
		   "ging nicht mehr in den Schnee."
		   " "
          }
        }
      }
      \hspace #0.1  % Spalte vom linken Rand
	}
  }
}
