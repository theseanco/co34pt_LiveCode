/*

Hi everyone

I'm sean, aka coï¿¥ï¾¡pt.

i'll be doing some live coding for you

Please enjoy yourselves :)


i'll be a minute or so
  .----.-----.-----.-----.
 /      \     \     \     \
|  \/    |     |   __L_____L__
|   |    |     |  (           \
|    \___/    /    \______/    |
|        \___/\___/\___/       |
 \      \     /               /
  |                        __/
   \_                   __/
    |        |         |
    |                  |
    |                  |



ftn, stab
*/

~one = Pbind(\instrument,\bplay,\buf,d["k"][5],\dur,0.5,\amp,0.7,\rate,1)

~one.play

~shout = Pbind(\instrument,\bplay,\buf,d["shout"][1],\dur,Pseq([1,Pseq([2],inf)],inf)/2,\amp,0.6)




~shout.play

~one.play

p.clock.tempo=80/60

~one.stop;
~sn.stop;
~h.stop
~cp.stop
~shout.stop;

~scale.stop
~scalex.stop
~scalexr.stop

(
~bpf.stop;
~bpf2.stop;
~bpfx.sto

~ftn = Pbind(\instrument,\vplay,\buf,d["ftn"][1],\rel,0.1,\amp,2,\dur,Pbjorklund2(Pwhite(1,7),8)/4,\pos,0.1,\rate,Pexprand(0.5,3).round(1))

~jesuschrist = Pbind(\instrument,\bplay,\buf,d["ftn"][0],\amp,2,\dur,Pwhite(8,16))

~shout.stop

~k2.stop

~h.stop

~sn.stop
~cp.stop

~one.stop

~h = Pbind(\instrument,\bplay,\buf,d["h"][5],\dur,Pseq([0.5,Pseq([1],inf)],inf)/2,\amp,1,\rate,Pwhite(1,1.2))

~sn.play

~cp.play

~h.play

~jesuschrist.stop
(

~scale = Pbind(\instrument,\sinfb,\dur,Pwrand([0.25,Pseq([0.125],2)],[0.8,0.2],inf),\rel,0.1,\fb,0,\degree,Pseq((0..7),inf),\amp,0.3,\scale,Scale.minor);

~scalex = Pbind(\instrument,\sinfb,\dur,Pwrand([0.25,Pseq([0.125],2)],[0.8,0.2],inf),\rel,0.1,\fb,0,\degree,Pseq((0..7).reverse,inf),\amp,0.3,\scale,Scale.minor);

~scalexr = Pbind(\instrument,\sinfb,\dur,Pwrand([0.25,Pseq([0.125],2)],[0.8,0.2],inf),\rel,0.1,\fb,0,\degree,Pseq((0..7).scramble,inf),\amp,0.3,\octave,6,\scale,Scale.minor);
)

~scalexr.play


~bpf = Pbind(\instrument,\bpfsaw,\dur,1,\degree,0,\octave,3,\amp,Pwhite(1,3.0),\ldb,16,\detune,Pexprand(0.001,1.4))

~bpf2 = Pbind(\instrument,\bpfsaw,\dur,1,\degree,0,\octave,4,\amp,Pwhite(1,3.0),\ldb,16,\detune,Pexprand(0.001,1.4))

~bpfx = Pbind(\instrument,\bpfsaw,\dur,1,\degree,0,\octave,2,\amp,Pwhite(1,3.0),\ldb,16,\lsf,200,\detune,Pexprand(0.001,1.4))


~ftn.stop
~bpfx.play

~bpf.play

d["ftn"][2].play
~jesuschrist.play

~k2.stop
~stab.stop

~stab2.stop
~stab3.stop

~stab4.stop

~stab5.stop

d["ftn"][1].play

~k2.play

~sn.play

~sn.stop


~h.play

~stab.stop

~ftn.play

	~k2.play

p.clock.tempo=150/60





(
~one.play;
~sn.play;
~stab.play;
~stab2.play;
)

~k2.play


~h = Pbind(\instrument,\bplay,\buf,d["h"][4],\dur,Pbjorklund2(Pwhite(1,7),8)/8,\amp,1,\rate,Pexprand(1,3).round(1))

	~sn = Pbind(\instrument,\bplay,\buf,d["sn"][4],\dur,Pbjorklund2(5,8),\amp,1.4)

~one.stop


~k2 = Pbind(\instrument,\bplay,\buf,d["k"][5],\dur,Pbjorklund2(3,8)/4,\rate,Pseq([1.5,2,1.5],inf)*2,\amp,1)

//ARE YOU READY?

~k2.play

~k2.stop

~one.play


~cp.stop


~cp.play

~cp = Pbind(\instrument,\bplay,\buf,d["cp"][4],\dur,1,\amp,1)

(
~stab = Pbind(\instrument,\bplay,\buf,d["stab"][0],\dur,Pbjorklund2(3,8),\rate,Pseq([1,1,1,1,1,1,0.9,1.1].stutter(3),inf),\amp,1);

~stab2 = Pbind(\instrument,\bplay,\buf,d["stab"][0],\dur,Pbjorklund2(3,8)/2,\rate,Pseq([1,1,1,1,1,1,0.9,1.1].stutter(3),inf)*2,\amp,1);

~stab3 = Pbind(\instrument,\bplay,\buf,d["stab"][0],\dur,Pbjorklund2(3,8)/4,\rate,Pseq([1,1,1,1,1,1,0.9,1.1].stutter(3),inf)*4,\amp,1);
)

~stab4 = Pbind(\instrument,\bplay,\buf,d["stab"][0],\dur,Pbjorklund2(Pwhite(1,7),8)/4,\rate,Pseq([1,1,1,1,1,1,0.9,1.1].stutter(4),inf)*8,\amp,1)

~stab5 = Pbind(\instrument,\bplay,\buf,d["stab"][0],\dur,Pbjorklund2(Pwhite(1,7),8)/4,\rate,Pseq([1,1,1,1,1,1,0.9,1.1].stutter(4),inf)*16,\amp,2)

~stab5.play

~stab3.play


~

~cp.play

~sn.play

~h.play

~one.play












s.makeWindow





