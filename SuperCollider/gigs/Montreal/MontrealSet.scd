/*

Hello from Newcastle, Montreal Algorave!
My name is coï¿¥ï¾¡pt
Thanks to yecto for organising!

Bonjour de Newcastle UK, Montréal Algorave!
Mon nom est coï¿¥ï¾¡pt
Merci à yecto pour l'organisation!

github.com/theseanco
twitter @theseanco
seancotterill.xyz

*/



/*

NOTES:

- Delayed harmonic runs
- Usual up/down/up-up
- Ring1 with unified/divergent rhythm
- ravestabs

*/


s.makeWindow

~rlpfd = { RLPFD.ar(Mix(LFSaw.ar([120, 180], 0, 0.33)), LinExp.kr(LFCub.kr(0.1, 0.5*pi), -1, 1, 280, 1500), 0.6, 0.5, mul:3).dup }
p.fadeTime=5
~rlpfd.play

~sin = {SinOsc.kr(0.01).range(0.01,10.01)}
~rlpfd.set(\speed,~sin)
~rlpfd = {arg speed = 0.5; RLPFD.ar(Mix(LFSaw.ar([120, 180, 60,SinOsc.kr(speed).range(120,600).round(60),SinOsc.kr(speed*1.01).range(120,1200).round(120)], 0, 0.33)), LinExp.kr(LFCub.kr(0.1, 0.5*pi), -1, 1, 280, 1500), 0.6, 0.5, mul:3).dup }


~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,Pbjorklund2(Prand([1,20,1,1,1,1],inf),32)*0.125,\amp,1);

//A string resonator example, which sounds great
~streson = {arg speed = 0.0001; Streson.ar(LFSaw.ar([220, 180], 0, mul:EnvGen.kr(Env.asr(0.5, 1, 0.02), 1.0) * 0.2), SinOsc.kr(speed).range(0.003,0.9), 0.9, 0.3) }
~streson.play
//modulating the speed
~stresonsine = {SinOsc.kr(0.1).range(0.00001,0.0001)}
~streson.set(\speed,~stresonsine)

~k.play

~streson.play

~r2 = {60}

~sinfb = Pbind(\instrument,\sinfb,\freq,Pseq([9,5,7,3,4],inf)*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.1,\rel,0.2);
~sinfb2 = Pbind(\instrument,\sinfb,\freq,Pseq([4,7,6,8,5],inf)*Pkr(~r2)*4,\dur,0.25,\amp,0.5,\fb,0.1,\rel,0.1);
~sinfb3 = Pbind(\instrument,\sinfb,\freq,[1,5,10]*Pkr(~r2),\dur,0.25,\amp,0.5,\fb,Pwhite(0.1,1.4),\rel,0.5);

(
~r = {0};
d[\scale] = Scale.chromatic(\et53);
l = Pbjorklund2(Pseq([3,5,8,8,7,4,2,1,14],inf),16)/4;
~ring1 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-6,6),\octave,2,\dur,l,\d,0.3,\a,Pexprand(1,400),\pan,0,\amp,1);
~ring5 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-6,6),\octave,Pwrand([2,3],[0.8,0.2],inf),\dur,0.25,\d,0.21,\a,Pexprand(1,500),\pan,0,\amp,1);
~ring2 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-6,6),\octave,Pwrand([4,5],[0.8,0.2],inf),\dur,l,\d,0.3,\a,Pexprand(1,40),\pan,0,\amp,1);
~ring3 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-6,6),\octave,Pwrand([4,2],[0.8,0.2],inf),\dur,l,\d,0.3,\a,Pexprand(1,40),\pan,0,\amp,1);
~ring4 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-12,12),\octave,Pwrand([4,3],[0.8,0.2],inf),\dur,l,\d,0.2,\a,Pexprand(1,400),\pan,0,\amp,1);
~h = Pbind(\instrument,\bplay,\buf,d["ch"][0],\dur,l,\amp,Pwhite(0.2,1));
~sn = Pbind(\instrument,\bplay,\buf,d["s"][0],\dur,l,\amp,1);
~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,l,\amp,1);
~sinfb = Pbind(\instrument,\sinfb,\scale,Scale.minor,\root,Pkr(~r),\octave,[4,5,6],\degree,[0,Pseq([4,5,3,5,4],inf).stutter(90).asStream,7,1],\dur,0.25,\amp,0.3,\fb,0.1,\rel,0.6);
~sinfb2 = Pbind(\instrument,\sinfb,\scale,Scale.minor,\root,Pkr(~r),\octave,[5,6],\degree,Pseq([3,5,6,2,5,1].scramble,inf),\dur,0.25,\amp,0.5,\fb,Pwhite(0.6,1.6),\rel,0.1);
)
p.fadeTime=4



//delay
~delaySend = {Mix.ar([~sinfb.ar])};
~delay = {CombC.ar(NumChannels.ar([~delaySend]),p.clock.tempo*4,SinOsc.kr(0.05).range(0.1,4),8)};
~delay.play;



~oh.play;~sn.play;~h.play;~c.play;~ring1.play;~ring2.play;~ring3.play;~ring4.play;~k.play;


~h.stop

~h = Pbind(\instrument,\bplay,\buf,d["ch"][0],\dur,0.25,\amp,Pwhite(0.2,1));

~h.play

~snx.stop

~ring5.stop




