(
~r = {0};
d[\scale] = Scale.chromatic(\et53);
)

~sn = Pbind(\instrument,\bplay,\buf,d["s"][0],\dur,2,\amp,1);

(
~t1.play
~t3.play
)

~ring3.stop(60)

Pbjorklund2(5,16,0,Pwhite(0,10).asStream)/4
(
l = Pbjorklund2(Pseq([3,5,7,13,1,5,8,5,9,3,10],inf),16)/4;
~t1 = Pbind(\instrument,\bplay,\buf,d["t"][0],\dur,Pbjorklund2(5,16,inf,Pwhite(0,10).asStream)/4,\amp,5,\rate,3);
~t2 = Pbind(\instrument,\bplay,\buf,d["t"][0],\dur,Pbjorklund2(5,16,inf,Pwhite(0,10).asStream)/4,\amp,5,\rate,4);
~t3 = Pbind(\instrument,\bplay,\buf,d["t"][0],\dur,Pbjorklund2(5,16,inf,Pwhite(0,10).asStream)/4,\amp,5,\rate,5);

~t3.play
~ring1 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-4,2),\octave,Pwrand([5,4],[10,1].normalizeSum,inf),\dur,l,\d,0.3,\a,Pexprand(1,20),\pan,1,\amp,0.9);
~ring3 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-4,2),\octave,Pwrand([5,4],[10,1].normalizeSum,inf),\dur,l,\d,0.3,\a,Pexprand(1,20),\pan,-1,\amp,0.9);
~ring2 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-10,10),\octave,Pwrand([3,2],[10,1].normalizeSum,inf),\dur,l,\d,0.25,\a,Pexprand(2,280),\pan,0,\amp,1.2);
~tx = Pbind(\instrument,\bplay,\buf,d["t"][2],\dur,l,\amp,1,\rate,1);
~sn = Pbind(\instrument,\bplay,\buf,d["s"][0],\dur,l,\amp,1);
~h = Pbind(\instrument,\bplay,\buf,d["ch"][0],\dur,Pwrand([0.25,Pseq([0.125],4)],[10,1].normalizeSum,inf),\amp,Pwhite(0.01,1.6));
~scalefb = Pbind(\instrument,\sinfb,\scale,d[\scale],\octave,[6,5],\degree,Pwhite(0,30),\dur,l,\amp,0.8,\fb,Pwhite(0.1,0.8),\rel,0.1);
~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,4);
~k2 = Pbind(\instrument,\bplay,\buf,d["k"][2],\dur,Pbjorklund2(3,8)/4,\amp,1,\rate,Pseq([1.3,1.4],inf));
~ring5 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pseq([0,10,20,15,25,5],inf),\octave,Pwrand([6,5],[10,1].normalizeSum,inf),\dur,l,\d,0.21,\a,Pexprand(1,200),\pan,-1,\amp,0.9);
~ring6 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pseq([0,10,20,15,25],inf),\octave,Pwrand([5,6],[10,1].normalizeSum,inf),\dur,l,\d,0.21,\a,Pexprand(1,200),\pan,1,\amp,0.9);
)

~k2.play

~ring6.play

~k2.stop

p.clock.tempo = 2.68

~sinfb = Pbind(\instrument,\sinfb,\freq,[100,200,300,500,1000],\dur,0.25,\amp,0.7,\fb,Pwhite(0.1,1.4));

~sinfbx = Pbind(\instrument,\sinfb,\freq,Pseq((1..10),inf)*100,\dur,0.25,\amp,2.4,\fb,Pwhite(1,300),\rel,0.2);
~sinfbx2 = Pbind(\instrument,\sinfb,\freq,Pseq((1..10).reverse,inf)*100,\dur,0.25,\amp,2.4,\fb,Pwhite(1,300),\rel,0.2);

~sinfbx2.play

~sinfbx.play

~k2.play

~sinfb.play

~k2.play

~dfm1.play

~h = Pbind(\instrument,\bplay,\buf,d["ch"][0],\dur,0.25,\amp,Pwhite(0.2,9));




~h2.play
(
~oh.play;
~sn.play;
~c.play;
~c2.play;
~sinfb.play;
~sinfb2.play;
~sinfb3.play;
~bass.play;
~k.play;
~henon.play;
)

