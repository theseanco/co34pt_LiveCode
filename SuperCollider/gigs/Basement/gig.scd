~fund = {80}

s.makeWindow

~one = Pbind(\instrument,\sinfb,\dur,1,\amp,Pwhite(0.1,0.5),\freq,Pwhite(1,7)*Pkr(~fund),\atk,3,\rel,4)

~one.stop(40)

(
~two.play;
~bass.play;
~shout.play;
~snare.play;
~k.play

)


//slower?

//faster?

//slower?

//faster

//ok lol

p.clock.tempo

~k2 = Pbind(\instrument,\bplay,\buf,d["k2"][0],\rate,1.01,\amp,1,\dur,1)

~k3 = Pbind(\instrument,\bplay,\buf,d["k2"][4],\rate,Pwhite(5,27.0),\dur,Pwhite(0.25,1).round(0.25),\amp,1)
~k2.stop

~snare.stop

~h.stop



~stab2.play



~stab.play

~k3.play

~clap = Pbind(\instrument,\bplay,\buf,d["cp"][4],\dur,Pbjorklund2(5,8)/2,\amp,1)

~k3.stop
~stab.stop
~stab2.stop

//i dont' know where to go from here....



~clap.play

~k2.play

~one.stop
~two.stop
~bass.stop

(
~stab.stop
~stab2.stop
)

p.clock.tempo=2.1


~shout.stop


~k = Pbind(\instrument,\bplay,\buf,d["k"][4],\amp,1,\dur,1,\rate,Pseq([1.5,2],inf)*1.2)

~k.play

~henon = Pbind(\instrument,\henon,\dur,0.25,\amp,4,\a,Pexprand(1.3,2.8),\b,Pexprand(0.3,1.4),\rel,0.3,\atk,0,\sus,0,\freq,Pseq((1..10).scramble,inf)*160)

~gab.stop

p.clock.tempo=4000000000000

//i have the perfect treat for you

//it'll take a couple secs, talk amongst yourselves.

~gab = Pbind(\instrument,\bplay,\buf,d["khc"][1],\dur,1,\amp,0.8,\rate,Pseq([1,1,1,1,1,1,0.9,0.8].stutter(4),inf))

~gab2 = Pbind(\instrument,\bplay,\buf,d["khc"][4],\dur,Pwhite(0.25,1).round(0.25),\rate,Place([4,4,[5,4,6,4],[4,4,5,5],[6,5,4,7]],inf),\amp,0.9)

~gab3 = Pbind(\instrument,\bplay,\buf,d["khc"][4],\dur,Pwhite(0.25,1).round(0.25),\rate,Place([4,4,[5,4,6,4],[4,4,5,5],[6,5,4,7]],inf)*2,\amp,0.9)

~clap = Pbind(\instrument,\bplay,\buf,d["sn"][4],\dur,2,\amp,2)
~clap2 = Pbind(\instrument,\bplay,\buf,d["sn"][4],\dur,2,\amp,2)

~clap2.play

~k2.play

~techno.stop

~gab2.stop;
~gab3.stop

~clap.play

~gab3.play

~k2 = Pbind(\instrument,\bplay,\buf,d["k2"][3],\amp,1)

~gab.play

//lost the beat...

~gab2.play

//there it is
//y'all ready?

~techno.play

~techno.stop

//a bit premature actually. how embarrasing.

p.clock.tempo = 2.56

~k.stop


~techno.stop

~henon.play

(
~k.stop;
~techno.stop;
)

~two = Pbind(\instrument,\sinfb,\dur,0.25,\amp,Pwhite(0.5,0.8),\rel,0.1,\freq,Pseq((1..10),inf)*Pkr(~fund))

~h = Pbind(\instrument,\bplay,\buf,d["h"][7],\dur,Pbjorklund2(Pwhite(1,15),16)2,\amp,Pexprand(0.8,1),\rate,5)

~clap.stop

//thank god for that.#

//i'd forgotten the name of it....

//so couldn't stop it...

//oops.



~h.play

~techno = Pbind(\instrument,\bplay,\buf,d["illegalparties"][0],\pos,0.68,\rel,0.35,\amp,Pwhite(0.4,1),\rate,1.2,\dur,1)

~techno.play


~techno.play

~shout.play

~techno.play

~k.play

~h.play

~h.stop

~k.stop

~snare.stop

~stab = Pbind(\instrument,\bplay,\buf,d["edmstab"][0],\dur,Pbjorklund2(3,8)/4,\amp,1,\rate,Pseq([1,1,0.9,1.1].stutter(3),inf))

~stab2 = Pbind(\instrument,\bplay,\buf,d["edmstab"][0],\dur,Pbjorklund2(Pwhite(1,15),16)/4,\amp,1,\rate,Pseq([1,1,0.9,1.1].stutter(3),inf)*2)

~stab2.play

~stab.play

p.clock.tempo=2.45

//that'll do.

~k2.stop

~h.stop
~bass.stop

~sn.stop

~k.stop

~bass = Pbind(\instrument,\sinfb,\dur,Pwhite(0.25,1).round(0.25),\amp,1,\freq,Pwhite(1,7)*(Pkr(~fund)/2),\fb,Pwhite(0.5,1.4),\rel,0.1)

~shout.stop

~shout = Pbind(\instrument,\bplay,\buf,d["shout"][1],\amp,0.6,\dur,Pseq([1,Pseq([2],inf)],inf))

~snare = Pbind(\instrument,\bplay,\buf,d["sn"][1],\amp,1,\dur,Pseq([0.5,Pseq([1],inf)],inf))

~



~snare.play

//it's getting there lol.

p.clock.tempo=1.7

~shout.play

~bass.play

~h.play

//lol.

	//this will eventually be dance music. 2 secs.

~two.play

~k.play

~one.play
