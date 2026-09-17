import mido
import os

INSTRUMENTS = [
    'Acoustic Grand Piano',
    'Bright Acoustic Piano',
    'Electric Grand Piano',
    'Honky-tonk Piano',
    'Electric Piano 1',
    'Electric Piano 2',
    'Harpsichord',
    'Clavi',
    'Celesta',
    'Glockenspiel',
    'Music Box',
    'Vibraphone',
    'Marimba',
    'Xylophone',
    'Tubular Bells',
    'Dulcimer',
    'Drawbar Organ',
    'Percussive Organ',
    'Rock Organ',
    'Church Organ',
    'Reed Organ',
    'Accordion',
    'Harmonica',
    'Tango Accordion',
    'Acoustic Guitar (nylon)',
    'Acoustic Guitar (steel)',
    'Electric Guitar (jazz)',
    'Electric Guitar (clean)',
    'Electric Guitar (muted)',
    'Overdriven Guitar',
    'Distortion Guitar',
    'Guitar harmonics',
    'Acoustic Bass',
    'Electric Bass (finger)',
    'Electric Bass (pick)',
    'Fretless Bass',
    'Slap Bass 1',
    'Slap Bass 2',
    'Synth Bass 1',
    'Synth Bass 2',
    'Violin',
    'Viola',
    'Cello',
    'Contrabass',
    'Tremolo Strings',
    'Pizzicato Strings',
    'Orchestral Harp',
    'Timpani',
    'String Ensemble 1',
    'String Ensemble 2',
    'SynthStrings 1',
    'SynthStrings 2',
    'Choir Aahs',
    'Voice Oohs',
    'Synth Voice',
    'Orchestra Hit',
    'Trumpet',
    'Trombone',
    'Tuba',
    'Muted Trumpet',
    'French Horn',
    'Brass Section',
    'SynthBrass 1',
    'SynthBrass 2',
    'Soprano Sax',
    'Alto Sax',
    'Tenor Sax',
    'Baritone Sax',
    'Oboe',
    'English Horn',
    'Bassoon',
    'Clarinet',
    'Piccolo',
    'Flute',
    'Recorder',
    'Pan Flute',
    'Blown Bottle',
    'Shakuhachi',
    'Whistle',
    'Ocarina',
    'Lead 1 (square)',
    'Lead 2 (sawtooth)',
    'Lead 3 (calliope)',
    'Lead 4 (chiff)',
    'Lead 5 (charang)',
    'Lead 6 (voice)',
    'Lead 7 (fifths)',
    'Lead 8 (bass + lead)',
    'Pad 1 (new age)',
    'Pad 2 (warm)',
    'Pad 3 (polysynth)',
    'Pad 4 (choir)',
    'Pad 5 (bowed)',
    'Pad 6 (metallic)',
    'Pad 7 (halo)',
    'Pad 8 (sweep)',
    'FX 1 (rain)',
    'FX 2 (soundtrack)',
    'FX 3 (crystal)',
    'FX 4 (atmosphere)',
    'FX 5 (brightness)',
    'FX 6 (goblins)',
    'FX 7 (echoes)',
    'FX 8 (sci-fi)',
    'Sitar',
    'Banjo',
    'Shamisen',
    'Koto',
    'Kalimba',
    'Bag pipe',
    'Fiddle',
    'Shanai',
    'Tinkle Bell',
    'Agogo',
    'Steel Drums',
    'Woodblock',
    'Taiko Drum',
    'Melodic Tom',
    'Synth Drum',
    'Reverse Cymbal',
    'Guitar Fret Noise',
    'Breath Noise',
    'Seashore',
    'Bird Tweet',
    'Telephone Ring',
    'Helicopter',
    'Applause',
    'Gunshot'
]
NOTES = ['C', 'C#', 'D', 'D#', 'E', 'F', 'F#', 'G', 'G#', 'A', 'A#', 'B']
OCTAVES = list(range(11))
NOTES_IN_OCTAVE = len(NOTES)

