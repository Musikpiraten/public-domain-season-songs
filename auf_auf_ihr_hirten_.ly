% Dieses Notenblatt wurde erstellt von Michael Nausch
% Kontakt: michael@nausch.org (PGP public-key 0x2384C849) 

\version "2.14.2"

\header {
  title = "Auf, auf, ihr Hirten!"		  % Die Überschrift der Noten wird zentriert gesetzt.
  poet = "Alpenländisches Volkslied"				  % Name des Dichters, linksbündig unter dem Unteruntertitel.
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
	% leide (noch) keine vorhanden!
  %\repeat "volta" 2 {   }
}


melodie = \relative c'' {
  \clef "treble"
  \time 3/4
  \tempo 4 = 110
  \key c\major
  \autoBeamOff
  \partial 4 % 1/4 Auftakt
	g4 c c d c e8 ([d]) c ([b]) a4 d b c r g c c d c e8 ([d]) c ([b]) a4 d b c r2
	e4 e8 ([d]) c ([b]) a2. d4 c8 ([b]) a ([g]) g2 \breathe g4 c c d c e8 ([d]) c ([b]) 
	a4 d b c2     
  %\repeat "volta" 2 {  }
  \bar "|."
}


text = \lyricmode {
  \set stanza = "1."
	Auf, auf, doch ihr Hir -- ten, nicht schlaft mir so lang',
	die Nacht ist ver -- gan -- gen, nun sa -- get es schon.
	Schaut's nur da -- her, schaut's nur da -- her,
	wie glän -- zet das Stern -- lein je län -- ger je mehr.  
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
			"Zu Bethlehem drunten"
			"geht wieder der Schein."
			"Es muss ja was köstlich's"
			"verborgen dort sein,"
			"an einem Stall, an einem Stall,"
			"da scheint es und glänzt es,"
			"als wär' es Kristall."
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
                        "Drum geh' nur, mein Fritzel,"
			"und b'sinn dich nicht lang!"
			"Steck' an eine Kerze"
			"und wag' nur den Gang."
			"Bück' dich fein schön,"
			"neig' dich fein schön,"
			"zieh' ab flugs dein Hütel,"
			"wenn ein du willst gehn."
			" "
          }
        }
      }
% } % bis hier auskommentieren, wenn es nur eine Spalte sein soll
      \hspace #0.1  % Spalte vom linken Rand
        }
  }
}


