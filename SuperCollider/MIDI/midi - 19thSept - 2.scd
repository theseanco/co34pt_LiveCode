p.clock.tempo = 2


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
        // degree is converted to midinote, not just frequency
	\degree, Pseq([0,1,2,3,4,3,2,1],inf),
	\octave,Pseq([3,4,5],inf).stutter(5) - 1,
	\dur, 1/3,
	\legato, 0.01
)
)


s.makeWindow

s.stopRecording

~k.play
~rim.play
~k2.stop
~c.stop

s.record

s.record


~one = {Pan2.ar(SoundIn.ar(0))}
~two = {CombC.ar(~one,5,(p.clock.tempo/4)/1.5*2,3,1)}

~one.stop(10)

~two.play

~one.play

~k.play

~k = Pbind(\instrument,\bplaym,\buf,d["k"][1],\dur,2/3,\amp,2,\rate,1);

~k2.play

~k2 = Pbind(\instrument,\bplaym,\buf,d["k"][1],\dur,2/3*1.5,\amp,2,\rate,1.5);

~rim = Pbind(\instrument,\bplay,\buf,d["c"][30],\dur,Pseq([1/3*2,Pseq([1],inf)],inf),\amp,0.5)

~h = Pbind(\instrument,\bplaym,\buf,d["rim"][0],\dur,0.25/1.5,\amp,Pexprand(0.05,1),\rate,Pwhite(1,1.15));


~h.play

~rim.stop

~rim.play

~k.stop

~k2 = Pbind(\instrument,\bplaym,\buf,d["k"][10],\dur,Pbjorklund2(Pwhite(1,5),8)/8,\amp,1,\rate,11);


p.fadeTime = 2
~k2.stop


~k.play
~rim = Pbind(\instrument,\bplaym,\buf,Prand(d["rim"],inf),\dur,Pbjorklund2(Pwhite(3,14),19)/4,\amp,0.5);

~rim.play

~c = Pbind(\instrument,\bplay,\buf,d["c"][5],\dur,Pwhite(1.5,3).round(0.5),\amp,0.5);

~c.play

p.clock.tempo = 2.2

~k.play

~c.play

~rim.play


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
	\degree, Pseq([0,3,4,5,7],inf) + Pwrand([0,7],[0.9,0.1],inf),
	\octave,3,
	\dur, 1,
	\legato, 0.2
)
)

~one = {Pan2.ar(SoundIn.ar(0))}
~one.play

~k.play