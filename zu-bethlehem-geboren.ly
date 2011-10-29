%=============================================
%   created by MuseScore Version: 0.9.6
%          Donnerstag, 18. November 2010
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
    title = "Zu Bethlehem geboren"
    composer = "Friedrich Spee (1637)"
    }

AvoiceAA = \relative c'{
    \set Staff.instrumentName = #""
    \set Staff.shortInstrumentName = #""
    \clef treble
    %staffkeysig
    \key f \major 
    %barkeysig: 
    \key f \major 
    %bartimesig: 
    \time 4/4 
    \partial 4
    c4     f4. g8 a4 g      | % 1
    f2 e4 f      | % 2
    g f8 g a4 g      | % 3
    f2 r4 c'      | % 4
    c a bes c      | % 5
    d2 bes4 bes      | % 6
    a bes c bes8 a      | % 7
    g2. r4      | % 8
    c2  g      | % 9
    a g4 a8 bes      | % 10
    c4 f,8 g a4 g      | % 11
    f2. \bar "|." 
}% end of last bar in partorvoice

      ApartAverseA = \lyricmode { \set stanza = " 1. " Zu Beth -- le -- hem ge -- bo -- ren ist uns ei -- ein Kin -- de -- lein, das hab' ich aus -- er -- ko -- ren, sein ei -- ei -- gen will ich sein, ei -- a, ei -- a sei -- ein ei -- ge -- en will ich sein. }

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
"In seine Lieb versenken will ich mich ganz hinab;"
"mein Herz will ich ihm schenken und alles, was ich hab."
"Eia, eia, und alles, was ich hab."
          
        }
      }
      \hspace #0.1
      \line {
        \bold "3."
        \column {
"O Kindelein, von Herzen dich will ich lieben sehr"
"in Freuden und in Schmerzen, je länger mehr und mehr."
"Eia, eia, je länger mehr und mehr."
        }
      }
      \hspace #0.1
      \line {
        \bold "4."
        \column {
"Dich wahren Gott ich finde in meinem Fleisch und Blut;"
"darum ich fest mich binde an dich, mein höchstes Gut."
"Eia, eia, an dich, mein höchstes Gut."
        }
      }
      \hspace #0.1
      \line {
        \bold "5."
        \column {
"Dazu dein Gnad mir gebe, bitt ich aus Herzensgrund,"
"dass dir allein ich lebe jetzt und zu aller Stund."
"Eia, eia, jetzt und zu aller Stund."
        }
      }
      \hspace #0.1
      \line {
        \bold "6."
        \column {
"Lass mich von dir nicht scheiden, knüpf zu, knüpf zu das Band"
"der Liebe zwischen beiden, nimm hin mein Herz zum Pfand."
"Eia, eia, nimm hin mein Herz zum Pfand."
        }
      }
    }
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
