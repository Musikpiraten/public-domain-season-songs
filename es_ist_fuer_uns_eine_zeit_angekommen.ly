\version "2.12.3"

\include "default.ly"

\header {
  title = "Es ist für uns eine Zeit angekommen"
  poet = "Text: Christian Hufgard"
  composer = "Musik: Schweizer Sternsingerlieder"
  tagline = ##f
}

Global = {
  \key f \major
  \times 4/4
  \autoBeamOff
}

Barline = |
EndMovementBarline = \bar "|."

% The music follows

Melodie =  { \Global
  \partial 2 \repeat volta 2 {r8 f' f' g' 
  a'4 a'8 g' a'4 a'8 g' 
  a'4 a'8 g' a'4 bes'
  c'' d''8 c'' c''4. bes'8
  a'1 }
  \repeat volta 2 { c''4. c''8 d''4. c''8
  bes' (a' bes') d'' c''1
  a'4. c''8 
  g'2 a'4 c'' 
  g'2 a'4. bes'8 
  c''4 (d''8) c'' c''4. bes'8 
  a'2 }}

StropheEins = \lyricmode {
Es ist für uns ei- ne Zeit an- ge- kom- men,
die wird für uns ei- ne gro- ße Freud',
Ü- bers schnee- be- de- ckte Feld
wan- dern wir, wan- dern wir,
durch die schö- ne Win- ter- welt.

%Un- ser Hei- land J- e- su- us Christ,
%der für uns, der für uns,
%der für uns Mensch ge- wor- den ist.

}

Score = \score {<<
%    \new ChordNames { \AlleJahreWiederXaAkkorde }
    \new Voice = "melodie" {\Melodie}
    \new Lyrics \lyricsto "melodie" {\StropheEins}
  >>
  \midi{}
  \layout {}
}
\score{\Score} %################

\markup {
  \fill-line {
    \column {
      \line {
        \bold "2."
        \column {
"Es schlafen Fischlein im See unterm Eise,"
"im Wald der Bär träumt den tiefen Traum."
"Unterm Schnee, der leise fällt,"
"wandern wir, wandern wir"
"durch die schöne Winterwelt."
        }
      }
    }
    \column {
      \line {
        \bold "3."
        \column {
"Vom Himmel oben ein leuchtend' Schweigen"
"erfüllt die Herzen mit Seligkeit."
"Mit den Sternen über uns"
"wandern wir, wandern wir"
"durch die schöne Winterwelt."
        }
      }
    \hspace #0.1
    }
  }
}
