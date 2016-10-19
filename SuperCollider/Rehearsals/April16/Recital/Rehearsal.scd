(
~one = {Pan2.ar(Warp1.ar(1,d["stairs"][0],SinOsc.kr(LFNoise1.kr(0.1).range(0.05,0.15)),mul:0.2),LFNoise1.kr(rrand(0.09,0.11)))};
~onex = {Pan2.ar(Warp1.ar(1,d["stairs"][1],SinOsc.kr(LFNoise1.kr(0.1).range(0.05,0.15)),mul:0.2),LFNoise1.kr(rrand(0.09,0.11)))};
~one.play;
~onex.play;
)

~fund = 50;

~d1.play

~d1 = {DFM1.ar(SinOsc.ar([~fund,~fund*1.01],0,0.1),[~fund,~fund*1.01],LFNoise1.kr(0.1).range(0.5,1.9),mul:0.4)}
~d2 = {DFM1.ar(SinOsc.ar([~fund,~fund*1.03]*2,0,0.1),[~fund,~fund*1.02]*2,LFNoise1.kr(0.1).range(0.5,1.2),mul:0.4)}
~d3 = {Pan2.ar(DFM1.ar(SinOsc.ar(~fund*4,0,0.1),~fund*4,EnvGen.ar(Env.perc(0.01,1),Impulse.kr(~tempo.kr/2),1.1),mul:0.5),LFNoise1.kr(1))}
~d4 = {Pan2.ar(DFM1.ar(SinOsc.ar(~fund*4,0,0.1),~fund*TRand.kr(2,10,Dust.kr(1)).round(2),EnvGen.ar(Env.perc(0.01,1),Impulse.kr(~tempo.kr/2),1.1),mul:Line.kr(0,0.6,20)),LFNoise1.kr(1))}
~d5 = {Pan2.ar(DFM1.ar(SinOsc.ar(~fund*8,0,0.1),LFNoise1.kr(0.1).range(~fund,~fund*15).round(~fund),LFNoise1.kr(0.4).range(0.7,2),mul:0.3),LFNoise1.kr(0.1))}
~d6 = {Pan2.ar(DFM1.ar(SinOsc.ar(~fund*8,0,0.1),~fund*TRand.kr(2,10,Dust.kr(1)).round(2),EnvGen.ar(Env.perc(0.01,1),Impulse.kr((~tempo.kr*2)*3),1.5),mul:0.4),LFNoise1.kr(1))}

~d1.play

~bpf = Pbind(\instrument,\bpfsaw,\dur,Pwhite(0.5,2).round(0.5),\amp,Pwhite(0.1,0.6),\freq,Pkr(~fund)*Pwhite(1,4),\detune,Pexprand(0.00001,0.8),\ldb,15,\lsf,400)
~bpf2 = Pbind(\instrument,\bpfsaw,\dur,Pwhite(0.5,2).round(0.5),\amp,Pwhite(0.1,0.6),\scale.Scale.minor,\degree,Prand([0,2,4],inf),\octave,3,\detune,Pexprand(0.00001,0.8),\ldb,15,\lsf,400)

~bpf.stop

~k = Pbind(\instrument,\bplay,\buf,d["k2"][1],\dur,Pbjorklund2(3,8,inf,Pwhite(1,6).asStream)/4,\amp,1)

~k.play

~cp = Pbind(\instrument,\bplay,\buf,d["sn"][1],\amp,1,\rate,Pwhite(1,2.0),\dur,Pbjorklund2(Pwhite(1,16),16,inf,Pwhite(1,10).asStream)/16,\pan,Pwhite(-1,1))

~cp.play

p.clock.tempo=1.5

~cp.play




~h.stop
~h2.stop
~k.stop

(
~k.play;
~k2.play;
~h.play;
~h2.play;
)

StageLimiter.activate

~schk = Pbind(\instrument,\bplay,\buf,d["k"][4],\dur,Pbjorklund2(3,8)/8,\amp,5,\rate,Pseq([1,1.6,1],inf))


~schk.play

~k2 = Pbind(\instrument,\bplay,\buf,d["k"][2],\dur,Pbjorklund2(3,8,inf,Pwhite(0,8).asStream)/8,\rate,8,\amp,1)

~k2.play


{SinOsc.ar([440,660],0,0.7)}.play

(
p.clock.tempo=0.000000000001;
d["ftn"][2].play;
)

p.clock.tempo=1.4

~stab6.play

~h = Pbind(\instrument,\bplay,\buf,d["h"][1],\dur,Pbjorklund2(Pwhite(1,16),16,Pwhite(1,16).asStream)/8,\amp,1)

~h2 = Pbind(\instrument,\bplay,\buf,d["h"][0],\dur,Pbjorklund2(Pwhite(1,16),16,Pwhite(1,16).asStream)/16,\rate,2,\amp,1)

~h.play
~h2.play

~k2.stop

~k2.stop

