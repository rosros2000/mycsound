\version "2.26.0"

\header {
 title = "Maple Leaf Rag"
 composer = "Scott Joplin"
 piece = "Tempo di marcia"

 mutopiatitle = "Maple Leaf Rag"
 mutopiacomposer = "JoplinS"
 mutopiainstrument = "Piano"
 date = "c. 1899"
 style = "Jazz"
 copyright = "Public Domain"
 source = "Reproduction of original edition (1899)"

 maintainer = "Chris Sawer"
}

\include "/home/rr/Music/Music/lilypond/globalrr.ily"

\paper {
  #(set-paper-size "a4")
  ragged-last-bottom = ##t
  left-margin = 24\mm
  right-margin = 17\mm
  bottom-margin = 12\mm
  top-margin = 10\mm
  markup-system-spacing = 30\mm
  print-page-number = ##t
  print-first-page-number = ##t
  oddHeaderMarkup = \markup \null
  evenHeaderMarkup = \markup \null
  oddFooterMarkup = \markup {
    %\on-the-fly \print-page-number-check-first
    \column {
    \fill-line {\null \concat {\bold { \null \fromproperty #'page:page-number-string " / "  
                 \page-ref #'theLastPage "0" "?" }} \mytagla }
    \override #'(line-width . 100)
    \fill-line { \tiny \italic \fontsize #-1 { \filen } \null \null}
  }
}

  evenFooterMarkup = \oddFooterMarkup

 
}

#(set-global-staff-size 17)

Arh = \relative c' { 
  r16 as'\f <es' es,> as, c <es es,>8 g,16 |
  <es' es,>16 g, bes <es es,> ~ <es es,>4 |
  r16 as, <es' es,> as, c <es es,>8 g,16 |
  <es' es,>16 g, bes <es es,> ~ <es es,>8 r16 <es es,> |
  r16 as, ces <fes fes,> r16 <es es,> r16 <es es,> |
  r16 as, ces <fes fes,> r16 <es es,> r8 |
  %\change Staff = "down"
  % \stemUp r16^\p as,,,-( ces as'-) r as-( ces as'-) \stemNeutral |
  %\change Staff = "up"
  \clef "bass"
  r16^\p as,,,-( ces as'-) r as-( ces as'-)
  \clef "treble"
  r16 as-( ces as'-) r as-( ces as'-) |
  <as as,>8-\mf \< <as as,> <as as,> <as as,>16 <as as,> ~ |
  <as as,> \! es f c es <f as,>8 <as, fes>16 ~ |
  <as fes!> bes <ces fes,> as bes <c es,>8 as16 |
  <c es,> as <bes es,>8 <as es> r16 <as as,> ~ |
  <as as,>8 <as as,> <as as,> <as as,>16 <as as,> ~ |
  <as as,> es <f as,> c es <f as,>8 <as, fes>16 ~ |
  <as fes> bes <ces fes,> as bes <c es,>8 as16 |}

Brh = \relative c' { 
  r16_\markup {\dynamic f \italic "stacc."} g'16 <es' es,> g, bes <d d,>8 g,16 |
  <des'! des,!> g, bes <c c,> ~ <c c,> es, <bes' bes,> es, |
  r c <as' as,> c, es <f f,>8 c16 |
  <as' as,> c, es <f f,> ~ <f f,> c <f f,>8 |
  r16 es <g g,> bes, des <f f,>8 es16 |
  <g g,> bes, des <f f,> ~ <f f,> des <f f,>8 |
  r16 c <as' as,> c, es <f f,>8 c16 |
  <as' as,> c, es <f f,> ~ <f f,> c <f f,>8 |
  r16 g <es' es,> g, bes <d d,>8 g,16 |
  <des'! des,!> g, bes <c c,> ~ <c c,> es, <bes' bes,> es, |
  r c <as' as,> c, es <f f,>8 c16 |
  <as' as,>8 <as as,> <g g,> <ges ges,> |
  r16 f, a c f c a f |
  r f bes des <f f,>8 <des bes f> |
  <c as f d> r16 <c as f d> r <bes des,>8 es,16 |}

Returnrh = \relative c' { 
  r16-\f as <es' es,> as, c <es es,>8 g,16 |
 <es' es,>16 g, bes <es es,> ~ <es es,>4 |
 r16 as, <es' es,> as, c <es es,>8 g,16 |
 <es' es,>16 g, bes <es es,> ~ <es es,>8 r16 <es es,> |
 r16 as, ces <fes fes,> r16 <es es,> r16 <es es,> |
 r16 as, ces <fes fes,> r16 <es es,> r8 |
 \change Staff = "down"
  \stemUp r16^\p as,,,-( ces as'-) r as-( ces as'-) \stemNeutral |
 \change Staff = "up"
 r16 as-( ces as'-) r as-( ces as'-) |
 <as as,>8-\mf \< <as as,> <as as,> <as as,>16 <as as,> ~ |
 <as as,> \! es f c es <f as,>8 <as, fes>16 ~ |
 <as fes!> bes <ces fes,> as bes <c es,>8 as16 |
 <c es,> as <bes es,>8 <as es> r16 <as as,> ~ |
 <as as,>8 <as as,> <as as,> <as as,>16 <as as,> ~ |
 <as as,> es <f as,> c es <f as,>8 <as, fes>16 ~ |
 <as fes> bes <ces fes,> as bes <c es,>8 as16 |
 <c es,> as <bes es,>8 <as es> <as' as,> |}

Crh = \relative c'' {
  <as es c as>8.\f <as es c bes>16 ~ <as es c bes>16 <es c> bes8 |
  <as' es c as>8. <as es c bes>16 ~ <as es c bes>16 <es c> bes <es c> |
  as, des bes des f as, des f |
  bes, des f as, ~ as f' bes, f' |
  <as es c as>8. <as es c bes>16 ~ <as es c bes>16 <es c> bes8 |
  <as' es c as>8. <as es c bes>16 ~ <as es c bes>16 <es c> bes <es c> |
  as, des bes des f as, des f |
  bes, des f as, ~ as f' a, <f' es> |
  <bes f d bes>8. <bes f d c>16 ~ <bes f d c>16 <f d> c8 |
  <bes' f d bes>8. <bes f d c>16 ~ <bes f d c>16 <f d> c <f d> |
  r es <bes' bes,> es, ges <c c,>8 es,16 |
  <bes' bes,> es, ges <c c,> ~ <c c,> es, <bes' bes,>8 |
  <des fes, des> <des fes, des> <c fes, c> <bes fes bes,> |
  <f! as,>16 des es <ges bes,> ~ <ges bes,> bes, <f' as,>8 |
  <f g,>16 des es <f ges,> ~ <f ges,> c <es ges,> <des f,> |}

Drh = \relative c'' {  
  <as as,>8\f <f as,> <as as,> <f as,> |
  <as f> <bes f>16 <c f,> ~ <c f,> bes as f |
  es f8 <c as>16 ~ <c as>4 |
  r16 es <f as,> c es <f as,>8 c16 |
  <es g,>8 f16 <bes, g> ~ <bes g>4 |
  r16 des <f g,> bes, des <f g,>8 <c as>16 ~ |
  <c as> es <f as,> c es <f as,>8 <c as>16 ~ |
  <c as> es <f as,> c es <f as,>8 es16 |
  <as as,>8 <f as,> <as as,> <f as,> |
  <as f> <bes f>16 <c f,> ~ <c f,> bes as f |
  as8 f es16 as8 <c, as>16 ~ |
  <c as> es <f as,> c es <f as,>8 <as, f>16 ~ |
  <as f> bes <as f>8 <as fes> <bes fes>16 <as es> ~ |
  <as es> bes <c es,> as bes <c es,>8 <as d,>16 ~ |
  <as d,!> bes <c d,> as r <bes des,>8 es,16 |}

top =  \relative c' {
 \key as \major
 \time 2/4
 \tempo 4 = 110
 \clef treble
 r2 r2
 \bar "||" \mark \markup {\hspace #-5 \bold "ARA" }
 \Arh { <c es,>16 as <bes es,>8 <as es> r8 } \break
 \bar "||" \mark \markup {\hspace #-5 \bold "ARB" }
 \tempo 4  = 100
 \Arh { <c es,>16 as <bes es,>8 <as es> r8 } \break
 \tempo 4 = 110
 \bar "||" \mark \markup {\hspace #-5 \bold "BRA" } 
 \Brh { <as c,>8 <es' es,> <es es,> <es es,> }  \break
 \tempo 4 = 100
 \bar "||" \mark \markup {\hspace #-5 \bold "BRB" } 
 \Brh { r16 as, c es <as as,>8 r } \break
 \bar "||" \mark \markup {\hspace #-1 \bold "RETURN" }
 \Returnrh \break
 \key des \major
 \bar "||" \mark \markup { \hspace #-6 \bold "CRA-TRIO" }
 \tempo 4 = 110
 \Crh { <des f,>16 <as' as,>8 f16 <as as,> f <as as,> f } \break
 \bar "||" \mark \markup {\hspace #-6 \bold "CRB-TRIO" }
 \tempo 4 = 110
 \Crh  { <des f,>16 des f as <des des,>8 r } \break
 \key as \major   
 \bar "||" \mark \markup { \bold "DRA" }
 \tempo 4 = 120
 \Drh  { <as c,>8 <es' es,> <es es,> <es es,> } \break
 \bar "||" \mark \markup { \bold "DRB" }
 \tempo 4 = 110
 \Drh { <as, c,>8 <es' des g,> <as es c as> r8 } 
 \bar "|."
}

Alh = \relative c  {
  <as as,> <c as es> <c as es> <a a,> |
  <bes bes,> <des g, es> <des g, es> <es, es,> |
  <as as,> <c as es> <c as es> <a a,> |
  <bes bes,> <des g, es> <des g, es> <es, es,> |
  <fes fes,>4 <es es,>8 <es es,> |
  <fes fes,>4 <es es,>8 r |
  \stemDown as, r as' r \stemNeutral |
  as' r as' r \clef treble |
  <b as f d> <b as f d> <b as f d> <b as f d> |
  <c as es> <c as es> <c as es> <c as es> |
  <ces as fes> <ces as fes> <c as es> <c as es> |
  <c as es> <des g, es> <c as> r \clef bass |
  <b, as f d> <b as f d> <b as f d> <b as f d> |
  <c as es> <c as es> <c as es> <c as es> |
  <ces as fes> <ces as fes> <c as es> <c as es> |
}

Blh = \relative c  {
  <bes bes,>8 <des g, es> <es, es,> <des' g, es> |
  <bes bes,> <des g, es> <es, es,> <g g,> |
  <as as,> <c as es> <es, es,> <c' as es> |
  <as as,> <c as es> <as as,> <a a,> |
  <bes bes,> <des g, es> <es, es,> <des' g, es> |
  <bes bes,> <des g, es> <bes bes,> <b b,> |
  <c c,> <c as es> <es, es,> <c' as es> |
  <as as,> <c as es> <as as,> <a a,> |
  <bes bes,> <des g, es> <es, es,> <des' g, es> |
  <bes bes,> <des g, es> <es, es,> <g g,> |
  <as as,> <c as es> <es, es,> <c' as es> |
  <as as,> <as as,> <g g,> <ges ges,> |
  <f f,> <f f,> <a a,> <a a,> |
  <bes bes,> <des bes f> <des bes f> <des bes f> |
  <bes f bes,> <bes f bes,> <es, es,> <g g,> |}

Returnlh = \relative c {
 <as as,> <c as es> <c as es> <a a,> |
 <bes bes,> <des g, es> <des g, es> <es, es,> |
 <as as,> <c as es> <c as es> <a a,> |
 <bes bes,> <des g, es> <des g, es> <es, es,> |
 <fes fes,>4 <es es,>8 <es es,> |
 <fes fes,>4 <es es,>8 r |
 \stemDown as,, r as' r \stemNeutral |
 as' r as' r \clef treble |
 <b as f d> <b as f d> <b as f d> <b as f d> |
 <c as es> <c as es> <c as es> <c as es> |
 <ces as fes> <ces as fes> <c as es> <c as es> |
 <c as es> <des g, es> <c as> r \clef bass |
 <b, as f d> <b as f d> <b as f d> <b as f d> |
 <c as es> <c as es> <c as es> <c as es> |
 <ces as fes> <ces as fes> <c as es> <c as es> |
 <c as es> <des g, es> <c as> r |}

Clh = \relative c {
  <es, es,> <ges' c, as> <ges, ges,> <ges' c, as> |
  <f, f,> <ges' c, as> <es, es,> <c c,> |
  <des des,> <f' des as> <as, as,> <f' des as> |
  <f, f,> <f' des as> <des, des,> <d d,> |
  <es es,> <ges' c, as> <ges, ges,> <ges' c, as> |
  <f, f,> <ges' c, as> <es, es,> <c c,> |
  <des des,> <f' des as> <as, as,> <f' des as> |
  <f, f,> <f' des as> <des, des,> <c c,> |      
  <bes bes,> <as'' d, bes> <d,, d,> <as'' d, bes> |
  <f, f,> <as' d, bes> <bes, bes,> <as' d, bes> |
  <es, es,> <ges' es bes> <ges, ges,> <ges' es bes> |
  <es, es,> <ges' es bes> <ges, ges,> <ges' es bes> |
  g,16 bes8 des16 fes des bes g |
  <as as,>8 <f'! des as> bes,, <d' bes as> |
  <des! bes es,> <des bes es,> <c as> <c as> |}

Dlh = \relative c {
  \clef "bass"
  <des des,> <f des as> <f des as> <c c,> |
  <des des,> <f des as> <bes, bes,> <b b,> |
  <c c,> <es c as> <es c as> <es, es,> |
  <as as,> <c as es> <es, es,> <a a,> |
  <bes bes,> <des g, es> <es, es,> <a a,> |
  <bes bes,> <des g, es> <es, es,> <g g,> |
  <as as,> <c as es> <es, es,> <c' as es> |
  <as as,> <c as es> <bes bes,> <c c,> |
  <des des,> <f des as> <f des as> <c c,> |
  <des des,> <f des as> <bes, bes,> <b b,> |
  <c c,> <es c as> <es c as> <es, es,> |
  \clef "bass_8" <as as,> <c as es> <es, es,> <c' as es> |
  <des, des,> <des des,> <bes bes,> <d d,> |
  <es es,> <c' as es> <es, es,> <e e,> |
  <f f,> <f f,> <g g,> <g g,> |}

bottom =  \relative c {
 \key as \major
 \time 2/4
 \clef bass
 r2 r4.
 <es es,>8 |
 \Alh { <c as es> <des g, es> <c as> <es, es,> }
 \Alh { <c' as es> <des g, es> <c as> <a a,> }
 \Blh { <as as,> <c as es> <c as es> <a a,> }
 \Blh { <as as,> <es' c as> <es c as> <es, es,> }
 \Returnlh
 \key des \major
 \Clh { <des des,> <f des as> <f des as> <d, d,> }
 \Clh { <des' des,> <as as,> <des, des,> <c' c,> }
 \key as \major
 \Dlh { <as as,>8 <c as es> <bes bes,> <c c,> }
 \Dlh { <as as,>8 <es es,> <as, as,> r8 }
 \label #'theLastPage
 \bar "|."
}

%-------------------------------
% DRUMS
%-------------------------------

dAA = \drummode {\tuplet 3/2 { bd8. wbh16  sn8 }}
dAB = \drummode {\tuplet 3/2 { cb8. sn16 hho8 }}
dBB = \drummode {\tuplet 3/2 { cb8. sn16 hho8}}
dCC = \drummode {cab4\p wbl4\f}

dA = \drummode {\dAA \dAB}
dB = \drummode {\dAA \dBB}

dCA = \drummode {  \tuplet 3/2 { bd16 sn8. tomh8 }
                  \tuplet 3/2 { toml16 toml8. cymr8 } }
dCB = \drummode {\tuplet 3/2 { sn8 bd8 tomh8 }
                  cymc8  cymc8 }

drumseqA = \drummode {\dA \dB   \dA   \dB  \dA  \dB  \dA \dB   \dA \dB    \dA \dB    \dA \dB   \dCA \dCB}

drumseqB = \drummode {\dCC \dCC \dCC \dCC  \dCC \dCC \dCC \dCC \dCC \dCC  \dCC \dCC  \dCC \dCC  
                       gui4_\markup{\italic guiro} r4    gui4_\markup{\italic guiro} r4}

drumsectTop = \drummode {
  \set Staff.instrumentName =  \markup { \center-column { "Drums" \line { "Top" } } }
   r2 r2
  %{ ARA %}      \drumseqA %{ ARB %}      \drumseqA  
  %{ BRA %}      \drumseqA %{ BRB %}      \drumseqA  
  %{ RETURN %}   \drumseqA 
  %{ CRA-TRIO %} \drumseqA %{ CRB-TRIO %} \drumseqA  
  %{ DRA %}      \drumseqA %{ DRB %}      \drumseqA  
}

drumsectBottom = \drummode {
  \set Staff.instrumentName =  \markup { \center-column { "Drums" \line { "Bottom" } } }
   r2^\markup{\italic {cab wbl}} 
  cab4\p wbl4\f^\markup{sim.}
  \override DynamicText.transparent = ##t
  %{ ARA %}    \drumseqB    %{ ARB %}      \drumseqB  
  %{ BRA %}      \drumseqB  %{ BRB %}      \drumseqB  
  %{ RETURN %}   \drumseqB 
  %{ CRA-TRIO %} \drumseqB  %{ CRB-TRIO %} \drumseqB  
  %{ DRA %}      \drumseqB  %{ DRB %}      \drumseqB  
}

%--------------------------------
% SCORE: LAYOUT
%--------------------------------

\score {
  <<
    \new GrandStaff \with {instrumentName =  "Piano"}<<
      \context Staff = "up"
        \top
      \context Staff = "down"
        \bottom
    >>
    
    
    \new DrumStaff = "DTop" \with { \magnifyStaff #6/7
    \override VerticalAxisGroup.staff-staff-spacing =
              #'((basic-distance . 5)
                 (minimum-distance . 5)
                 (padding . 0))
    } <<
      \drumsectTop
    >>
    
    \new DrumStaff  = "Bottom" \with { \magnifyStaff #5/7
    } <<
      \drumsectBottom
    >>
  >>

  \layout {
  \context {
    \Score
    \override SpacingSpanner.shortest-duration-space = #2.5
  }
}
}
%----------------------------------------
% SCORE: MIDI 
%----------------------------------------

\score {
  <<
    \new PianoStaff \with {
       % midiMaximumVolume = 0.5
    }  <<
      \context Staff = "up"
       % \top
         \relative c' {
         \key as \major
         \time 2/4
         \tempo 4 = 110
         \clef treble
         r2 r2
         \set midiMaximumVolume = 0.8
         \Arh { <c es,>16 as <bes es,>8 <as es> r8 }
         \tempo 4  = 100
         \set midiMaximumVolume = 0.8
         \Arh { <c es,>16 as <bes es,>8 <as es> r8 }
         \set midiMaximumVolume = 1.0
         \tempo 4 = 110
         \Brh { <as c,>8 <es' es,> <es es,> <es es,> }
         \tempo 4 = 100
         \set midiMaximumVolume = 0.8
         \Brh { r16 as, c es <as as,>8 r }
         \set midiMaximumVolume = 0.9
         \Returnrh
         \key des \major
         \tempo 4 = 120
         \Crh { <des f,>16 <as' as,>8 f16 <as as,> f <as as,> f }
         \tempo 4 = 110
         \Crh { <des f,>16 des f as <des des,>8 r }
         \key as \major   
         \tempo 4 = 120
         \Drh { <as c,>8 <es' es,> <es es,> <es es,> }
         \tempo 4 = 100 
         \Drh  { <as, c,>8 <es' des g,> <as es c as> } r8
        }

      \context Staff = "down"
       % \bottom
       \relative c {
         \key as \major
         \time 2/4
         \clef bass
         r2 r4.
         <es es,>8 |
         \Alh  { <c as es> <des g, es> <c as> <es, es,> }
         \Alh  { <c' as es> <des g, es> <c as> <a a,> }
         \Blh  { <as as,> <c as es> <c as es> <a a,> }
         \Blh  { <as as,> <es' c as> <es c as> <es, es,> }
         \Returnlh
         \key des \major
         \Clh { <des des,> <f des as> <f des as> <d, d,> }
         \Clh { <des' des,> <as as,> <des, des,> <c' c,> }
         \key as \major
         \Dlh { <as as,> <c as es> <bes bes,> <c c,> }
         \Dlh { <as as,> <es es,> <as, as,> }
        }

    >>

    \new DrumStaff \with {
        midiMaximumVolume = 0.7
    }<<
      \drumsectTop
    >>
    
    \new DrumStaff \with {
      
        midiMaximumVolume = 0.8 
    }<<
      \drumsectBottom
    >>
  >>

  \midi  {\context {
   \consists Dynamic_performer
  }}
}