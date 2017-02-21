s = Scale.chromatic(\et53)
~r = {0}
l = Pbjorklund2(Pwhite(1,7),8)/4

(
l = Pbjorklund2(Pseq([3,5,2,6,8,1,10,9,14,8,2,4,6,7],inf),rrand(10,20))/[4,4,4,4,4,4,8].choose;
~ring1 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,s,\root,Pkr(~r),\degree,Pwhite(0,2),\octave,Pwrand([5,4]+1,[10,1].normalizeSum,inf),\dur,l,\d,Pexprand(0.3,2),\a,Pexprand(1,20),\pan,1,\amp,0.7);
~ring2 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,s,\root,Pkr(~r),\degree,Pwhite(0,2),\octave,Pwrand([5,6],[10,1].normalizeSum,inf),\dur,l,\d,Pexprand(0.3,2),\a,Pexprand(1,20),\pan,-1,\amp,0.7);

~ringx = Pbind(\instrument,\ring1,\f,50,\scale,s,\root,Pkr(~r),\degree,Pwhite(-2,2),\octave,Pwrand([3,4],[10,1].normalizeSum,inf),\dur,Pbjorklund2(Pwhite(10,16),16)/4,\d,Pexprand(0.1,0.3),\a,Pexprand(1,400),\pan,0,\amp,2);

~ringx2 = Pbind(\instrument,\ring1,\f,Pkr(~r)*Pwrand([1,1.1,1.2,2,1.5],[10,1,1,1,1].normalizeSum,inf),\scale,s,\root,Pkr(~r),\degree,Pwhite(-4,4),\octave,Pwrand([4,5],[10,1].normalizeSum,inf),\dur,Pbjorklund2(Pwhite(10,16),20)/8,\d,Pexprand(0.1,0.8),\a,Pexprand(1,800),\pan,0,\amp,2);

~ringx2.play

~ring3 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,s,\root,Pkr(~r),\degree,Pwhite(0,2),\octave,3,\dur,l,\d,Pexprand(0.3,2),\a,Pexprand(1,200),\pan,0,\amp,0.7);
~sn = Pbind(\instrument,\bplay,\buf,d["s"][0],\dur,l,\amp,1);
~h = Pbind(\instrument,\bplaym,\buf,d["ch"][0],\dur,l,\amp,Pwhite(0.2,1));
~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,l,\amp,2);
~sk = Pbind(\instrument,\bplaym,\buf,d["sk"][1],\dur,l,\amp,9);
)




~ringx2.stop
p.clock.tempo
~sn.stop

~r = {120}

~sin2 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7],inf)*Pkr(~r),\dur,1/3,\amp,0.6,\fb,Pexprand(0.1,0.3),\rel,0.5)
~sin = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7].reverse,inf)*Pkr(~r),\dur,0.25,\amp,0.6,\fb,Pexprand(0.1,0.3),\rel,0.5)
~sin3 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7].reverse,inf)*Pkr(~r)*2,\dur,Pwrand([0.5,0.25],[10,1].normalizeSum,inf),\amp,0.6,\fb,Pexprand(0.1,0.8),\rel,0.5)
~sin4 = Pbind(\instrument,\sinfb,\freq,Pseq((1..20),inf)*Pkr(~r),\dur,Pbjorklund2(Pwhite(5,10),16)/8,\amp,0.6,\fb,Pexprand(0.1,1.6),\rel,0.1)
~sin5 = Pbind(\instrument,\sinfb,\freq,Pseq((1..10).reverse,inf)*Pkr(~r)*2,\dur,Pbjorklund2(Pwhite(5,10),16)/8,\amp,0.6,\fb,Pexprand(0.1,3.6),\rel,0.1)




~sin5.play

~k.stop
~h.stop

~sin4.play
~sin3.play

~ringx2.clear






~sin2.play


~sin.play

~dfm = {DFM1.ar(SinOsc.ar([~r,~r+1],0,0.1),~r*2,SinOsc.kr(0.05).range(0.9,1.6),1,0,0.0003,1)}

~dfm2 = {DFM1.ar(SinOsc.ar([~r*2,~r*2+1],0,0.1),~r*4,SinOsc.kr(0.0535).range(0.9,1.6),1,0,0.0003,0.5)}

~dfm3 = {DFM1.ar(SinOsc.ar([~r*4,~r*4+1],0,0.1),~r*8,SinOsc.kr(0.06).range(0.9,1.6),1,0,0.0003,0.5)}


~dfm3.play

~dfm2.play

~sn = Pbind(\instrument,\bplay,\buf,d["s"][0],\dur,Pbjorklund2(Pseq([3,5],inf),8)/8,\amp,5)


~sn.play

~dfm.play

~sk.stop
~ring2.stop

~r = {SinOsc.kr(0.1).range(-1,1)}

~h.play

p.clock.tempo = 1.25

~ringx.play
~c = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,Pseq([0.5,Pseq([1],inf)],inf),\amp,10)

~t = Pbind(\instrument,\bplaym,\buf,d["t"][0],\dur,Pbjorklund2(Pwhite(1,10),16)/4,\amp,4,\rate,9)

~t2 = Pbind(\instrument,\bplaym,\buf,d["t"][2],\dur,Pbjorklund2(Pwhite(1,10),16)/4,\amp,4,\rate,9)
~k.play

~sn.play

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,0.5,\amp,10)
~sn = Pbind(\instrument,\bplay,\buf,d["s"][0],\dur,1,\amp,10)
~c.stop


(
~k.play;
~sn.play;
)

~t2.play

~t.play

~ring4.stop(20)


~c.play

p.clock.tempo = 2.5

2.5*60

~h.stop

~c.stop

~ring4.play



~sn.play

~sk.stop


~c.play
~sk.play
~k.play


p.clock.tempo=2.3




~c.play
(
~c.play;
~k.play;
~sn.stop;
~h.stop;
~sk.stop;
)

plp.clock.tempo = 2.25

60*2.25

~ring4.play
~k.play
Pseq([1,2,3,4,5],inf)

~sn.play
~h.play
(
~h = Pbind(\instrument,\bplaym,\buf,d["ch"][0],\dur,Pwrand([0.125,Pseq([0.125/2],2)],[10,1].normalizeSum,inf),\amp,Pwhite(0.2,1));
~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,Pbjorklund2(3,8)/4,\amp,2)
~sk = Pbind(\instrument,\bplaym,\buf,d["sk"][1],\dur,1,\amp,9)
)

~k.play

~h.play


p.clock.tempo=1.9

~ring3.play

~ring2.play
~ring1.play

