% Copyright (C) 2010 Ingo van Lil <inguin@gmx.de>
% This work is licensed under a Creative Commons Attribution 3.0 License.

\version "2.12"

#(set-default-paper-size "a4")
#(set-global-staff-size 17)

\header {
    title = "Vom Himmel hoch, da komm' ich her"
    composer = "Text und Musik: Martin Luther (1535)"
}

\layout {
  indent = #0
}

melody = \relative c'' {
    \clef treble
    \key c \major
    \time 4/4
    \partial 8

    c8 b4 a b g a b c
    r8 c c4 g g e g f e
    r8 e a4 a g b c a g
    r8 c b4 a g g f8( e) d4 c2
    \bar "|."
}

text = \lyricmode {
    Vom Him- mel hoch, da komm' ich her,
    ich bring' euch gu- te neu- e Mär,
    der gu- ten Mär bring' ich so viel,
    da- von ich sing'n und sa- gen will. 
}

harmonies = \chordmode {
    \germanChords
    c8 g4 d4 g c/e f g c2
    a4:m g/b e:m a:m g d:m a2
    f4 d:m g2 c4 d g4.
    a8:m e4:m f c g/b f/a g c2
}

\score {
    <<
        \new ChordNames {
            \harmonies
        }
        \new Voice = "sopran" {
            \melody
        }
        \new Lyrics \lyricsto "sopran" \text
    >>
    \layout {
        \context {
            \Score
            \remove "Bar_number_engraver"
        }
    }
    \midi {}
}

\markup {
  \fill-line {
        \column {
            \hspace #0
            \line { 2. Euch ist ein Kindlein heut’ geborn }
            \line {    Von einer Jungfrau auserkorn, }
            \line {    Ein Kindelein, so zart und fein, }
            \line {    Das soll eu’r Freud und Wonne sein. }

            \hspace #0
            \line { 3. Es ist der Herr Christ, unser Gott, }
            \line {    Der will euch führn aus aller Not, }
            \line {    Er will eu’r Heiland selber sein, }
            \line {    Von allen Sünden machen rein. }

            \hspace #0
            \line { 4. Er bringt euch alle Seligkeit, }
            \line {    Die Gott der Vater hat bereit, }
            \line {    Daß ihr mit uns im Himmelreich }
            \line {    Sollt leben nun und ewiglich. }

            \hspace #0
            \line { 5. So merket nun das Zeichen recht: }
            \line {    Die Krippe, Windelein so schlecht, }
            \line {    Da findet ihr das Kind gelegt, }
            \line {    Das alle Welt erhält und trägt. }

            \hspace #0
            \line { 6. Des laßt uns alle frölich sein }
            \line {    Und mit den Hirten gehn hinein, }
            \line {    Zu sehn, was Gott uns hat beschert, }
            \line {    Mit seinem lieben Sohn verehrt. }
        }

        \column {
            \hspace #0
            \line { 7. Merk auf, mein Herz, und sieh dorthin! }
            \line {    Was liegt dort in dem Krippelein? }
            \line {    Wes ist das schöne Kindelein? }
            \line {    Es ist das liebe Jesulein. }

            \hspace #0
            \line { 8. Sei mir willkommen, edler Gast! }
            \line {    Den Sünder nicht verschmähet hast }
            \line {    Und kommst ins Elend her zu mir, }
            \line {    Wie soll ich immer danken dir? }

            \hspace #0
            \line { 9. Ach, Herr, du Schöpfer aller Ding, }
            \line {    Wie bist du worden so gering, }
            \line {    Daß du da liegst auf dürrem Gras, }
            \line {    Davon ein Rind und Esel aß! }

            \hspace #0
            \line { 10. Und wär’ die Welt vielmal so weit, }
            \line {     Von Edelstein und Gold bereit’, }
            \line {     So wär sie doch dir viel zu klein, }
            \line {     Zu sein ein enges Wiegelein. }

            \hspace #0
            \line { 11. Der Sammet und die Seide dein, }
            \line {     Das ist grob Heu und Windelein, }
            \line {     Darauf du König groß und reich }
            \line {     Herprangst, als wär’s dein Himmelreich. }
        }

        \column {
            \hspace #0
            \line { 12. Das hat also gefallen dir, }
            \line {     Die Wahrheit anzuzeigen mir: }
            \line {     Wie aller Welt Macht, Ehr und Gut }
            \line {     Vor dir nichts gilt, nichts hilft noch tut. }

            \hspace #0
            \line { 13. Ach, mein herzliebes Jesulein, }
            \line {     Mach dir ein rein, sanft Bettelein, }
            \line {     Zu ruhen in meins Herzens Schrein, }
            \line {     Das ich nimmer vergesse dein. }

            \hspace #0
            \line { 14. Davon ich allzeit fröhlich sei, }
            \line {     Zu springen, singen immer frei }
            \line {     Das rechte Susaninne schon, }
            \line {     Mit Herzenslust den süßen Ton. }

            \hspace #0
            \line { 15. Lob, Ehr sei Gott im höchsten Thron, }
            \line {     Der uns schenkt seinen ein’gen Sohn. }
            \line {     Des freuen sich der Engel Schar }
            \line {     Und singen uns solch neues Jahr. }
        }
      }
}


\markuplines {
  \italic {
    \line {
      Gesetzt von Ingo van Lil
      \general-align #Y #DOWN {
        \epsfile #X #3 #"publicdomain.eps"
      }
    }
  }
}