~t3.stop

~k2 = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,30);

p.clock.tempo = 1.8

p.clock.tempo = 2.3
~k.stop
~sn.stop
~tx.stop

~.stop(60)

(
~ring5.stop;
~ring6.stop;
~t1.stop;
~t2.stop;
~t3.stop;
)



~k2.stop

~t3.play

~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,Pbjorklund2(Pseq([3,3,3,4],inf),8)/4,\amp,1);



~c.play

~r2 = {Line.kr(92,45,20)}
~dfm1 = {DFM1.ar(SinOsc.ar([~r2,~r2*1.01],0,0.1),200,SinOsc.kr(0.05).range(0.9,1.1),1,0,0.0003,0.5)};
~dfm2 = {DFM1.ar(SinOsc.ar([~r2,~r2*1.01]*2,0,0.1),~r2*4,SinOsc.kr(0.05).range(0.9,1.1),1,0,0.0003,0.5)};

~dfm2.play

~bass = Pbind(\instrument,\ring1,\f,Pkr(~r2)*Pwhite(0.5,1.5).round(0.5),\dur,l,\d,0.3,\a,Pexprand(10,500),\pan,0,\amp,1);

~k.play

~bass.play

~sinfb = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,5,10,1,4,6,10],inf)*Pkr(~r2),\dur,0.25,\amp,0.8,\fb,1,\rel,0.1);
~sinfb2 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,5,10,1,4,6,10,12],inf)*Pkr(~r2),\dur,0.25,\amp,0.8,\fb,0.1,\rel,0.1);
~sinfb3 = Pbind(\instrument,\sinfb,\freq,Prand([1,2,5,10,1,4,6,10,12],inf)*Pkr(~r2)*2,\dur,0.25,\amp,0.8,\fb,0.1,\rel,0.1);
~sinfb4 = Pbind(\instrument,\sinfb,\freq,Prand([1,2,5,10,1,4,6,10,12],inf)*Pkr(~r2)*4,\dur,0.25,\amp,0.8,\fb,0.1,\rel,0.1);

~henon = Pbind(\instrument,\henon,\freq,Pwhite(1,10)*Pkr(~r)*10,\dur,0.25,\a,Pexprand(1.3,1.31),\b,Pexprand(0.3,0.32),\amp,1,\atk,0.0,\sus,0,\rel,Pexprand(0.01,0.2));

~henon.play

(
~k.play;
~c.play;;
~t3.stop;
)

~h = Pbind(\instrument,\bplay,\buf,d["oh"][1],\dur,Pseq([0.5,Pseq([1],inf)],inf),\amp,2);


~sn = Pbind(\instrument,\bplay,\buf,d["s"][1],\dur,2,\amp,4);

~dfm1.play

~dfm2.stop(30)

~r2 = {SinOsc.kr(0.1).range(40000,60000)}

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,10);



~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,Pbjorklund2(Pseq([3,3,3,4],inf),8)/4,\amp,7);

~c2 = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,0.75,\amp,7,\rate,1.4);

~c2.play






p.clock.tempo = 2.63

~k = Pbind(\instrument,\bplay,\buf,d["k"][2],\dur,Pbjorklund2(Pseq([3,3,3,4],inf),8)/4,\amp,4,\rate,Pseq([1.2,1.5,1.6,1.3],inf)*1.6);

~sn.play

(
~k.play;
~sinfb.play;
~sinfb4.play;
~sinfb2.play;
~sinfb3.play;
~bass.play;
)

p.clock.tempo = 2.5

~h.play

~sinfb4.play

~r2 = {Line.kr(50,70,10)}

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,4);

~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,0.75,\amp,2);

~h.play

~k.play

~sinfb3.play

~fb3 = {SinOsc.kr(0.11).range(0.01,1.51)}

~sinfb3.set(\fb,~fb3)

~sinfb2.play

~sinfb.play


~dfm1.play


~scalefb.stop

~h.stop


~sinfb.stop

~k2.play
~k.play



~scalefb.play


~h.play

(
~tx.play;
~sn.play;
~t1.play;
~t2.play;
~t3.play;
)

~sn.play

~tx.play
p.clock.tempo = 2.25

~ring2.play
~t3.play
~t2.play

~ring3.play
~ring1.play