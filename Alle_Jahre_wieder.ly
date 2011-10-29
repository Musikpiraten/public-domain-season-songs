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

AlleJahreWiederXaTextStropheEins = \lyricmode { \set stanza = #"1. "
Al- le Jah- re wie- der
kommt das Chris- tus- kind.
Auf die Er- de nie- der,
wo wir Men- schen sind.
}

AlleJahreWiederXaMelodie = \relative c'' {
a4. h8 a4 g | fis2 e | d4 e8( fis) g4 fis | e2. r4 | fis4 a h a | d2 cis4( h) | a g8( fis) g4 a | fis2. r4 \bar "|."
}

AlleJahreWiederXaGesang =
\new ChoirStaff {<<
  \new Staff {\AlleJahreWiederXaGlobal \key d \major <<
    \new Voice = "melodie" {\AlleJahreWiederXaMelodie}
    \new Lyrics \lyricsto "melodie" {\AlleJahreWiederXaTextStropheEins}
  >>}
>>}

AlleJahreWiederXa = \score {<<
  \AlleJahreWiederXaGesang
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
