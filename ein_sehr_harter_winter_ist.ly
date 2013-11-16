% Dieses Notenblatt wurde erstellt von Michael Nausch
% Kontakt: michael@nausch.org (PGP public-key 0x2384C849) 

\version "2.14.2"

\header {
  title = "Ein sehr harter Winter ist"        % Die Überschrift der Noten wird zentriert gesetzt.
  subtitle = "4-stimmiger Kanon "             % weitere zentrierte Überschrift.
%  poet = "Text: Karl G. Hering (1766 - 1853)" % Name des Dichters, linksbündig unter dem Unteruntertitel.
  meter = ""                                  % Metrum, linksbündig unter dem Dichter.
  composer = "Text u. Melodie: Karl G. Hering (1766 - 1853)" % Name des Komponisten, rechtsbüngig unter dem Unteruntertitel.
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

% Akkorde für die Gitarrenbegleitung
akkorde = \chordmode {
  \germanChords
	d1 d1 d1 d1
}


melodie = \relative c' {
  \clef "treble"
  \time 4/4
  \tempo 4 = 100
  \key d\major
  \autoBeamOff
  %\repeat volta 2 { } %Wiederholung
  %\partial 8 % 1/8 Auftakt
  \repeat volta 2 { 
	d4^"1." e4 fis4 d4\fermata fis4^"2." g4 a2 \fermata d8^"3." d8 cis8 cis8 d8 a8 fis8 d8\fermata a'4^"4." a4 d,2
 	}
  %\bar "|."
}


text = \lyricmode {
  %\set stanza = "1."
	Ein sehr har -- ter Win -- ter ist, wenn ein Wolf, ein Wolf, ein Wolf den an -- dern frißt.
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
