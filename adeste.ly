\version "2.12.3"

\include "default.ly"

\header {
  title = "Herbei, o ihr Gläub’gen – Adeste Fideles"
  poet = \markup {\line{ Text: \column{"Deutsch: Friedrich Heinrich Ranke" "Latein: John Francis Wade"}}}
  composer = "Musik: John Francis Wade"
  tagline = ##f
}

Melodie = \relative c'' {
  \partial 4
  a4 | a2 e4 a | b2 e, | cis'4 b cis d | cis2 b4 a |
  a2 gis4 fis | gis( a) b cis | gis2( fis4.) e8 | e1 |
  e'2 d4 cis | d2 cis | b4 cis a b | gis4.( fis8) e4 a |
  a gis a b | a2 e4 cis' | cis b cis d | cis2 b4 cis |
  d cis b a | gis2 a4( d) | cis2( b4.) a8 | a2.
}


Akkorde= \chordmode {
  s4 | a1 | e1 | a4 e a d | a2 e4 a1*3/4 e1*5/4  a4 | e1*2 |
  a1 | d2 a2 | e4 a2 e1 a2  e4 a e | a1*5/4 e4 a d | a2 e4 a |
  d a e a | e2 a4 d | a2 e2 | a1*3/4
}
  

TextLat = \context Lyrics = "textlat" \lyricmode {
  \set stanza = #"lat: 1."
  A4 -- des2 -- te,4 fi -- del2 -- es,
  Lae4 -- ti4 tri -- um -- phan2 -- tes,4
  Ven4 -- i2 -- te,4 ven -- i2 -- te4 in Beth2.. -- le8 -- hem.1
  Na2 -- tum4 vi -- de2 -- te
  Reg4 -- em ang -- el -- or2 -- um.4
  Ven -- i -- te a -- dor -- e2 -- mus,4
  Ven -- i -- te a -- dor -- e2 -- mus,4
  Ven -- i -- te a -- dor -- e2 -- mus,
  Do2.. -- mi8 -- num.2.
}

TextDeu = \context Lyrics = "textdeu" \lyricmode {
  \set stanza = #"dt.: 1."
  Her4 -- bei,2 o4 ihr Gläu2 -- b’gen, 
  fröh4 -- lich4 tri -- um -- phie2 -- rend,4
  o4     kom2 -- met,4   o   kom2 -- met4 nach Beth2.. -- le8 -- hem.1
  Se2 -- het4 das4 Kind2 -- lein,2 
  uns4 zum Heil ge -- bo2 -- ren!4
  O las -- set uns an -- be2 -- ten,4 
  o las -- set uns an -- be2 -- ten,4
  o las -- set uns an -- be2 -- "ten den"
  Kö2 -- nig,4. den8 Herrn.
}


\score{ 
  \context ChoirStaff {
    <<
      \new ChordNames { \Akkorde }
      \new Voice { 
        \clef treble
        \key a\major
        \time 4/4
        \Melodie
        \bar "|."
      }
      \new Lyrics { \TextDeu }
      \new Lyrics { \TextLat }
    >>
  }
  
  \layout{ }
  %\midi { \context { \Score tempoWholesPerMinute = #(ly:make-moment 120 4) } }
}
\markup {
  \fill-line {
    \hspace #0.1 
    \column {\line{\bold "Deutscher Text:"}
        \line {  \bold "2. "
          \column {
            "Du König der Ehren, Herrscher der Heerscharen,"
            "verschmähst nicht, zu ruhn in Marien Schoß,"
            "du wahrer Gott von Ewigkeit geboren."
            \concat{ \bold "Refrain: " "O lasset uns anbeten…"}
            }
          }
          \hspace #0.1 
          \line { \bold "3."
            \column {
              "Kommt, singet dem Herren, singt ihm, Engelchöre!"
              "Frohlocket, frohlocket, ihr Seligen:"
              "Ehre sei Gott im Himmel und auf Erden!"
              \concat{ \bold "Refrain: " "O lasset uns anbeten…"}
              }
            }
            \hspace #0.1 
            \line { \bold "4."
              \column {
                "Ja, dir, der du heute Mensch für uns geboren,"
                "Herr Jesu, sei Ehre und Preis und Ruhm,"
                "dir, fleischgewordnes Wort des ewgen Vaters!"
                \concat{ \bold "Refrain: " "O lasset uns anbeten…"}
                }
              }
            }
            \hspace #0.1 
            \column {\line{\bold "Lateinischer Text:"}
            \line {  \bold "2. "
              \column {
                "En grege relicto, humiles ad cunas"
                "Vocati pastores approperant."
                "Et nos ovanti gradu festinemus:"
                \concat{\bold "Refrain: " "Venite adoremus…"}
                }
              }
              \hspace #0.1 
              \line { \bold "3."
              \column {
                "Aeterni Parentis splendorem aeternum"
                "Velatum sub carne videbimus."
                "Deum infantem, pannis involutum,"
                \concat{\bold "Refrain: " "Venite adoremus…"}
                }
              }
              \hspace #0.1 
              \line { \bold "4."
              \column {
                "Pro nobis egenum et foeno cubantem"
                "Piis foveamus amplexibus."
                "Sic nos amantem quis non redamaret?"
                \concat{\bold "Refrain: " "Venite adoremus…"}
                }
              }
            }
            \hspace #0.1 
          }
        }
        