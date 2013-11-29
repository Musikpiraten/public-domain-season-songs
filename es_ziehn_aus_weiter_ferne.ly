% Dieses Notenblatt wurde erstellt von Michael Nausch
% Kontakt: michael@nausch.org (PGP public-key 0x2384C849) 

\version "2.14.2"

\header {
  title = "Es ziehn aus weiter Ferne"		  % Die Überschrift der Noten wird zentriert gesetzt.
  poet = "Sternsingerlied aus der Steiermark"				  % Name des Dichters, linksbündig unter dem Unteruntertitel.
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
	s4
  %\repeat "volta" 2 {   }
}


melodie = \relative c' {
  \clef "treble"
  \time 4/4
  \tempo 4 = 100
  \key g\major
  \autoBeamOff
  \partial 4 % 1/4 Auftakt
	d4 g a b c d4. (e8) d4 \breathe b b g a fis g2 r4 d
	g a b c d4. (e8) d4 \breathe b b g a8 ~ a fis4 g2 r4 a
	a4. b8 a4 g fis (a) d, \breathe a' a4. b8 a4 g fis2 r4 d
	g a b c d4. (e8) d4 \breathe e d b c fis, g2 r4
  %\repeat "volta" 2 {  }
  \bar "|."
}


text = \lyricmode {
  \set stanza = "1."
	Es ziehn aus wei -- ter Fer -- ne drei Kö -- ni -- ge ein -- her,
	sie ka -- men von drei Ber -- gen und fuh -- ren über das Meer.
	Un -- zäh -- lig sind die Scha -- ren, ge -- schmückt ist das Ge -- leit,
	die Spo -- ren glän -- zen hel -- le im Son -- nen -- lich -- te weit.
}


wdh = \lyricmode {
}

\score {
  <<
    \new ChordNames { \akkorde }
    \new Voice = "Lied" { \melodie }
    \new Lyrics \lyricsto "Lied" { \text }
%    \new Lyrics \lyricsto "Lied" { \wdh }
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
                        "Sie bringen viel Geschenke"
                        "von Myrrhe, Weihrauch, Gold"
                        "Wem wollen sie die bieten,"
                        "wem sind sie denn so hold?"
                        "Der stern, er stehet stille"
                        "und senket nieder sich"
                        "auf eine arme Hütte,"
                        "die einem Stalle glich."
			" "
          }
        }
        \hspace #0.1  % vertikaler Abstand zwischen den Strophen 
        \line { \bold "  3. "
          \column {
                        "Ein Kind liegt in der Krippe,"
                        "so wunderlieb und klein!"
                        "Das schönste Kind auf Erden,"
                        "im gold'nen Himmelsschein."
                        "Da halten nun die Könige"
                        "mit ihrer ganzen Macht,"
                        "mit ihren Dienern allen,"
                        "mit ihrer ganzen Pracht."
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
                        "Sie rufen Heil dem Kinde,"
                        "das hier in windeln liegt."
                        "Der Stern hat uns bedeutet,"
                        "daß es die Welt besiegt."
                        "Sie habens angebetet"
                        "und Opfer dargebracht,"
                        "dann ziehen sie wieder von dannen"
                        "noch in derselbigen Nacht."
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



