% Dieses Notenblatt wurde erstellt von Peter Crighton [http://www.petercrighton.de] 
%
% Kontakt: PeteCrighton@googlemail.com

\version "2.12.3"
\header {
  title = "Macht hoch die Tür"
  poet = "Text: Georg Weissel (1623)"
  composer = "Melodie: Freylinghausensches Gesangbuch (1704)"
}
\layout {
  indent = #0
}
akkorde = \chordmode {
  r4 es1. as2. bes
  as es bes es
  bes es c:m bes
  es c:m f bes
  as2 es4 as2 es4 as2. es
  c2:m bes4 c2:m g4:m as2. es
  c:m f:m bes1.
  as2. bes es1*5/4
}
melodie = \relative c' {
  \clef "treble"
  \time 6/4
  \key es\major
  \partial 4
  g'4 | bes2 as4 g2 f4 | es( f) g f2 bes4 |
  as2 as4 g2 g4 | f( es) f es2 g4 |
  f2 f4 g( a) bes | bes( c) a bes2 f4 |
  g2 f4 g( a) bes | bes( c) a bes2 bes4 |
  c2 bes4 c2 bes4 | c( bes) as g2 bes4 |
  c2 bes4 c2 bes4 | c( bes) as g2 bes4 |
  es,2 es4 as2 g4 | f2.~ f2 bes4 |
  as2 g4 f( es) f | es2.~ es2 \bar "|."
}
text = \lyricmode {
  \set stanza = "1."
  Macht hoch die Tür, die Tor __ macht weit;
  es kommt der Herr der Herr -- lich -- keit,
  ein Kö -- nig al -- ler Kö -- nig -- reich,
  ein Hei -- land al -- ler Welt zu -- gleich,
  der Heil und Le -- ben mit sich bringt;
  der -- hal -- ben jauchzt, mit Freu -- den singt:
  Ge -- lo -- bet sei mein Gott, __
  mein Schöp -- fer reich von Rat. __
}
\score {
  <<
    \new ChordNames \transpose es c { \akkorde }
    \new Voice = "Lied" \transpose es c { \melodie }
    \new Lyrics \lyricsto "Lied" { \text }
  >>
}
\markup {
  \fill-line {
    \hspace #0.1
    \column {
      \line {
	\bold "2."
        \column {
          "Er ist gerecht, ein Helfer wert;"
	  "Sanftmütigkeit ist sein Gefährt,"
	  "sein Königskron ist Heiligkeit,"
	  "sein Zepter ist Barmherzigkeit;"
	  "all unsre Not zum End er bringt,"
	  "derhalben jauchzt, mit Freuden singt:"
	  "Gelobet sei mein Gott,"
	  "mein Heiland groß von Tat."
	}
      }
      \hspace #0.1
      \line {
        \bold "4."
        \column {
          "Macht hoch die Tür, die Tor macht weit,"
          "eu'r Herz zum Tempel zubereit'."
          "Die Zweiglein der Gottseligkeit"
          "steckt auf mit Andacht, Lust und Freud;"
          "so kommt der König auch zu euch,"
          "ja, Heil und Leben mit zugleich."
          "Gelobet sei mein Gott,"
          "voll Rat, voll Tat, voll Gnad."
        }
      }
    }
    \hspace #0.1
    \column {
      \line {
        \bold "3."
        \column {
          "O wohl dem Land, o wohl der Stadt,"
          "so diesen König bei sich hat."
          "Wohl allen Herzen insgemein,"
          "da dieser König ziehet ein."
          "Er ist die rechte Freudensonn,"
          "bringt mit sich lauter Freud und Wonn."
          "Gelobet sei mein Gott,"
          "mein Tröster früh und spat."
        }
      }
      \hspace #0.1
      \line {
        \bold "5."
        \column {
          "Komm, o mein Heiland Jesu Christ,"
	  "meins Herzens Tür dir offen ist."
	  "Ach zieh mit deiner Gnade ein;"
	  "dein Freundlichkeit auch uns erschein."
	  "Dein Heilger Geist uns führ und leit"
	  "den Weg zur ewgen Seligkeit."
	  "Dem Namen dein, o Herr,"
	  "sei ewig Preis und Ehr."
        }
      }
    }
    \hspace #0.1
  }
}

\markuplines {
  \italic {
    \line {
      Gesetzt von Peter Crighton
      \general-align #Y #DOWN {
        \epsfile #X #3 #"publicdomain.eps"
      }
    }
  }
}