(
~ravestab = Pbind(\instrument,\bplay,\buf,d["stab"][1],\dur,Pbjorklund2(3,8)/4,\rate,Pseq([1,1,1,1,1,1,0.9,1.1],inf).stutter(3),\amp,1);
~ravestab2 = Pbind(\instrument,\bplay,\buf,d["stab"][1],\dur,Pbjorklund2(3,8)/4,\rate,Pseq([1,1,1,1,1,1,0.9,1.1]*2,inf).stutter(3),\amp,1);
~ravestab3 = Pbind(\instrument,\bplay,\buf,d["stab"][1],\dur,Pbjorklund2(Pwhite(1,10),16)/4,\rate,Pseq([1,1,1,1,1,1,0.9,1.1]*4,inf).stutter(3),\amp,1);
~ravestab4 = Pbind(\instrument,\bplay,\buf,d["stab"][1],\dur,Pbjorklund2(Pwhite(1,10),16)/4,\rate,Pseq([1,1,1,1,1,1,0.9,1.1]*6,inf).stutter(3),\amp,1);
)


~ravestab2.stop(10);


~sinfb = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7,8,9],inf)*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.1,\rel,Pexprand(0.1,1));
~sinfb2 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7,8,9].reverse,inf)*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.1,\rel,Pexprand(0.1,2.9));
~sinfb3 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7,8,9].scramble,inf)*Pkr(~r2)*2,\dur,0.25,\amp,0.3,\fb,0.1,\rel,Pexprand(0.1,2.9));

~k.stop;~kx.stop;

~k.play;~kx.play;~c4.play;~cx.play;

~k = Pbind(\instrument,\bplay,\buf,d["sk"][0],\dur,1,\amp,2);

p.clock.tempo = 0.00001

~rlpfd = {arg speed = 0.5; RLPFD.ar(Mix(LFSaw.ar([60,60*4,60*8,120, 180], 0, 0.33)), LinExp.kr(LFCub.kr(0.1, 0.5*pi), -1, 1, 280, 1500), 0.6, 0.5, mul:6).dup }



///thanks <3 <3 <3 <3
///sorry about the technical issues

~rlpfd.play

~r2 = {XLine.kr(9000,120000,40)}

~rlpfd.stop(10)

~c4 = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,0.75,\amp,1);
~cx = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,Pbjorklund2(3,8)/4,\amp,1);


~sn.stop

~sinfb2.play

~sinfb3.play

~sinfb3.set(\fb,~sin2)

~sinfb.play


~kx = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,1);

~kx.play

~ravestab.stop

~r2 = {60}

~ravestab4.play


~cx.stop

~ravestab3.play




~ravestab2.play

p.clock.tempo = 2.55

~delay.clear

(
~delay.stop(10);
~ravestab.play;
)

~c2.stop;~c.stop;

~k.play;~sn.play;~oh.play;~c2.play;~c.play;

~rlpfd = {arg speed = 0.5; RLPFD.ar(Mix(LFSaw.ar([120, 180], 0, 0.33)), LinExp.kr(LFCub.kr(0.1, 0.5*pi), -1, 1, 280, 1500), 0.6, 0.5, mul:1.5).dup }

~rlpfd.play

(
~k = Pbind(\instrument,\bplay,\buf,d["k"][2],\dur,Pbjorklund2(3,8)/4,\amp,1,\rate,Pseq([1.5,1.7],inf));
~sn = Pbind(\instrument,\bplay,\buf,d["s"][0],\dur,2,\amp,1);
~oh = Pbind(\instrument,\bplay,\buf,d["oh"][1],\dur,Pseq([0.5,Pseq([1],inf)],inf),\amp,1);
~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,Pbjorklund2(Pwhite(1,5),8)/4,\amp,1,\pan,-1);
~c2 = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,Pbjorklund2(Pwhite(1,5),8)/4,\amp,1,\pan,1);
)

~c2.play

~


~c.play
~oh.stop

~c2.stop

~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,0.75,\amp,1);
~c2 = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,Pbjorklund2(3,8)/4,\amp,1);

~c2.play

~sinfb2.clear

~ring5.play

~sinfb2.stop

~snx = Pbind(\instrument,\bplay,\buf,d["s"][1],\dur,2,\amp,10);

~snx.play

~sinfb2.play

~sinfb.play

~sinfb2.clear


~ring5.play

~ring4.stop

~k.stop


~ring5.stop


~ring5.play

p.clock.tempo = 2.4

~k = Pbind(\instrument,\bplay,\buf,d["sk"][0],\dur,1,\amp,3);
~oh = Pbind(\instrument,\bplay,\buf,d["oh"][1],\dur,Pseq([0.5,Pseq([1],inf)],inf),\amp,3,\rate,2);


~oh.play

~k.play

~k.play


~sn.play;~h.play;~c.play;


p.clock.tempo = 2.35

~ring4.play

~c.play

~sn.play

~ring2.play

~ring3.play

~delay.stop(60)


//HELLO AGAIN!

~sinfb3.stop

~sn.stop

~k.stop


~ring1.play

~sinfb3.stop(10)


~r2 = {60}



~streson.clear

~rlpfd.stop(40)

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,Pbjorklund2(3,8)/4,\amp,4);
~sn = Pbind(\instrument,\bplay,\buf,d["s"][0],\dur,Pbjorklund2(Pwhite(1,6),8)/4,\amp,3,\rate,3);
~h = Pbind(\instrument,\bplay,\buf,d["ch"][0],\dur,0.25,\amp,Pwhite(0.2,1.5));






~h.play

~sn.play
~sinfb3.play
~sinfb2.set(\fb,~sin2)

~sin2 = {SinOsc.kr(0.1).range(0.1,1.5)}

~streson.stop(60)

p.clock.tempo = 2.05

~sinfb2.play

//delay
~delaySend = {Mix.ar([~sinfb.ar,~sinfb2.ar])};
~delay = {CombC.ar(NumChannels.ar([~delaySend]),p.clock.tempo*4,p.clock.tempo/16,10)};
~delay.play;

