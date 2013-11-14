\version "2.12.3"

\include "default.ly"

\header {
  title="Süßer die Glocken nie klingen"
  composer="Musik: Volksweise (1826)"
  poet="Text: Friedrich Wilhelm Kritzinger"
  tagline = ""
}


Melodie= {
         a'8. a'16 a'8 a' g' a' |
         c''4. g' |
         g'8. g'16 g'8 g'(f') g' |
         a'4.( a'4) r8 |
         c''8. c''16 c''8 c'' a' f' |
         f''4. d'' |
         c''8. d''16 c''8 c'' bes' g' |
         f'4.( f'4) r8 |
         g'8. g'16 g'8 a' a' a' |
         c''8. bes'16 g'8 a'4. |
         g'8. g'16 g'8 a' a' a' |
         c''8. bes'16 g'8 a'4. |
         c''8. bes'16 a'8 a' g' f' |
         f''4.(d'') |
         c''8. d''16 c''8 c'' bes' g' |
         f'4.( f'4) r8
}


Akkorde= \chordmode {
  f2. c c f
  f4. f:7 b2. f4./c c:7
  f2.
  c4. f
  g4:m c8:7 f4.
  c4. f
  g4:m c8:7 f4.
  f f:7
  b2.
  f4./c c:7
  f2.
}

Text=\lyricmode {
	Sü- ßer die Glo- cken nie klin- gen, als zu der Weih- nachts- zeit; "’s ist" als ob En- ge- lein sin- gen wie- der von Frie- den
	und Freud.  Wie sie ge- sun- gen in se- li- ger Nacht, wie sie ge- sun- gen in se- li- ger Nacht! Glo- cken mit hei- li- gem Klang,
	klingt doch die Er- de ent- lang!
}


\score{
  <<
    \new ChordNames {\Akkorde}
    \new Voice = "Melodie" {
      \autoBeamOff
      \clef treble
      \key f \major
      \time 6/8
      \Melodie \bar "|."
    }
    \new Lyrics = Strophe \lyricsto Melodie \Text
  >>
  %\midi{}
}

\markup {
    \hspace #0.1
    \column {
      \line {
        \bold "2."
        \column {
"O, wenn die Glocken erklingen,"
"schnell sie das Christkindlein hört:"
"Tut sich vom Himmel dann schwingen"
"eilig hernieder zur Erd’."
\line {
       \char ##x1D106
       "Segnet den Vater, die Mutter, das Kind,"
       \char ##x1D107
}
"Glocken mit heiligem Klang,"
"Klinget die Erde entlang!"
                }
      }
      }
\hspace #0.1 \column { \line { \bold "3." \column {
"Klinget mit lieblichem Schalle"
"über die Meere noch weit,"
"dass sich erfreuen doch alle"
"seliger Weihnachtszeit."
\line {
       \char ##x1D106
       "Alle aufjauchzen mit herrlichem Sang!"
       \char ##x1D107
}
"Glocken mit heiligem Klang,"
"Klinget die Erde entlang!"
}}}
\hspace #0.1
}

 % some settings % vim: sw=2 et
