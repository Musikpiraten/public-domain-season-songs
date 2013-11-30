\version "2.12.3"

\include "default.ly"
\header {
  title="Ihr Kinderlein kommet"
  composer="Melodie: Johann Abraham Peter Schulz (1794)"
  poet="Text: Christoph von Schmid (1798)"
  tagline = ""
}


Melodie=\relative c'' {
  \partial 8

  a8 | a4 fis8 a | a4 fis8 a | g4 e8 g | fis4 r8 a | \break
  a4 fis8 a | a4 fis8 a |
  % Takt 7
  g4 e8 g | fis4 r8 fis | \break
  e4 e8 e | g4 g8 g | fis4 fis8 fis | b4 r8 b | \break
  % Takt 13
  a4 a8 a | d4 a8 fis | a4 g8 e | d4. s8 \bar "|."
}


Akkorde= \chordmode {
  s8  d1 a2:7 d1. a2:7 d2
  % Takt 9
  a2 a2:7 d g a2 d2 a2:7 d
}

Text=\lyricmode {
  \set stanza = "1."
  Ihr Kin -- der -- lein kom -- met,
  oh kom -- met doch all!
  Zur Krip -- pe her kom -- met
  in Beth -- le -- hems Stall
  und seht was in die -- ser
  hoch -- hei -- li -- gen Nacht
  der Va -- ter im Him -- mel
  für Freu -- de uns macht.
}


\score{
  <<
    \new ChordNames {\Akkorde}
    \new Voice = "Melodie" {
      \autoBeamOff
      \clef violin
      \key d \major
      \time 2/4
      \Melodie
    }
    \new Lyrics = Strophe \lyricsto Melodie \Text
  >>
  %\midi{}
}


\markup { \smaller
  \fill-line {
    \hspace #0.1 % Spalte vom linken Rand wegbewegen
    % Kann entfernt werden, wenn wenig Platz auf der Seite ist
    \column {
      \hspace #1.0
      \line { \bold "2."
        \column {
          "Oh seht in der Krippe, im nächtlichen Stall,"
          "seht hier bei des Lichtleins hellglänzendem Strahl"
          "in reinlichen Windeln das himmlische Kind,"
          "viel schöner und holder als Engelein sind."
        }
      }
      \hspace #0.5 % Vertikaler Strophenzwischenraum
      \line { \bold "3."
        \column {
          "Da liegt es, das Kindlein, auf Heu und auf Stroh,"
          "Maria und Joseph betrachten es froh,"
          "die redlichen Hirten knien betend davor,"
          "hoch oben schwebt jubelnd der Engelein Chor."
        }
      }
      \hspace #0.5 % Vertikaler Strophenzwischenraum
      \line { \bold "4."
        \column {
          "Oh beugt wie die Hirten anbetend die Knie,"
          "erhebet die Hände und danket wie sie."
          "Stimmt freudig ihr Kinder, wer wollt’ sich nicht freu’n?"
          "Stimmt freudig zum Jubel der Engel mit ein!"
        }
      }
    }
    \hspace #0.1
    \column {
      \hspace #1.0
    \line { \bold "5."
        \column {
          "Oh betet „Du liebes, du göttliches Kind,"
          "was leidest du alles für unsere Sünd’"
          "ach hier in der Krippe schon Armut und Not,"
          "am Kreuze dort gar noch den bitteren Tod.“"
        }
      }
      \hspace #0.5 % Vertikaler Strophenzwischenraum
      \line { \bold "6."
        \column {
          "Was geben wir Kinder, was schenken wir dir,"
          "du bestes und liebstes der Kinder dafür?"
          "Nichts willst du von Schätzen und Reichtum der Welt,"
          "ein Herz nur voll Demut allein dir gefällt."
        }
      }
      \hspace #0.5 % Vertikaler Strophenzwischenraum
      \line { \bold "7."
        \column {
          "So nimm uns’re Herzen zum Opfer denn hin,"
          "Wir geben sie gerne mit fröhlichem Sinn,"
          "und mache sie heilig und selig wie deins"
          "und mach sie auf ewig mit deinem in eins."
        }
      }
    }
    \hspace #0.1 % Rechter Rand
  }
}

 % some settings % vim: sw=2 et
