\version "2.12.3"

\include "default.ly"

\header {
  title = "Freut euch, ihr lieben Christen"
  poet = "Text: Traditionell"
  composer = "Melodie: Leonhart Schröter"
  tagline = ##f
}

Global = {
  \key f \major
  \times 4/4
  \autoBeamOff
}

Barline = |
EndMovementBarline = \bar "|."

% The music follows

Melodie =  { \Global
  \partial 2 f'2 
  f'4 f' g' a'
  bes'2 a'4 a'
  g' f' f' e'
  f'2 r4 f'
  f' f' g' a'
  bes'2 a'4 a'
  g' f' g' g'
  a'2 r4 a'
  c'' c'' c'' b'
  c''2 c''4 c''
  b' c'' c'' b'
  c''2 r4 c''
  c'' c'' bes' bes'
  a'2 g'4 g'
  a' bes' c''4. (bes'8
  a'4 bes') g'2
  f'2 r %r4 c''4
%  c'' c'' bes' bes'
%  a'2 g'4 g'
%  a' bes' c''4. bes'8
%  a'4 bes' g'2
%  f'1
%  f'
%  f'
}

StropheEins = \lyricmode {
Freut euch, ihr lie- ben Chris- ten
Freut euch von Her- zen sehr,
Euch ist ge- bo- ren Chri- stus,
Recht gu- te, neu- e Mär.
Es sin- gen uns die Eng- el
Aus Got- tes ho- hem Thron,
Gar lieb- lich tun sie sin- gen
Für- wahr ein sü- ßen Ton.
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
    \column {
      \line {
        \bold "2."
        \column {
"Also tun sie nun singen:"
"Das Kindlein ist euch hold,"
"Es ist des Vaters Wille,"
"Der hat's also gewollt,"
"Es ist euch dargegeben,"
"Dadurch ihr sollet ha'n"
"Des Vaters Gunst und Segen,"
"Sein Gnad' ist aufgetan."
        }
      }
    }
    \column {
      \line {
        \bold "3."
        \column {
"Tod, Teufel, Sünd' und Hölle"
"Haben den Sieg verlor'n,"
"Das Kindlein tut sie fällen,"
"Ganz nichts gilt jetzt ihr Zorn,"
"Ihr' Macht, die ist gekränket,"
"Da ist kein Zweifel an,"
"Das Kindlein tut sie fällen,"
"Das sei euch kundgetan."
        }
      }
    \hspace #0.1
    }
  }
}
