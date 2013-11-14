
% \version "2.12.3"

\paper {
  #(set-paper-size "a4")
}

\layout {
  indent = #0
  \context {
    \Lyrics
      \override LyricSpace #'minimum-distance = #1.6
  }
}

