MIDIClient.init
p = ProxySpace.push(s)


    // substitute your own device here
// un
m = MIDIOut.newByName("Scarlett 2i4 USB", "Scarlett 2i4 USB MIDI 1").latency_(0.41);

(
~midiPattern = Pbind(
    \type, \midi,
        // this line is optional b/c noteOn is the default
        // just making it explicit here
    \midicmd, \noteOn,
    \midiout, m,    // must provide the MIDI target here
    \chan, 0,
	\scale,d[\scale],
        // degree is converted to midinote, not just frequency
	\degree, Pseq([0,3,4,5,7],inf) + Pwrand([0,7],[0.9,0.1],inf),
	\octave,Pwrand([2,3,6],[0.8,0.15,0.05],inf),
	\dur, Pbjorklund2(3,8)/4,
	\legato, 0.4
)
)

d[\scale] = Scale.minor

~midiPattern.play

~one = {Pan2.ar(CombC.ar(SoundIn.ar(0)))}

p.fadeTime = 3

~one.play

~k = Pbind(\instrument,\bplaym,\buf,d["k"][1],\dur,1,\amp,0.5);

~k.stop

~k.stop

~k.play


//delay
~reverbSend = {Mix.ar([SoundIn.ar(0)])};
~reverb = {arg size = 50, time = 1, damping = 0.5, spread = 15, dry = 0, amp = 0.8; GVerb.ar(Mix.ar([~reverbSend.ar]),size,time,damping,0.5,spread,dry,mul:amp)}
~reverb.play;

~k.play

~grey = {Greyhole.ar(SoundIn.ar(0),2,0,1,0.707,0)}

~grey.play

~k.play

p.clock.tempo = 142/60

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,Pbjorklund2(3,8)/4,\amp,1,\rate,Pseq([1,1.4],inf));

~h = Pbind(\instrument,\bplay,\buf,d["ch"][0],\dur,Pwrand([0.25,Pseq([0.125],4)],[10,2].normalizeSum,inf),\amp,Pexprand(0.05,0.5),\rate,1.5);

~h.play

~c = Pbind(\instrument,\bplay,\buf,d["s"][2],\dur,Pseq([0.5,Pseq([1],inf)],inf)*2,\amp,0.4);

~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,0.75,\amp,0.5);

~c2 = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,Pbjorklund2(3,8)/4,\amp,0.5,\rate,1.3);

~c2.play



~c.play

~sinfb = Pbind(\instrument,\sinfb,\scale,d[\scale],\root,Pkr(~r),\octave,[4,3],\degree,Pseq([[0,4,5]!5,4,4,4].flat,inf),\dur,0.25,\amp,0.3,\fb,0.1,\rel,0.3);

~r = 0

~sinfb.stop

~sinfb.set(\fb,~sin)

~sin = {SinOsc.kr(0.1).range(0.01,1.31)}

~k.stop

~k.play

~r = 0

d[\scale] = Scale.minor

~sinfb.play

~c.play
~k.play

p.clock.tempo = 2