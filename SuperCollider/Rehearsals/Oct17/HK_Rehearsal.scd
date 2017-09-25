~k = Pbind(\instrument,\bplaym,\buf,d["k"][2],\dur,Pbjorklund2(3,8)/4,\amp,1,\rate,Pseq([1.3,1.5],inf));

~k2 = Pbind(\instrument,\bplaym,\buf,d["k"][40],\dur,1,\amp,1.5);

(
~k2.play;
~cym.play;
)

(
d[\scale] = Scale.chromatic(\et53);
l = Pbjorklund2(Pseq([3,8,10,13,11,8,6,1,13,14,9,6,8,11],inf),16)/4;
~ring0 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,0,\octave,3,\dur,l,\d,0.3,\a,Pexprand(20,600),\pan,0,\amp,0.5);
~ring1 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-4,4),\octave,Pseq([2,3],inf),\dur,l,\d,0.2,\a,Pexprand(2,200),\pan,0,\amp,0.4);
~ring2 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-4,4),\octave,Pseq([4,5],inf),\dur,l,\d,0.2,\a,Pexprand(2,200),\pan,0,\amp,0.4);
~ring3 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pseq((0..52),inf)+Pwhite(-4,4),\octave,Pseq([4,5],inf),\dur,l,\d,0.12,\a,Pexprand(2,200),\pan,0,\amp,0.4);
~ring4 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pseq((0..52),inf)+Pwhite(-4,4),\octave,Pseq([5,6],inf),\dur,l,\d,0.12,\a,Pexprand(2,200),\pan,0,\amp,0.4);
~sn = Pbind(\instrument,\bplay,\buf,d["s"][1],\dur,l,\amp,1,\rate,1.2);
~cym = Pbind(\instrument,\bplaym,\buf,d["cym"][3],\dur,l,\rel,0.5,\amp,0.8,\rate,1);
~sinfb = Pbind(\instrument,\sinfb,\scale,d[\scale],\root,Pkr(~r),\octave,5,\degree,0,\dur,l,\amp,0.3,\fb,Pwhite(0.8,1.5),\rel,0.3,\atk,0.0);
~k = Pbind(\instrument,\bplaym,\buf,d["k"][0],\dur,l,\amp,3);
(
~midiPattern = Pbind(
    \type, \midi,
    \midicmd, \noteOn,
	\midiout, d[\m],
    \chan, 0,
	\scale,d[\scale],
	\degree,0,
	\octave, Pseq([3,3,3,3,3,3,3,2],inf),
	\dur, l,
	\legato, 0.6
)
);
(
~midiBend = Pbind(
\type,\midi,
\midicmd,\bend,
\midiout,d[\m],
\chan,0,
\dur,l,
	\val, Pwhite(0,16000),
)
)
)

~dfm3.stop

~k2.stop

~ring0.stop

~kx = Pbind(\instrument,\bplay,\buf,d["kbig"][0],\dur,Pbjorklund2(3,8)/4,\amp,2,\rate,Pseq([1,1.2],inf));

~kx.play

d.keys

~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,2,\amp,3);

~c.play

~one = {Pan2.ar(SoundIn.ar(0)) * 2}

~one.play

~ring0.play

~cym.play


p.clock.tempo = 2.5

~sn.play

~ring4.play

~k = Pbind(\instrument,\bplaym,\buf,d["k"][0],\dur,1,\amp,3);


~k.play

~sinfb = Pbind(\instrument,\sinfb,\scale,d[\scale],\root,Pkr(~r),\octave,5,\degree,0,\dur,0.25,\amp,0.3,\fb,Pwhite(0.8,1.5),\rel,0.3,\atk,0.0);

~sin.clear

~sinfb.stop(120)

~ring0.clear

p.fadeTime = 4

~ringx.stop


~c3.stop

~r2 = {SinOsc.kr(0.1).range(50000,39999)}

(
~ringx = Pbind(\instrument,\ring1,\f,Pkr(~r2)/4,\dur,Pwhite(0.25,1.5).round(0.25),\d,0.2,\a,Pexprand(2,2000),\pan,0,\amp,5);
~sinfbf = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5],inf)*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.1,\rel,0.1);
~sinfb2 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5].scramble,inf)*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.1,\rel,0.1);
~sinfb3 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6].scramble,inf)*Pkr(~r2)*2,\dur,0.25,\amp,0.3,\fb,0.1,\rel,0.1);
~sinfb4 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7,8,9,10],inf)*Pkr(~r2)*2,\dur,0.25,\amp,0.3,\fb,0.1,\rel,0.1);
~sinfb5 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7,8,9,10].scramble,inf)*Pkr(~r2)*4,\dur,0.25,\amp,0.3,\fb,0.1,\rel,0.1);
)

~k.stop

~c = Pbind(\instrument,\bplay,\buf,d["c"][3],\dur,0.75,\amp,8,\rate,2);
~c2 = Pbind(\instrument,\bplay,\buf,d["c"][3],\dur,Pbjorklund2(3,8)/4,\amp,9,\rate,2);
~c3 = Pbind(\instrument,\bplay,\buf,d["c"][3],\dur,Pbjorklund2(3,16)/4,\amp,10,\rate,2);

~c3.play

~k = Pbind(\instrument,\bplay,\buf,d["kbig"][0],\dur,Pbjorklund2(3,8)/4,\amp,3,\rate,Pseq([1.5,1.6],inf));
~k2 = Pbind(\instrument,\bplaym,\buf,d["k"][4],\dur,1,\amp,50);

~k2.play

d.keys

