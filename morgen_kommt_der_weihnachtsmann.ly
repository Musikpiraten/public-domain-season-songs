%{



%}

\header{
  title = "Morgen kommt der Weihnachtsmann"
  poet = "Hoffmann von Fallersleben (1798 bis 1874)"
  composer = "Volksweise"
}

\layout { indent = #0 } 

<<
 \chords { g1 c2 g d:7 g d:7 g g d:7 g d:7 g d:7 g d:7 g1 c2 g d:7 g d:7 g }
  \relative c'' {
    \key g \major
    \time 4/4
    g4 g d' d
    e e d2
    c4 c b b
    a2 g
    \break
    d'4 d c c 
    b b a2
    d4 d c c 
    b b a2
    \break
    g4 g d' d 
    e e d2
    c4 c b b 
    a2 g  
  }
  \addlyrics { 
	\set stanza = #"1. "
 	Mor -- gen kommt der Weih -- nachts -- mann, 
	Kommt mit sei -- nen Ga -- ben. 
	Trom- mel, Pfei- fe und Ge -- wehr, 
	Fahn und Sä- bel und noch mehr, 
	Ja ein gan -- zes Krie -- ges -- heer, 
	Möcht ich ger -- ne ha -- ben. 
  }
  \addlyrics { 
	\set stanza = #"2. "
	Bring' uns, lie -- ber Weih -- nachts -- mann,
	Bring' auch mor -- gen, brin -- ge
	Mus -- ke -- tier und Gre -- na -- dier,
	Zot -- tel -- bär und Pan -- ther -- tier,
	Ross und E -- sel, Schaf und Stier,
	Lau -- ter schö -- ne Din -- ge. 
  } 
  \addlyrics { 
	\set stanza = #"3. "
	Doch du weißt ja un -- sern Wunsch,
	Ken -- nest un -- sere Her -- zen.
	Kin -- der, Va -- ter und Ma -- ma,
	Auch so -- gar der Groß -- pa -- pa,
	A -- lle, a -- lle sind wir da,
	War -- ten dein mit Schmer -- zen.  
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

