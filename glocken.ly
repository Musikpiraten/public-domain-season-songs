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


%Akkorde= \chordmode {
%  [Akkorde]
%}

Text=\lyricmode {
	Sü- ßer die Glo- cken nie klin- gen, als zu der Weih- nachts- zeit; "'s ist" als ob En- ge- lein sin- gen wie- der von Frie- den
	und Freud.  Wie sie ge- sun- gen in se- li- ger Nacht, wie sie ge- sun- gen in se- li- ger Nacht! Glo- cken mit hei- li- gem Klang,
	klingt doch die Er- de ent- lang!
}


\score{
  <<
%    \new ChordNames {\Akkorde}
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
	\epsfile #X #.6 #"musical_symbol_left_repeat_sign.eps"
	"Segnet den Vater, die Mutter, das Kind,"
	\epsfile #X #.6 #"musical_symbol_right_repeat_sign.eps"
}
"Glocken mit heiligem Klang,"
"Klinget die Erde entlang!"
                }
      }
      }
\hspace #0.1 \column { \line { \bold "3." \column {
"Klinget mit lieblichem Schalle"
"über die Meere noch weit,"
"daß sich erfreuen doch alle"
"seliger Weihnachtszeit."
\line {
	\epsfile #X #.6 #"musical_symbol_left_repeat_sign.eps"
	"Alle aufjauchzen mit herrlichem Sang!"
	\epsfile #X #.6 #"musical_symbol_right_repeat_sign.eps"
}
"Glocken mit heiligem Klang,"
"Klinget die Erde entlang!"
}}}
\hspace #0.1
}

 % some settings % vim: sw=2 et
