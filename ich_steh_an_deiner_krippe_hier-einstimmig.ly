\version "2.12.3"


\include "deutsch.ly"
\include "default.ly"

  \header {
    title = "Ich steh an deiner Krippe hier"
    composer = "Musik: Johann Sebastian Bach"
    poet = "Text: Paul Gerhardt"
    opus = "BWV 469"
    tagline = ""
  }


Melodie = \relative c'' {
  \partial 4
  g4
  c d es c
  b4. as8 g4 \breathe b
  es,4. d8 es4 f
  g2 g4 \breathe g
  c d es c
  b4. as8 g4 \breathe b
  es,4. d8 es4 f
  g2 g4 \breathe b
  es b c b
  as4. b8 g4 \breathe b
  es b c b
  as4. b8 g4 \breathe g
  a h c8[ es] d[ c]
  %\set Timing.measurePosition = #(ly:make-moment 1 4)
  h2 c4\fermata
  \bar "|."
}

choraltextone = \lyricmode {
  \set stanza = #"1. "
  Ich steh’ an dei -- ner Krip -- pen hier,
  o Je -- su, du mein Le -- ben;
  ich kom -- me, bring und schen -- ke dir,
  was du mir hast ge -- ge -- ben.
  Nimm hin, es ist mein Geist und Sinn,
  Herz, Seel und Mut, nimm al -- les hin
  und lass dir’s wohl ge -- fal -- len.
}

choraltextfour = \lyricmode {
  \set stanza = #"4. "
  Ich se -- he dich mit Freu -- den an
  und kann mich nicht satt se -- hen;
  und weil ich nun nichts wei -- ter kann,
  bleib ich an -- be -- tend ste -- hen.
  O dass mein Sinn ein Ab -- grund wär
  und mei -- ne Seel ein wei -- tes Meer,
  dass ich dich möch -- te fas -- sen.
}

choraltextnine = \lyricmode {
  \set stanza = #"9. "
  Eins a -- ber hoff ich, wirst du mir,
  mein Hei -- land nicht ver -- sa -- gen:
  dass ich dich mö -- ge für und für
  in, bei und an mir tra -- gen.
  So lass mich doch dein Kripp -- lein sein;
  komm, komm und le -- ge bei mir ein
  dich und all dei -- ne Freu -- den.
}

Akkorde= \chordmode {
\set chordChanges = ##t
g4 c1:m b2/d es
c:m as
g:sus4 g
c1:m b2/d es
c:m as
g:sus4 g4 r
es2 as4 es/g
f:m b:7 es2
es as4 es/g
f:m b:7 es c:m
f g:7/f c:m/es f:m6
g2 c4
}




\score{
  <<
    \new ChordNames {\Akkorde}
    \new Voice = "Melodie" {
      \autoBeamOff
      \clef violin
      \key c \minor
      \time 4/4
      \Melodie \bar "|."
    }
    \new Lyrics = Strophe \lyricsto Melodie \choraltextone
    %\new Lyrics = Strophe \lyricsto Melodie \choraltextfour
    %\new Lyrics = Strophe \lyricsto Melodie \choraltextnine
  >>
  %\midi{}
}


\markup {
  \hspace #0.1
  \column {
    \line {
      \bold "4."
      \column {
        "Ich sehe dich mit Freuden an"
  "und kann mich nicht satt sehen;"
  "und weil ich nun nichts weiter kann,"
  "bleib ich anbetend stehen."
  "O dass mein Sinn ein Abgrund wär"
  "und meine Seel ein weites Meer,"
  "dass ich dich möchte fassen."       
      }
    }
    \hspace #0.1
    
  }
  
  \hspace #0.1
  \column {
    \line {
      \bold "9."
      \column {
        "Eins aber hoff ich, wirst du mir,"
  "mein Heiland nicht versagen:"
  "dass ich dich möge für und für"
  "in, bei und an mir tragen."
  "So lass mich doch dein Kripplein sein;"
  "komm, komm und lege bei mir ein"
  "dich und all deine Freuden."
      }
    }
  }
  \hspace #0.1
}

