% Dieses Notenblatt wurde erstellt von Michael Nausch
% Kontakt: michael@nausch.org (PGP public-key 0x2384C849) 

\version "2.14.2"
\header {
  title = "Sei uns willkommen"                % Die Überschrift der Noten wird zentriert gesetzt. 
  poet = "Deutsches Volkslied"       		      % Name des Dichters, linksbündig unter dem Unteruntertitel. 
  tagline = "Diese Noten sind frei kopierbar für jedermann – erstellt für www.ebersberger-liedersammlung.de" 
	    				      % Zentriert unten auf der letzten Seite.
%  copyright = "Diese Noten sind frei kopierbar für jedermann – erstellt für www.ebersberger-liedersammlung.de"
	    				      % Zentriert unten auf der ersten Seite (sollten tatsächlich zwei 
					      %	seiten benötigt werden"
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
	s2 d2:m a2:m d2:m c2 d2:m bes2 f2 s2 d1:m a1:m 
	bes2 d2:m a2:m e2:m d2:m d1.:m bes2 c2 d2:m a2:m bes2 c2
	s2 g1. bes1 f1 c1 s1 c2 c2 g2
}


melodie= \relative c' {
        \clef "treble"
        \key f \major
        \time 8/4
        \tempo 2 = 90
        \autoBeamOff
	\partial 2
	d2 f e d c f bes a r a a c c \break bes a 
	a g f f f a bes g f e d c 
	r g' g g bes g f f e g r1 c2 e d
	\bar "|."
}


text = \lyricmode {
  \set stanza = "1."
	Sei uns will -- kom -- men, Her -- re Christ, der du un -- ser al -- ler
	Her -- re bist, sei uns will -- kom -- men lie -- ber Her -- re,
	hier im Erd -- rei -- che recht in Eh -- ren. Ky -- rie -- elys.
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

