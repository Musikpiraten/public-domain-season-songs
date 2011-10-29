\version "2.12.3"

#(set-global-staff-size 19)

\header {
  title = "Es ist ein Ros entsprungen"
  composer = "volkstümlich"
  arranger = "Michael Praetorius / Christian Schramm"
  poet = "volkstümlich / Michael Praetorius / Friedrich Layriz"
}
global = {
  \key f \major
  \time 4/4
}

soprano = \relative c'' {
  \global
  \partial 2
  c2
  c4 c d c
  c2 a4 r
  bes2 a4 g~
  g f2 e4
  f2 r4 c'4
  
  c4 c d c
  c2 a4 r
  bes2 a4 g~
  g f2 e4
  f2 r4 a4

  
  g e f d
  c2 r4 c'
  c c d c
  c( bes) a2
  bes a4 g~
  g f2 e4
  f2\fermata
  \bar "|."
  
}

alto = \relative c'' {
  \global
  \partial 2
  a2
  a4 f f f
  e2 f4 r
  d2 c4 c
  d4.( a8) c2
  c2 r4 a'4
  
  a4 g f f
  g( e) fis4 r
  f?2 f4 d
  d4.( a8) d4( c)
  c2 r4 f4

  
  e e f d
  c2 r4 bes'
  
  a4 f f f
  e8( d e g) f( e) d4~
  d2 e4 d
  f8( e d a) c2
  c2
  
}

tenor = \relative c' {
  \global
  \partial 2
  c2
  c4 a bes a
  c2 a4 r
  bes2 a4 c
  bes( a2) g4
  a2 r4 c4
  
  c4 bes bes c
  c2 a4 r
  d2 c4 bes
  bes( a2) g4
  a2 r4 c4

  
  c a a b
  c2 r4 e
  
  c c bes a
  g2 a2
  bes8( c d bes) c( cis) d4
  c2 a4( c8 bes)
  a2\fermata
}

bass = \relative c {
  \global
  \partial 2
  f2
  f4 f bes f
  c2 d4 r
  g2 f4 e
  d2 c2
  f2 r4 f4
  
  e4 es bes a
  c2 d4 r
  bes2 c4 d
  e( f) bes,( c)
  f2 r4 f4

  
  c cis d g
  c( bes) a( g)
  f8( g) a( fis) g( f) e( d)
  c4( cis) d( fis)
  g2 a4 bes
  c2 c,2
  f2
  
}

verseOne = \lyricmode {
  \set stanza = "1. "Es ist ein Ros ent -- sprun -- gen
  aus ei -- ner Wur -- zel zart, 
  wie uns die Al -- ten sun -- gen,
  von Jes -- se kam die Art
  und hat ein Blüm -- lein bracht
  mit -- ten im kal -- ten Win -- ter,
  wohl zu der hal -- ben Nacht.  
}


\score {
  \new ChoirStaff <<
    \new Staff = "sa" \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { "Sopran" "Alt" }
    } <<
      \new Voice = "soprano" { \voiceOne \soprano }
      \new Voice = "alto" { \voiceTwo \alto }
    >>
    \new Lyrics \with {
      alignAboveContext = "sa"
    } \lyricsto "soprano" \verseOne
    \new Lyrics \lyricsto "alto" \verseOne
    \new Staff = "tb" \with {
      midiInstrument = "choir aahs"
      instrumentName = \markup \center-column { "Tenor" "Bass" }
    } <<
      \clef bass
      \new Voice = "tenor" { \voiceOne \tenor }
      \new Voice = "bass" { \voiceTwo \bass }
    >>
    \new Lyrics \with {
      alignAboveContext = "tb"
    } \lyricsto "tenor" \verseOne
    \new Lyrics \lyricsto "bass" \verseOne
  >>
  \layout { }
  \midi {
    \context {
      \Score
      tempoWholesPerMinute = #(ly:make-moment 100 4)
    }
  }
}

\markup {
  \fill-line {
    \hspace #0.1
    \column {
      \line {
        \bold "2."
        \column {
"Das Röslein, das ich meine, davon Jesaia sagt,"
    "hat uns gebracht alleine Marie die reine Magd."
    "Aus Gottes ewgem Rat"
    "hat sie ein Kind geboren wohl zu der halben Nacht."          
        }
      }
    }
    \hspace #0.1
    \column {
      \line {
        \bold "3."
        \column {
"Das Blümelein so kleine, das duftet uns so süß,"
    "mit seinem hellen Scheine vertreibt's die Finsternis:"
    "Wahr' Mensch und wahrer Gott,"
    "hilft uns aus allem Leide, rettet von Sünd und Tod."          
        }
      }
    }
    \hspace #0.1
  }
}

\markuplines {
  \italic {
    \line {
      Gesetzt von Christian Schramm
      \general-align #Y #DOWN {
        \epsfile #X #3 #"publicdomain.eps"
      }
    }
  }
}
