\version "2.12.3"

\include "default.ly"

\header {
  title = "Empor zu Gott, mein Lobgesang"
  poet = "Text: Friedrich Adolf Krummacher (1811)"
  composer = "Musik: Jacob Praetorius (1604)"
  tagline = ##f
}

Global = {
  \key a \major
  \times 4/4
  \autoBeamOff
}

Barline = |
EndMovementBarline = \bar "|."

% The music follows

Melodie =  { \Global
  r4 a' e'' e''
  fis'' e'' d''8 [cis'' d''] b'
  cis''2 r4 e''4
  e'' e'' e'' cis''
  e'' b' a'2
  r4 e' a' b'
  cis''4. b'8 a'4 b'
  cis''2 r4 d''4
  e'' e'' e'' cis''
  d'' b' a'2
}

StropheEins = \lyricmode {
Em- por zu Gott, mein Lob- ge- sang!
Er, dem das Lied der Eng- el klang,
der ho- he Freu- den- tag ist da,
lob- sing- en ihm, hal- le- lu- ja!

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
    \hspace #0.1
    \column {
      \line {
        \bold "2."
        \column {
"Vom Himmel kam in dunkler Nacht,"
"der uns das Lebenslicht gebracht."
"Nun leuchtet uns ein milder Strahl"
"wie Morgenrot im dunklen Tal."
        }
      }
      \hspace #0.1
      \line {
        \bold "4."
        \column {
"Er, der jetzt bei dem Vater thront,"
"hat unter uns ein Mensch gewohnt,"
"damit auch wir ihm werden gleich"
"auf Erden und im Himmelreich."
        }
      }
    }
    \hspace #0.1
    \column {
      \line {
        \bold "3."
        \column {
"Er kam, des Vaters Ebenbild,"
"von schlichtem Pilgerkleid umhüllt,"
"und führet uns mit sanfter Hand,"
"ein treuer Hirt, ins Vaterland."
        }
      }
      \hspace #0.1
      \line {
        \bold "5."
        \column {
"Empor zu Gott, mein Lobgesang!"
"Er, seine Brüder, auch hinan,"
"und wandelt unser Pilgerkleid"
"in Sternenglanz und Herrlichkeit."
        }
      }
    }
    \hspace #0.1
  }
}