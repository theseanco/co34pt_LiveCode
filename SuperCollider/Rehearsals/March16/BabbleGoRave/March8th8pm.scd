~one = Pbind(\instrument,\sinfb,\dur,0.25,\freq,Pwrand([1,2,3],[0.8,0.1,0.1],inf)*Pkr(~fund),\octave,3,\amp,0.3,\atk,0.01,\rel,0.2)

~one2 = Pbind(\instrument,\sinfb,\dur,1,\freq,Pwhite(1,10)*Pkr(~fund)*2,\octave,4,\atk,0.4,\sus,2,\atk,2,\fb,Pexprand(0.0001,0.6),\amp,0.1)

~bass = Pbind(\instrument,\sinfb,\dur,Pwhite(0.25,0.75).round(0.25),\rel,0.3,\freq,Pexprand(1,8).round(1)*Pkr(~fund),\amp,0.8,\fb,Pwhite(0.8,1.2))

~rumbs = Pbind(\instrument,\bpfsaw,\freq,Pexprand(1,7).round(1)*Pkr(~fund),\detune,Pexprand(0.0001,1),\atk,1,\sus,1,\rel,1,\dur,0.25,\ldb,10,\lsf,400,\amp,Pwhite(0.4,1))

~sins = Pbind(\instrument,\sinfb,\dur,0.25,\freq,Pseq((1..10),inf,Pwhite(0,4).asStream)*(Pkr(~fund))*2,\amp,0.8, \fb,0,\rel,0.01)

~sins2 = Pbind(\instrument,\sinfb,\dur,0.25,\freq,Pseq((1..10).reverse,inf,Pwhite(0,4).asStream)*(Pkr(~fund))*2,\amp,0.8, \fb,0,\rel,0.01)

(
~one.stop(20);
~one2.stop(30);
~bass.stop(60);
~rumbs.stop(70);
)


~sins.stop
~sins2.stop


p.clock.tempo=160/60


~khc = Pbind(\instrument,\bplay,\buf,d["khc"][1],\amp,2,\dur,Pwrand([1,Pseq([0.25,0.5,0.25],1),Pseq([0.25],4)],[0.6,0.3,0.1],inf),\rate,Pseq([1,1,1,1,1,1,0.9,0.8].stutter(4),inf))

~khc.play

~snare = Pbind(\instrument,\bplay,\buf,d["sn"][0],\amp,2,\dur,2)

~hats = Pbind(\instrument,\bplay,\buf,d["h"][4],\amp,2,\rate,0.6,\dur,Pseq([0.5,Pseq([1],inf)],inf))

~hats.play

~snare.play

~khc.play

~khc2 = Pbind(\instrument,\bplay,\buf,d["khc"][4],\amp,0.7,\dur,Pwhite(1,4)/4,\rate,Place([4,4,[5,4,3],[4,4,3,6],[5,5,5,4]]*3,inf))

~khc3 = Pbind(\instrument,\bplay,\buf,d["khc"][4],\amp,0.7,\dur,Pwhite(1,4)/4,\rate,Place([4,4,[5,4,3],[4,4,3,6],[5,5,5,4]]*1.5,inf))

p.clock.tempo=170/60

~khc3.play

~k.stop

~illegal = Pbind(\instrument,\vplay,\buf,d["illegalparties"][0],\rel,0.3,\pos,0.68,\dur,Pwhite(0.5,1.5).round(0.5),\amp,6,\rate,1.1)

~illegal2.stop

~illegal2 = Pbind(\instrument,\vplay,\buf,d["illegalparties"][0],\rel,0.1,\pos,0.7,\dur,Pwhite(0.5,1.5).round(0.5),\amp,6,\rate,1.3)

~illegal2.play

s.makeWindow

p.clock.tempo=170/60


~illegal = Pbind(\instrument,\bplay,\buf,d["illegalparties"][0],\dur,32,\amp,2)

~illegal.play


~illegal.play

~k2.stop


~perc.stop
~hats.stop

~sins2.play

~rumbs.play

~bass.play

~one.play

~fund.fadeTime=0.1

(
~elk = Task({
	inf.do({
		~fund = [50,50,50,50,50,70,60,60].choose;
		rrand(5,10).wait;
	});
});
)

~

~bass.play

~dfm = {DFM1.ar(SinOsc.ar(50,0,0.1),[~fund,~fund*1.01]*1,EnvGen.ar(Env.perc,Impulse.kr(~tempo.kr),5),1,0,0.004,0.4)}

~dfm2 = {DFM1.ar(SinOsc.ar(50,0,0.1),[50,50*1.01]*9,LFNoise1.kr(0.1).range(0.4,3.0),1,0,0.004,0.4)}

~dfm.play

~dfm.play
~dfm2.stop

1.2*60

p.clock.tempo=160/60


~clp.stop


~clp.play


~k2 = Pbind(\instrument,\bplay,\buf,d["k2"][2],\dur,Pwhite(4,8),\amp,1)

~k = Pbind(\instrument,\bplay,\buf,d["k2"][2],\dur,1,\amp,1)

~k.play

~sn = Pbind(\instrument,\bplay,\buf,d["sn"][2],\dur,Pwrand([2,Pseq([1/3!3,1].flat,1)],[0.7,0.3],inf)/4,\amp,0.6)

~clp = Pbind(\instrument,\bplay,\buf,d["cp"][2],\dur,2,\amp,1)

~perc = Pbind(\instrument,\bplay,\buf,d["sn"][2],\dur,2,\amp,1)

~perc.play


~clp.play

~hats = Pbind(\instrument,\bplay,\buf,d["h"][4],\dur,Pwrand([0.25,Pseq(0.125!4)],[0.9,0.1],inf),\pan,Pwhite(-1.0,1.0),\amp,Pexprand(0.1,1))

	0.125!4

~hats.play

~sn.stop

~hats.play
~k.play
~k2.play

~sht.play


~sht = Pbind(\instrument,\bplay,\buf,d["shout"][1],\dur,Pseq([1,Pseq([2],inf)],inf),\amp,1,\rate,1)

~sht.play

[1/6!6]

~sht.play

~sn.play

~k.play

~onesin = {SinOsc.kr(0.1).range(0,2)}

~one.set(\fb,~onesin)

~one2.play



s.scope

~one.play


Tuning.directory;
Scale.directory

t = Tuning.just
y = Scale.minor