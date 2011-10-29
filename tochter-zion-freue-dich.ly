%=============================================
%   created by MuseScore Version: 0.9.6
%          Mittwoch, 17. November 2010
%=============================================

\version "2.12.0"



#(set-default-paper-size "a4")

\layout {
  indent = #0
}

\paper {
  line-width    = 190\mm
  left-margin   = 10\mm
  top-margin    = 10\mm
  bottom-margin = 20\mm
  %%indent = 0 \mm
  %%set to ##t if your score is less than one page:
  ragged-last-bottom = ##t
  ragged-bottom = ##f
  %% in orchestral scores you probably want the two bold slashes
  %% separating the systems: so uncomment the following line:
  %% system-separator-markup = \slashSeparator
  }

\header {
    title = "Tochter Zion, freue dich"
    composer = "G. F. Händel, 1747"
    poet = "F. H. Ranke, 1823"
    }

AvoiceAA = \relative c'{
    \set Staff.instrumentName = #""
    \set Staff.shortInstrumentName = #""
    \clef treble
    %staffkeysig
    \key es \major
    %barkeysig:
    \key es \major
    %bartimesig:
    \time 2/2
    bes'2 g4.( aes8)      | % 1
    bes2 ees,      | % 2
    f8( g aes bes aes4) g      | % 3
    f1      | % 4
    g8( aes bes c) bes4 bes      | % 5
    ees2 bes      | % 6
    aes4( g f4.) ees8      | % 7
    ees1 ^\markup {\upright \bold  "fine"} \bar "|."     | % 8
    g8( f g aes g4) g      | % 9
    f2 ees      | % 10
    aes4( g f) ees      | % 11
    d1      | % 12
    ees8( d ees f ees4) ees      | % 13
    c'2 a      | % 14
    bes4( c8 bes a4.) bes8      | % 15
    bes1 ^\markup {\upright \bold  "d. c. al fine"} \bar "|."
}% end of last bar in partorvoice

      ApartAverseA = \lyricmode { \set stanza = " 1. " Toch  ter Zi -- on freu -- e Dich, ja- uch ze laut, Je -- ru -- sa -- lem Sieh, dein Kö nig kommt zu dir, ja er kommt, der Frie -- de fürst }

\score {
    <<
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
%%        \override Score.TimeSignature #'style = #'() %%makes timesigs always numerical
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
        \bold "2."
          \column {
"Hosianna, Davids Sohn, sei gesegnet deinem Volk!"
"Gründe nun dein ewges Reich, Hosianna in der Höh!"
"Hosianna, Davids Sohn, sei gesegnet deinem Volk!"
}
}
\markup {
        \bold "3."
\column {
"Hosianna, Davids Sohn, sei gegrüßet, König mild!"
"Ewig steht dein Friedensthron, du des ewgen Vaters Kind."
"Hosianna, Davids Sohn, sei gegrüßet, König mild!"
        }
      }

#(set-global-staff-size 20)
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