errors = {
    'program': 'Bad input, please refer this spec-\n'
               'http://www.electronics.dit.ie/staff/tscarff/Music_technology/midi/program_change.htm',
    'notes': 'Bad input, please refer this spec-\n'
             'http://www.electronics.dit.ie/staff/tscarff/Music_technology/midi/midi_note_numbers_for_octaves.htm'
}


def instrument_to_program(instrument: str) -> int:
    assert instrument in INSTRUMENTS, errors['program']
    return INSTRUMENTS.index(instrument) + 1


def program_to_instrument(program: int) ->  str:
    assert 1 <= program <= 128, errors['program']
    return INSTRUMENTS[program - 1]


def number_to_note(number: int) -> tuple:
    octave = number // NOTES_IN_OCTAVE
    assert octave in OCTAVES, errors['notes']
    assert 0 <= number <= 127, errors['notes']
    note = NOTES[number % NOTES_IN_OCTAVE]

    return note, octave


def note_to_number(note: str, octave: int) -> int:
    assert note in NOTES, errors['notes']
    assert octave in OCTAVES, errors['notes']

    note = NOTES.index(note)
    note += (NOTES_IN_OCTAVE * octave)

    assert 0 <= note <= 127, errors['notes']

    return note


def midi_to_csound_score(midi_file_path, output_sco_path):
    mid = mido.MidiFile(midi_file_path)

    # Store all notes to be formatted later
    # Format: [track_id, time_seconds, duration_seconds, midi_note, velocity]
    score_events = []

    # Track current playing notes for each (track, channel, note)
    active_notes = {}

    # Csound tempo (beats per second). Assumes 60 BPM (1 beat = 1 second)
    tempo = 1.0/200.0

    for i, track in enumerate(mid.tracks):
        track_instr = i + 1  # Each track gets a separate instrument
        current_time = 0.0

        for msg in track:
            current_time += msg.time * tempo

            if msg.type == 'note_on' and msg.velocity > 0:
                note_key = (i, msg.channel, msg.note)
                active_notes[note_key] = (current_time, msg.velocity)

            elif msg.type == 'note_off' or (msg.type == 'note_on' and msg.velocity == 0):
                note_key = (i, msg.channel, msg.note)
                if note_key in active_notes:
                    start_time, velocity = active_notes.pop(note_key)
                    duration = current_time - start_time
                    if duration > 0.001:
                        score_events.append([track_instr, start_time, duration, msg.note, velocity])

    # Write to standard Csound Score (.sco)
    p2old = 0

    with open(output_sco_path, 'w') as f:
        f.write(f'; Generated from {midi_file_path}\n')
        f.write(f'f 0 {mid.length}\n') # Dummy function for overall score duration


        notechordseq = 0

        for ev in sorted(score_events, key=lambda x: (x[0], x[1])):
            initialsilence = 0

            instrument = ev[0]
            p1 = instrument
            if True: #p1==2:
                if instrument==2:
                    instrument = 20
                elif instrument==3:
                    instrument=30
                elif instrument==4:
                    instrument=40
                elif instrument==5:
                    instrument=50

                p2 = ev[1]+initialsilence
                p3 = ev[2]

                #~ if instrument==3:
                    #~ p3 = ev[2]*1.5
                #~ if instrument==4:
                    #~ p3 = ev[2]*1.3

                a, b = number_to_note(ev[3])



                if p2!=p2old:
                        f.write(';-------------------------------------\n')
                        p2old = p2
                        notechordseq = 1
                else:
                        notechordseq += 1

                f.write(f'i {instrument} {p2:7.2f} {p3:6.2f} {ev[4]:3d} {ev[3]:3d} {notechordseq:1d}; {str(b-1)+str(a)}\n')


mymidi = "mlr-var_t-dynamics.midi"
mysco = "mlr-nt3d_1.sco"



midi_to_csound_score(mymidi, mysco)


print(f"Generated Csound Score: {mysco}")
