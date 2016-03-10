(
Task({
	20.do({
		arg i;
		rrand(1,20).do{Synth(\bpfsaw,[\freq,exprand(50,300).round(50),\amp,rrand(0.1,0.4),\detune,exprand(0.0000001,0.6),\ldb,10,\lsf,200,\atk,rrand(5,10),\sus,rrand(10,30),\rel,rrand(5,10)])};
		i.postln;
		rrand(5,20).wait;
	});
}).start;
)

~fund = 50

~l1 = Pbind(\instrument,\sinfb,\atk,Pwhite(0.01,2),\freq,Pwhite(1,10)*Pkr(~fund),\amp,0.1,\rel,2)

~bass = Pbind(\instrument,\sinfb,\dur,Pwhite(0.25,1).round(0.25),\freq,Pwhite(1,8)*(Pkr(~fund))/2,\amp,1,\rel,0.1,\fb,Pwhite(0.1,2.0))

~l2 = Pbind(\instrument,\sinfb,\rel,0.5,\dur,Pwhite(0.25,1).round(0.25),\freq,Pwhite(2,8)*(Pkr(~fund))*2,\fb,Pexprand(0.001,2.5))


p.clock.tempo=160/60

~one = Pbind(\instrument,\bplay,\buf,d["khc"][0],\amp,1)

~one.play

~two = Pbind(\instrument,\sinfb,\dur,Pexprand(0.25,1).round(0.25),\scale,Scale.minor,\degree,Pwhite(0,7),\rel,0.1,\amp,0.8,\octave,6,\fb,1.9)

~two.play

~henon = Pbind(\instrument,\henon,\atk,0.01,\sus,0,\rel,0.1,\dur,0.25,\a,Pwhite(1.1,2.3),\b,Pwhite(0.1,0.4),\amp,0.8,\freq,Pkr(~fund)*11)

~henon.play

~bpf = Pbind(\instrument,\bpfsaw,\freq,Pwhite(1,10)*Pkr(~fund),\amp,Pwhite(0.1,0.5),\atk,1,\sus,1,\rel,1,\ldb,10,\detune,Pexprand(0.0001,1.3),\dur,0.25)


~dfm1.stop(4)

~fund.fadeTime=0.1

~up = Pbind(\instrument,\sinfb,\freq,Pseq((1..12),inf)*(Pkr(~fund))*2,\dur,0.25,\rel,0.05,\amp,0.5,\fb,1.2)

~down = Pbind(\instrument,\sinfb,\freq,Pseq((1..12).reverse,inf)*(Pkr(~fund))*2,\dur,0.25,\rel,0.02,\amp,0.5,\fb,Pwhite(0.8,1.5))

~around = Pbind(\instrument,\sinfb,\freq,Prand((1..12).reverse,inf)*(Pkr(~fund))*2,\dur,0.25,\rel,0.01,\amp,0.5,\fb,Pwhite(0.7,1.5))

~around.stop(10)

p.clock.tempo=5/60

~l1.stop
~l2.stop(4)

~henon.stop

~illegal = Pbind(\instrument,\bplay,\buf,d["illegalparties"][0],\dur,8,\amp,1)

~khc.play

~illegal.play

~bass.stop(40)

~illegal = Pbind(\instrument,\vplay,\buf,d["illegalparties"][0],\pos,0.68,\rel,0.35,\dur,1,\amp,0.8,\rate,1)


~illegal.stop

~khc.stop
~khc.play

(
p.clock.tempo=180/60;
~khc = Pbind(\instrument,\bplay,\buf,d["khc"][0],\amp,1,\rate,Pseq([2,1,2,3,1,2],inf).stutter(4),\dur,Prand([1,Pseq([0.25,0.5,0.25],1)],inf));
)

d["illegalparties"][0].play
p.clock.tempo=9000/60

~k.stop

~khcxc = Pbind(\instrument,\bplay,\buf,d["khc"][0],\dur,1,\amp,2,\rate,1)

~khcxc.play


~khc2 = Pbind(\instrument,\bplay,\buf,d["khc"][2],\rate,Place([4,4,[5,4,6],[6,5,5,5],[5,4,4,4]],inf),\dur,Pwhite(0.25,1).round(0.25),\amp,0.9)


~khc3 = Pbind(\instrument,\bplay,\buf,d["khc"][2],\rate,Place([4,4,[5,4,6],[6,5,5,5],[5,4,4,4]],inf)*2,\dur,Pwhite(0.25,1).round(0.25),\amp,0.9)

~khc3.play

~around.play


~up.play

~sht.stop

~snare.stop

~k.play
~k2.stop
~hat.stop

(
~elk = Task({
	inf.do({
		~fund = [50,50,50,60].choose;
		rrand(5,20).wait;
	});
});
)

~elk.clear



p.clock.tempo=132/60


~dfm1 = {DFM1.ar(SinOsc.ar([~fund,~fund*1.01]*2,0,0.1),[~fund,~fund*1.01]*2,EnvGen.ar(Env.perc(0.01,1),Impulse.kr(~tempo.kr)/2,4),1,0,0.004,0.3)}

~dfm1.play

~bpf.play

p.fadeTime=3

~l2.play

~k.play

~k = Pbind(\instrument,\bplay,\buf,d["k"][1],\dur,1,\amp,4)
~k2 = Pbind(\instrument,\bplay,\buf,d["k2"][0],\dur,Pwhite(4,8),\amp,0.6)

(
~k.play;
~k2.play;
~hat.play;
)

~hat = Pbind(\instrument,\bplay,\buf,d["h"][4],\amp,Pexprand(0.8,2.7),\dur,Pwrand([0.25,Pseq([0.125],2)],[0.7,0.3],inf))

~snare = Pbind(\instrument,\bplay,\buf,d["sn"][3],\dur,2,\amp,1)

~snare.play

~hat.stop(10)

~hat.play

~sht = Pbind(\instrument,\bplay,\buf,d["shout"][1],\dur,0.25,\amp,Pseq([0.6,0.1,0.1,0.1],inf)*4,\rate,Pwhite(1,5))

~sht.play

~clp = Pbind(\instrument,\bplay,\buf,d["cp"][2],\dur,3,\amp,0.6)

~clp.play

~sht.stop(10)

~clp.stop

~bass.play

~sinmod = {SinOsc.kr(0.1).range(0.01,1.2)}

~l1.set(\fb,~sinmod)

~l1.play

