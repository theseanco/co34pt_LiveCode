~one = Pbind(\instrument,\bplaym,\pan,Pwhite(-1,1),\pan2,Pwhite(-1,1),\amp,1,\dur,Pbjorklund2(Pwhite(1,8),8,inf,Pwhite(0,8).asStream)/8,\rate,Pwrand([1,2],[0.8,0.2],inf)*Prand([0.8,0.9,1],inf).stutter(10))

~one.play(0,4)

~two = Pbind(\instrument,\bplay,\buf,d["k"][1],\pan,Pwhite(-1,1),\pan2,Pwhite(-1,1),\amp,1,\dur,Pbjorklund2(Pwhite(1,8),8,inf,Pwhite(0,8).asStream)/4)

p.clock.tempo=1.1

~two2 = Pbind(\instrument,\bplay,\buf,d["k"][1],\rate,Pwrand([4,6,16],[16,8,4].normalizeSum,inf),\pan,Pwhite(-1,1),\pan2,Pwhite(-1,1),\amp,0.8,\dur,Pbjorklund2(Pwhite(1,8),8,inf,Pwhite(0,8).asStream)/8)

~two2.play(0,4)

~kk.play(0,4)

~kk = Pbind(\instrment,\bplay,\buf,d["k"][0],\amp,5)



~two2.clear


StageLimiter.activate(numChannels:4)

~two.clear

~three = Pbind(\instrument,\bplay,\buf,d["sn"][4],\dur,Pbjorklund2(Pwhite(1,7).stutter(6),8,inf,Pwhite(1,8).asStream)/8,\amp,1,\pan,Pwhite(-1.0,1),\pan2,Pwhite(-1.0,1),\rate,Pwrand([3,6,9,12],[12,9,6,3].normalizeSum,inf))

~three.clear

~three.play(0,4)

~fund = 60;

~four.play(0,4)

~four = {DFM1.ar(SinOsc.ar([~fund*2]!4,0,0.1),Array.fill(4,~fund*{rrand(0.99,1.01)}),LFNoise1.kr(0.1).range(0.5,2.0),mul:LFNoise1.kr([0.2]!4).abs)*1.2}

~five = {DFM1.ar(SinOsc.ar([~fund*2]!4,0,0.1),Array.fill(4,(~fund*8)*{rrand(0.99,1.01)}),LFNoise1.kr(0.1).range(0.5,2.0),mul:LFNoise1.kr(Array.fill(4,{rrand(0.1,0.5)})).abs)*1.4}

~six = Pbind(\instrument,\bpfsaw,\pan,Pwhite(-1,1),\pan2,Pwhite(-1,1),\freq,Pwrand([2,4,6,8],[8,6,4,2].normalizeSum,inf)*Pkr(~fund),\ldb,12,\amp,1)

~seven = Pbind(\instrument,\vplay,\pos,Pwhite(0,0.99),\rel,0.1,\buf,Prand(d["p1"],inf),\pan,Pwhite(-1,1),\pan2,Pwhite(-1,1),\dur,Pbjorklund2(Pwhite(1,15),16,inf,Pwhite(0,16).asStream)/8,\amp,9)

p.clock.tempo=1.3

~two2.play(0,4)

~seven.clear

~seven.play(0,4)

~three.play
~four.stop
~one.play
~two.play
~five.stop

~six.play

~five.play

StageLimiter.activate(numChannels:4)

~four.play

~six.play(0,4)


	[rrand(0.99,1.01)]
~two.clear
~two.play

~one = {SinOsc.ar([440,441,442,443],0,0.1)}

Synth(\sinfb,[\pan,rrand(-1.0,1.0)])

~one = {PanAz.ar(4,SinOsc.ar(440),0.0)}


~one = {SinOsc.ar([100,100,100,100],0,0.001)}
~two = {SinOsc.ar([100,100,100,100],0,0.001)}
~three = {SinOsc.ar([100,100,100,100],0,0.001)}

~three.play
~one.play

~two.clear
	Array.fill(4,50*{rrand(0.9,1.1)})
~two.play