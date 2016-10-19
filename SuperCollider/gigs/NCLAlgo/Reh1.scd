~one = Pbind(\instrument,\bpfsaw,\atk,Pwhite(2,5),\sus,Pwhite(2,5),\rel,Pwhite(2,5),\amp,Pwhite(0.3,1),\detune,Pexprand(0.1,4),\freq,44100/1024,\lsf,440,\ldb,15)

~onex2.play

~onex = Pbind(\instrument,\bpfsaw,\atk,Pwhite(2,5),\sus,Pwhite(2,5),\rel,Pwhite(2,5),\amp,Pwhite(0.3,1),\detune,Pexprand(0.1,4),\freq,44100/512,\lsf,440,\ldb,15)

~onex2 = Pbind(\instrument,\bpfsaw,\atk,Pwhite(2,5),\sus,Pwhite(2,5),\rel,Pwhite(2,5),\amp,Pwhite(0.3,1),\detune,Pexprand(0.1,4),\freq,44100/256,\lsf,440,\ldb,15)

~onex2.play





(
~k2 = Pbind(\instrument,\bplay,\buf,d["k2"][2],\dur,Pbjorklund2(3,8)/8,\amp,2,\rate,16);
~k3 = Pbind(\instrument,\bplay,\buf,d["k2"][2],\dur,Pbjorklund2(3,8,inf,Pwhite(1,7).asStream)/8,\amp,2,\rate,32);
~k = Pbind(\instrument,\bplay,\buf,d["k"][1],\dur,Pbjorklund2(3,8)/8,\rate,Pseq([1,1.5,1],inf),\amp,5);
)


~k.play



~onex2.stop(30)

~k3.play

(
~k2.play;
~k.play;
~ky.stop;
~ky2.stop;
~sn.stop;
)



~sn.stop


~k.play

~sn = Pbind(\instrument,\bplay,\buf,d["sn"][4],\dur,1,\amp,5,\rate,2)

~sn.play

~k.play


~ftn = Pbind(\instrument,\vplay,\buf,d["ftn"][1],\rel,0.1,\pos,0.1,\dur,Pbjorklund2(Pexprand(1,7).round(1),8)/8,\amp,1,\rate,Prand([1,1,1,1,[1.2,1.4],[1.1,1.3]],inf))

~ftn.fadeTime=3

~ftn.play

p.clock.tempo=0.01


p.clock.tempo = 86/60

(
~rave = Pbind(\instrument,\bplay,\buf,d["stab"][0],\dur,Pbjorklund2(3,8)/8,\amp,1,\rate,Pseq([1,1,1,1,1,1,0.9,1.1].stutter(3),inf));
~rave2 = Pbind(\instrument,\bplay,\buf,d["stab"][0],\dur,Pbjorklund2(3,8)/8,\amp,1,\rate,2);
~rave3 = Pbind(\instrument,\bplay,\buf,d["stab"][0],\dur,Pbjorklund2(3,8,inf,Pwhite(1,7).asStream)/8,\amp,1,\rate,2);
~rave4 = Pbind(\instrument,\bplay,\buf,d["stab"][0],\dur,Pbjorklund2(Pwhite(1,7),8,inf,Pwhite(1,7).asStream)/8,\amp,1,\rate,4);
~rave5 = Pbind(\instrument,\bplay,\buf,d["stab"][0],\dur,Pbjorklund2(Pwhite(1,7),8,inf,Pwhite(1,7).asStream)/8,\amp,1,\rate,8);
)




~sn = Pbind(\instrument,\bplay,\buf,d["h"][0],\rate,0.5,\dur,Pseq([0.5,Pseq([1],inf)],inf)/2,\amp,1)

~k.stop


~sn.play

(
~rave.play;
~k.play;
~k2.play;
~k3.play;
~rave2.play;
~rave3.play;
~rave4.play;
~rave5.play;
)


~rave5.play


~rave3.play

g=1

~rave2.play

~henon6.clear


~onex2.stop(30)


~sn = Pbind(\instrument,\bplay,\buf,d["sn"][5],\dur,Pbjorklund2(5,16,inf,Pwhite(1,7).asStream),\amp,1)

~sn.play

~ky = Pbind(\instrument,\bplay,\buf,d["k"][1],\dur,Pbjorklund2(3,8,inf,Pwhite(1,7).asStream)/8,\amp,1,\rate,Pseq([1.5,2],inf))

~ky2 = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,Pbjorklund2(3,8,inf,Pwhite(1,7).asStream)/8,\amp,6,\rate,Pseq([1.5,2],inf)*2)


~k.stop

~ky2.play

~h = Pbind(\instrument,\bplay,\buf,d["h"][5],\dur,Pbjorklund2(Pwhite(1,15),16,inf)/16,\amp,2,\rate,2)

~h.play


p.clock.tempo=1.2

~kx = Pbind(\instrument,\bplay,\buf,d["k"][1],\dur,Pbjorklund2(3,7)/4,\amp,0.7,\rate,4)

~ky.play

~k.play

~ky.stop

~henon6.stop(30)

~k.stop

~henon = Pbind(\instrument,\henon,\a,Pexprand(1.3,1.30001),\b,Pexprand(0.3,0.300001),\atk,0,\sus,0,\rel,0.04,\freq,44100/512,\amp,2,\pan,Pwhite(-1.0,1),\dur,Prand([0.25,Pseq([0.125],2)],inf))

~henon2 = Pbind(\instrument,\henon,\a,Pexprand(1.3,1.50001),\b,Pexprand(0.3,0.500001),\atk,0,\sus,0,\rel,0.04,\freq,44100/256,\amp,1,\pan,Pwhite(-1.0,1),\dur,Prand([0.25,Pseq([0.125],2)],inf))

~henon3 = Pbind(\instrument,\henon,\a,Pexprand(1.3,1.50001),\b,Pexprand(0.3,0.500001),\atk,0,\sus,0,\rel,0.01,\freq,44100/1024,\amp,3,\pan,Pwhite(-1.0,1),\dur,Prand([0.25,Pseq([0.125],2)],inf))

~henon5 = Pbind(\instrument,\henon,\a,Pexprand(1.2,1.40001),\b,Pexprand(0.2,0.400001),\atk,0,\sus,0,\rel,0.01,\freq,44100/Prand([,512,256,128],inf),\amp,3,\pan,Pwhite(-1.0,1),\dur,Prand([0.25,Pseq([0.125],2)],inf))

~henon6 = Pbind(\instrument,\henon,\a,Pexprand(1.2,1.40001),\b,Pexprand(0.2,0.400001),\atk,0,\sus,0,\rel,0.005,\freq,44100/Prand([512,256,128],inf),\amp,3,\pan,Pwhite(-1.0,1),\dur,Prand([0.25,Pseq([0.125/2],4)],inf))

~henon6.play
~henon5.play

~henon3.play

~henon2.play

~henon.play

~k2.play

