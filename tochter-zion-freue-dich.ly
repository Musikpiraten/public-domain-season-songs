\version "2.12.3"

\include "default.ly"

\header {
  title="Tochter Zion, freue dich"
  composer="Musik: Georg Friedrich Händel"
  poet="Text: Friedrich Heinrich Ranke"
  tagline = ""
}


Melodie=\relative c' {
    bes'2 g4.( aes8)      | % 1
    bes2 ees,      | % 2
    f8([ g aes bes] aes4) g      | \break % 3
    f1      | % 4
    g8([ aes bes c]) bes4 bes      | % 5
    ees2 bes      | % 6
    aes4( g f4.) ees8      | % 7
    ees1 ^\markup {\upright \bold  "fine"} \bar "||" | \break % 8
    g8([ f g aes] g4) g      | % 9
    f2 ees      | % 10
    aes4( g f) ees      | % 11
    d1      | \break % 12
    ees8([ d ees f] ees4) ees      | % 13
    c'2 a      | % 14
    bes4( c8[ bes] a4.) bes8      | % 15
    bes1 ^\markup {\upright \bold  "d. c. al fine"}
}


Akkorde= \chordmode {
  \set chordChanges = ##t
    es1 es1 g1:m7
    bes es es1 aes es
    g1 bes2 es2 aes1 d
    es1 c2 a2 bes f es
}

Text=\lyricmode {
	\set stanza = " 1. "
	Toch -- ter Zi -- on freu -- e Dich, jau -- ch -- ze laut, Je -- ru -- sa -- lem.
	Sieh, dein Kö -- nig kommt zu dir, ja er kommt, der Frie -- de -- fürst.
}


\score{
  <<
    \new ChordNames {\Akkorde}
    \new Voice = "Melodie" {
      \autoBeamOff
      \clef treble
      \key es \major
      \time 2/2
      \Melodie \bar "|."
    }
    \new Lyrics = Strophe \lyricsto Melodie \Text
  >>
   \layout{}
   \midi {\context { \Score tempoWholesPerMinute = #(ly:make-moment 110 4) } }
}

\markup {
	\fill-line {
		\column {
			\hspace #0.1
			\line {
				\bold "2."
				\column {
					"Hosianna, Davids Sohn, sei gesegnet deinem Volk!"
					"Gründe nun dein ewig Reich, Hosianna in der Höh’!"
					"Hosianna, Davids Sohn, sei gesegnet deinem Volk!"
				}
			}
			\hspace #0.1
			\line {
				\bold "3."
				\column {
					"Hosianna, Davids Sohn, sei gegrüßet, König mild!"
					"Ewig steht dein Friedensthron, du des ew’gen Vaters Kind."
					"Hosianna, Davids Sohn, sei gegrüßet, König mild!"
				}
			}
		}
	}
}


 % some settings % vim: sw=2 et
