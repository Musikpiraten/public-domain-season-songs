\version "2.12.3"
\include "deutsch.ly"


snotes = \relative c'' {
  \partial 4
  g4
  c d es c
  b4. as8 g4 \breathe b
  es,4. d8 es4 f
  g2 g4 \breathe g
  c d es c
  b4. as8 g4 \breathe b
  es,4. d8 es4 f
  g2 g4 \breathe b
  es b c b
  as4. b8 g4 \breathe b
  es b c b
  as4. b8 g4 \breathe g
  a h c8[ es] d[ c]
  %\set Timing.measurePosition = #(ly:make-moment 1 4)
  h2 c4\fermata
  \bar "|."
}

anotes = \relative c' {
  \partial 4
  es8[ f]
  g4 f es8[ f] g[ es]
  f[ d] es[ f] es4 \breathe b
  c4. d8 c4 d8[ c]
  d2 d4 \breathe es8[ f]
  g4 f es8[ f] g[ es]
  f[ d] es[ f] es4 \breathe b
  c4. d8 c4 d8[ c]
  d2 d4 \breathe es8[ f]
  g[ as] b[ g] as4 es
  f4. d8 es4 \breathe g8[ f]
  es[ f] g[ f] es4 es
  es d es \breathe es
  f g g as
  
  g4. f8 es4\fermata
}

tnotes = \relative c' {
  \partial 4
  c4
  g g c c
  f,4. b8 b4 \breathe g
  g g c8[ b] as[ c]
  c2 h4 \breathe c
  g g c c
  f,4. b8 b4 \breathe g
  g g c8[ b] as[ c]
  c2 h4 \breathe b
  b es es4. b8
  c4 b b \breathe b
  c b as b8[ g]
  c4 b b \breathe c
  c d c f8[ es]
  
  d2 c4 \fermata
}

bnotes = \relative c {
  \partial 4
  \repeat unfold 2 {
    c8[ d]
    es[ d] c[ h] c[ d] es[ c]
    d[ b] c[ d] es4 \breathe es8[ d]
    c[ g'] c[ b] as[ g] as4
    g2 g,4 \breathe }
  g'8[ f]
  es[ f] g[ es] as4. g8
  f8[ es] d[ f] es4 \breathe es8[ d]
  c[ d] es[ d] es[ d] g[ es]
  f4 b, es c
  f8[ es] f[ d] es4 f
 
  g g, c\fermata
}

choraltextone = \lyricmode {
  \set stanza = #"1. "
  Ich steh' an dei -- ner Krip -- pen hier,
  o Je -- su, du mein Le -- ben;
  ich kom -- me, bring und schen -- ke dir,
  was du mir hast ge -- ge -- ben.
  Nimm hin, es ist mein Geist und Sinn,
  Herz, Seel und Mut, nimm al -- les hin
  und lass dir's wohl ge -- fal -- len.
}

choraltextfour = \lyricmode {
  \set stanza = #"4. "
  Ich se -- he dich mit Freu -- den an
  und kann mich nicht satt se -- hen;
  und weil ich nun nichts wei -- ter kann,
  bleib ich an -- be -- tend ste -- hen.
  O dass mein Sinn ein Ab -- grund wär
  und mei -- ne Seel ein wei -- tes Meer,
  dass ich dich möch -- te fas -- sen.
}

choraltextnine = \lyricmode {
  \set stanza = #"9. "
  Eins a -- ber hoff ich, wirst du mir,
  mein Hei -- land nicht ver -- sa -- gen:
  dass ich dich mö -- ge für und für
  in, bei und an mir tra -- gen.
  So lass mich doch dein Kripp -- lein sein;
  komm, komm und le -- ge bei mir ein
  dich und all dei -- ne Freu -- den.
}

spart = {
  \new Staff <<
    \new Voice = "s" {
      \key g \minor
      \autoBeamOff
      \snotes
    }
    \new Lyrics \lyricsto "s" \choraltextone
    \new Lyrics \lyricsto "s" \choraltextfour
    \new Lyrics \lyricsto "s" \choraltextnine
  >>
  
}



\bookpart {
  
  \header {
    title = "Ich steh an deiner Krippe hier"
    composer = "Musik: Johann Sebastian Bach"
    poet = "Text: Paul Gerhardt"
    opus = "BWV 469"
  }
  
  #(set-global-staff-size 19)

  \score {
    \new ChoirStaff <<
      \new Staff <<
        \key g \minor
        \new Voice = "s" {
          \autoBeamOff
          \voiceOne
          \snotes
        }
        \new Voice = "a" {
          \autoBeamOff
          \voiceTwo
          \anotes
        }
        \new Lyrics \lyricsto "s" \choraltextone
        \new Lyrics \lyricsto "s" \choraltextfour
        \new Lyrics \lyricsto "s" \choraltextnine
      >>
      
      \new Staff <<
        \key g \minor
        \clef bass
        \new Voice = "t" {
          
          \autoBeamOff
          \voiceOne
          \tnotes
        }
        
        \new Voice = "b" {
          \autoBeamOff
          \voiceTwo
          \bnotes
        }
      >>
      
    >>
  }
}
          
  

  
