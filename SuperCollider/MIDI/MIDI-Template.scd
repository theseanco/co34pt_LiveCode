p.clock.tempo = 2

// a scratchpaddy template i'm using to create some functions that use MIDI to add to howto_co34pt_liveCode

//from http://doc.sccode.org/Tutorials/A-Practical-Guide/PG_Cookbook04_Sending_MIDI.html


//the basic MIDI pattern

d[\m2] = MIDIOut.newByName("Scarlett 2i4 USB", "Scarlett 2i4 USB MIDI 1").latency = (0.255);

(
d[\scale] = Scale.minor;
~midiPattern = Pbind(
    \type, \midi,
        // this line is optional b/c noteOn is the default
        // just making it explicit here
    \midicmd, \noteOn,
	\midiout, d[\m2],    // must provide the MIDI target here
    \chan, 0,
	\scale,d[\scale],
        // degree is converted to midinote, not just frequency
	\degree, 0,
	\octave,3,
	\dur,1,
	\legato, 0.6
)
);


(
d[\scale] = Scale.minor;
~midiPattern = Pbind(
    \type, \midi,
        // this line is optional b/c noteOn is the default
        // just making it explicit here
    \midicmd, \noteOn,
	\midiout, d[\m2],    // must provide the MIDI target here
    \chan, 0,
	\scale,d[\scale],
        // degree is converted to midinote, not just frequency
	\degree, 0,
	\octave,3,
	\dur,1,
	\legato, 0.01
)
);

(~midiPattern = Ppar([
	Pbind(
    \type, \midi,
        // this line is optional b/c noteOn is the default
        // just making it explicit here
    \midicmd, \noteOn,
	\midiout, d[\m2],    // must provide the MIDI target here
    \chan, 0,
	\scale,d[\scale],
        // degree is converted to midinote, not just frequency
	\degree, 0,
	\octave,3,
	\dur,5,
	\legato, 0.6
), Pbind(\type,\midi,\midicmd,\bend,\midiout,d[\m2],\chan,0,\scale,d[\scale],\degree,0,\octave,3,\bend,Pwhite(40,40000),\dur,0.25)],inf))

~one = Pbind(\type,\midi,\midicmd,\bend,\midiout,d[\m2],\dur,1,\num,Pwhite(100,1000))

// I cannot get pitch bend to work though, which would be useful for some pseudo-microtonal stuff, so i'm going to use a keyboard that does make pitch bend work with my 0 coast and dump some MIDI data through to see what it responds to.

//if I send a 'bend' Pbind away:

~one = Pbind(\type,\midi,\midicmd,\bend,\midiout,d[\m2],\dur,1,\bend,Pwhite(100,1000))

//and run MIDIFunc.trace

MIDIFunc.trace

//'bend' is _always_ 125
/*

MIDI Message Received:
	type: bend
	src: 1310720
	chan: 0
	num: 125

*/

~one = Pbind(\type,\midi,\midicmd,\bend,\midiout,d[\m2],\chan,0,\dur,1,\val,Pwhite(1,16000))


//If I look in the MIDI Spec, I find this: bend:  #{ arg chan=0, val=125; [ chan, val ] }

// it's also listed here: http://new-supercollider-mailing-lists-forums-use-these.2681727.n2.nabble.com/pitch-bend-from-a-pattern-td3250143.html

//SO:



MIDIIn.connect(0)
MIDIIn.connectAll



~bendPattern = Pbind(\type,\midi,\midicmd,\bend,\midiout,d[\m2],\chan,0,\control,Pwhite(40,4000),\dur,0.1)


~bendPattern = Pbind(\type,\midi,\midiout,d[\m2],\bend,Pwhite(0,6000),\dur,0.1)

~one = {Pan2.ar(FreeVerb.ar(SoundIn.ar(0)))}

~one.play