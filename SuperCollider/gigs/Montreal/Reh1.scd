/*

Bonjour de Newcastle UK, Montréal!
Mon nom est coï¿¥ï¾¡pt
Merci à yecto pour l'organisation!

Hello from Newcastle, Montreal!
My name is coï¿¥ï¾¡pt
Thanks to yecto for organising!

*/


//this RLPFD example is gorgeous, the filter is beautiful
~rlpfd = { RLPFD.ar(Mix(LFSaw.ar([120, 180], 0, 0.33)), LinExp.kr(LFCub.kr(0.1, 0.5*pi), -1, 1, 280, 1500), 0.6, 0.5, mul:3).dup }
p.fadeTime=5
~rlpfd.play

~sin = {SinOsc.kr(0.01).range(0.01,10.01)}
~rlpfd.set(\speed,~sin)
~rlpfd = {arg speed = 0.5; RLPFD.ar(Mix(LFSaw.ar([120, 180, 60,SinOsc.kr(speed).range(120,600).round(60),SinOsc.kr(speed*1.01).range(120,1200).round(120)], 0, 0.33)), LinExp.kr(LFCub.kr(0.1, 0.5*pi), -1, 1, 280, 1500), 0.999, 0.999, mul:7).dup }


~rlpfd.stop(120)

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,Pbjorklund2(Prand([1,20,1,1,1,1],inf),32)*0.125,\amp,1);

//A string resonator example, which sounds great
~streson = {arg speed = 0.0001; Streson.ar(LFSaw.ar([220, 180], 0, mul:EnvGen.kr(Env.asr(0.5, 1, 0.02), 1.0) * 0.2), SinOsc.kr(speed).range(0.003,0.9), 0.9, 0.3) }
~streson.play
//modulating the speed
~stresonsine = {SinOsc.kr(0.1).range(0.1,0.0001)}
~streson.set(\speed,~stresonsine)

~r = {60}


~sin2 = {SinOsc.kr(rrand(0.1,0.08)).range(0.01,1.41)}


~sinfb3.set(\fb,~sin2)

~sinfb = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5],inf)*Pkr(~r),\dur,Pbjorklund2(6,8)/4,\amp,0.7,\fb,0.1,\rel,0.1);
~sinfb2 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5]+5,inf)*Pkr(~r),\dur,Pbjorklund2(3,8)/4,\amp,0.7,\fb,0.1,\rel,0.1);
~sinfb3 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7,8,9].scramble,inf)*Pkr(~r)*2,\dur,Pbjorklund2(3,8)/8,\amp,0.7,\fb,0.1,\rel,0.1);


~sn.stop

~delay.stop(10)

~r = {Line.kr(10,1,20)}


~delay2.stop(120)

p.clock.tempo = 2.4

//delay
~delaySend2 = {Mix.ar([~sinfb,~sinfb2,~sinfb3])};
~delay2 = {arg time = 4; CombC.ar(NumChannels.ar([~delaySend2]),9,0.9,time)};
~delay2.play;

~streson.stop(120)

~c.stop

~oh = Pbind(\instrument,\bplay,\buf,d["oh"][1],\dur,Pseq([0.5,Pseq([1],inf)],inf),\rate,5,\amp,1);

~oh.play

~sinfb3.play

~dfm1 = {DFM1.ar(SinOsc.ar([60,60*1.01],0,0.1),120,SinOsc.kr(0.05).range(0.9,1.6),1,0,0.0003,0.8)};

~oh.stop

~delay.clear

~k.stop

p.fadeTime = 0.3

(
~r2 = {0};
d[\scale] = Scale.chromatic(\et53);
l = Pbjorklund2(Pseq([3,4,6,10,12,3,5,13,2,1,5].scramble,inf),16)/4;
~ring1 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r2),\degree,Pwhite(-5,5),\octave,Pwrand([5,4],[0.8,0.2],inf),\dur,l,\d,0.4,\a,Pexprand(0.9,40),\pan,0,\amp,1,\pan,1);
~ring2 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r2),\degree,Pwhite(-5,5),\octave,Pwrand([4,5],[0.8,0.2],inf),\dur,l,\d,0.4,\a,Pexprand(0.9,40),\pan,0,\amp,1,\pan,-1);
~ring3 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r2),\degree,Pwhite(-5,5),\octave,Pwrand([3,2],[0.8,0.2],inf),\dur,l,\d,0.31,\a,Pexprand(0.9,400),\pan,0,\amp,2,\pan,1);
~ring4 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r2),\degree,Pwhite(-5,5),\octave,2,\dur,l,\d,0.31,\a,Pexprand(0.9,400),\pan,0,\amp,2,\pan,0);
~ring5 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r2),\degree,Pwhite(-10,10),\octave,7,\dur,l,\d,Pexprand(0.05,0.2),\a,Pexprand(0.9,40),\pan,0,\amp,0.5,\pan,0);
~sinfb = Pbind(\instrument,\sinfb,\scale,Scale.minor,\root,Pkr(~r),\octave,4,\degree,[0,Pseq([4,5,3,5,4],inf).stutter(120).asStream],\dur,0.25,\amp,0.6,\fb,0.1,\rel,0.3,\octave,[4,5,6]);
~h = Pbind(\instrument,\bplay,\buf,d["ch"][0],\dur,l,\amp,Pwhite(0.2,1));
~k = Pbind(\instrument,\bplay,\buf,d["sk"][0],\dur,1,\amp,10);
~oh = Pbind(\instrument,\bplay,\buf,d["oh"][0],\dur,Pseq([0.5,Pseq([1],inf)],inf),\amp,1);
~sn = Pbind(\instrument,\bplay,\buf,d["s"][0],\dur,l,\amp,1);
~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,l,\amp,1);
~ring1.play;~ring2.play;~ring3.play;~ring4.play;~ring5.play;~k.play;~oh.play;
)

~oh.stop

~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,0.75,\amp,2);
~c2 = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,Pbjorklund2(3,8)/4,\amp,2);

~c2.play

~k.stop
~oh.stop


//delay
~delaySend = {Mix.ar([~sinfb])};
~delay = {CombC.ar(NumChannels.ar([~delaySend]),p.clock.tempo*4,p.clock.tempo/16,10)};
~delay.play;

~c.play


~k.stop

~ring1.stop;~ring2.stop;~ring3.stop;~ring4.stop;~ring5.stop;

~k.play

~sinfb.play


p.clock.tempo = 2.5

~sn.play

(
~k.play;
~oh.play;
)

~dfm1.clear





~ring5.play



~ring4.play

~h.play

~ring3.play

~ring2.play


~delay2.set(\time,40)

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,5);

~k.play

~dfm1.play

~h = Pbind(\instrument,\bplay,\buf,d["ch"][0],\dur,0.25,\amp,Pwhite(0.2,1));

~sn = Pbind(\instrument,\bplay,\buf,d["s"][0],\dur,2,\amp,1.5,\rate,2);




//delay
~delaySend = {Mix.ar([~sn])};
~delay = {CombC.ar(NumChannels.ar([~delaySend]),p.clock.tempo*4,p.clock.tempo/16,4)};
~delay.play;


~c = Pbind(\instrument,\bplay,\buf,d["fx"][0],\dur,Pwhite(1,10),\amp,1);

~c.play


~sinfb2.play

~h.stop
~k.play