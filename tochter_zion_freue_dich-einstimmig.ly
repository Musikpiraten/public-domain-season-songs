\version "2.12.3"

\include "default.ly"

\header {
  title="Tochter Zion, freue dich"
  composer="Melodie: Georg Friedrich Händel"
  poet="Text: Friedrich Heinrich Ranke"
  tagline = ""
}

dcaf = {
	\once \override Score.RehearsalMark #'break-visibility = #end-of-line-visible
	\once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
	\mark "D.C. al Fine"
}

fine = {
	\once \override Score.RehearsalMark #'break-visibility = #end-of-line-visible
	\once \override Score.RehearsalMark #'self-alignment-X = #RIGHT
	\mark "Fine"
}

Melodie=\relative c' {
    bes'2 g4.( aes8)      | % 1
    bes2 ees,      | % 2
    f8([ g aes bes] aes4) g      | \break % 3
    f1      | % 4
    g8([ aes bes c]) bes4 bes      | % 5
    ees2 bes      | % 6
    aes4( g f4.) ees8      | % 7
    ees1 \fine \bar "|." | \break % 8
    g8([ f g aes] g4) g      | % 9
    f2 ees      | % 10
    aes4( g f) ees      | % 11
    d1      | \break % 12
    ees8([ d ees f] ees4) ees      | % 13
    c'2 a      | % 14
    bes4( c8[ bes] a4.) bes8      | % 15
    bes1 \dcaf \bar "||"
}


Akkorde= \chordmode {
  \set chordChanges = ##t
    es1 es1 bes2 es
    bes1 es c2:m g:m aes bes es1
    c1:m g2:7 c:m f1:m7 g
    c1:m f2/a f g4:m es f2 bes1
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
      \Melodie
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
