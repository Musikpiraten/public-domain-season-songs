%=============================================
%   created by MuseScore Version: 0.9.6.3
%          Donnerstag, 25. November 2010
%=============================================

\version "2.12.0"



#(set-default-paper-size "a4")

\paper {
  line-width    = 190\mm
  left-margin   = 10\mm
  top-margin    = 10\mm
  bottom-margin = 20\mm
  indent = 0 \mm 
  %%set to ##t if your score is less than one page: 
  ragged-last-bottom = ##t 
  ragged-bottom = ##f  
  %% in orchestral scores you probably want the two bold slashes 
  %% separating the systems: so uncomment the following line: 
  %% system-separator-markup = \slashSeparator 
  }

\header {
    title = "We Wish You A Merry Christmas "
    composer = "Traditional aus England"
    poet = "Traditional aus England"
    }

AvoiceAA = \relative c' {
    \set Staff.instrumentName = #""
    \set Staff.shortInstrumentName = #""
    \clef treble
    %staffkeysig
    \key d \major 
    %barkeysig: 
    \key d \major 
    %bartimesig: 
    \time 3/4 
    \partial 4
    a'4     d d8 e d cis      | % 1
    b4 b b      | % 2
    e e8 fis e d      | % 3
    cis4 a a      | % 4
    fis' ^\markup {\upright  "Fis"} fis8 g fis e      | % 5
    d4 ^\markup {\upright  "h"} b a8 a      | % 6
    b4 e cis      | % 7
    d2      
    a4 ^\markup {\upright  "Fine"}      | % 7
    d d d      | % 8
    cis2 cis4 
    \bar "||"     | % 9
    d4 ^\markup {\upright  "h"} cis b      | % 10
    a2 e'4      | % 11
    fis e8 e d d      | % 12
    a'4 ^\markup {\upright  "Fis"} 
    a a8 a      | % 13
    b4 e cis      | % 14
    d2 \bar "|."
}% end of last bar in partorvoice

      ApartAverseA = \lyricmode { \set stanza = " 1. " We wish you a mer -- ry  Christ -- mas,  we wish you a mer -- ry  Christ -- mas,  we wish you a mer -- ry  Christ -- mas  and a hap -- py  New Year! Good ti -- dings  we bring, to you and your kin. We wish you a mer -- ry  Christ -- mas  and a hap -- py  New Year! }
theChords = \chordmode { 
                    s4             d2. g2. e2. a4 g2 a4:7 d1. a1*5/4 e4:7 a2. d1. g2 a4:7 d4 }%%end of chordlist 

akkorde =  \chordmode { s4 d2. g e a fis b:m g2 a4:7 d2. d a b2:m e4:7 a2. d fis:m g2 a4:7 d2 }

\score { 

    << 
    \new ChordNames { \theChords } 
        \context Staff = ApartA << 
            \context Voice = AvoiceAA \AvoiceAA
        >>

         \context Lyrics = ApartAverseA\lyricsto AvoiceAA  \ApartAverseA



      \set Score.skipBars = ##t
      %%\set Score.melismaBusyProperties = #'()
      \override Score.BarNumber #'break-visibility = #end-of-line-invisible %%every bar is numbered.!!!
      %% remove previous line to get barnumbers only at beginning of system.
       #(set-accidental-style 'modern-cautionary)
      \set Score.markFormatter = #format-mark-box-letters %%boxed rehearsal-marks
       \override Score.TimeSignature #'style = #'() %%makes timesigs always numerical
      %% remove previous line to get cut-time/alla breve or common time 
      \set Score.pedalSustainStyle = #'mixed 
       %% make spanners comprise the note it end on, so that there is no doubt that this note is included.
       \override Score.TrillSpanner #'(bound-details right padding) = #-2
      \override Score.TextSpanner #'(bound-details right padding) = #-1
      %% Lilypond's normal textspanners are too weak:  
      \override Score.TextSpanner #'dash-period = #1
      \override Score.TextSpanner #'dash-fraction = #0.5
      %% lilypond chordname font, like mscore jazzfont, is both far too big and extremely ugly (olagunde@start.no):
      \override Score.ChordName #'font-family = #'roman 
      \override Score.ChordName #'font-size =#0 
      %% In my experience the normal thing in printed scores is maj7 and not the triangle. (olagunde):
      \set Score.majorSevenSymbol = \markup {maj7}
  >>

  %% Boosey and Hawkes, and Peters, have barlines spanning all staff-groups in a score,
  %% Eulenburg and Philharmonia, like Lilypond, have no barlines between staffgroups.
  %% If you want the Eulenburg/Lilypond style, comment out the following line:
  \layout {\context {\Score \consists Span_bar_engraver}}
}%% end of score-block 


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

\markuplines {
  \italic {
    \line {
      Gesetzt für http://www.kinder-wollen-singen.de
      \general-align #Y #DOWN {
        \epsfile #X #3 #"publicdomain.eps"
      }
    }
  }
}

#(set-global-staff-size 20)
