\version "2.12.3"

\include "default.ly"

\header {
        title="Zu Bethlehem geboren"
        composer="Musik: Volksweise"
        poet="Text: Friedrich Spee (1637)"
        tagline = ""
}

Melodie=\relative c' {
        c4 f4. g8 a4 g | % 1
        f2 e4 f | % 2
        g f8( g) a4 g | % 3
        f2 r4 c' | % 4
        c a bes c | % 5
        d2 bes4 bes | % 6
        a( bes c) bes8 a | % 7
        g2. r4 | % 8
        c2 g | % 9
        a g4 a8( bes) | % 10
        c4 (f,8 g) a4 g | % 11
        f2.
}

Akkorde= \chordmode {
        \set chordChanges = ##t
        \partial 4
        s4
        f4. f8 c4 c
        f2 f4 f
        c4 c8 c c4 c
        f2 s4 f
        f f f f
        b2 b4 b
        f4 f f f8 f
        c2. s4
        f2 c
        f2 c4 c8 c
        f4 f8 f c4:7 c:7
        f2.
}

Text=\lyricmode {
        \set stanza = " 1. "
        Zu Beth -- le -- hem ge -- bo -- ren ist uns ein Kin -- de -- lein,
        das hab’ ich aus -- er -- ko -- ren, sein eigen will ich sein,
        ei -- a, ei -- a sein eigen will ich sein.
}

\score{
        <<
                \new ChordNames {\Akkorde}
                \new Voice = "Melodie" {
                        \autoBeamOff
                        \clef treble
                        \key f \major
                        \time 4/4
                        \partial 4
                        \Melodie \bar "|."
                }
                \new Lyrics = Strophe \lyricsto Melodie \Text
        >>
        \layout{}
        \midi {\context { \Score  tempoWholesPerMinute = #(ly:make-moment 90 4) } }
}

\markup {
        \fill-line{
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
                \hspace #0.1
        }
}
