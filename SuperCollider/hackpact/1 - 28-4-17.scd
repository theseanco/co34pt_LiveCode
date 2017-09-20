p = ProxySpace.push(s)
s.scope
//TODO: Record this with freqscope
(
~r2 = {80};
~mastermod = {Slew.ar(HenonN.ar(XLine.kr(1,120,600).round(1),LFNoise2.kr(0.1,0.2,1.2),LFNoise2.kr(1,0.15,0.15)),XLine.kr(1,1000,400).round(1),XLine.kr(1,10000,400).round(1))};
~sin = {SinOscFB.ar([(~mastermod*440).round(80)]!2*[1,1.01],0,XLine.kr(0.000001,0.3,10))};
~sin2 = {SinOscFB.ar([(~mastermod*440).round(40)]!2*[1,1.01],0,XLine.kr(0.000001,0.3,20))};
~sin3 = {SinOscFB.ar([(~mastermod*440).round(160)]!2*[1.01,1],0,XLine.kr(0.000001,0.3,40))};
~sin4 = {SinOscFB.ar([(~mastermod*880).round(160)]!2*[1.01,1],0,XLine.kr(0.000001,0.1,80))};
~sin5 = {SinOscFB.ar([(~mastermod*1760).round(320)]!2*[1.01,1.04],0,XLine.kr(0.000001,0.05,200))};
~sin1.play;~sin2.play;~sin3.play;~sin4.play;~sin5.play;
)


//here's your start
//run these both a few times
~sinfb = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7],inf,Pwhite(0,4).asStream)*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.5,\rel,0.3,\pan,Pwhite(-0.4,0.4));
~sinfb2 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7].reverse,inf,Pwhite(0,4).asStream)*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.5,\rel,0.3,\pan,Pwhite(-0.4,0.4));

~sin1 = {arg min = 0.2, max = 1; SinOsc.kr(LFNoise1.kr(0.1).range(0.07,0.12)).range(min,max)};
~sinfb.set(\fb,~sin1);


~sin2 = {arg min = 0.2, max = 1; SinOsc.kr(LFNoise1.kr(0.1).range(0.07,0.12)).range(min,max)};
~sinfb2.set(\fb,~sin2);
