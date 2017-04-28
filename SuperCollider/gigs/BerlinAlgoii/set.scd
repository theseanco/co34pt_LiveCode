(
f = File.new(thisProcess.nowExecutingPath.dirname +/+ "codeExecutedBerlinAlgo23-3-17-gig.txt","w");
this.codeDump = { |str| SystemClock.sched(0.0,{arg time; f.write(time.asString)}); f.write("       ");  f.write(str);  f.putChar($\n); };
~r = {0};
d[\scale] = Scale.chromatic(\et53);
p.fadeTime = 2;
)

//note: DON'T FORGET ABOUT SFX
s.makeWindow

/*

Hallo, Berlin!

coming soon...

just waiting for sound...

please be patient...

here we go.

My name is coï¿¥ï¾¡pt

thx to Alexandra for organising && Urban Spree for hosting/sound/etc.

big s/o to all visualists.

<3

*/


~shep = {var intervals, amps; #intervals, amps = Shepard.kr(5,-0.008); (SinOsc.ar( (intervals + 60).midicps) * amps).sum * 0.05 ! 2}
~shep.play

~t2.play

(
l = Pbjorklund2(Pseq([3,6,12,11,10,8,1,5,3,1],inf),16)/4;
~t1 = Pbind(\instrument,\bplay,\buf,d["t"][0],\dur,l,\amp,1,\pan,Pwhite(-0.5,0.5));
~t2 = Pbind(\instrument,\bplay,\buf,d["t"][0],\dur,l,\amp,1,\pan,Pwhite(-0.5,0.5),\rate,8);
~t3 = Pbind(\instrument,\bplay,\buf,d["t"][0],\dur,l,\amp,1,\pan,Pwhite(-0.5,0.5),\rate,6);
~t4 = Pbind(\instrument,\bplay,\buf,d["t"][0],\dur,l,\amp,1,\pan,Pwhite(-0.5,0.5),\rate,5);
~ring1 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,0,\octave,Pwrand([3,4],[10,1].normalizeSum,inf),\dur,0.5,\d,0.34,\a,Pexprand(1,200),\pan,0,\amp,1);
~ring2 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-2,2),\octave,Pwrand([4,5],[10,1].normalizeSum,inf),\dur,l,\d,0.34,\a,Pexprand(2,200),\pan,0,\amp,1);
~ring3 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(-2,2),\octave,Pwrand([5,6],[10,1].normalizeSum,inf),\dur,l,\d,0.34,\a,Pexprand(2,200),\pan,0,\amp,1);
~sn = Pbind(\instrument,\bplay,\buf,d["s"][0],\dur,l,\amp,4);
~k = Pbind(\instrument,\bplay,\buf,d["k"][2],\dur,Pbjorklund2(3,8)/4,\amp,1,\rate,Pseq([1.3,1.5],inf));
~oh = Pbind(\instrument,\bplay,\buf,d["shout"][0],\dur,Pseq([0.5,Pseq([1],inf)],inf)*2,\amp,4);
~h = Pbind(\instrument,\bplay,\buf,d["ch"][0],\dur,0.25,\amp,Pwhite(0.2,3));
)

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,Pbjorklund2(3,8)/4,\amp,1);


~sn = Pbind(\instrument,\bplay,\buf,d["s"][0],\dur,2,\amp,5);
~k.play

~sn.play



p.clock.tempo = 2.3

~ring1.stop
~sinfbx.stop(10)
~k.stop

~sinfb = Pbind(\instrument,\sinfb,\scale,Scale.minor,\root,Pkr(~r),\octave,6,\degree,Pseq([0,0,4,5],inf),\dur,0.25,\amp,0.3,\fb,Pwhite(1,1.4),\rel,0.1);

~sinfbx = Pbind(\instrument,\sinfb,\scale,Scale.minor,\root,Pkr(~r),\octave,6,\degree,Pseq([0,0,4,5,0,0,4,5,6],inf),\dur,0.25,\amp,0.3,\fb,Pwhite(1,1.4),\rel,0.05);

~sinfbroot = Pbind(\instrument,\sinfb,\scale,Scale.minor,\root,Pkr(~r),\octave,[3,4],\degree,0,\dur,1,\amp,Pwhite(0.1,0.3),\fb,Pwhite(1,1.4),\rel,1);
~h.stop

~h = Pbind(\instrument,\bplay,\buf,d["ch"][0],\dur,Pwrand([0.25,Pseq([0.125],2),Pseq([0.125/2],4)],[10,5,2].normalizeSum,inf),\amp,Pwhite(0.2,1));


~freqfb = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7,8],inf)*Pkr(~r2),\dur,0.25,\amp,0.7,\fb,Pwhite(0.1,0.9),\rel,0.1);
~freqfb2 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7,8].reverse,inf)*Pkr(~r2),\dur,0.25,\amp,0.7,\fb,Pwhite(0.1,0.9),\rel,0.1);

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,1);

~r2 = {SinOsc.kr(0.1).range(9000,12000)}
p.clock.tempo = 1499999

//thx.

//i'm gonna finish now.

~k.play

~cx.play

~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,0.75,\amp,1);
~cx = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,Pbjorklund2(Pseq([3,3,3,4],inf),8)/4,\rate,1.5,\amp,1);

~freqfb2.play


~sinfbroot.stop


~r2 = {70}

~freqfb.play

~sinfb.stop(40)

~shout = Pbind(\instrument,\bplay,\buf,d["shout"][0],\dur,Pseq([0.5,Pseq([1],inf)],inf),\amp,4


)

~shout.stop





p.clock.tempo = 0.2

~shout.play
~sinfbbass.stop(10)
~h.play

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,Pbjorklund2(3,8)/4,\amp,0.3,\rate,Pseq([1.4,1.5],inf));

~.stop
~h.stop
~sn.stop

(
p.clock.tempo = 2.3;
~k.play;
~oh.play;
)

p.clock.tempo = 1.15

~sinfbroot.play

~sinfbx.play


~sn.stop

~sinfb2 = Pbind(\instrument,\sinfb,\scale,Scale.minor,\root,Pkr(~r),\octave,[4,5],\degree,Pseq([0,0,4,5],inf),\dur,Pbjorklund2(3,8)/4,\amp,0.3,\fb,Pwhite(1,1.4),\rel,0.3);

~oh = Pbind(\instrument,\bplay,\buf,d["oh"][1],\dur,Pseq([0.5,Pseq([1],inf)],inf),\amp,2);
~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,2);

~sinfb2.play



~sinfb.play

~sinfb.play


(
~oh.stop
~k.stop
~t4.stop

~ring3.stop
~t1.stop
~c2.stop

~h.stop

~sn.stop

~h.play

~oh.play

(
~t1.stop;
~t2.stop;
~t3.stop;
~t4.stop;
)

p.clock.tempo = 2.1



~sn.stop
~ring3.play

~k.stop

~c.stop

~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,0.75,\amp,1);


~c2 = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,Pbjorklund2(Pseq([3,3,3,4],inf),8)/4,\amp,1,\rate,1.2);

p.clock.tempqo = 2.2

~sn.play

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,1);

~oh = Pbind(\instrument,\bplay,\buf,d["oh"][1],\dur,Pseq([0.5,Pseq([1],inf)],inf),\amp,2);

~t1.play


~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,2);


(
~ring1.play;
~ring2.play;
~ring3.play;
~k.play;
)



~oh.play

~c2.play


~c.play

~shep.clear


p.clock.tempo =1.25

~c.play
~shep.stop(120)


~t4.play


~ring2.play

~ring1.play

~k.play

~sn.play




//this will be dance music soon.

//i promise.