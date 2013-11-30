\version "2.12.3"

\include "default.ly"

\header{
  title = "Fröhliche Weihnacht überall"
  poet = "Text: A. H. Hoffmann von Fallersleben"
  composer = "Melodie: Aus England"
  tagline = ##f
}



Melodie=\relative c' {
  d'8 ([ c)] b c d4 b
  g4 a b4 r4
  b8 a g a b4 g
  d4 fis g4 r4
  \break
  a4 d d2
  b4 d d2
  a4 e' d b
  d c8 ([ b)] a2
  \break
  d8 ([ c)] b c d4 b
  g4 a b4 r4
  b8 a g a b4 g
  d4 fis g4 r4
  \break
  a4. b8 c4 a % darum alle 
  b( c) d2
  e4 d c b
  c2. r4
  \break
  a4. b8 c4 a
  b c d2
  d,4 b' b a 
  g2. r4
}


Akkorde= \chordmode {
  \set chordChanges = ##t
  g1 c4 d g2 g1 d2 g
  d1 g d2 g2 g2 d2
  g1 c4 d g2 g1 d2 g d1 g c d d g g2 d2 g1
}

TextEins=\lyricmode {
  \set stanza = #"1. "
  Fröh -- li -- che Weih -- nacht ü -- ber -- all!
  tö -- net durch die Lüf -- te fro -- her Schall.
  Weih -- nachts -- ton, Weih -- nachts -- baum,
  Weih -- nachts -- duft in je -- dem Raum!
  Fröh -- li -- che Weih -- nacht ü -- ber -- all!
  tö -- net durch die Lüf -- te fro -- her Schall.
  Da -- rum al -- le stim -- met in den Ju -- bel -- ton,
  denn es kommt das Licht der Welt
  von des Va -- ters Thron.
}




\score{
  <<
    \new ChordNames {\Akkorde}
    \new Voice = "Melodie" {
      \autoBeamOff
      \clef treble
      \key g \major
      \time 2/2
      \Melodie \bar "|."
    }
    \new Lyrics = "Strophe1" \lyricsto Melodie \TextEins
  >>
  \layout{}
  \midi {\context {  \Score  tempoWholesPerMinute = #(ly:make-moment 110 4)  } }
}

\markup {
  \hspace #0.1
  \column {
    \line {
      \bold "2."
      \column {
  "Fröhliche Weihnacht überall!"
  "tönet durch die Lüfte froher Schall."
  "Weihnachtston, Weihnachtsbaum,"
  "Weihnachtsduft in jedem Raum!"
  "Fröhliche Weihnacht überall!"
  "tönet durch die Lüfte froher Schall."
  "Licht auf dunklem Wege, unser Licht bist du;"
  "denn du führst, die dir vertrau’n,"
  "ein zu sel’ger Ruh’."
      }
    }
  }
  \hspace #0.1
  \column {
    \line {
      \bold "3."
      \column {
  "Fröhliche Weihnacht überall!"
  "tönet durch die Lüfte froher Schall."
  "Weihnachtston, Weihnachtsbaum,"
  "Weihnachtsduft in jedem Raum!"
  "Fröhliche Weihnacht überall!"
  "tönet durch die Lüfte froher Schall."
  "Was wir andern taten, sei getan für dich,"
  "dass bekennen jeder muss,"
  "Christkind kam für mich."
    }
  }
}
}
