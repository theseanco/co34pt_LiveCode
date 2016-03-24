//hi everyone

//my name is Sean

//i'm going to be doing some live coding for you today.

~one = Pbind(\instrument,\bpfsaw,\amp,1,\scale,Scale.minor,\root,-3,\octave,3,\amp,Pwhite(1.8,3.2),\detune,Pexprand(0.0001,0.3),\degree,[0,2,4])

~one.play

~two = Pbind(\instrument,\sinfb,\dur,0.5,\scale,Scale.minor,\root,-3,\octave,4,\rel,0.1,\degree,Pseq((0..7),inf),\fb,Pwhite(0.1,2),\amp,0.5)
~two2 = Pbind(\instrument,\sinfb,\dur,0.5,\scale,Scale.minor,\root,-3,\octave,5,\rel,0.1,\degree,Pseq((0..7),inf),\fb,Pwhite(0.1,2),\amp,0.5)

(
~two.stop(30);
~two2.stop(30);
~one.stop(30);
)
~stab.play

~two2.play

~sn.stop

~k.play

~sn.play



~stab = Pbind(\instrument,\bplay,\buf,d["edmstab"][0],\rate,Pseq([1,1,1,1,1,1,0.9,1.1].stutter(3),inf),\dur,Pbjorklund2(3,8)/4,\amp,1.5)


~stab2 = Pbind(\instrument,\bplay,\buf,d["edmstab"][0],\rate,Pseq([1,1,1,1,1,1,0.9,1.1].stutter(3),inf)*4,\dur,Pbjorklund2(Pwhite(1,15),16)/4,\amp,3)

(
~k.play;
~h.play;
~stab.stop;
)

~stab2.play

~stab.play

~one.clear

~sn.stop

~hey = Pbind(\instrument,\bplay,\buf,d["shout"][1],\dur,Pseq([1,Pseq([2],inf)],inf),\amp,1)

~hey.play

~k.stop

(
~tek = Pbind(\instrument,\vplay,\buf,d["illegalparties"][0],\pos,0.68,\rate,1.2,\rel,0.3,\dur,1,\amp,0.7);
~tek.play;
~fwb.stop;
)

~sn.play

~tek.play

~hey.stop



~stab.stop

~fwb = Pbind(\instrument,\bplay,\buf,d["fwb"][0],\dur,16,\amp,0.8)

~fwb2 = Pbind(\instrument,\bplay,\buf,d["fwm"][4],\dur,32,\amp,0.8)



~fwb2.clear

~fwb2.play

~tek.stop

p.clock.tempo=160/60


~fwb.play


~h.stop

~sn.stop

~stab2.stop

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\amp,1,\dur,Pbjorklund2(3,8,inf,Pwhite(1,6).asStream)/4,\rate,Pseq([2,2.5,2],inf)/2)

p.clock.tempo=420*81629489328932orplf/60

~k2.play

(
~gab.stop(10);
~gab2.stop;
~gab3.stop;
~gab4.stop;
)
~sn.play
~hey.play

~k.stop

~gab = Pbind(\instrument,\bplay,\buf,d["khc"][0],\dur,1,\amp,1.5,\rate,Pseq([1,1,1,1,1,1,0.9,0.8].stutter(4),inf))

~gab.play


~gab2 = Pbind(\instrument,\bplay,\buf,d["khc"][4],\dur,Pwhite(0.25,1).round(0.25),\rate,Place([4,4,4,[5,6,7,4],[6,5,4,5],[6,5,4,4,4]],inf),\amp,1)

~gab3 = Pbind(\instrument,\bplay,\buf,d["khc"][4],\dur,Pwhite(0.25,1).round(0.25),\rate,Place([4,4,4,[5,6,7,4],[6,5,4,5],[6,5,4,4,4]],inf)*2,\amp,1)
~gab4 = Pbind(\instrument,\bplay,\buf,d["khc"][4],\dur,Pwhite(0.25,1).round(0.25),\rate,Place([4,4,4,[5,6,7,4],[6,5,4,5],[6,5,4,4,4]],inf)*4,\amp,1)



~k3 = Pbind(\instrument,\bplay,\buf,d["k2"][3],\amp,0.3,\dur,1,\rate,Pwhite(1,4))


~sn.stop

~h.stop

~tek.stop

~k3.play

~h.play

~gab2.play

~gab3.play

~fwb2.stop

~k.stop
~hey.play

~k.play

~hey.stop

~one.stop(40)

~sn = Pbind(\instrument,\bplay,\buf,d["sn"][4],\amp,1,\dur,2)

~sn.play


~bass = Pbind(\instrument,\sinfb,\dur,Pbjorklund2(3,8)/2,\fb,Pwhite(0.1,0.7),\scale,Scale.minor,\degree,Pwrand([0,4,5],[3,2,1].normalizeSum,inf),\octave,3)

~h = Pbind(\instrument,\bplay,\buf,d["h"][0],\amp,1,\dur,Pbjorklund2(Pwhite(1,15),16)/4,\rate,1)

~h.play

~k.stop

~bass.stop

p.clock.tempo=150/60

~h.play

~bass.play


~k.play

~two.play

s.makeWindow

~one.play







