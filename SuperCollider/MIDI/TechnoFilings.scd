
(
l = Pbjorklund2(Pseq([3,5,7,9,10,12,8,6,7,3,5,6,7],inf),16)/4;
~one = Pbind(\instrument,\saw,\scale,Scale.minor,\degree,Pseq([1,2,3,4,5,6,7,8,9]-1,inf),\dur,l,\amp,0.5,\fb,0.1,\atk,Pkr(~globAtk),\rel,Pkr(~globRel),\octave,5);
~one2 = Pbind(\instrument,\saw,\scale,Scale.minor,\degree,Pseq([1,2,3,4,5,6,7,8]-1,inf),\dur,l,\amp,0.5,\fb,0.1,\atk,Pkr(~globAtk),\rel,Pkr(~globRel),\octave,3);
)


(
~midiPattern = Pbind(
    \type, \midi,
        // this line is optional b/c noteOn is the default
        // just making it explicit here
    \midicmd, \noteOn,
	\midiout, d[\m2],    // must provide the MIDI target here
    \chan, 0,
        // degree is converted to midinote, not just frequency
	\scale,Scale.minor,
	\degree, Pseq([0,4,7,0,4,2,5,9],inf),
	\octave,2,
	\dur, Pbjorklund2(Pwhite(10,12),16)/4,
	\legato, 0.5
)
)


// this is a really pleasant pattern
d[\m2] = MIDIOut.newByName("Scarlett 2i4 USB", "Scarlett 2i4 USB MIDI 1").latency = (0.255);
(
d[\scale] = Scale.minor;
~midiPattern = Pbind(
    \type, \midi,
        // this line is optional b/c noteOn is the default
        // just making it explicit here
    \midicmd, \noteOn,
	\midiout, d[\m2],    // must ide the MIDI target here
    \chan, 0,
	\scale,Scale.minor,
        // degree is converted to midinote, not just frequency
	\degree, Pwhite(-3,5),
	\octave,4,
	\dur,Pbjorklund2(3,8)/2,
	\legato, 0.2
)
)

(
d[\scale] = Scale.minor;
~midiPattern = Pbind(
    \type, \midi,
        // this line is optional b/c noteOn is the default
        // just making it explicit here
    \midicmd, \noteOn,
	\midiout, d[\m2],    // must ide the MIDI target here
    \chan, 0,
	\scale,Scale.minor,
        // degree is converted to midinote, not just frequency
	\degree, Pwrand([-3,0,5],[0.7,0.2,0.1],inf),
	\octave,Pseq([4,5,3],inf),
	\dur,0.25,
	\legato, 0.01
)
)

s.record


~one = {Pan2.ar(FreeVerb.ar(SoundIn.ar(0),0.4,0.9,0.3))}
~one.play

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,1);

~k.play

~cym = Pbind(\instrument,\bplay,\buf,d["bell"][2],\dur,Pseq([0.5,Pseq([1],inf)],inf)*Pwrand([1,5],[0.7,0.3],inf),\amp,0.4,\rel,0.5,\rate,Pwrand([8,16],[5,1].normalizeSum,inf));

~cym.stop

~h = Pbind(\instrument,\bplay,\buf,Prand(d["rim"],inf).stutter(20),\dur,Pwrand([0.25,Pseq([0.125],4)],[10,1].normalizeSum,inf),\amp,Pexprand(0.05,0.5),\rate,5);



~sn = Pbind(\instrument,\bplay,\buf,d["snrev"][0],\dur,Prand([2,3,5,Pseq([1/3,1/3,2+(1/3)],1)],inf),\amp,0.5);

~sn.play

~k = Pbind(\instrument,\bplaym,\buf,d["k"][3],\dur,1,\amp,4);



~k.play

~h = Pbind(\instrument,\bplay,\buf,d["crev"][0],\dur,3.5,\amp,0.3);

~h.play

~cym.play

~one = {Pan2.ar(FreeVerb.ar(SoundIn.ar(0),0.5,0.8,0.1,2))}
~one.play

~dfm = {DFM1.ar(SinOsc.ar([100,101]*0.5,0,0.1),200*0.5,SinOsc.kr(0.05).range(0.9,1.1),1,0,0.0003,0.7)};

~dfm.clear

p.clock.tempo = 2.7

~h = Pbind(\instrument,\bplay,\buf,d["rim"][0],\dur,0.25,\amp,Pexprand(0.05,1),\rate,8);

~h.play

~h.play

~k.stop

~k = Pbind(\instrument,\bplay,\buf,d["k"][39],\dur,1,\amp,1);
~tech = Pbind(\instrument,\bplay,\buf,d["techno"][0],\dur,Pwrand([1.5,0.25,2],[10,1,1].normalizeSum,inf),\amp,1);

~tech.play

~synth2 = Pbind(\type,\midi,\midicmd,\bend,\midiout,d[\m2],\chan,0,\dur,0.25,\val,Pwhite(6000,8000).round(100))


~tech.play
~k.play

s.stopRecording

s.makeWindow


~k.stop

~sn = Pbind(\instrument,\bplay,\buf,d["rim"][0],\dur,2,\amp,1);

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,1);

~k.play

~sn.play

~one2.stop(40)

~modular.stop(10)


p.fadeTime = 4

~modular.play
~modular1 = {Pan2.ar(FreeVerb.ar(SoundIn.ar(0) * 1.2,0.333,0.9,0))}
~modular = {Pan2.ar(CombC.ar(SoundIn.ar(0),10,(p.clock.tempo/5),1))}


~modular.stop
~modular1.clear
~modular1.play
~modular.play

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,Pbjorklund2(Pwhite(2,6),8)/4,\amp,2);

