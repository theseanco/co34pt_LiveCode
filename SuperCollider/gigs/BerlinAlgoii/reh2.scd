(
f = File.new("codeExecutedBerlinAlgo23-3-17TEST.txt","w")
this.codeDump = { |str| SystemClock.sched(0.0,{arg time; f.write(time.asString)}); f.write("       ");  f.write(str);  f.putChar($\n); };
~r = {0};
d[\scale] = Scale.chromatic(\et53);
)

//DON'T FORGET ABOUT SFX

(
l = Pbjorklund2(Pseq([3,3,1,5,10,11,4,7,9,5,1,4,8,9,12].scramble,inf),16)/4;
~t1 = Pbind(\instrument,\bplay,\buf,d["t"][0],\dur,l,\amp,1,\pan,Pwhite(-0.5,0.5));
~t2 = Pbind(\instrument,\bplay,\buf,d["t"][0],\dur,l,\amp,1,\pan,Pwhite(-0.5,0.5),\rate,1.2);
~t3 = Pbind(\instrument,\bplay,\buf,d["t"][0],\dur,l,\amp,1,\pan,Pwhite(-0.5,0.5),\rate,1.6);
~t4 = Pbind(\instrument,\bplay,\buf,d["t"][0],\dur,l,\amp,1,\pan,Pwhite(-0.5,0.5),\rate,2);
~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,0.75,\amp,1);
~ring1 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-4,4),\octave,Pwrand([3,2],[10,1].normalizeSum,inf),\dur,l,\d,0.31,\a,Pexprand(1,2000),\pan,0,\amp,1);
~ring2 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-4,4),\octave,Pwrand([5,4],[10,1].normalizeSum,inf),\dur,l,\d,0.4,\a,Pexprand(1,200),\pan,1,\amp,0.5);
~ring3 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-4,4),\octave,Pwrand([6,5],[10,1].normalizeSum,inf),\dur,l,\d,0.4,\a,Pexprand(1,200),\pan,-1,\amp,0.5);
~sn = Pbind(\instrument,\bplay,\buf,d["s"][0],\dur,2,\amp,1);
~h = Pbind(\instrument,\bplay,\buf,d["ch"][0],\dur,l,\amp,Pwhite(0.2,1));
~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,l,\amp,1);
~sinfb = Pbind(\instrument,\sinfb,\scale,d[\scale],\octave,3,\degree,[0,52],\dur,0.25,\amp,0.3,\fb,0.1,\rel,0.9);
~k = Pbind(\instrument,\bplay,\buf,d["k"][2],\dur,Pbjorklund2(3,8)/4,\amp,3,\rate,Pseq([1.2,1.5],inf));
~oh = Pbind(\instrument,\bplay,\buf,d["oh"][0],\dur,Pseq([0.5,Pseq([1],inf)],inf),\amp,1);
~k2 = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,5);
)

~h = Pbind(\instrument,\bplay,\buf,d["ch"][0],\dur,0.25,\amp,Pwhite(0.2,2));

(
~t4.play
~k2.play;
~oh.play;
~h.play;
~c.play;
~cx.play;
)


~h.stop
~c.stop
~cx.stop

~r2 = {SinOsc.kr(0.1).range(9000,10000)}

~h.play
~c.play


~r2 = {76}

~dfm1 = {DFM1.ar(SinOsc.ar([~r2,~r2*1.01],0,0.1),~r2*2,SinOsc.kr(0.05).range(0.9,1.1),1,0,0.0003,0.5)};
~dfm2 = {DFM1.ar(SinOsc.ar([~r2,~r2*1.01]*2,0,0.1),~r2*4,SinOsc.kr(0.05).range(0.9,1.1),1,0,0.0003,0.5)};

~c2 = Pbind(\instrument,\bplay,\buf,d["c"][0],\rate,1.4,\dur,Pbjorklund2(Pseq([3,3,3,4],inf),8)/4,\amp,1);


~henon = Pbind(\instrument,\henon,\freq,44100,\dur,0.25,\a,Pexprand(1.3,1.4),\b,Pexprand(0.3,0.4),\atk,0,\sus,0,\rel,Pexprand(0.01,0.4),\amp,3);


~henon.play

~bass = Pbind(\instrument,\sinfb,\scale,Scale.minor,\octave,[4,5],\degree,Pseq([0,0,4,5],inf),\dur,Pbjorklund2(3,8)/4,\amp,0.7,\fb,1,\rel,0.3);
~bass2 = Pbind(\instrument,\sinfb,\scale,Scale.minor,\octave,[5,6],\degree,Pseq([0,7,6,4,2,5,1,2,1],inf),\dur,0.25,\amp,0.7,\fb,1,\rel,0.1);

~oh.stop




~bass2.play

~oh.play

~sinfb4.stop

~bass.play

(
~t4.stop

~c2.play
~k2.play

~sinfb = Pbind(\instrument,\sinfb,\freq,Pseq([5,7,2,1,1,4,6,7],inf)*Pkr(~r2),\dur,0.25,\amp,0.5,\fb,0.1,\rel,0.3);
~sinfb2 = Pbind(\instrument,\sinfb,\freq,Pseq([5,7,2,1,1,4,6,7,9],inf)*Pkr(~r2),\dur,0.25,\amp,0.5,\fb,0.1,\rel,0.3);
~sinfb3 = Pbind(\instrument,\sinfb,\freq,Pseq([5,7,2,1,1,4,7],inf)*Pkr(~r2)*2,\dur,0.25,\amp,0.5,\fb,0.1,\rel,0.3);
~sinfb4 = Pbind(\instrument,\sinfb,\freq,Pseq([1,1,1,1,5],inf)*Pkr(~r2)*4,\dur,0.25,\amp,0.5,\fb,0.1,\rel,0.3);

~sinfb4.play

~r2 = {XLine.kr(74,100,30)}


~sinfb3.play

~c2.stop

~s.stop

~h.stop
~k.stop

~sn.stop

~c = Pbind(\instrument,\bplay,\buf,d["sfx"][0],\dur,Pwhite(0.5,5).round(0.5),\amp,1);
~cx = Pbind(\instrument,\bplay,\buf,d["sfx"][4],\dur,Pwhite(0.25,1.75).round(0.25),\amp,1);

~cx.play
~k2.stop

~k.play

~sinfb2.play



~oh.stop

~sinfb.play


~dfm1.play

~oh.play

p.clock.tempo = 2.4




~sinfb.stop




~k.stop
~oh.stop



~oh.play


~h.stop

(
~k2.play;
~sinfb.play;
~oh.play;
~t1.play;
~t2.play;
~t3.play;
~t4.play;
~h.play;
)


~c.stop;
~k.play


~sinfb.play

~sin4 = {SinOsc.kr(0.12).range(0.01,1.5)}

~sinfb4.set(\fb,~sin4)

~c.play

~h.play

~t4.play

p.clock.tempo = 2.3


~sn.play

~ring3.play

~ring2.play

~ring1.play

~t3.play

