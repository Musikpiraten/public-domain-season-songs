\include "deutsch.ly"
\version "2.12.3"

\header{
    title = "Alle Jahre wieder"
    poet = "Text: Wilhelm Hey (1789–1854)"
    composer = "Musik: Friedrich Silcher (1789–1860)"
}

AlleJahreWiederXaGlobal = {
  \tempo 4 = 144
  \key d \major
}

\layout {
  indent = #0
}

AlleJahreWiederXaAkkorde = \chords {
  \set chordChanges = ##t
  d4. d8 d4 a:7 d2 a2:7 d4 d8 d8 a4:7 d4 a2. r4
  d4 d g d g2 g4 g d4 d8 d a4 a d2. r4
}

AlleJahreWiederXaTextStropheEins = \lyricmode { \set stanza = #"1. "
Al- le Jah- re wie- der
kommt das Chris- tus- kind.
Auf die Er- de nie- der,
wo wir Men- schen sind.
}

AlleJahreWiederXaMelodie = \relative c'' { \AlleJahreWiederXaGlobal
a4. h8 a4 g | fis2 e | d4 e8( fis) g4 fis | e2. r4 | fis4 a h a | d2 cis4( h) | a g8( fis) g4 a | fis2. r4 \bar "|."
}

AlleJahreWiederXa = \score {<<
    \new ChordNames { \AlleJahreWiederXaAkkorde }
    \new Voice = "melodie" {\AlleJahreWiederXaMelodie}
    \new Lyrics \lyricsto "melodie" {\AlleJahreWiederXaTextStropheEins}
  >>
\layout{}}

AlleJahreWiederXaStrophen = 
\markup {
  \fill-line {
\hspace #0.1 \column {\line { \bold "2." \column {
  "Kehrt mit seinem Segen"  
  "ein in jedes Haus,"
  "geht auf allen Wegen"
  "mit uns ein und aus."
}}}
\hspace #0.1 \column { \line { \bold "3." \column {
  "Steht auch mir zur Seite"
  "still und unerkannt,"
  "daß es treu mich leite"
  "an der lieben Hand."
}}}
\hspace #0.1 \column { \line { \bold "4." \column {
  "Sagt den Menschen allen,"
  "daß ein Vater ist,"
  "dem sie wohlgefallen,"
  "der sie nicht vergisst."
}}}
\hspace #0.1
}}

\score{\AlleJahreWiederXa} \AlleJahreWiederXaStrophen

\markuplines {
  \italic {
    \line {
      Gesetzt von Sebastian Werk
      \general-align #Y #DOWN {
        \epsfile #X #3 #"publicdomain.eps"
      }
    }
  }
}