~k.play

~k2 = Pbind(\instrument,\bplay,\buf,d["k"][40],\dur,Pbjorklund2(3,8)/4,\amp,2,\rate,Pseq([1.5,1.64]+40,inf));
~k2x = Pbind(\instrument,\bplay,\buf,d["k"][40],\dur,0.75,\amp,2,\rate,Pseq([1.5,1.64]+40,inf));

~k2x.stop

~k2x.play

~sinfb.stop



~k2.play




~sinfb2.stop(20)
~sinfb = Pbind(\instrument,\sinfb,\scale,d[\scale],\root,Pkr(~r),\octave,3,\degree,0,\dur,Pbjorklund2(3,8)/4,\amp,0.8,\fb,0.7,\rel,0.3,\atk,0);

~sinfb2 = Pbind(\instrument,\sinfb,\scale,d[\scale],\root,Pkr(~r),\octave,[7],\degree,Pseq([0,1,2,3,4],inf),\dur,0.25,\amp,0.4,\fb,0.7,\rel,0.05);
~sinfb3 = Pbind(\instrument,\sinfb,\scale,d[\scale],\root,Pkr(~r),\octave,[6,7],\degree,Pseq([0,1,2,3,4,5,6].reverse,inf),\dur,Pwrand([0.25,0.5],[10,1].normalizeSum,inf),\amp,0.4,\fb,0.7,\rel,0.05);

~sinfb2.fadeTime = 30

~sinfb3.play


~k = Pbind(\instrument,\bplay,\buf,d["k"][60],\dur,1,\amp,1);


~k.play

~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,0.75,\amp,0.6);


//delay
~reverbSend = {Mix.ar([~c])};
~reverb = {arg size = 80, time = 5, damping = 0.9, spread = 15, dry = 0.9, amp = 0.8; GVerb.ar(Mix.ar([~reverbSend.ar]),size,time,damping,0.5,spread,dry,mul:LFNoise1.kr(0.1).range(0.1,0.5))}
~reverb.play;

~c.stop


~reverb.stop(20)


~cym = Pbind(\instrument,\bplay,\buf,d["cym"][0],\dur,Pseq([0.5,Pseq([1],inf)],inf),\amp,0.5,\rate,2,\rel,0.1,\pos,0.005);

~verb = {FreeVerb.ar(~cym.ar,0.33,0.8,0.4,2)}

~verb.play

~cym.play

~c.play

~sinfb.play

~one = Pbind(\instrument,\sinfb,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,0,\octave,3,\dur,Pbjorklund2(3,8)/4,\d,0.6,\a,Pexprand(5,200),\pan,0,\amp,0.5);

~sinfb.set(\fb,~sin)

~sin = {SinOsc.kr(0.1).range(0.9,1.99999)}

~hpfone.play

~k.stop

(
d[\scale] = Scale.minor;
~midiPattern = Pbind(
    \type, \midi,
        // this line is optional b/c noteOn is the default
        // just making it explicit here
    \midicmd, \noteOn,
	\midiout, d[\m2],    // must provide the MIDI target here
    \chan, 0,
	\scale,Scale.minor,
        // degree is converted to midinote, not just frequency
	\degree, Pwhite(-3,5),
	\octave,4,
	\dur,Pbjorklund2(3,8)/4,
	\legato, 0.01
);
~midiPattern2 = Pbind(
    \type, \midi,
        // this line is optional b/c noteOn is the default
        // just making it explicit here
    \midicmd, \noteOn,
	\midiout, d[\m2],    // must provide the MIDI target here
    \chan, 0,
	\scale,Scale.minor,
        // degree is converted to midinote, not just frequency
	\degree, Pwhite(-3,5),
	\octave,6,
	\dur,2,
	\legato, 0.01
)
)

~hpfone = {HPF.ar(~one.ar,30)}

~cym.stop

~hpfone.play

~one.play

~r = 0


d[\scale] = Scale.minor

~k.stop

~one3 = Pbind(\instrument,\saw,\freq,Pseq([1],inf)*Pkr(~r2)/2,\dur,l,\amp,0.8,\fb,0.1,\atk,0,\rel,Pkr(~globRel));


~one3.stop

~one3.play

~globRel = {Line.kr(0.15,0.6,30)}
~globAtk = {Line.kr(0.2,0.01,10)}


~one2.play

(
SynthDef(\saw, {
	arg freq = 440, atk = 0.01, sus = 0, rel = 1, phase = 0, amp = 0.3, out = 0, pan=0;
	var sig, env;
	env = EnvGen.ar(Env.linen(atk,sus,rel),1,1,0,1,2);
	sig = SawDPW.ar(freq,phase,amp);
	sig = sig*env;
	Out.ar(out,Pan2.ar(sig.tanh,pan,1));
}).add;
);



~dfm2.stop(10)

~k = Pbind(\instrument,\bplaym,\buf,d["k"][0],\dur,1,\amp,2);

~verb.stop

~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,0.75,\amp,1);


~dfm = {DFM1.ar(SinOsc.ar([~r2,~r2*1.01]*2,0,0.1),~r2*4,SinOsc.kr(0.05).range(0.99,1.2),1,0,0.0003,0.3)};

~dfm2 = {DFM1.ar(SinOsc.ar([~r2,~r2*1.01]*4,0,0.1),~r2*8,SinOsc.kr(0.05).range(0.99,1.2),1,0,0.0003,0.3)};


~k.stop

~c.stop

~dfm2.play

~dfm.play

~c.play

~k.play

~one.play

~r2 = 75