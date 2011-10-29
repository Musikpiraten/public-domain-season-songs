%{

Gesetzt von Beate Paland

%}

\header{
  title = "Kling, Glöckchen, klingelingeling"
  poet = "Karl Enslin oder Benedikt Widmann"
  composer = "Volksweise"
}
\layout {
  indent = #0
}

\score {
<<
 \chords { 
	\set chordChanges = ##t
	d2 d4 g d1 a1:7 d a2:7 d d a1:7 a1:7 d2 e1 a b2:m a4 e e2 a2 d2 d4 g d1 a:7 d
}
  \relative c'' {
    \key d \major
    \time 4/4
    a2 fis4 g
    a8 b a b a2 
    g e4 a
    fis1
    \break
    e4 e fis d   
    fis2 e
    g4 g a e
    g2 fis
    \break
    e4 e fis gis    
    a2 e
    fis4 b a gis 
    b2 a
    \break
    a2 fis4 g
    a8 b a b a2 
    g e4 a
    fis1
  }
  \addlyrics { 
	\set stanza = #"1. "
 	Kling, Glöck -- chen, klin -- ge -- lin -- ge -- ling,
	kling, Glöck -- chen, kling!
	Lasst mich ein, ihr Kin -- der,
	ist so kalt der Win -- ter,
	öff -- net mir die Tür -- en,
	lasst mich nicht er -- frie -- ren!
	Kling, Glöck -- chen, klin -- ge -- lin -- ge -- ling,
	kling, Glöck -- chen, kling!
  }
  \addlyrics { 
	\set stanza = #"2. "
	Kling, Glöck -- chen, klin -- ge -- lin -- ge -- ling,
	Kling, Glöck -- chen, kling!
	Mäd -- chen, hört, und Büb -- chen,
	macht mir auf das Stüb -- chen,
	bring euch vie -- le Ga -- ben,
	sollt euch dran er -- la -- ben.
	Kling, Glöck -- chen, klin -- ge -- lin -- ge -- ling,
	kling, Glöck -- chen, kling!
  } 
  \addlyrics { 
	\set stanza = #"3. "
	Kling, Glöck -- chen, klin -- ge -- lin -- ge -- ling,
	kling, Glöck -- chen, kling!
	Hell er -- glühn die Ker -- zen,	
	öff -- net mir die Her -- zen!
	Will drin woh -- nen fröh -- lich,
	from -- mes Kind, wie se -- lig.
	Kling, Glöck -- chen, klin -- ge -- lin -- ge -- ling,
	kling, Glöck -- chen, kling! 
} 
>>
}
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
