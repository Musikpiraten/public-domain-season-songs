% Für das Projekt "Gemeinfreie Weihnachtslieder 2011" der Musikpiraten e.V.
% Webseite http://musik.klarmachen-zum-aendern.de/
% Dieses Notenblatt wurde bearbeitet von Ingo Felger [www.facebook.com/Tschilp] 
% Kontakt: chirp@ulmo.org
% Ursprünglicher Satz: David Herrmann, hedavid@arcor.de


\version "2.12.3"
\include "deutsch.ly"
\include "default.ly"

\header {
    title = "Ich lag und schlief, da träumte mir"
    poet = "Text: Hoffmann von Fallersleben (1798-1872)"
    composer = "Melodie: Volksweise"
    source = "Das Buch der Weihnachtslieder. Bremen, 1´896"
    tagline = ""
}


SongMelodyOne = \relative c' {
    d8 fis8
    a4 a fis d
    e8 d8 e8 fis8 e4 d8 fis8
    a4 a4 fis4 d4
    e2 r4 a8 cis8
    e4 e4 cis4 e4
    a,4. d8 d4 a8 cis8
    e4 e4 cis a
    d2
}
SongMelodyTwo = \relative c' {
    d4
    d4 d d d
    cis4 cis4 cis4 d4
    d4 d4 d4 d4
    cis2 r4 cis8 e8
    g4 g4 g4 e4
    d4. fis8 fis4 cis8 e8
    g4 g g g
    fis2
}
SongMelodyThree = \relative c {
    fis4
    fis4 fis4 a4 fis4
    g4 g g fis
    fis fis a a
    a2 r4 a4
    cis4 cis4 e4 cis4
    d4. a8 a4 a
    cis cis e cis
    a2
}
SongMelodyFour = \relative c {
    d4
    d d d d
    a a a d
    d d d fis
    a2 r4 a,4
    a'4 a a a8 g8
    fis4. d8 d4 a'
    a, a a' a
    d,2
}


SongChords = \chordmode { \set chordChanges = ##t \germanChords
s4 d1 a2.:7 d4 d1 a2 s4 a4 a1:7 d2. a4 a1:7 d2 s4
}

SongText = \lyricmode { \set stanza = "1."
	Ich4 __ lag und schlief, da träum -- te mir
	ein wun -- der -- schö -- ner Traum:2. 
	Es4 stand4 auf4 un -- serm Tisch vor mir
	ein hoh -- er Weih -- nachts -- baum.
}

\score { 
<<
  \new ChordNames { \SongChords }
  \new GrandStaff
  << 
    \new Staff = "upper" {
      \clef treble
      \key d\major
      \time 4/4
      \override Staff.TimeSignature   #'style = #'numbered
      \partial 4

      <<
      \new Voice = "v1" {
          \voiceOne
          \SongMelodyOne
      }
      \new Voice = "v2" {
          \voiceTwo
          \SongMelodyTwo
      }
      >>
      r4 \bar "|."
    }
    \new Lyrics \SongText
    \new Staff = "lower" {
      \clef bass
      \key d\major
      \time 4/4
      \override Staff.TimeSignature   #'style = #'numbered
      \partial 4

      <<
      \new Voice = "v3" {
          \voiceOne
          \SongMelodyThree
      }
      \new Voice = "v4" {
          \voiceTwo
          \SongMelodyFour
      }
      >>
      r4 \bar "|."
    }
  >>
>>

  \layout{
    \context {
      \GrandStaff
      \accepts "Lyrics"
    }
    \context {
      \Lyrics
      \consists "Bar_engraver"
    }
  }
  %\midi{}
}

  
\markup {
  \hspace #0.1
  \column {
    \line {
      \bold "2."
      \column {
          "Und bunte Lichter ohne Zahl,"
          "Die brannten rings umher,"
          "Die Zweige waren allzumal"
          "Von goldnen Äpfeln schwer."
      }
    }
    \hspace #0.1
    \line {
      \bold "4."
      \column {
          "Und als ich nach dem Baume sah"
          "Und ganz verwundert stand,"
          "Nach einem Apfel griff ich da,"
          "Und alles, alles schwand."
      }
    }
    \hspace #0.1 
    \line {
      \bold "6."
      \column {
          "Da war es just, als rief er mir:"
          "„Du darfst nur artig sein,"
          "Dann steh ich wiederum vor dir —"
          "Jetzt aber schlaf nur ein!“"
      }
    }
  }
  \hspace #0.1
  \column {
    \line {
      \bold "3."
      \column {
          "Und Zuckerpuppen hingen dran;"
          "Das war mal eine Pracht!"
          "Da gabs, was ich nur wünschen kann"
          "Und was mir Freude macht."
      }
    }
    \hspace #0.1
    \line {
      \bold "5."
      \column {
          "Da wacht ich auf aus meinem Traum"
          "Und dunkel wars um mich:"
          "Du lieber, schöner Weihnachtsbaum,"
          "Sag an, wo find ich dich?"
      }
    }
    \hspace #0.1 
    \line {
      \bold "7."
      \column {
          "„Und wenn du folgst und artig bist,"
          "Dann ist erfüllt dein Traum,"
          "Dann bringet dir der heilge Christ"
          "Den schönsten Weihnachtsbaum.“"
      }
    }
  }
  \hspace #0.1
}

