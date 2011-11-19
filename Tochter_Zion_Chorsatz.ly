\version "2.14.2"
%war: \version "2.15.14"
\include "default.ly"
\language "deutsch"

\header {
	title = "Tochter Zion, freue dich"
	composer="Musik: Georg Friedrich Händel (1747)"
	poet="Text: Friedrich Heinrich Ranke (1823)"
	tagline=""
	%opus =
	% arranger =
	}

global = \relative c {
	\time 2/2
	
}

dcaf = {
	\once \override Score.RehearsalMark #'break-visibility = #end-of-line-visible
	\once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
	\mark \markup {\upright \bold  "d. c. al fine"} }

fine = {
%	\once \override Score.RehearsalMark #'break-visibility = #end-of-line-visible
	\once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
	\mark \markup {\upright \bold  "fine"} }
	
snotes = \relative c'' {
	b2 g4.( as8)
	b2 es,
	f8([ g as b] as4) g
	f1
	g8([ as b c] b4) b
	es2 b
	as4( g f4.) es8
	es1
	\fine \bar "||"
	
	g8[( f g as] g4) g
	f2 es
	as4( g f) es
	d1
	es8[( d es f] es4) es
	c'2 a
	b4( c8[ b] a4.) b8 b1 \dcaf \bar "|."
}

anotes = \relative c' {
	es2 es4.( d8)
	es2 b
	d8([ es f g] f4) es
	d1
	es2. es4
	es2 es
	d4( es2) d4
	es1
	
	
	es8[( d es f] es4) es
	d2 c
	f4( es d) c
	h1
	c8([ h c d] c4) c
	es2. es4
	d4( es8[ d] c4) f
	f1
}

tnotes = \relative c' {
	g2 b4.( as8)
	g2 b
	as4( f b) b
	b1
	b2. b4
	b2 g
	as4( b2) as4
	g1
	
	b2. b4
	as2 g
	h4( c as) g
	g1
	g2.  g4
	f2 c'
	b4( g c) c
	d1
}

bnotes = \relative c {
	es2 g4.( f8)
	es2 g
	f4.( es8 d4) es
	b1
	es8([ f g as] g4) g
	g2 es
	f4( g8[ as] b4) b,
	es1
	
	es2. es4
	b2 c
	d4( es f) c
	g'1
	c,2. b4
	a2 f'
	g4( es f) f
	b,1
}


zionone = \lyricmode { \set stanza = "1. "
	Toch2 -- ter2 Zi2 -- on,2 freu2. -- e4 Dich,1
	jauch2. -- ze4 laut,2 Je2 -- ru1 * 7/8 -- sa8 -- lem!1
	Sieh,2. dein4 Kö2 -- nig2 kommt2. zu4 dir,1
	ja2. er4 kommt,2 der2 Frie1 * 7/8 -- de8 -- fürst.4
}

ziontwo = \lyricmode { \set stanza = "2. "
	Ho2 -- si2 -- an2 -- na,2 Da2. -- vids4 Sohn,1
	sei2. ge4 -- seg2 -- net2 dei1 * 7/8 -- nem8 Volk!1
	Grün2. -- de4 nun2 dein2 e2. -- wig4 Reich,1
	Ho2. -- si4 -- an2 -- na2 in1 * 7/8 der8 Höh!1
}

zionthree = \lyricmode { \set stanza = "3. "
	Ho2 -- si2 -- an2 -- na,2 Da2. -- vids4 Sohn,1
	sei2. ge4 -- grü2 -- ßet,2 Kö1 * 7/8 -- nig8 mild!1
	E2. -- wig4 steht2 dein2 Frie2. -- dens4 -- thron,1
	du2. des4 ew’2 -- gen2 Va1 * 7/8 -- ters8 Kind.1
}

sapart = {
	\new Staff <<
		\key es \major
		\autoBeamOff
		\clef treble
		\global
		\partcombine \snotes \anotes
		\new Lyrics \zionone
		\new Lyrics \ziontwo
		\new Lyrics \zionthree
	>>
}
	

	
tbpart = {
	\new Staff <<
		\key es \major
		\autoBeamOff
		\clef bass
		\global
		\partcombine \tnotes \bnotes
	>>
}



\score {
	\new ChoirStaff <<
		\sapart
		
		\tbpart
		
		>>
		\layout{}
		\midi{}	

}

	
