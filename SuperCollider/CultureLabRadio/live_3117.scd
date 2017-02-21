/*

Hello everyone. I've jst got a bunch of new samples, and i'm going to be testing them out today.

I think Culture Lab Radio is broken, so there's probably no sound on there.

sample guide:

bb = bass bombs
k = kicks
sk = sub kicks
uk = unusual kicks
c = claps
s = snares
ls = long snares
ch = closed hats
oh = open hats
crash = crash cymbal
cfx = crash fx
chime = crash fx chimes
t = toms hi/mid/lo
cb = cowbell
rs = rimshots
n = noise/hiss
donk = something banging to put on things
sw = swells
clang = clangs



*/





//thx




p.clock.tempo = 0.6

~clng = Pbind(\instrument,\xplay,\buf,d["clang"][0],\dur,Pbjorklund2(Pwhite(1,10),16)/16,\amp,0.4,\rate,Pwrand([4,0.5,0.25,0.125],[0.7,0.1,0.1,0.1],inf))

~cow = Pbind(\instrument,\bplay,\buf,d["cb"][0],\dur,Pbjorklund2(3,8)/8,\amp,0.9,\rate,Pseq([1,0.85,0.85],inf))

~cow2 = Pbind(\instrument,\vplay,\buf,d["cb"][0],\dur,Pbjorklund2(5,8)/16,\amp,0.8,\rate,Pseq([1,0.85,0.85],inf)*Prand([1,0.5,0.25,0.3333,0.666666],inf,\rel,1)

~verb = {FreeVerb.ar(~cow2,1,0.9,0.1,3)}

~verbx = {FreeVerb.ar(~verb,1,0.9,0.1,1)}

~verbxx = {FreeVerb.ar(~verbx,1,0.9,0.1,0.2)}

~verbxxx = {FreeVerb.ar(~verbxx,1,0.9,0.1,1)}

~verbxxx.play

~verbxx.play
~verbx.play

~cow3 = Pbind(\instrument,\vplay,\buf,d["cb"][0],\dur,Pbjorklund2(Pwhite(1,6),8)/16,\amp,0.8,\rate,Pseq([1,0.85,0.85],inf)*Prand([1,0.5,0.25,0.3333,0.666666]*4,inf),\rel,0.1)

~cow3.stop

~cow3.play

~clp = Pbind(\instrument,\bplay,\buf,d["c"][1],\dur,Pseq([0.5,Pseq([1],inf)],inf)/2,\amp,6,\rate,0.9)

~clp.play


~cow2.play

(
~dfm1.stop
~clng.stop;
~one.stop;
~onex.play;
~onex2.play;
~two.stop;
~sn.stop;
)

~cow.play

~clng.play

~one = Pbind(\instrument,\xplay,\buf,d["k"][0],\amp,2,\dur,Pbjorklund2(3,8)/8)

~one.play


~onex3.stop

~one3 = Pbind(\instrument,\xplay,\buf,d["n"][0],\amp,1,\dur,0.75)

~one3.play

~onex.play

~onex = Pbind(\instrument,\xplay,\buf,d["sk"][0],\amp,22,\dur,Pbjorklund2(3,8)/16,\rate,Pseq([1,1.3],inf));

~onex2 = Pbind(\instrument,\xplay,\buf,d["sk"][0],\amp,22,\dur,Pbjorklund2(3,8)/16,\rate,Pseq([1,1.3],inf))

~onex2.play

d["sk"][2].play

~two = Pbind(\instrument,\xplay,\buf,d["ch"][0],\dur,Pwrand([0.125,Pseq([0.125]/2,2)],[0.8,0.2],inf),\amp,Pexprand(0.06,1))

~two.play

~three = Pbind(\instrument,\xplay,\buf,Prand(d["ch"],inf),\amp,Pwhite(0.2,0.5),\dur,Pbjorklund2(Pwhite(1,5),8)/8,\rate,1)

~three.play

~rtok = Pbind(\instrument,\bplay,\buf,Prand(d["rs"],inf),\dur,Pbjorklund2(Pwhite(1,6),8)/16,\amp,Pwhite(0.8,1.2),\rate,Prand([0.4,0.8],inf))

~rtok.play

~sn = Pbind(\instrument,\xplay,\buf,d["ls"][0],\dur,Pseq([0.5,Pseq([1],inf)],inf),\amp,1)

~cfx = Pbind(\instrument,\xplay,\buf,d["cfx"][0],\dur,Pwhite(1,10),\amp,0.1,\rate,0.1)

~cfx.play

~cfx.stop

~sn.stop
~rtok.stop

~four.stop

ProxyMixer.new(p)

d["rs"][0].numChannels

~sn.play



~four = Pbind(\instrument,\xplay,\buf,d["sw"][0],\rate,0.5,\dur,Pwhite(1,10),\amp,1)

~dfm1 = {DFM1.ar(SinOsc.ar(100,0,0.9),[100+LFNoise1.kr(0.1),100+LFNoise1.kr(0.1)],SinOsc.kr(0.1).range(0.01,1.2),noiselevel:LFNoise1.kr(0.1).range(0.01,0.0003),mul:1)}

~dfm1.play

~dfm = {DFM1.ar(Mix.ar([~sins.ar,~sins2.ar,~cow.ar]),SinOsc.kr(0.08).range(1000,100),SinOsc.kr(0.1).range(0.1,1.5),mul:0.5)}

~dfm.play

~sins = Pbind(\instrument,\sinfb,\scale,Scale.minor,\octave,Pwrand([3,4,6],[0.4,0.4,0.2],inf),\atk,Pwhite(5,10),\rel,Pwhite(5,10.0),\fb,Pwhite(0,2.0),\degree,Place([0,0,[2,4,5],[6,5,4,4],[7,1,2],[10,12,14,16]],inf),\dur,Pbjorklund2(Pwhite(1,5),8)/4,\amp,Pwhite(0.2,0.6),\rel,0.1)

~sins2 = Pbind(\instrument,\sinfb,\scale,Scale.minor,\dur,Pbjorklund2(Pwhite(1,10),16)/16,\degree,Pseq((0..14),inf),\octave,4,\amp,Pwhite(0.4,1.9),\atk,0.01,\rel,0.2,\fb,Pwhite(0.8,2))

~sins2.stop(40)

~sins2.play

~dfm1.play

~four.play