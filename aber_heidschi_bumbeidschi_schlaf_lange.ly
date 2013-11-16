% Dieses Notenblatt wurde erstellt von Michael Nausch
% Kontakt: michael@nausch.org (PGP public-key 0x2384C849) 

\version "2.14.2"

\header {
  title = "Aber heidschi, bumbeidschi, schlaf lange"   % Die Überschrift der Noten wird zentriert gesetzt.
  subtitle = " "                                  % weitere zentrierte Überschrift.
%  poet = "Text: überliefert"                      % Name des Dichters, linksbündig unter dem Unteruntertitel.
  meter = ""                                      % Metrum, linksbündig unter dem Dichter.
%  composer = "Melodie: alpenländische Volksweise" % Name des Komponisten, rechtsbüngig unter dem Unteruntertitel.
  composer = "alpenländisches Volkslied"
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
  \germanChords
  \partial 4
	s4 f2. f c:7 s c:7 c:7 f s f f c:7 c:7 c:7 c:7 f
	f f f c:7 s c:7 c:7 f s2
}

melodie = \relative c' {
  \clef "treble"
  \time 3/4
  \tempo 4 = 110
  \key f\major
  \autoBeamOff
	c8 c a'4. a8 a4 a g a c2. bes2 \breathe c,4 \break
	bes'4. bes8 bes4 bes a bes d2. c2 \breathe c,4 a'4. a8 a4 a g a
	c c bes g2 \breathe c,4 bes'4. bes8 bes4 bes (a) bes d2 c4
	a2 \breathe c,8 c a'4. a8 a4 a g a bes2. ~ bes4 r c8 c
	c4. e8 c4 bes c, bes' a2. ~ a4 r
  \bar "|."
}

text = \lyricmode {
  \set stanza = "1."
	Å -- ber hei -- dschi, bum -- bei -- dschi schlåf lån -- ge,
	es is jå dei Muat -- ta aus -- gån -- ga, 
	sie is jå aus -- gan -- ga und kimmd nea -- ma hoam 
	und låßt dås kloa Bia -- warl gånz al -- loan.
	Å -- ber hei -- dschi, bum -- bei -- dschi, bum bum,_ 
	å -- ber hei -- dschi, bum -- bei -- dschi, bum bum._

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
      \hspace #0.3
      \line {
	\bold "  2. "
        \column {
	  		"Åber heidschi, bumbeidschi schlåf siaße,"
			"die Engerl, die låssn di griaßn."
			"Sie låssn di griaßn und låssn di frågn,"
			"ob du im Himme' spazieren willst fårn?"
			"Åber heidschi, bumbeidschi, bum bum,"
			"åber heidschi, bumbeidschi, bum bum."
			" "
		}
      }
      \hspace #0.3
      \line {
        \bold "  3. "
        \column {
                        "Åber heidschi, bumbeidschi im Himme',"
                        "då fårt di a schneeweißa Schimme',"
                        "drauf sitzt a kloans Engerl mit ona Latern,"
                        "drin leicht vom Himmel der ållerschönst Stern."
                        "Åber heidschi, bumbeidschi, bum bum,"
                        "åber heidschi, bumbeidschi, bum bum."
			" "
                }
      }
      \hspace #0.3
      \line {
        \bold "  4. "
        \column {
                        "Da Heidschi_bumbeidschi is kumma"
                        "und håt ma mei Biawerl mitgnumma,"
                        "er håt mas mitgnumma und håts neama bråcht,"
                        "drum wünsch i mein Biawerl a recht guade Nåcht."
                        "Åber heidschi, bumbeidschi, bum bum,"
                        "åber heidschi, bumbeidschi, bum bum."
			" "
                }
      }
	}
}

