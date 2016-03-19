~fund = 50

~one = {Pan2.ar(DFM1.ar(SinOsc.ar(~fund,0,0.1),~fund,EnvGen.ar(Env.perc(0.01,0.8),Impulse.kr(~tempo.kr/4),1.3,0,1),1,0,0,0.4))}

p.fadeTime=4

~two = {DFM1.ar(SinOsc.ar([~fund,~fund*1.01],0,0.1),[~fund,~fund*1.01]*2,EnvGen.ar(Env.perc(0.01,0.8),Impulse.kr(~tempo.kr),2),1,0,0,0.4)}

~three = {Pan2.ar(Blip.ar(~fund/TRand.kr(2,16,Dust.kr(0.1)).round(4),20,0.2),SinOsc.kr(0.1))}


~threex = {Pan2.ar(Blip.ar(~fund/TRand.kr(2,16,Dust.kr(0.1)).round(4),20,0.2),SinOsc.kr(0.1))}


~four = Pbind(\instrument,\multiwave,\atk,3,\sus,3,\rel,1,\dur,Pwhite(1,3),\amp,Pwhite(0.01,0.7),\freq,Pwhite(1,5)*Pkr(~fund),\which,Pwhite(1,5))

~five = {DFM1.ar(SinOsc.ar([~fund,~fund*1.01]*4,0,0.1),[~fund,~fund*1.01]*4,LFNoise1.kr(0.1).range(0.8,1.9),1,0,0,0.1)}

~six = {SinOscFB.ar(LFNoise1.kr(0.1).range(~fund,~fund*10).round(~fund),SinOsc.kr(0.1).abs,0.03)!2}

~seven = {DFM1.ar(SawDPW.ar([~fund,~fund*1.02]*4,0,0.1),[~fund,~fund*1.02]*TRand.kr(1,8,Impulse.kr(~tempo.kr)),EnvGen.ar(Env.perc(0.4,0.4),Dust.kr(1),1.3,0,1),1,0,0.01,0.3)}


~h = Pbind(\instrument,\bplay,\buf,d["h"][0],\dur,Pbjorklund2(Pwhite(1,7),8)/10,\amp,0.5)

~sn = Pbind(\instrument,\bplay,\buf,d["sn"][4],\dur,Pbjorklund2(Pwhite(1,15),16)/5,\amp,0.8)

~sn.play

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,Pbjorklund2(3,8)/10,\amp,1)

~seq = Pbind(\instrument,\sinfb,\dur,0.2,\atk,0.01,\rel,0.1,\freq,Pseq((1..10),inf)*Pkr(~fund),\amp,0.4)




~seq2 = Pbind(\instrument,\sinfb,\dur,0.2,\atk,0.01,\rel,0.1,\freq,Pseq((1..10).reverse,inf)*Pkr(~fund),\amp,0.4)

~seq3 = Pbind(\instrument,\sinfb,\dur,Pseq([0.05!20,1].flat,inf),\atk,0.01,\rel,0.1,\freq,Pseq((1..20).reverse,inf)*Pkr(~fund),\amp,0.5)

~stabs = Pbind(\instrument,\bplay,\buf,d["edmstab"][0],\rate,Pseq([1,1,0.9,1.1].stutter(3),inf),\dur,Pbjorklund2(3,8)/10,\amp,1)



~erol = Pbind(\instrument,\sinfb,\dur,0.1,\freq,Pseq((1..20),inf)*(Pkr(~fund)*8),\amp,0.7,\rel,0.1)

~erol2 = Pbind(\instrument,\sinfb,\dur,0.1,\freq,Pseq((1..20),inf)*(Pkr(~fund)*4),\amp,0.7,\rel,0.1)

~erol2.play

~erol2.set(\fb,~erolsine2)

~erolsine = {SinOsc.kr(0.1).range(0.1,1.5)}

~erolsine2 = {SinOsc.kr(0.1).range(0.1,1.5)}

~erolsine = {SinOsc.kr(0.1).range(0.1,1.5)}~seq3.play

~stabs.play

~seq2.play

~k.play

(
~one.stop(2);
~two.stop(4);
~three.stop(6);
~four.stop(8);
~five.stop(16);
)

~h.play

~six.play

~seven.play

~five.play

~four.play

~threex.play

~fund.fadeTime=10

~stabs.play;

~fund = {XLine.kr(50,900,20).poll(1)}
p.clock.tempo=100



~fund.value

~three




~two.play

~one.play