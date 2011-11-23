% Für das Projekt "Gemeinfreie Weihnachtslieder 2011" der Musikpiraten e.V.
% Webseite http://musik.klarmachen-zum-aendern.de/
% Dieses Notenblatt wurde bearbeitet von Ingo Felger [www.facebook.com/Tschilp] 
% Kontakt: chirp@ulmo.org


\version "2.12.3"
\include "deutsch.ly"
\include "default.ly"

\header {
    title = "Der Heiland ist geboren"
    composer = "Musik: Traditionell (Innsbruck 19. Jhdt.)"
    poet = "Text: Traditionell"
    tagline = ""
}


SongMelodyOne = \relative c' {
    \repeat volta 2 {     \partial 4
    f4     f( c) a' f( c) a'
    f( f' e8 d) c2 c4
    \break
    b( g) b a( f) a
    %  \partial 8*6
    g2. (g2) }
  \break
    \partial 4
    c4 
    c( g) c c a c
    c( b) a g2 c4
    \break
    c4( g) c c( a) c
    c( b) a g2  f4
       \break
    f( c) a' f c a'
    f( f') e8( d) c2 c4
    \break
    b( g) c a( f) c'8( d)
    c4( b) g f2 
}

SongChords = \chordmode { \set chordChanges = ##t
  \germanChords
s4 f1. f1. c2.:7 f2. c2 g4:7 c2
c4 c2. f2. c2 f4 c2. c2.:7 f2.
c2 f4 c2. f2. f2.:7 b2 c4 f2. c2. f2. c2. f2
}

SongTextA = \lyricmode { \set stanza = "1."
Der4 Hei2 -- land4 ist2 ge4 -- bo2. -- ren,2 freu4 dich,2 o4 Chri2 -- sten4 -- heit,4*5
Freut4 euch2 von4 Her -- zen, ihr Chri2 -- sten4 all’,2 kommt4 her2 zum4 Kind2 -- lein4 in2 dem4 Stall,2
freut4 euch2 von4 Her -- zen, ihr Chri2 -- sten4 all’,2  kommt4 her2 zum4 Kind2 -- lein4 in2 dem4 Stall.2
}
SongTextB = \lyricmode {
sonst4 wär’n2 wir4 gar2 ver4 -- lor2. -- ren2 in4 al2 -- le4 E2 -- wig4 -- keit.4*5
}

\score {
  <<
  \new ChordNames { \SongChords }
    \new Staff = "upper" {
      \clef treble
      \key f\major
      \time 6/4
      \override Staff.TimeSignature   #'style = #'numbered
      \partial 4

      \new Voice = "v1" {
          \SongMelodyOne
      }
      \bar "|."
    }
    \new Lyrics \SongTextA
    \new Lyrics \SongTextB
  >>

  \layout{
  }
  %\midi{}
}

  
\markup {
  \hspace #0.1
  \column {
    \line {
      \bold "2."
      \column {
      "Das Kindlein auserkoren,"
"Freu dich, o Christenheit,"
"Das in dem Stall geboren,"
"Hat Himmel und Erd erfreut."
\line {
       \char ##x1D106
	"Freut euch von Herzen, ihr Christen all’,"
}
\line {
	"Kommt her zum Kindlein in dem Stall."
       \char ##x1D107
}

      }
    }
    \hspace #0.1
    \line {
      \bold "4."
      \column {
          "Den Frieden sie verkünden!"
"Freu dich, du Christenheit!"
"Verzeihung aller Sünden"
"Ist uns im Stall bereit’t"
\bold "Refrain"
      }
    }
  }
  \hspace #0.1
  \column {
    \line {
      \bold "3."
      \column {
"Die Engel lieblich singen,"
"Freu dich, du Christenheit,"
"Tun gute Botschaft bringen,"
"Verkündigen große Freud."
\bold "Refrain"
      }
    }
    \hspace #0.1
    \line {
      \bold "5."
      \column {
"Der Gnadenbrunn tut fließen."
"Freu dich, du Christenheit!"
"Tut alle das Kindlein grüßen,"
"Kommt her zu ihm mit Freud!"
\bold "Refrain"
      }
    }
  }
  \hspace #0.1
}

