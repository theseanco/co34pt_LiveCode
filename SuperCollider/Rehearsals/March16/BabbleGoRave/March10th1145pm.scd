(
~el = Task({
	inf.do({
		~fund = [60,60,60,60,65,65,70].choose;
		rrand(1,10).wait;
	})
});
)

~fund.fadeTime=0

(
Task({
	20.do({ arg i;
		rrand(5,20).do{Synth(\bpfsaw,[\atk,rrand(10,20),\sus,rrand(10,20),\rel,rrand(10,20),\freq,exprand(1,10).round(1)*60,\lsf,300,\ldb,10])};
		rrand(5,20).wait;
		i.postln;
	});
}).start;
)

~w1 = Pbind(\instrument,\sinfb,\dur,Pwhite(1,4)/2,\atk,Pwhite(1,3),\rel,Pwhite(1,3),\amp,Pwhite(0.1,0.3),\freq,Pwhite(1,10)*Pkr(~fund)*2)

~w2 = Pbind(\instrument,\sinfb,\dur,Pwhite(1,4),\atk,Pwhite(1,3),\rel,Pwhite(1,3),\amp,Pwhite(0.05,0.4),\freq,Pwhite(1,10)*(Pkr(~fund))*2)

~bass = Pbind(\instrument,\sinfb,\dur,Pwhite(1,4)/4,\rel,0.1,\freq,Pwhite(2,10)*(Pkr(~fund))/2,\amp,Pwhite(0.3,1.4),\fb,Pexprand(0.0001,1))

~bpfsaw = Pbind(\instrument,\bpfsaw,\dur,0.25,\freq,Pwhite(1,10)*(Pkr(~fund))/2,\amp,Pwhite(0.3,1),\lsf,400,\ldb,10,\atk,Pwhite(1,3),\rel,Pwhite(0.4,2))

~bass.stop

~run = Pbind(\instrument,\sinfb,\dur,0.25,\rel,0.01,\freq,Pseq((1..10),inf)*(Pkr(~fund))*2,\fb,0.1,\amp,0.4)

~run2 = Pbind(\instrument,\sinfb,\dur,0.25,\rel,0.01,\freq,Pseq((1..11).reverse,inf)*(Pkr(~fund))*2,\fb,0.1,\amp,0.4)

~run3 = Pbind(\instrument,\sinfb,\dur,0.25,\rel,0.01,\freq,Prand((1..6).scramble,inf)*(Pkr(~fund))*4,\fb,0.1,\amp,0.4)

(
~run.stop
~run2.stop
~run3.stop


~gab = Pbind(\instrument,\bplay,\buf,d["khc"][1],\dur,Pwhite(0.5,1.5).round(0.5),\amp,2,\rate,Pseq([1,1,1,1,1,1,0.9,0.8].stutter(4),inf)*Pwhite(1,2))

~illegalparties.stop

~shout.play

~gab.play

~gab2 = Pbind(\instrument,\bplay,\buf,d["khc"][4],\dur,Pwhite(1,4)/4,\rate,Place([4,4,[5,4,6],[5,6,4,3],[6,7,6,7],[6,5,4,5,6]],inf),\amp,1)

~gab3 = Pbind(\instrument,\bplay,\buf,d["khc"][4],\dur,Pwhite(1,4)/4,\rate,Place([4,4,[5,4,6],[5,6,4,3],[6,7,6,7],[6,5,4,5,6]],inf)*2,\amp,1)

~gab3.play

~dfm1.stop

~kick2.stop

~run3.play

~bpfsaw.stop

~run2.play

~bpfsaw.play

~dfm1 = {arg intensity = 3; DFM1.ar(SinOsc.ar([~fund,~fund*1.01],0,0.1),[~fund,~fund*1.01]*1,EnvGen.ar(Env.perc(0.01,0.3),Impulse.kr(~tempo.kr),intensity),1,0,0.003,0.3)}

~dfm1.play



~illegalparties = Pbind(\instrument,\bplay,\buf,d["illegalparties"][0],\dur,34,\amp,0.6)

~illegalparties = Pbind(\instrument,\vplay,\buf,d["illegalparties"][0],\dur,Pwrand([1,Pseq([0.25,1,0.25,0.5],1)],[0.7,0.3],inf),\pos,0.67,\rate,1.1,\rel,0.3,\amp,3)

~shout.stop

~snare.play


~illegalparties.play

(
~gab.play;
~gab2.play;
)


(
~kick.stop;
~hats.stop;
~shout.stop;
)

(
~kick.play;
~shout.play;
~snare.stop;
~hats.play;
)

(
~w1.stop(20);
~w2.stop(20);
)



~kick = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,5,\rate,4)

~kick.play

~kick2 = Pbind(\instrument,\bplay,\buf,d["k2"][0],\dur,Pseq([0.25,1.75],inf),\amp,2)

~kick2.play

~snare = Pbind(\instrument,\bplay,\buf,d["sn"][0],\dur,2,\amp,2)



~snare.play

~hats = Pbind(\instrument,\bplay,\buf,d["h"][3],\dur,Pwrand([0.25,Pseq([0.125],2)],[0.7,0.3],inf)/4,\amp,Pexprand(0.5,2.2),\rate,Pexprand(1,1.6))

~hats.play

~shout = Pbind(\instrument,\bplay,\buf,d["shout"][1],\dur,Pseq([1,Pseq([2],inf)],inf)/2,\amp,1)

~shout.play

p.clock.tempo=420*8/60

~hats.play

~snare.play

~kick.play

~bass.play

~w2.play

p.fadeTime=4

~w1.play
~w1.set(\fb,~sinfb)



~sinfb = {SinOsc.ar(0.1).range(0.1,1.3)}