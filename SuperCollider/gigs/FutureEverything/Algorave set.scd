/*

Hi everyone

I'm sean, aka coï¿¥ï¾¡pt.

i'll be doing some live coding for you

Enjoy yourselves :)

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




*/


~one = Pbind(\instrument,\bplay,\buf,d["stab"][0],\dur,Pbjorklund2(3,8)/2,\amp,1,\rate,Pseq([1,1,1,1,1,1,0.9,1.1].stutter(4),inf)/2);

(
~onex = Pbind(\instrument,\bplay,\buf,d["stab"][0],\dur,Pbjorklund2(3,8)/2,\amp,1,\rate,Pseq([1,1,1,1,1,1,0.9,1.1].stutter(3),inf));
~onex2 = Pbind(\instrument,\bplay,\buf,d["stab"][0],\dur,Pbjorklund2(3,8)/4,\amp,1,\rate,Pseq([1,1,1,1,1,1,0.9,1.1].stutter(3),inf)*2);
~onex3 = Pbind(\instrument,\bplay,\buf,d["stab"][0],\dur,Pbjorklund2(Pwhite(1,7),8)/4,\amp,1,\rate,Pseq([1,1,1,1,1,1,0.9,1.1].stutter(3),inf)*Pwrand([4,8],[4,1].normalizeSum,inf));
)

~onex3.play

p.clock.tempo=160/60

~two = Pbind(\instrument,\bplay,\buf,d["h"][4],\dur,Pbjorklund2(Pwhite(1,5),8,inf,Pwhite(1,7).asStream)/4,\amp,Pwhite(0.7,1))
~twox = Pbind(\instrument,\bplay,\buf,d["h"][4],\dur,Pbjorklund2(Pwhite(1,5),8,inf,Pwhite(1,7).asStream)/4,\amp,Pwhite(0.7,1),\rate,1.1)
~two.play

~h2 = Pbind(\instrument,\bplay,\buf,d["h"][8],\dur,Pbjorklund2(Pwhite(1,15),16)/4,\rate,Pwrand([3,2,1],[3,2,1].normalizeSum,inf),\amp,1)

~k = Pbind(\instrument,\bplay,\buf,d["k2"][2],\dur,1,\amp,2)

~k.play

~perc = Pbind(\instrument,\vplay,\rel,0.1,\pos,0.5,\dur,Pexprand(0.25,1).round(0.25),\amp,1,\buf,Prand(d["p1 "],inf))

~sn = Pbind(\instrument,\bplay,\buf,d["sn"][4],\dur,Pbjorklund2(3,8,inf,Pwhite(1,7).asStream)/2,\amp,2)

~sn.play


~clap = Pbind(\instrument,\bplay,\buf,d["cp"][2],\dur,2,\amp,2)

~jesuschrist = Pbind(\instrument,\bplay,\buf,d["ftn"][0],\amp,2,\dur,16)

~ftn = Pbind(\instrument,\vplay,\buf,d["ftn"][1],\rel,0.05,\pos,0.4,\dur,Pbjorklund2(Pwhite(4,7),8)/4,\amp,2,\rate,Pexprand(0.4,2).round(1).stutter(10))

~ftn2 = Pbind(\instrument,\vplay,\buf,d["ftn"][1],\rel,(Pseq([0.5,0.25,1],inf).stutter(5))/4,\pos,0.4,\dur,Pbjorklund2(Pwhite(4,7),8)/4,\amp,2,\rate,Pseq([0.5,0.25,1],inf).stutter(5))

~ftn2.play

~fenton = Pbind(\instrument,\bplay,\buf,d["ftn"][1],\amp,2,\dur,Pwhite(8,20))

~fenton.play

~ftn.play

~jesuschrist.play

~clap.play

~perc.play

~k.play

~h2.play

~k3 = Pbind(\instrument,\bplay,\buf,d["k"][2],\amp,2,\dur,Pbjorklund2(Pwhite(1,4),8)/4,\rate,Pwhite(2,5))

~k3.play

~k2 = Pbind(\instrument,\bplay,\buf,d["k"][5],\amp,1,\dur,Pbjorklund2(3,8)/4,\rate,Pseq([1.5,2,1.5],inf)*Pkr(~multer))

~bassw = {Warp1.ar(2,d["stab"][0],SinOsc.kr(0.1),interp:1,mul:0.2)}

~multer = 3;


~multer.fadeTime=20

(
~h2.stop;
~perc.stop;
~shout.stop
~onex3.stop;
~onex.stop;
~onex2.stop;
)

~shout = Pbind(\instrument,\bplay,\buf,d["shout"][1],\dur,Pseq([1,Pseq([2],inf)],inf),\amp,1)


~shout.play



~bassw.play

~sn = Pbind(\instrument,\bplay,\buf,d["sn"][5],\amp,0.7,\dur,Pbjorklund2(Pwhite(5,15),16)/2)

~sn.stop



~sn.play


~k.play


~two.play

p.clock.tempo=140/60

~one.play