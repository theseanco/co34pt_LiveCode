~one = {Splay.ar(PulseDPW.ar([TRand.kr(1,10,Dust.kr(0.3))],0.1,1))}

~fund = 50

~two = {DFM1.ar(SinOsc.ar([~fund*LFNoise1.kr(0.1).range(1,5).round(0.5),~fund*LFNoise1.kr(0.1).range(1,5).round(0.5)]),[~fund*LFNoise1.kr(0.1).range(1,5).round(0.5),~fund*LFNoise1.kr(0.1).range(1,5).round(0.5)],LFNoise1.kr(0.1).range(0.5,2.0),1,0,0.04,0.1)}

~three = {var env = EnvGen.ar(Env.perc(0.1,0.6),Dust.kr(2));Pan2.ar(LatoocarfianN.ar(env*90050,LFNoise1.kr.range(0.8,1.2),LFNoise1.kr.range(2.0,4.0),LFNoise1.kr.abs,LFNoise1.kr.abs,0.5,0.5,env*0.3),LFNoise1.kr(4))}

~three.play

~three.clear



~three.play

~convolver = {Convolution.ar(~beat.ar,~two.ar)}

~convolver.play

~two.stop

~beat = Pbind(\instrument,\bplay,\buf,d["shout"][1],\dur,Pwhite(1,4.0),\amp,0.4,\rate,Pwhite(0.2,3.0))

~two.play

~one.play

p.fadeTime=4

~one.play

s.scope