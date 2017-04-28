/*

Hello Leeds!

My name is coï¿¥ï¾¡pt!

s/o to Ryan, Joanne, ODI and all visualists <3

github.com/theseanco
@theseanco
seancotterill.xyz

*/

~rlpfd.play

(
~chords = Pbind(\instrument,\bpfsaw,
	\dur,Pwhite(4.5,15.0,inf),
	\scale,Scale.minor,
	\degree,Pwrand([[0,2,4],[3,5,7],[4,6,8]],[0.5,0.25,0.25],inf),
	\cfmin,100,
	\cfmax,1500,
	\rqmin,Pexprand(0.02,0.15,inf),
	\atk,Pwhite(2.0,4.5,inf),
	\rel,Pwhite(6.5,10.0,inf),
	\ldb,6,
	\lsf,1000,
	\octave,Pwrand([4,3,5],[0.6,0.3,0.1],inf),
	\amp,Pwhite(0.8,2.0),
	\out,0);
~chords.play
)

(
~h = Pbind(\instrument,\bplay,\buf,d["ch"][0],\dur,0.25,\amp,Pexprand(0.01,1));
~sin = {SinOsc.kr(0.01).range(0.1,1.4)};
)


~oh.stop

~sin.fadeTime = 5
p.fadeTime = 3
(
d[\scale] = Scale.chromatic(\et53);
l = Pbjorklund2(Pseq([10,9,5,3,2,10,14,5,3,9,2,4,5].scramble,inf),16)/4;
~r = {0};
~sinfb = Pbind(\instrument,\sinfb,\scale,Scale.minor,\root,Pkr(~r),\octave,[1,2,3],\degree,[0,Pseq([5,3,5,4,4],inf).stutter(10).asStream],\dur,0.25,\amp,0.3,\fb,0.1,\rel,1);
~sinfbl = Pbind(\instrument,\sinfb,\scale,Scale.minor,\root,Pkr(~r),\octave,[6,7],\degree,Pseq((0..7),inf),\dur,0.25,\amp,0.3,\fb,0.1,\rel,0.3);
~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,l,\amp,1);
~ring1 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-10,10),\octave,2,\dur,l,\d,0.4,\a,Pexprand(0.6,400),\pan,0,\amp,0.8);
~ring2 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-4,30),\octave,Pwrand([4,5],[0.8,0.2],inf),\dur,l,\d,0.21,\a,Pexprand(0.6,400),\pan,1,\amp,0.5);
~ring3 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-10,4),\octave,Pwrand([4,5],[0.8,0.2],inf),\dur,l,\d,0.21,\a,Pexprand(0.6,400),\pan,-1,\amp,0.5);
~ring4 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-40,40),\octave,Pwrand([6,5],[0.8,0.2],inf),\dur,l,\d,0.21,\a,Pexprand(0.6,40),\pan,0,\amp,0.5);
~ring5 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pseq((0..200),inf),\octave,Pwrand([6,5],[0.8,0.2],inf),\dur,l,\d,0.21,\a,Pexprand(0.6,10),\pan,0,\amp,0.5);
~ring6 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pseq((0..400),inf),\octave,Pwrand([6,5],[0.8,0.2],inf),\dur,l,\d,0.21,\a,Pexprand(0.6,10),\pan,0,\amp,0.5);
~sn = Pbind(\instrument,\bplay,\buf,d["s"][0],\dur,l,\amp,1);
~h = Pbind(\instrument,\bplay,\buf,d["ch"][0],\dur,l,\amp,Pwhite(0.2,1));
~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,l,\amp,1,\rate,1);
~k2 = Pbind(\instrument,\bplay,\buf,d["k"][2],\dur,l,\amp,1,\rate,1.6);
~t = Pbind(\instrument,\bplay,\buf,d["t"][0],\dur,l,\amp,1,\rate,2);
~t2 = Pbind(\instrument,\bplay,\buf,d["t"][0],\dur,l,\amp,1,\rate,2.5);
)


~hey.stop

~ring6.stop(30)

~k2.stop

~t2.stop


~k.stop

~kx = Pbind(\instrument,\bplay,\buf,d["k"][2],\dur,Pbjorklund2(3,8)/4,\amp,2,\rate,Pseq([1.2,1.5],inf));

~kx.play

~dfm.stop

(
~sinfb.stop;
~ravestab = Pbind(\instrument,\bplay,\buf,d["stab"][1],\dur,Pbjorklund2(Pwhite(3,10),16)/4,\rate,Pseq([1,1,1,1,1,1,0.9,1.1],inf).stutter(3),\amp,1);
~ravestab2 = Pbind(\instrument,\bplay,\buf,d["stab"][1],\dur,Pbjorklund2(Pwhite(3,10),8)/4,\rate,Pseq([1,1,1,1,1,1,0.9,1.1]*2,inf).stutter(3),\amp,1);
~ravestab3 = Pbind(\instrument,\bplay,\buf,d["stab"][1],\dur,Pbjorklund2(Pwhite(1,14),16)/4,\rate,Pseq([1,1,1,1,1,1,0.9,1.1]*4,inf).stutter(3),\amp,1);
)