~hey = Pbind(\instrument,\bplay,\buf,d["h"][4],\dur,Pseq([0.5,Pseq([1],inf)],inf)/2,\amp,1,\rate,0.5)
~hey.play

~bpf2.stop
~stab2.play
~stab3.play
~stab4.play
~stab5.play

(
~stab = Pbind(\instrument,\bplay,\buf,d["stab"][0],\dur,Pbjorklund2(Pwhite(1,5),8,Pwhite(1,6).asStream)/4,\amp,1);
~stab2 = Pbind(\instrument,\bplay,\buf,d["stab"][0],\dur,Pbjorklund2(Pwhite(1,5),8,Pwhite(1,6).asStream)/4,\amp,1,\rate,0.5);
~stab3 = Pbind(\instrument,\bplay,\buf,d["stab"][0],\dur,Pbjorklund2(Pwhite(1,5),8,Pwhite(1,6).asStream)/4,\amp,1,\rate,2);
~stab4 = Pbind(\instrument,\bplay,\buf,d["stab"][0],\dur,Pbjorklund2(Pwhite(1,7),8)/4,\amp,1,\rate,4);
~stab5 = Pbind(\instrument,\bplay,\buf,d["stab"][0],\dur,Pbjorklund2(Pwhite(1,7),8)/8,\amp,1,\rate,8);
~stab6 = Pbind(\instrument,\bplay,\buf,d["stab"][0],\dur,Pbjorklund2(Pwhite(1,7),8)/8,\amp,1,\rate,8);
~ftn = Pbind(\instrument,\vplay,\buf,d["ftn"][1],\dur,Pbjorklund2(Pwhite(1,7),8)/8,\amp,0.8,\rel,0.2,\pos,0.1);
~ftn2 = Pbind(\instrument,\vplay,\buf,d["ftn"][1],\dur,Pbjorklund2(Pwhite(1,7),8)/8,\amp,0.5,\rel,0.2,\pos,0.1,\rate,Pwrand([1,1.2,1.3],[1,4,2].normalizeSum,inf));
)

~stab2.play


(
~stab.stop(10);
~stab2.stop(10);
~stab3.stop(10);
~stab4.stop(10);
~stab5.stop(10);
~stab6.stop(10);
)


~bpf.clear

~bpf2.clear

~chord.clear



~stab6.play


~ftn2.play

d["ftn"][2].play

~



(
~scale.stop(10);
~scale2.stop(12);
~scale4.stop(14);
~chords.stop(20);
~chords2.stop(30);
)

(
~k.play;
~k2.play;
~sn.play;
~cp.play;
)

~sn = Pbind(\instrument,\bplay,\buf,d["sn"][4],\dur,Pbjorklund2(5,8),\amp,0.5)

~sn.play

~bpf.stop

p.clock.tempo=1.45

(
~scale = Pbind(\instrument,\sinfb,\scale,Scale.minor,\degree,Pseq((0..7),inf),\octave,5,\amp,Pwhite(0.1,0.7),\dur,Prand([0.25,Pseq([0.125],2)],inf),\rel,0.1,\fb,0.4,\root,3);
~scale2 = Pbind(\instrument,\sinfb,\scale,Scale.minor,\degree,Pseq((0..7).reverse,inf),\octave,5,\amp,Pwhite(0.1,0.7),\dur,Prand([0.25,Pseq([0.125],2)],inf),\rel,0.1,\fb,0.4,\root,3);
~scale4 = Pbind(\instrument,\sinfb,\scale,Scale.minor,\degree,Pseq((0..7).reverse.pyramid,inf),\octave,6,\amp,Pwhite(0.1,0.7),\dur,Prand([0.25,Pseq([0.125],2)],inf),\rel,0.1,\fb,0.4,\root,3);
~chords = Pbind(\instrument,\sinfb,\scale,Scale.minor,\degree,Pwrand([[0,2,4],[2,4,6],[4,6,8]],[10,5,1].normalizeSum,inf),\amp,0.1,\atk,3,\sus,3,\rel,3,\dur,Pwhite(1,4),\root,3);
~chords2 = Pbind(\instrument,\sinfb,\scale,Scale.minor,\degree,Pwrand([[0,2,4],[2,4,6],[4,6,8]],[10,5,1].normalizeSum,inf),\amp,0.1,\atk,3,\sus,3,\rel,3,\dur,Pwhite(1,4),\root,3,\octave,4)
)

~scale.play

~chords2.play

~one.clear
~onex.clear

(
~d1.clear
~d2.clear;
~d3.clear;
~d4.stop(10);
~d5.stop(10);
~d6.stop(10);


)

~cmod = {SinOsc.kr(0.1).range(0.1,1.4)}

~chords.set(\fb,~cmod)

p.clock.tempo=1.2


~h.play

~k2.play


~bpf2.play


~fund= {Line.kr(500,10,20)}

p.fadeTime=3


~d5.play


(
~one.stop(20);
~onex.stop(30);
)

~d3.pla5

~d4.play

~d2.play

~d1.play