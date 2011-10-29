\version "2.10.33"

#(set-default-paper-size "a4")
#(set-global-staff-size 16)


\paper {
  line-width    = 185\mm
  left-margin   = 15\mm
  right-margin   = 10\mm
  top-margin    = 0\mm
  bottom-margin = 5\mm
  }

\header {
  title = "In dulci jubilo"
  subtitle = "lateinisch-deutsche Fassung"
  poet = "Ursprungsfassung Heinrich Seuse zugeschrieben"
  composer = "Weihnachtslied, 14. Jhd."
  %% http://de.wikipedia.org/wiki/In_dulci_jubilo

  enteredby = "Sigrid Peuker"
  maintainerEmail = "mail@sigridpeuker.de"
  lastupdated = "2010/Dec/8"
}

<<

\relative c' {
\set Staff.instrumentName = #"Sopran"
\clef "treble"
 \key f \major
  \time 6/4
  \partial 4
	f4
	f2 f4 a2 bes4
	c2( d4 c2) f,4
	f2 f4 a2 bes4
	c2( d4 c2.)
	c2 d4 c2 bes4
	a2. f2 f4
	g2 g4 a2 g4
	f2(g4 a2) c4
	c2 d4 c2 bes4
	a2. f2 f4
	g2 g4 a2 g4
	f2( g4 a2) r4
	d,2 d4 e2 e4
	f2.( c'2.)
	a2 a4 g2 g4
	f2.( f2) 
	\cadenzaOff
	\bar "|"
}

  \addlyrics {
  \set stanza = "1." In dul -- ci ju -- bi -- lo, nun sin -- get und seid froh! Uns -- res Her -- zens Won -- ne leit in prae -- se -- pi -- o und leuch -- tet als die Son -- ne ma -- tris in gre -- mi -- o, Al -- pha es et O, Al -- pha es et O.
}

  \addlyrics {
  \set stanza = "2." O Je -- su par -- vu -- le, nach dir ist mir so weh! Tröst mir mein Ge -- mü -- te, o pu -- er op -- ti -- me, durch al -- le dei -- ne Gü -- te, o prin -- ceps glo -- ri -- ae, tra -- he me post te, tra -- he me post te.
}

  \addlyrics {
  \set stanza = "3." U -- bi sunt gau -- di -- a? _ Nir -- gend mehr denn da, wo die En -- gel sin -- gen _ no -- va can -- ti -- ca, _ und die Schel -- len klin -- gen in re -- gis cu -- ri -- a. Ei -- a, wärn wir da, ei -- a wärn wir da.
}

\relative c' {
\set Staff.instrumentName = #"Alt"
\clef "treble"
 \key f \major
  \time 6/4
  \partial 4
	f4
	f2 f4 f2 g4
	a2( bes4 g2) f4
	f2 f4 f2 g4
	a2( bes4 g2.)
	a2 f4 a2 g4
	f2( e4) d2 d4
	e2 e4 f2 e4
	d2( e4 f2) a4
	a2 f4 a2 g4
	f2( e4) d2 d4
	e2 e4 f2 e4
	d2( e4 f2) r4
	d2 d4 e2 e4
	f2.( g2.)
	f2 f4 f2 e4
	f2.( f2)
	\cadenzaOff
	\bar "|"
}

  \addlyrics {
  \set stanza = "1." In dul -- ci ju -- bi -- lo, nun sin -- get und seid froh! Uns -- res Her -- zens Won -- ne leit in prae -- se -- pi -- o und leuch -- tet als die Son -- ne ma -- tris in gre -- mi -- o, Al -- pha es et O, Al -- pha es et O.
}

  \addlyrics {
  \set stanza = "2." O Je -- su par -- vu -- le, nach dir ist mir so weh! Tröst mir mein Ge -- mü -- te, o pu -- er op -- ti -- me, durch al -- le dei -- ne Gü -- te, o prin -- ceps glo -- ri -- ae, tra -- he me post te, tra -- he me post te.
}

  \addlyrics {
  \set stanza = "3." U -- bi sunt gau -- di -- a? _ Nir -- gend mehr denn da, wo die En -- gel sin -- gen _ no -- va can -- ti -- ca, _ und die Schel -- len klin -- gen in re -- gis cu -- ri -- a. Ei -- a, wärn wir da, ei -- a wärn wir da.
}

\relative c' {
\set Staff.instrumentName = #"Männer"
\clef "treble"
 \key f \major
  \time 6/4
  \partial 4
	f4
	f2 f4 f2 f4
	f2.( c2) f4
	f2 f4 f2 f4
	f2.( c2.)
	f2 d4 f2 d4
	d2( a4) d2 d4
	c2 c4 a8( bes c4) c4
	d2 (c4 f2) f4
	f2 d4 f2 d4
	d2( a4) d2 d4
	c2 c4 a8( bes8 c4) c4
	d2( c4 f2) r4
	d2 d4 c2 c4
	f2.( e2.)
	f4( d) c bes2 c4
	f2.( f2)
	\cadenzaOff
	\bar "|"
}

  \addlyrics {
  \set stanza = "1." In dul -- ci ju -- bi -- lo, nun sin -- get und seid froh! Uns -- res Her -- zens Won -- ne leit in prae -- se -- pi -- o und leuch -- tet als die Son -- ne ma -- tris in gre -- mi -- o, Al -- pha es et O, Al -- pha es et O.
}

  \addlyrics {
  \set stanza = "2." O Je -- su par -- vu -- le, nach dir ist mir so weh! Tröst mir mein Ge -- mü -- te, o pu -- er op -- ti -- me, durch al -- le dei -- ne Gü -- te, o prin -- ceps glo -- ri -- ae, tra -- he me post te, tra -- he me post te.
}

  \addlyrics {
  \set stanza = "3." U -- bi sunt gau -- di -- a? _ Nir -- gend mehr denn da, wo die En -- gel sin -- gen _ no -- va can -- ti -- ca, _ und die Schel -- len klin -- gen in re -- gis cu -- ri -- a. Ei -- a, wärn wir da, ei -- a wärn wir da.
}
>>
