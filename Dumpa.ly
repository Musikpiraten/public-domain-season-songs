% ****************************************************************
% *** Created on Sat Nov 19 22:24:02 CET 2011 by Wolfgang Pilz ***
% ****************************************************************

% *** Vorspann                                                 ***
\version "2.12.3"
\include "deutsch.ly"
\include "default.ly"

%#(set-default-paper-size "a5")
%#(set-global-staff-size 16)

\header {
	title = "Es wird scho glei dumpa"
 	composer = "Musik: Franz Friedrich Kohl und Josef Reiter"
 	poet = "Text: Anton Reidinger"
  	tagline = ""
}


% ****************************************************************
% *** Text und Melodie                                         ***
% ****************************************************************
 
Melodie = \relative c'         
  { 	
 % Type notes here 
   \partial4 
  \repeat volta 2 {d4
  g g a
  h8( d) d4. c8
  h4 h a
  g2 
  }
  \break
  d'4
  d h d
  d8(c) a4. c8
  h4 g h
  a2  
 
  d,4 
  g g a
  h8( d) d4. c8
  h4 h a
  g2

  c8 (fis,) 
  g2  
  a8 (d,) 
  g2 g8 (h)
  d4 h8 (g) a (d,) 
  g2 \bar "|."
}


Akkorde = \chordmode {
   r4 g2 d4 g2 s8 d8:7
   g2 d4:7 g2.
   
   g2. d:7 g d g2 d4
   g2 s8 d8:7 g2 d4:7 g2 d4:7
    g2 d4:7 g2.
   g2 d4:7 g2
}

Text = \lyricmode {
  \set stanza = "1."
{
  Es wird scho glei dum -- pa, 
  Es wird scho glei Nåcht. 

  Will sin -- gen a Lia -- dl 
  dem Lieb -- ling, dem Kloan.
  Du magst jå nit schlå -- fn
  I hör di nur woan
  Hei, hei, hei, hei!
  Schlåf süß, herz -- liabs Kind
}
}
Wdh = \lyricmode {
  Drum kimm i zu dir her. 
  Mei Hei -- lånd auf’d Wåcht.
}


Textd = \lyricmode {
  \set stanza = "1."
{
  Es wird schon gleich dun -- kel, es wird ja schon Nacht,
Wir sin -- gen ein Lied -- lein dem Kind -- lein, dem klein'.
Du magst ja nicht schla -- fen, ich hör dich nur wein'.
Ei, ei, ei, ei,
Schlaf süß, herz -- lieb's Kind.
}
}
Wdhd = \lyricmode {
  Drum komm ich zu dir her, mein Hei -- land auf d'Wacht.
}


% ****************************************************************
% *** Generierung                                              ***
% ****************************************************************

\score{
  <<
    \new ChordNames {\Akkorde}
    \new Voice = "Melodie" {
      %      \autoBeamOff
      \clef violin
      \key g \major
      \time 3/4
      \Melodie
    }
    \new Lyrics = Strophe \lyricsto Melodie \Text
    \new Lyrics = Strophe \lyricsto Melodie \Wdh
    \new Lyrics = Strophe \lyricsto Melodie \Textd
    \new Lyrics = Strophe \lyricsto Melodie \Wdhd
  >>
  %\midi {}
}
  


\markup {
  % \fill-line { \larger
    \hspace #0.1 
     \column {
      \hspace #0.3 
      \line { 
        \bold "2."
        \column {
  "Vergiß hiaz. o Kinderl, dein Kummer, dei Load  "
  "daß’d dåda muaßt leiden im Ståll auf da Hoad."
  "Es ziern jå die Engerl dei Liegerstått aus."
  "Möcht schöner nit sein drin an König sein Haus."
  "Hei, hei, hei, hei! Schlåf süß, herzliabs Kind"
        }
        
        \bold "2."
        \column {
  "Vergiß jetzt, o Kindlein, dein' Kummer, dein Leid,"
"Dass du da musst leiden im Stall auf der Heid'."
"Es zier'n ja die Engel dein Krippelein aus,"
"Möcht' schöner nicht sein in dem vornehmsten Haus."
"Ei, ei, ei, ei,Schlaf süß, herzlieb's Kind."
        }
      }
    }
    % }
    \hspace #0.1 
}
  \markup {
    % \fill-line { \larger
    \hspace #0.1 
     \column {
     \hspace #0.3 
      \line { 
        \bold "3."
        \column {
  "Måch zua deine Äugerl in Ruh und in Fried"
  "und gib mir zum Åbschied dein Segn no gråd mit!"
  "Åft werd jå mei Schlaferl a sorgenlos sein,"
  "åft kånn i mi ruah -- li aufs Nie -- der -- legn gfrein."
  "Hei, hei, hei, hei! Schlåf süß, herzliabs Kind"
        }
        
        \bold "3."
        \column {
  "Schließ zu deine Äuglein in Ruh' und in Fried'"
"Und gib mir zum Abschied dein' Segen nur mit."
"Dann wird auch mein Schlafen ganz sorgenlos sein,"
"Dann kann ich mich ruhig auf's Niederleg'n freun."
"Ei, ei, ei, ei, Schlaf süß, herzlieb's Kind."
        }
      }


      %      \hspace #0.3 
      % \italic \smaller
      %\line { 
      %"Gesetzt von Wolfgang Pilz"
      %        \general-align #Y #DOWN {
      %        \epsfile #X #3 #"publicdomain.eps"
    %}
  %}      
         
     }   
  \hspace #0.1 
  % }
}




