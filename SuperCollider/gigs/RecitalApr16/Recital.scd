(
~one = {Pan2.ar(Warp1.ar(1,d["stairs"][0],SinOsc.kr(LFNoise1.kr(0.1).range(0.05,0.15)),mul:0.2),LFNoise1.kr(rrand(0.09,0.11)))};
~onex = {Pan2.ar(Warp1.ar(1,d["stairs"][1],SinOsc.kr(LFNoise1.kr(0.1).range(0.05,0.15)),mul:0.2),LFNoise1.kr(rrand(0.09,0.11)))};
~one.play;
~onex.play;
)


~fund = 50

~d1 = {DFM1.ar(SinOsc.ar([~fund,~fund*1.01],0,0.1),[~fund,~fund*1.01],LFNoise1.kr(0.1).range(0.6,1.2),mul:0.2)}

~d2 = {DFM1.ar(SinOsc.ar([~fund,~fund*1.01]*2,0,0.1),[~fund,~fund*1.01]*2,LFNoise1.kr(0.1).range(0.6,1.2),mul:0.2)}


~d3 = {Pan2.ar(DFM1.ar(SinOsc.ar(~fund*4,0,0.1),~fund*4,EnvGen.ar(Env.perc(0.01,1),Impulse.kr(~tempo.kr/2),1.2),mul:0.2),LFNoise1.kr(0.5))}

~d4 = {Pan2.ar(DFM1.ar(SinOsc.ar(~fund*4,0,0.1),~fund*TRand.kr(2,10,Dust.kr(1)).round(2),EnvGen.ar(Env.perc(0.01,1),Impulse.kr(~tempo.kr/3),1.2),mul:0.2),LFNoise1.kr(0.5))}

~d6 = {Pan2.ar(DFM1.ar(SinOsc.ar(~fund*4,0,0.1),~fund*TRand.kr(2,10,Dust.kr(1)).round(2),EnvGen.ar(Env.perc(0.01,1),Impulse.kr(~tempo.kr*3),1.2),mul:0.3),LFNoise1.kr(0.5))}

~d6.play

~d5 = {Pan2.ar(DFM1.ar(SinOsc.ar(~fund*8,0,0.1),LFNoise1.kr(0.6).range(~fund,~fund*20).round(~fund),LFNoise1.kr(0.1).range(0.8,1.2),mul:0.05),LFNoise1.kr(0.8))}

~fund = {SinOsc.kr(0.05).range(48,52)}

~k.play


~scale2.play

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,0.5,\amp,1)

~bpf = Pbind(\instrument,\bpfsaw,\scale,Scale.minor,\amp,2,\octave,4,\ldb,14,\lsf,500,\detune,Pwhite(0,0.3))

~bpf2 = Pbind(\instrument,\bpfsaw,\scale,Scale.minor,\ldb,16,\amp,2,\detune,Pwhite(0,0.3))

~bpf.play

~scale.play

~one.clear
~onex.clear

~k.stop
~sn.stop



(
~hx.stop;
~k2.play;
)

~k.stop

(
~stab = Pbind(\instrument,\bplay,\buf,d["stab"][0],\dur,Pbjorklund2(3,8)/4,\rate,0.5,\amp,1);
~stab2 = Pbind(\instrument,\bplay,\buf,d["stab"][0],\dur,Pbjorklund2(3,8)/4,\rate,1,\amp,1);
~stab3 = Pbind(\instrument,\bplay,\buf,d["stab"][0],\dur,Pbjorklund2(3,8),\rate,1,\amp,1);
~stab4 = Pbind(\instrument,\bplay,\buf,d["stab"][0],\dur,Pbjorklund2(3,8)/8,\rate,2,\amp,1);
~stab5 = Pbind(\instrument,\bplay,\buf,d["stab"][0],\dur,Pbjorklund2(Pwhite(1,15),16,inf,Pwhite(1,10).asStream)/8,\rate,4,\amp,1);
~stab6 = Pbind(\instrument,\bplay,\buf,d["stab"][0],\dur,Pbjorklund2(Pwhite(1,15),16,inf,Pwhite(1,10).asStream)/8,\rate,8,\amp,1);
~ftn = Pbind(\instrument,\vplay,\buf,d["ftn"][1],\pos,0.0,\rel,0.1,\amp,2,\dur,Pbjorklund2(Pwhite(1,7),8)/4)
~ftn2 = Pbind(\instrument,\vplay,\buf,d["ftn"][1],\pos,0.0,\rel,0.2,\amp,1,\dur,Pbjorklund2(Pwhite(1,7),8)/8,\rate,Prand([1,1.2,1.4],inf))
)

p.clock.tempo

~h.stop
~hx.stop
~h2.stop

~ftn.play

~ftn2.stop


p.clock.tempo=0.1

(
p.clock.tempo=1.35;
~stab6.play;
~stab5.play;
~stab4.play;
~k.play;
~k2.play;
~k3.play;
)
~k.stop

~ftn2.play

d["ftn"][1].play

~cp = Pbind(\instrument,\bplay,\buf,d["cp"][1],\amp,2,\dur,0.75)

~hx.play

~cp.play

p.clock.tempo=1.3

~k = Pbind(\instrument,\bplay,\buf,d["k"][1],\amp,0.8)

~k.play

