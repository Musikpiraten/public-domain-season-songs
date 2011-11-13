\version "2.12.3"

\include "default.ly"

\header {
  title="We Wish You A Merry Christmas"
  composer=""
  poet="Text & Musik: Traditional aus England"
  tagline = ""
}


Melodie=\relative c' {
  \partial 4 a'4     d d8 e d cis      | % 1
  b4 b b      | % 2
  e e8 fis e d      | % 3
  cis4 a a      | % 4
  fis' fis8 g fis e      | % 5
  d4 b a8 a      | % 6
  b4 e cis      | % 7
  d2      
  a4       | % 7
  d d d      | % 8
  cis2 cis4 | % 9
  d4  cis b      | % 10
  a2 e'4      | % 11
  fis e8 e d d      | % 12
  a'4
  a a8 a      | % 13
  b4 e cis      | % 14
  d2
}
  
  
Akkorde= \chordmode {
    s4
    d2. g2. e2. a d1*4/4 g4 a4 e2 a4 d1*6/4
    a1*3/4 d4 a4 e4:7 a2.  d1. g2 a4:7 d4
}

Text=\lyricmode {
  \set stanza = " 1. "
  We wish you a mer -- ry Christ -- mas,
  we wish you a mer -- ry Christ -- mas,
  we wish you a mer -- ry  Christ -- mas and a hap -- py  New Year!
  Good ti -- dings we bring, to you and your kin.
  We wish you a mer -- ry Christ -- mas  and a hap -- py  New Year!
}


\score{
  <<
    \new ChordNames {\Akkorde}
    \new Voice = "Melodie" {
      \autoBeamOff
      \clef violin
      \key d \major
      \time 3/4
      \Melodie \bar "|."
    }
    \new Lyrics = Strophe \lyricsto Melodie \Text
  >>
  %\midi {\context {  \Score  tempoWholesPerMinute = #(ly:make-moment 110 4)  } }
}


 % some settings % vim: sw=2 et

 
 \markup {
   \hspace #0.1
   \column {
     \line {
       \bold "2."
       \column {
         "Now bring us some figgy pudding,"
         "Now bring us some figgy pudding,"
         "Now bring us some figgy pudding,"
         "And bring some out here!"
         "Good tidings we bring"
         "To you and your kin."
         "We wish you a merry Christmas "
         "And a happy New Year!"
       }
     }
     \hspace #0.1
     \line {
       \bold "4."
       \column {
         "And we won't go until we get some"
         "And we won't go until we get some"
         "And we  won't go until we get some"
         "So bring some out here!"
         "Glad tidings we bring"
         "To you and your kin;"
         "We wish you a merry Christmas"
         "And a happy New Year!"
       }
     }
   }
   \hspace #0.1
   \column {
     \line {
       \bold "3."
       \column {
         "For we all like figgy pudding"
         "For we all like figgy pudding"
         "For we all like figgy pudding"
         "Please bring it right here!"
         "Glad tidings we bring"
         "To you and your kin;"
         "We wish you a merry Christmas"
         "And a happy New Year!"
       }
     }
     \hspace #0.1
     \line {
       \bold "5."
       \column {
         "We wish you a Merry Christmas"
         "We wish you a Merry Christmas"
         "We wish you a Merry Christmas"
         "And a happy New Year."
       }
     }
   }
   \hspace #0.1
 }
