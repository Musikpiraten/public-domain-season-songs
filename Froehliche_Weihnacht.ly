%{

Gesetzt von Beate Paland

%}

\layout {
  indent = #0
}

\header{
  title = "Fröhliche Weihnacht überall"
  poet = "A. H. Hoffmann von Fallersleben, 1798 bis 1874"
  composer = "Aus England, 19. Jh."
}

<<
 \chords {
	\set chordChanges = ##t
	g1 d2 g g1 d2 g d1 g d2 g2 g2 d2 g1 d2 g g1 d2 g d1 g c d d g g2 d2 g1
  }
  \relative c' {
    \key g \major
    \time 2/2
    d'8 ([ c)] b c d4 b
    g4 a b4 r4
    b8 a g a b4 g
    d4 fis g4 r4
    \break
    a4 d d2
    b4 d d2
    a4 e' d b
    d c8 ([ b)] a2
    \break
    d8 ([ c)] b c d4 b
    g4 a b4 r4
    b8 a g a b4 g
    d4 fis g4 r4
    \break
    a4. b8 c4 a % darum alle 
    b( c) d2
    e4 d c b
    c2. r4
    \break
    a4. b8 c4 a
    b c d2
    d,4 b' b a 
    g2. r4
  }
  \addlyrics { 
	\set stanza = #"1. "
	Fröh -- li -- che Weih -- nacht ü -- ber -- all!
	tö -- net durch die Lüf -- te fro -- her Schall.
	Weih -- nachts -- ton, Weih -- nachts -- baum,
	Weih -- nachts -- duft in je -- dem Raum!
	Fröh -- li -- che Weih -- nacht ü -- ber -- all!
 	tö -- net durch die Lüf -- te fro -- her Schall.
    Da -- rum al -- le stim -- met in den Ju -- bel -- ton,
	denn es kommt das Licht der Welt
	von des Va -- ters Thron.
  }
  \addlyrics { 
	\set stanza = #"2. "
	Fröh -- li -- che Weih -- nacht ü -- ber -- all!
	tö -- net durch die Lüf -- te fro -- her Schall.
	Weih -- nachts -- ton, Weih -- nachts -- baum,
	Weih -- nachts -- duft in je -- dem Raum!
	Fröh -- li -- che Weih -- nacht ü -- ber -- all!
 	tö -- net durch die Lüf -- te fro -- her Schall.
	Licht auf dunk -- lem We -- ge, un -- ser Licht bist du;
	denn du führst, die dir ver -- trau’n,
	ein zu sel’ -- ger Ruh’.
  } 
  \addlyrics { 
	\set stanza = #"3. "
	Fröh -- li -- che Weih -- nacht ü -- ber -- all!
	tö -- net durch die Lüf -- te fro -- her Schall.
	Weih -- nachts -- ton, Weih -- nachts -- baum,
	Weih -- nachts -- duft in je -- dem Raum!
	Fröh -- li -- che Weih -- nacht ü -- ber -- all!
 	tö -- net durch die Lüf -- te fro -- her Schall.
	Was wir an -- dern ta -- ten, sei ge -- tan für dich,
	daß be -- ken -- nen je -- der muss,
	Christ -- kind kam für mich.
  } 
>>

\markuplines {
  \italic {
    \line {
      Gesetzt von Beate Paland
      \general-align #Y #DOWN {
        \epsfile #X #3 #"publicdomain.eps"
      }

    }
  }
}
\version "2.12.3"  % necessary for upgrading to future LilyPond versions.