~k.stop

~k2.stop


~henon = Pbind(\instrument,\henon,\freq,44100,\dur,0.25,\a,Pexprand(1.3,1.33),\b,Pexprand(0.3,0.35),\atk,0,\sus,0,\rel,Pexprand(0.01,0.1),\amp,1);


//delay
~reverbSend = {Mix.ar([~henon])};
~reverb = {arg size = 30, time = 10, damping = 0.5, spread = 15, dry = 0, amp = 0.8; GVerb.ar(Mix.ar([~reverbSend.ar]),size,time,damping,0.5,spread,dry,0.7,0.5,300,amp)};
~reverb.play;

~hey.stop


~sinfb = Pbind(\instrument,\sinfb,\scale,Scale.minor,\root,Pkr(~r),\octave,[2,3],\degree,Pseq([0,0,4,5],inf),\dur,Pbjorklund2(3,8)/4,\amp,0.3,\fb,0.1,\rel,0.3);
~sinfbl = Pbind(\instrument,\sinfb,\scale,Scale.minor,\root,Pkr(~r),\octave,[4,5,6],\degree,Pseq([0,0,4,5],inf),\dur,Pbjorklund2(3,8)/4,\amp,0.3,\fb,0.1,\rel,0.1);

~k.stop
~sinfb.play

//rlpfd
~rlpfdSend = {Mix.ar([~sinfb])};
~rlpfd = {arg speed = 0.1, min = 200, max = 500, res = 0.8, dist = 0.2; RLPFD.ar(NumChannels.ar([~rlpfdSend]),SinOsc.kr(speed).range(min,max),res,dist,3)};
~rlpfd.play;

(
~henon.stop;
~reverb.clear;


~sinfbl.play

~k.play

~sinfb.play

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,4);

~delay.stop(30)

~sn.stop

~ravestab.stop


~henon.play

~oh = Pbind(\instrument,\bplay,\buf,d["oh"][1],\dur,Pseq([0.5,Pseq([1],inf)],inf),\amp,1);
~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,0.75,\amp,1);
~sn = Pbind(\instrument,\bplay,\buf,d["s"][0],\dur,2,\amp,1);
(
~k2.play;
~k.play;
~oh.play;
~sn.play;
)

p.clock.tempo = 2.59




//delay
~delaySend = {Mix.ar([~ravestab3.ar])};
~delay = {CombC.ar(NumChannels.ar([~delaySend]),p.clock.tempo*4,SinOsc.kr(0.01).range(0.1,0.0001),10,mul:0.8)};
~delay.play;





~k.play

~dfm = {DFM1.ar(SinOsc.ar([60,60],0,0.1),120,SinOsc.kr(0.05).range(0.9,1.1),1,0,0.0003,0.8)};

~dfm.play
~hey.play

~k2 = Pbind(\instrument,\bplay,\buf,d["k"][2],\dur,Pbjorklund2(3,8)/4,\amp,1,\rate,Pseq([1.2,1.4],inf));

~k.play
~k2.play
~ravestab3.play

~k = Pbind(\instrument,\bplay,\buf,d["sk"][0],\dur,1,\amp,4);

~k.play

~sinfbl.play

~sinfb.play

~chords.clear

~ring6.play

~k.stop

~ring5.play

(
~ring1.stop;
~ring2.stop;
~ring3.stop;
~ring4.stop;
~sn.stop;
~h.stop;
~c.stop;
~k2.stop;
~t.stop;
~t2.stop;
)

~sn = Pbind(\instrument,\vplay,\buf,d["s"][0],\dur,Pbjorklund2(Pwhite(1,6),16)/4,\amp,1,\rate,Prand([-1,1],inf),\pos,Pkey(\rate).linlin(-1,1,0.99,0));

(
~ring1.play;
~ring2.play;
~ring3.play;
~ring4.play;
~sn.stop;
~h.play;
~c.play;
~k2.play;
~t.play;
~t2.play;
)
~oh = Pbind(\instrument,\bplay,\buf,d["oh"][1],\dur,Pseq([0.5,Pseq([1],inf)],inf),\amp,1);
~k = Pbind(\instrument,\bplay,\buf,d["sk"][0],\dur,1,\amp,2);

~hey = Pbind(\instrument,\bplay,\buf,d["shout"][1],\dur,2,\amp,1);

~hey.play

~oh.play


~t2.play

~t.play

~k2.play

~c.play

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,5);

~h.play


~k.play

p.clock.tempo = 2.45

2.4*60

~sinfbl.stop(120)

p.clock.tempo = 2.3

~ring4.play

~k.stop

~chords.stop(120)

~ring3.play

~ring2.play

~sinfbl.play

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,1);

~k.play

~c.stop

~ring1.play

~c.play


~sinfb.play
~sinfbl.set(\fb,~sin)
