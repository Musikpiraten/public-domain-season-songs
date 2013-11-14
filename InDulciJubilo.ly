% ****************************************************************
% *** Created on Thu Feb 03 22:24:02 CET 2011 by Wolfgang Pilz ***
% ****************************************************************

% *** Vorspann                                                 ***
\version "2.12.3"
\include "deutsch.ly"
\include "default.ly"

%#(set-default-paper-size "a5")
%#(set-global-staff-size 16)

\header {
	title = "In dulci jubilo" 
 	composer = "Weihnachtslied, 14. Jhd." 	
 	poet = "traditionell" 
  	tagline = ""
}


% ****************************************************************
% *** Text und Melodie                                         ***
% ****************************************************************
 
Melodie = \relative c'         
  { 	
 % Type notes here 
	\partial 4		
        f4
        f2 f4 a2 b4
        c2( d4 c2) c4
        f,2 f4 a2 b4
        c2( d4 c2.)
        \break  
        c2 d4 c2 b4
        a2. f2 f4
        g2 g4 a2 g4
        f2(g4 a2) a4
        \break
        c2 d4 c2 b4
        a2. f2 f4
        g2 g4 a2 g4
        f2( g4 a2) r4
        \break
        d,2 d4 e2 e4
        f2.( c'2.)
        a2 a4 g2 g4
        f2.( f2) 
	\bar "|."
	}

Akkorde = \chordmode { \germanChords
	\set chordChanges = ##t
	f4 f2 f4 d2:m g4:m f2 b4 c2 a4:m d2.:m b2. f2 g4 c2.
	f2 b4 f2 g4:m d2.:m d2:m d4:m g2:m c4 f2 c4 d2:m c4 f2. f2 b4 c2 g4:m
        a2. d2.:m g2:m c4 f2 c4 d2 g4:m a2.
        b2 g4:m c2 a4:m d2.:m c2. f2. g2:m c4 f2. f2
	}

Text = \lyricmode {
        \set stanza = "1." In dul -- ci ju -- bi -- lo, 
        nun sin -- get und seid froh! 
        Uns -- res Her -- zens Won -- ne 
        leit in prae -- se -- pi -- o 
        und leuch -- tet als die Son -- ne 
        ma -- tris in gre -- mi -- o, 
        Al -- pha es et O, Al -- pha es et O.
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
      \key f \major
      \time 6/4
      \Melodie
    }
    \new Lyrics = Strophe \lyricsto Melodie \Text
  >>
  %\midi{}
}

\markup {
  \fill-line { \huge
    \hspace #0.1 
     \column {
	  \hspace #0.3 
      \line { \bold "2."
        \column {
   "O Jesu parvule, nach dir ist mir so weh!"
   "Tröst mir mein Gemüte, o puer optime,"
   "durch alle deine Güte, o princeps gloriae,"
   "trahe me post te, trahe me post te."
        }
      }
 
      \hspace #0.3 
      \line { \bold "3."
        \column {
        "Ubi sunt gaudia? Nirgend mehr denn da,"
        "wo die Engel singen nova cantica,"
        "und die Schellen klingen in regis curia."
        "Ei-a, wärn wir da, ei-a wärn wir da."
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
  }
}
