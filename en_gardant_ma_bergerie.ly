\version "2.10.33"
\include "default.ly"

#(set-global-staff-size 16)
\layout {
	indent = 15\mm
}

\paper {
  line-width    = 185\mm
  left-margin   = 15\mm
  right-margin   = 10\mm
  top-margin    = 0\mm
  bottom-margin = 5\mm
  }

\header {
  title = "En gardant ma bergerie"
  poet = "Text: Chanoine Toussaint Le Roy"
  composer = "Musik: franz. Weihnachtslied (16. Jhd.)"
  tagline = ""
  %%  aus der Grafschaft Maine, heute in der Region Pays de la Loire

  enteredby = "Sigrid Peuker"
  maintainerEmail = "mail@sigridpeuker.de"
  lastupdated = "2011/Dec/6"
}

% Beginnpunkt auf das mittlere C setzen


<<

\relative c'' {
\set Staff.instrumentName = #"Sopran"
\clef "treble"
    \partial 2
    \time 4/4
	a4 c
	b a g a 
	b a a c 
	b a g b 
	a2 a4 a
	\break
	e' e f e
	d c d e
	d c c b
	c2 
	\repeat volta 2 { c8 b c d | e2 b8 a b c | d2 a8 g a b | c4 d b2 }
	\alternative {
	  { a2 }
	  { a2 }
	}
	\bar "|."
  }
  \addlyrics {
	\set stanza = #"1. "
	En gar -- dant ma ber -- ge -- ri -- e, l’au -- tre nuit que je veil -- lais, j’ai sur la mi -- nuit ou -- i -- e u -- ne si plai -- san -- te voix.  
	\repeat volta 2 { Que je ne sau -- rais, quand je le vou -- drais, que je ne pour -- rais pas di -- }
	\alternative {
	   { re. } 
	   { re. } 
	}
  }

  \addlyrics { 
	\set stanza = #"2. "
	Que ce fût une a -- lou -- et -- te je ne le croix nul -- le -- ment. Sa voix é -- tait plus dou -- cet -- te et chan -- tait si dou -- ce -- ment. 

  } 

  \addlyrics { 
	\set stanza = #"3. "
	Cet -- te voix plai -- sante e bel -- le que si doux j’oy -- ais chan -- tant, ra -- con -- tait u -- ne nou -- vel -- le qui me ren -- dit si con -- tent. 
  } 

  \addlyrics { 
	\set stanza = #"4. "
	En Beth -- lé -- hem de Ju -- dé -- e, di -- sait el -- le main -- te -- nant, u -- ne vierge est ac -- cou -- ché -- e d’un tant a -- gré -- able en -- fant. 
  } 

\relative c' {
    \set Staff.instrumentName = #"Alt"
\clef "treble"
    \partial 2
    \time 4/4
	e4 e
	g4. f8 e4 c
	e e e8( d) e( f)
	g4. f8 e4 e
	c2 a'4 a
	b c d c
	b c g g
	f e d d 
	e2 
	\repeat volta 2 { e4 a | g4. g8 d4 g | f2 c4 f | e a a( gis) }
	\alternative {
	  { a2 }
	  { a2 }
	}
	\bar "|."
  }

  \addlyrics {
	\set stanza = #"1. "
	En gar -- dant ma ber -- ge -- ri -- e, l’au -- tre nuit que je veil -- lais, j’ai sur la mi -- nuit ou -- i -- e u -- ne si plai -- san -- te voix. 
	\repeat volta 2 { Ne sau -- rais, quand je vou -- drais, ne le pour -- rais di -- }
	\alternative {
	   { re. } 
	   { re. } 
	}
  }

  \addlyrics { 
	\set stanza = #"2. "
	Que ce fût une a -- lou -- et -- te je ne le croix nul -- le -- ment. Sa voix é -- tait plus dou -- cet -- te et chan -- tait si dou -- ce -- ment.
  } 

  \addlyrics { 
	\set stanza = #"3. "
Cet -- te voix plai -- sante e bel -- le que si doux j’oy -- ais chan -- tant, ra -- con -- tait u -- ne nou -- vel -- le qui me ren -- dit si con -- tent. 	
  } 

  \addlyrics { 
	\set stanza = #"4. "
	En Beth -- lé -- hem de Ju -- dé -- e, di -- sait el -- le main -- te -- nant, u -- ne vierge est ac -- cou -- ché -- e d’un tant a -- gré -- able en -- fant. 
  } 

\relative c' {
    \set Staff.instrumentName = #"Männer"
\clef "bass"
    \partial 2
    \time 4/4
	a4 a
	g4 d e f
	e a, a' a
	g d e e
	a2 a4 a
	g a d, e8( f)
	g4 c, b c
	d e f g
	c, c'8 b
	\repeat volta 2 { a4 a | e8 d e f g2 | d8 c d e f4 d8 d | a'4 d, e2 }
	\alternative {
	  { a4 c8 b }
	  { <a a,>2 }
	}
	\bar "|."
  }

  \addlyrics {
	\set stanza = #"1. "
	En gar -- dant ma ber -- ge -- ri -- e, l’au -- tre nuit que je veil -- lais, j’ai sur la mi -- nuit ou -- i -- e u -- ne si plai -- san -- te voix.  Que je
	\repeat volta 2 { ne sau -- rais, je ne sau -- rais, quand je le vou -- drais, que ne pour -- rais di -- }
	\alternative {
	   { re. Que je } 
	   { re. } 
	}
  }

  \addlyrics { 
	\set stanza = #"2. "
	Que ce fût une a -- lou -- et -- te je ne le croix nul -- le -- ment. Sa voix é -- tait plus dou -- cet -- te et chan -- tait si dou -- ce -- ment. Que je
  } 

  \addlyrics { 
	\set stanza = #"3. "
Cet -- te voix plai -- sante e bel -- le que si doux j’oy -- ais chan -- tant, ra -- con -- tait u -- ne nou -- vel -- le qui me ren -- dit si con -- tent. Que je
  } 

  \addlyrics { 
	\set stanza = #"4. "
	En Beth -- lé -- hem de Ju -- dé -- e, di -- sait el -- le main -- te -- nant, u -- ne vierge est ac -- cou -- ché -- e d’un tant a -- gré -- able en -- fant.  Que_je
  } 

>>