~hey = Pbind(\instrument,\bplay,\buf,d["shout"][1],\amp,0.7,\dur,2)


(
p.clock.tempo=0.0000001;
d["ftn"][2].play;
)


~hey.play


~k = Pbind(\instrument,\bplay,\buf,d["k"][4],\amp,1,\dur,0.5)
~k2 = Pbind(\instrument,\bplay,\buf,d["k"][4],\amp,1,\dur,Pbjorklund2(3,8,inf,Pwhite(1,8).asStream)/8,\rate,2)
~k3 = Pbind(\instrument,\bplay,\buf,d["k"][4],\amp,1,\dur,Pbjorklund2(3,8,inf,Pwhite(1,8).asStream)/8,\rate,4)
~h = Pbind(\instrument,\bplay,\buf,d["h"][2],\dur,Pbjorklund2(Pwhite(1,15),16,inf,0)/16,\amp,1)
~h2 = Pbind(\instrument,\bplay,\buf,d["h"][2],\dur,Pbjorklund2(Pwhite(1,15),16,inf,0)/8,\amp,1,\rate,2)
~sn = Pbind(\instrument,\bplay,\buf,d["sn"][4],\dur,Pbjorklund2(5,8),\amp,0.5)

~k2.stop
~k3.stop

p.clock.tempo=1.3

~stab.stop

~h2.stop

p.clock.tempo=1.1

(
~scale2.stop(10);
~bpf2.stop(15);

(
~bpf = Pbind(\instrument,\bpfsaw,\scale,Scale.minor,\amp,2,\octave,4,\ldb,14,\lsf,500,\detune,Pwhite(0,0.3),\root,4);
~bpf2 = Pbind(\instrument,\bpfsaw,\scale,Scale.minor,\ldb,16,\root,4,\amp,2,\detune,Pwhite(0,0.3));
~scale = Pbind(\instrument,\sinfb,\dur,Prand([0.25,Pseq([0.125],2)],inf),\scale,Scale.minor,\root,4,\degree,Pseq((0..7),inf),\fb,Pwhite(0,0.3),\rel,0.1);
~scale = Pbind(\instrument,\sinfb,\dur,Prand([0.25,Pseq([0.125],2)],inf),\scale,Scale.minor,\root,4,\degree,Pseq((0..7),inf),\fb,Pwhite(0,0.3),\amp,Pwhite(0.3,0.7),\rel,0.1);
~scale2 = Pbind(\instrument,\sinfb,\dur,Prand([0.25,Pseq([0.125],2)],inf),\scale,Scale.minor,\degree,Pseq((0..7).pyramid,inf),\fb,Pwhite(0,0.3),\root,4,\amp,Pwhite(0.3,0.7),\rel,0.1,\octave,6);
~chords = Pbind(\instrument,\sinfb,\dur,Pwhite(1,4),\degree,Pwrand([[0,2,4],[2,4,6],[4,6,8]],[5,2,1].normalizeSum,inf),\amp,0.1,\atk,3,\root,4,\scale,Scale.minor,\sus,3,\rel,3);
~chordsx = Pbind(\instrument,\sinfb,\dur,Pwhite(1,4),\degree,Pwrand([[0,2,4],[2,4,6],[4,6,8]],[5,2,1].normalizeSum,inf),\amp,0.1,\atk,3,\root,4,\scale,Scale.minor,\sus,3,\rel,3,\octave,4);
)

~chordsx.stop(40)

~chords.stop

~k2.stop
~hx.stop
~sn.stop


~scale2.play

~sclae.play

~cmod = {SinOsc.kr(0.1).range(0.2,1.4)}


~chords.set(\fb,~cmod)

~hx = Pbind(\instrument,\bplay,\buf,d["h"][5],\dur,Pseq([0.5,Pseq([1],inf)],inf)/2,\amp,Pwhite(0.5,1),\rate,0.4)

~hx.play

~k.play

~k2.play

p.clock.tempo=1.4

~stabs.stop
~stabs6

.stop

~hx.stop

~stabs3.stop



~k = Pbind(\instrument,\bplay,\buf,d["k2"][0],\amp,1,\dur,Pbjorklund2(3,8)/8,\rate,2)
~k2 = Pbind(\instrument,\bplay,\buf,d["k"][4],\amp,1,\dur,Pbjorklund2(3,8,inf,Pwhite(1,8).asStream)/8,\rate,3)
~h = Pbind(\instrument,\bplay,\buf,d["h"][2],\dur,Pbjorklund2(Pwhite(1,15),16,inf,0)/4,\amp,2)
~h2 = Pbind(\instrument,\bplay,\buf,d["h"][2],\dur,Pbjorklund2(Pwhite(1,15),16,inf,0)/8,\amp,2,\rate,2)
~sn = Pbind(\instrument,\bplay,\buf,d["sn"][4],\dur,Pbjorklund2(5,8)/4,\amp,0.5)

~sn.play

~h2.play

p.clock.tempo=1.4

~h.play

~bpf2.stop


~chords.play

(
~d1.stop(10);
~d2.stop(11);
~d3.stop(12);
~d4.stop(13);
~d5.stop(14);
~d6.stop(15);
)


~fund = {10}

p.fadeTime=3

~d5.play

~d4.play
~d3.play



















~d1.play

~d2.play