~k.clear
d.keys

~c2.play

~ringx.play

~c.play


~sinfb5.play

~sin5 = {SinOsc.kr(rxrand(0.08,0.12)).range(0.01,1.81)}

~sinfb5.set(\fb,~sin5)

~c.stop


~c = Pbind(\instrument,\bplay,\buf,d["c"][2],\dur,Pbjorklund2(Pwhite(1,6),16)/4,\amp,0.5,\rate,4);

~c.play

~dfm = {DFM1.ar(SinOsc.ar([~r2,~r2+1],0,0.1),~r2*2.01,SinOsc.kr(0.05).range(0.9,1.8),1,0,0.0003,0.9)};
~dfm2 = {DFM1.ar(SinOsc.ar([~r2,~r2+1]*2,0,0.1),~r2*4.01,SinOsc.kr(0.05).range(0.9,1.8),1,0,0.0003,0.9)};

~k2.vol = 0.4

~dfm2.play

~sinfb4.play
~k2.stop


~k = Pbind(\instrument,\bplaym,\buf,d["k"][0],\dur,Pwhite(0.25,2.0).round(0.25),\amp,6);


~synth.stop

~r2 = 50

~synth = {Pan2.ar(FreeVerb.ar(SoundIn.ar(0),0.33,0.7,0.5))}

~synth.play

~k.play
~sinfb3.play

~r2 = {SinOsc.kr(0.01).range(70,72)}

~sinfb.set(\rel,~sinenv)

~sinfb.play

~sinenv = {SinOsc.kr(0.1).range(0.01,0.1)}

~ring3.play
p.clock.tempo = 2.3

~ring2.play

p.fadeTime = 0


~ring1.play

~synth = {Pan2.ar(FreeVerb.ar(SoundIn.ar(0),0.1,0.9,0.2,2))}

~cym.play

~r = 0

d[\scale] = Scale.minor

(
~midiPattern = Pbind(
    \type, \midi,
    \midicmd, \noteOn,
	\midiout, d[\m],
    \chan, 0,
	\scale,d[\scale],
	\degree, Place([0,2,[7,8,9,10,21]],inf),
	\octave, Pseq([3,3,3,3,3,3,3,2],inf) ,
	\dur, 0.125,
	\legato, 0.6
)
)


~k.stop

~k2.stop

~cym.stop

~sn3.stop(10)

~sinfb.play

~sn = Pbind(\instrument,\bplay,\buf,d["c"][8],\dur,Pbjorklund2(3,8)/4,\amp,0.8);
~sn2 = Pbind(\instrument,\bplay,\buf,d["c"][8],\dur,Pbjorklund2(3,16)/4,\amp,0.8,\rate,1.5);
~sn3 = Pbind(\instrument,\bplay,\buf,d["c"][8],\dur,0.75,\amp,0.8,\rate,1.9);

~sn3.play

p.clock.tempo = 2.2


~sn.stop

~ring1.stop

~rbang.stop

~bang.stop


p.clock.tempo = 2.01

~sn = Pbind(\instrument,\bplay,\buf,d["srev"][1],\dur,Pbjorklund2(Pwhite(1,5),16),\amp,1);



~cym.stop


~sn.play

~r2 = 80

~k.vol = 0.2
d.keys




~sinfb2.stop

~sinfb.stop(20)



~bang = Pbind(\instrument,\bplay,\buf,Prand(d["rbang"],inf),\dur,Pbjorklund2(Pwhite(1,10),16)/4,\amp,1.6);

~bang.play

~sinfb.stop(40)

~sinfb = Pbind(\instrument,\sinfb,\scale,d[\scale],\root,Pkr(~r),\octave,5,\degree,[0,4],\dur,0.25,\amp,0.3,\fb,0.1,\rel,2);

~sinfb2 = Pbind(\instrument,\sinfb,\scale,d[\scale],\root,Pkr(~r),\octave,[4,5],\degree,Place([0,4,[1,2,3],[6,4,5],[0,4,3,2]],inf),\dur,Pbjorklund2(5,8)/2,\amp,0.3,\fb,0.1,\rel,0.3);





l = Pbjorklund2(Pseq([3,8,10,13,11,8,6,1,13,14,9,6,8,11],inf),16)/4
~ring1 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwrand([0,4],[10,1].normalizeSum,inf),\octave,Pseq([2,3],inf),\dur,Pwhite(0.25,1.5).round(0.25),\d,0.2,\a,Pexprand(2,200),\pan,0,\amp,0.7);

~ring1.play

~sinfb.play

~sinfb2.play

~sin = {SinOsc.kr(rrand(0.08,0.12)).range(0.01,1.41)}
~sin2 = {SinOsc.kr(rrand(0.08,0.12)).range(0.01,1.41)}

~sinfb2.set(\fb,~sin2)

~sinfb.play


~k.stop

~h = Pbind(\instrument,\bplay,\buf,d["ch"][0],\dur,0.25,\amp,Pexprand(0.05,1));


~cym.play

~cym = Pbind(\instrument,\bplay,\buf,d["cym"][0],\dur,Pseq([0.5,Pseq([1],inf)],inf),\rel,0.1,\amp,1,\rate,2,\pos,0.05)

~cym.play

Bjorklund2(3,8)/4

p.fadeTime = 2

~k2.stop

~k.stop

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,6);

~sinfbf.stop(40)


p.clock.tempo = 0.0001



~synth = {Pan2.ar(FreeVerb.ar(SoundIn.ar(0),0.33,1,0.2,1))}

~synth.play

~k.play