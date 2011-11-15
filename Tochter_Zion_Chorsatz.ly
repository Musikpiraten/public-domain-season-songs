\version "2.15.14"
\language "deutsch"

\header {
	title = "Tochter Zion, freue dich"
	composer = "Musik: Georg Friedrich Händel (1685–1759)"
	poet = "Text: Friedrich Heinrich Ranke (1798–1876)"
	%opus =
	% arranger =
	}

global = \relative c {
	\time 2/2
	
}

dcaf = { 
	\once \override Score.RehearsalMark #'break-visibility = #end-of-line-visible
	\once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
	\mark "D.C. al Fine" }

	fine = { 
	%\once \override Score.RehearsalMark #'break-visibility = #end-of-line-visible
	\once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
	\mark "Fine" }
	
snotes = \relative c'' {
	b2 g4.( as8)
	b2 es,
	f8([ g as b] as4) g
	f1
	g8([ as b c] b4) b
	es2 b
	as4( g f4.) es8
	es1
	\bar "|." \fine
	
	g8[( f g as] g4) g
	f2 es
	as4( g f) es
	d1
	es8[( d es f] es4) es
	c'2 a
	b4( c8[ b] a4.) b8 b1 \dcaf \bar "||"
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
	Toch -- ter Zi -- on, freu -- e Dich,
	jauch -- ze laut, Je -- ru -- sa -- lem!
	Sieh, dein Kö -- nig kommt zu dir,
	ja er kommt, der Frie -- de -- fürst.
}

ziontwo = \lyricmode { \set stanza = "2. "
	Ho -- si -- an -- na, Da -- vids Sohn,
	sei ge -- seg -- net dei -- nem Volk!
	Grün -- de nun dein e -- wges Reich,
	Ho -- si -- an -- na in der Höh!
}

zionthree = \lyricmode { \set stanza = "3. "
	Ho -- si -- an -- na, Da -- vids Sohn,
	sei ge -- grü -- ßet, Kö -- nig mild!
	E -- wig steht dein Frie -- dens -- thron,
	du des ew'-- gen Va -- ters Kind.
}

sapart = {
	\new Staff <<
		\new Voice = "s" {
			\voiceOne
			\key es \major
			\autoBeamOff
			\clef treble
			\global
			\snotes
		}
		\new Lyrics \lyricsto "s" \zionone
		\new Lyrics \lyricsto "s" \ziontwo
		\new Lyrics \lyricsto "s" \zionthree
		
		\new Voice = "a" {
			\voiceTwo
			\key es \major
			\autoBeamOff
			\clef treble
			\global
			\anotes
		}
	>>
}
	

	
tbpart = {
	\new Staff <<
		\new Voice = "t" {
			\voiceOne
			\key es \major
			\autoBeamOff
			\clef "treble_8"
			\global
			\tnotes
		}
		
		\new Voice = "b" {
			\voiceTwo
			\key es \major
			\autoBeamOff
			\clef bass
			\global
			\bnotes
		}
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

	
