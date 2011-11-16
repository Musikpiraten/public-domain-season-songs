\version "2.12.3"

\include "default.ly"

\header {
  title="Jingle Bells"
  subtitle = "Or the one horse open sleigh"
  composer="Text und Musik: James Lord Pierpont (1850)"
%  poet="Text: James Lord Pierpont (1850)"
  tagline = ""
}

Melodie=\relative c' {
	d8 b' a g      | % 1
	d4. d16 d      | % 2
	d8 b' a g      | % 3
	e2      | % 4
	e8 c' b a      | % 5
	fis2      | % 6
	d'8 d c a      | % 7
	b2      | % 8
	d,8 b' a g      | % 9
	d2      | % 10
	d8 b' a g      | % 11
	e4. e8      | % 12
	e c' b a      | % 13
	d d d d      | % 14
	e d c a      | % 15
	g4 r      | % 16
	b8 b b4      | % 17
	b8 b b4      | % 18
	b8 d g,8. a16      | % 19
	b2      | % 20
	c8 c c8. c16      | % 21
	c8 b b b16 b      | % 22
	b8 a a b      | % 23
	a4( d)      | % 24
	b8 b b4      | % 25
	b8 b b4      | % 26
	b8 d g,8. a16      | % 27
	b2      | % 28
	c8  c c8. c16      | % 29
	c8 b b b16 b      | % 30
	d8 d c a      | % 31
	g2
}


Akkorde= \chordmode {
	\set chordChanges = ##t
	g8 g g g g4. g16 g g8 g g g c2 %sleigh
	a8:m a:m a:m a:m d2:7 d8:7 d:7 d:7 d:7 g2 %way
	g8 g g g g2 g8 g g g c4. %bright
	e8:7/b a8:m a:m a:m a:m g g g g a:m a:m d:7 d:7 g4 r %night
	g8 g g4 g8 g g4 g8 g c8. c16 g2 %way
	a8:m a:m d8.:7 d16:7 g8 g e:m e16:m e:m a8:7 a:7 a:7 a:7 a4:m7 d:7 %sleigh
	g8 g g4 g8 g g4 g8 g c8. c16 g2 %way
	c8 c c8. c16 g8 g g g16 g a8:m a:m d:7 d:7 g2 %sleigh
}

Text=\lyricmode {
	\set stanza = " 1. "
	Dash -- ing  through the snow, in a one horse op -- en  sleigh,
	o'er the fields we go, laugh -- ing  all the way;
	Bells on bob -- tail  ring, mak -- ing  spir -- its  bright.
	What fun it is to laugh and sing a sleigh -- ing  song to -- night.
	Jin -- gle  bells, jin -- gle  bells, Jin -- gle  all the way;
	oh what fun it is to ride in a one horse op -- en  sleight.
	Jin -- gle  bells, jin -- gle  bells, Jin -- gle  all the way,
	oh what fun it is to ride in a one horse op -- en  sleigh.
}


\score{
  <<
    \new ChordNames {\Akkorde}
    \new Voice = "Melodie" {
      \autoBeamOff
      \clef treble
      \key g \major
      \time 2/4
      \Melodie \bar "|."
    }
    \new Lyrics = Strophe \lyricsto Melodie \Text
  >>
%  \midi{}
}

\markup {
    \hspace #0.1 
     \column {
      \line { \bold "2."
        \column {
	"A day or two ago I thought I'd take a ride,"
	"And soon Miss Fannie Bright was seated by my side."
	"The horse was lean and lank, misfortune seemed his lot,"
	"He got into a drifted bank and we got upsot."
        \bold |:Refrain:|
        }
      }
      \hspace #0.1 
      \line { \bold "3."
        \column {
	"A day or two ago, The story I must tell"
	"I went out on the snow, And on my back I fell;"
	"A gent was riding by In a one-horse open sleigh,"
	"He laughed as there I sprawling lie, But quickly drove away."
	\bold "|:Refrain:|"
        }
      }
    \hspace #0.1  
     \column {
      \line { \bold "4."
	\column {
	"Now the ground is white, go it while you're young,"
	"Take the girls tonight and sing this sleighing song."
	"Just get a bobtailed bay, two-forty for his speed,"
	"Then hitch him to an open sleigh, and crack! You'll take the lead."
	\bold "|:Refrain:|"
        }
      }
    }
  }
  \hspace #0.1 
}

% some settings % vim: sw=2 et
