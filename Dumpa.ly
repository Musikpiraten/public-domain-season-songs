\version "2.12.3"

\header {
        title = "Es wird scho glei dumpa"
  composer = "Franz Friedrich Kohl und Josef Reiter"
  poet = "Anton Reidinger"
}

\layout {
  indent = #0
}

<<
  \new ChordNames {
  \chordmode {
   r4 g2 d4 g2. 
   g2 c4 g2
   r4 g2 d4 g2. 
   g2 c4 g2
   r4 g2. d:7 g  
   d2 r4
   g2. g2. 
   g2 d4:7  g2
   r4 g2 d4 g2. 
   g2 d4:7 g2
  }
}  
 \relative c' {
  \clef "treble"
  \key g \major
 \time  3/4  
 
  \partial4 c4
  g'  g a
  b8( d) d4. c8
  b4 b a
  g2 
  c,4 
  g'  g a
  b8( d) d4. c8
  b4 b a
  g2
  d'4
  d b d
  d8(c) a4 c
  b g b
  a2  
  c,4 
  g'  g a
  b8( d) d4. c8
  b4 b a
  g2
  c8 (fis,) 
  g2  a8 (d,) 
  g2 g8 (b)
  d4 b8 (g) a (d,) 
  g2 \bar "|."
}


\addlyrics{
  Es wird scho glei dum -- pa, 
  Es wird scho glei Nåcht. 
  Drum kimm i zu dir her. 
  Mei Hei -- land auf'd Wåcht.
  Will sin -- gen a Lia -- dl 
  dem Lieb -- ling, dem Kloan.
  Du magst ja nit schlåf -- en
  I hör di nur woan
  Hei, hei, hei, hei!
  Schlåf süß herz -- liabs Kind
}
\addlyrics{
  Ver -- giß hiaz. o Kin -- derl, dein Kum -- mer, dei Load
  daß'd då -- da muaßt lei -- den im Ståll auf da Hoad.
  Es ziern ja die Eng -- erl dei Lie -- ger -- statt aus.
  Möcht schö -- ner nit sein drin an Kön -- ig sein Haus.
}
\addlyrics {
  Måch zua dei -- ne Äu -- gerl in Ruh und in Fried
  und gib mir zum Åb -- schied dein Segn no gråd mit!
  Åft werd jå mei Schla -- ferl a sor -- gen -- los sein,
  åft kånn i mi ruah -- li aufs Nie -- der -- legn gfrein.
}
>>

\markuplines {
  \italic {
    \line {
      Gesetzt von Martin Thoma (http://www.thoma-stammler.at)
      \general-align #Y #DOWN {
        \epsfile #X #3 #"publicdomain.eps"
      }
    }
  }
}
