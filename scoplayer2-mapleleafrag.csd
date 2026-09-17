<CsoundSynthesizer>
<CsOptions>
-n
;-odac
;-+rtmidi=portmidi -M1 ; q49
;-m0 ; message level
-b 48
-B 1024
;-+skip_seconds=250
</CsOptions>
<CsInstruments>
sr = 48000
ksmps = 32
nchnls = 4
0dbfs  = 1

isf     sfload "/usr/share/sounds/sf2/FluidR3_GM.sf2"
        sfplist isf
        sfpassign       0, isf
giPreset  sfpreset  0, 128, isf, 2


gkScoreAmp init 0
gkScoreAmp1 init 0

gaL20 init 0
gaR20 init 0
gaL30 init 0
gaR30 init 0
gaL40 init 0
gaR40 init 0
gaL50 init 0
gaR50 init 0

instr 20
    ; ----------------------------------
    ; piano: rh
    ; ----------------------------------
    ikey  init p5
    ivel  init p4
    iswitch init p6
    ;-----------------------------------
    ; note 'color' in chords
    ;-----------------------------------
    icolfactor = 7
    ivel = ivel - (iswitch-1)*icolfactor
    ;-----------------------------------
    ; dynamic range expansion
    ;-----------------------------------
    ; Gain with expanded dynamic range, soft knee.
    amplitude:i = ampdb(ivel)
    iGain = ampmidicurve(ivel, 1, 1.5)
    ;iGain = 1
    ;--------------------------------
    ; debug
    ;--------------------------------
    Snote mton ikey
    iTime    times
    printf "%6.2f => i:20: %3d :: %d => %s\n",1, iTime, ivel, ikey, Snote
    ;--------------------------------
    kamp  = 1 / 5000
    kfreq = 1
    aL20, aR20 sfplay3 ivel, ikey, kamp * ivel, kfreq, 0, 0
    ;--------------------------------
    ; FILTERING
    ; Piano strings have more bright harmonics at the start, which fade quickly.
    ;--------------------------------
    iDecay   = 2.0 + (ivel * 3.0)
    kEnv     madsr   0.005, iDecay, 0, 0.5
    kCutoff  =  kEnv * 3000 + 300*pow(ivel/127,1.7) ; Filter closes as the note decays + additional note coloring w/ pow(ivel/127,1.7)
    aLowPass lowpass2 aL20, kCutoff, 5 ; Filter gives it that warm piano tone
    ;
    gaL20 = aLowPass*iGain
    gaR20 = aLowPass*iGain
endin

instr 30
    ; ----------------------------------
    ; piano: lh
    ; ----------------------------------
    ikey  init p5
    ivel  init p4
    iswitch init p6
    ;-----------------------------------
    ; note 'color' in chords
    ;-----------------------------------
    icolfactor = 7
    ivel = ivel - (iswitch-1)*icolfactor
    ;-----------------------------------
    ; dynamic range expansion
    ;-----------------------------------
    ; Gain with expanded dynamic range, soft knee.
    amplitude:i = ampdb(ivel)
    igain = ampmidicurve(ivel, 1, 1.5)
    ;igain = 1
    ;--------------------------------
    ; debug
    ;--------------------------------
    Snote mton ikey
    iTime    times
    printf "%6.2f => i:50: %3d :: %d => %s\n",1, iTime, ivel, ikey, Snote
    ;--------------------------------
    kamp  = 1 / 5000
    kfreq = 1
    aL30, aR30 sfplay3 ivel, ikey, kamp * ivel, kfreq, 0, 0
    ;--------------------------------
    ; FILTERING
    ;--------------------------------
    iDecay   = 2.0 + (ivel * 1.2)
    kEnv     madsr   0.005, iDecay, 1, 0.3
    kCutoff  =  kEnv * 3000 + 300 ; Filter closes as the note decays
    aLowPass lowpass2 aL30, kCutoff, 5 ; Filter gives it that warm piano tone

    gaL30 = aL30*igain
    gaR30 = aL30*igain
endin



instr 40
    ; ----------------------------------
    ; percussions
    ; ----------------------------------
    ikey  init p5
    ivel  init p4
    iswitch init p6
    ;kamp    linsegr 1, 1, 1, .1, 0
    kamp = 1
    kamp    = kamp/5000                                           ;scale amplitude
    kfreq   =       1                                               ;do not change freq from sf
    ;--------------------------------
    ; debug
    ;--------------------------------
    Snote mton ikey
    kres times
    printf "%6.2f  i40 (percussion 1) %3d :: %d => %s\n",1, kres, ivel, ikey, Snote
    ;--------------------------------
    gaL40,ga40   sfplay3 ivel, ikey, ivel*kamp, kfreq, 2, 0
endin

instr 50
      ; ----------------------------------
    ; percussions
    ; ----------------------------------
    ikey  init p5
    ivel  init p4
    iswitch init p6
    ;kamp    linsegr 1, 1, 1, .1, 0
    kamp = 1
    kamp    = kamp/5000                                             ;scale amplitude
    kfreq   =       1                                               ;do not change freq from sf
    ;--------------------------------
    ; debug
    ;--------------------------------
    Snote mton ikey
    kres times
    printf "%6.2f  i50 (percussion 2) %3d :: %d => %s\n",1, kres, ivel, ikey, Snote
    ;--------------------------------
    gaL50,gaR50   sfplay3 ivel, ikey, ivel*kamp, kfreq, 2, 0
endin

instr 96 ; Score Volume: FadeIn-FadeOut
    gkScoreAmp linseg 0, 1, 1, 164, 1, 4, 0.7, -1, 0.5
    gkScoreAmp1 linseg 0, 1, 1, 164, 1, 4, 0.2, -1, 0.1
endin


instr 99 ; mixer
    imvol init .0034
    aPianoRH = imvol*gaL20*0.74
    aPianoLH = imvol*gkScoreAmp1*gaL30*1.2
    aPercussion1 = imvol*gkScoreAmp*gaL40*1.1
    aPercussion2 = imvol*gkScoreAmp*gaL50*1.2

   ; aLR = aPianoRH + aPianoLH + aPercussion1 + aPercussion2
   ; outs aLR, aLR

    fout "mapleleafrag0.wav", 18, aPianoRH, aPianoLH, aPercussion1, aPercussion2

    clear gaL20
    clear gaR20
    clear gaL30
    clear gaR30
    clear gaL40
    clear gaR40
    clear gaL50
    clear gaR50
endin

</CsInstruments>
<CsScore>
i 99 0 -1         ; mixer: stay active indefinitely
i 96 0 -1         ; gkScoreAmp: FadeIn-FadeOut
t 0 200
#include "mlr-nt3d_1.sco"
e
</CsScore>
</CsoundSynthesizer>
