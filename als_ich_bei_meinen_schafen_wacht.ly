% Dieses Notenblatt wurde erstellt von David Göhler
% Kontakt: david@dgoehler.de

\version "2.14.2"
\header {
  title = "Als ich bei meinen Schafen wacht'"	  % Die Überschrift der Noten wird zentriert gesetzt.
  subtitle = " "                                  % weitere zentrierte Überschrift.
%  poet = "Text: " 			          % Name des Dichters, linksbündig unter dem Unteruntertitel.
  meter = ""                                      % Metrum, linksbündig unter dem Dichter.
  composer = "Volkslied aus dem 17. Jahrhundert"  % Name des Komponisten, rechtsbüngig unter dem Unteruntertitel.
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

% Akkorde für die Gitarrenbegleitung
akkorde = \chordmode {
  \germanChords
  %\partial 4
	\repeat "volta" 2 {
	    bes4 c:m d4.:m bes8 ees4 f bes2 g4:m c:m d4.:m bes8 ees4 f bes2
	}
	s4 g:m d2 g2:m d2 g2:m g4:m c4:m d2 g4:m f4 bes2 bes4 f8 g:m d4:m ees c:m d g2:m bes4 f8 g:m d4:m g:m c:m d g2:m
}

melodie = \relative c'' {
  \clef "treble"
  \time 4/4
  \tempo 4 = 110
  \key g\minor
  \autoBeamOff
	\repeat volta 2 {
      bes4 a8 g f4. f8 g4 a bes2 \breathe bes4 a8 g f4. f8 g4 a bes2 \breathe
    }
    r4 bes a4. a8 g2 a4. a8 g2 \breathe bes4 c d2 bes4 c d2  \breathe d4 c8 bes
    a4 g a fis g2  \breathe d'4 c8 bes a4 g a fis g2 r2
  %\bar "|."
}

text = \lyricmode {
	\set stanza = "1."
	Als ich bei mei -- nen Scha -- fen wacht', ein En -- gel mir die Bot -- schaft bracht'.
	Des bin ich froh, bin ich froh, froh, froh, froh, o, o, o, 
	Be -- ne -- di -- ca -- mus Do -- mi -- no, be -- ne -- di -- ca -- mus Do -- mi -- no.
}

wdh = \lyricmode { }


\score {
  <<
    \new ChordNames { \akkorde }
    \new Voice = "Lied" { \melodie }
    \new Lyrics \lyricsto "Lied" { \text }
    % \new Lyrics \lyricsto "Lied" { \wdh } % auskommentieren, wenn Text zweizeilig gesetzt wird
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
    \fill-line {
      \hspace #0.1  % Spalte vom linken Rand, auskommentieren, wenn nur eine Spalte
          \column {      % erste Spalte links
        \line { \bold "  2. "
          \column {
			"|: Er sagt', es soll geboren sein"
			"zu Bethlehem ein Kindelein. :|"
			"Des bin ich froh, ..."
			" "
          }
        }
        \hspace #0.1  % vertikaler Abstand zwischen den Strophen 
        \line { \bold "  3. "
          \column {
			"|: Er sagt', das Kind liegt dort im Stall"
			"und soll die Welt erlösen all'. :|"
			"Des bin ich froh, ..."
			" "
          }
        }
        \hspace #0.1  % vertikaler Abstand zwischen den Strophen 
        \line { \bold "  4. "
          \column {
			"|: Als ich das Kind im Stall geseh'n,"
			"nicht wohl konnt' ich von dannen geh'n. :|"
			"Des bin ich froh, ..."
			" "
		  }
        }
        \hspace #0.1  % vertikaler Abstand zwischen den Strophen 
        \line { \bold "  5. "
          \column {
			"|: Das Kind mir sein' Äuglein wandt,"
			"mein Herz gab ich in seine Hand. :|"
			"Des bin ich froh, ..."
			" "
          }
        }
      }
% { ab hier auskommentieren, wenn es nur eine Spalte sein soll
      \hspace #0.1    % horizontaler Abstand zwischen den Spalten
          \column {       % zweite Spalte rechts
        \line { \bold "  6. "
          \column {
			"|: Demütig küsst' ich seine Füß',"
			"davon mein Mund ward zuckersüß'. :|"
			"Des bin ich froh, ..."
			" "
          }
        }
        \hspace #0.1
        \line { \bold "  7.  "
          \column {
            		"|: Als ich heimging, das Kind wollt' mit"
			"und wollt' von mir abweichen nit. :|"
			"Des bin ich froh, ..."
			" "
			
          }
        }
        \hspace #0.1  % vertikaler Abstand zwischen den Strophen 
        \line { \bold "  8. "
          \column {
			"|: Das Kind legt' sich an meine Brust"
			"und macht' mir da all' Herzenslust. :|"
			"Des bin ich froh, ..."
			" "
          }
        }
        \hspace #0.1  % vertikaler Abstand zwischen den Strophen 
        \line { \bold "  9. "
          \column {
			"|: Den Schatz muss ich bewahren wohl,"
			"so bleibt mein Herz der Freuden voll. :|"
			"Des bin ich froh, ..."
			" "
          }
        }
      }
% } % bis hier auskommentieren, wenn es nur eine Spalte sein soll
      \hspace #0.1  % Spalte vom linken Rand
        }
  }
}

