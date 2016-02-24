
~f = {TRand.kr(30,90,Impulse.kr(8)).round(10)}

~one = {DFM1.ar(SinOsc.ar(~f),freq:90,res:EnvGen.ar(Env.perc(0.5,3),Impulse.kr(~tempo.kr*TRand.kr(1,5,Impulse.kr(0.4))),levelScale:5),inputgain:1,type:0,noiselevel:0.0003,mul:0.1).dup}



~one.clear

~one.play

StageLimiter.activate
