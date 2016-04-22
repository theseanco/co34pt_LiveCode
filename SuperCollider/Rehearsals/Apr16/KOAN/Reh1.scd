/*

Sean Cotterill

For KOAN

Thanks to Martin

Sounds:

brec - field recording

mhit - metal hits
[0] - metal bar hit

mgest - metal  gestures
[0] - Metal bar multihit

bhit - bass hit

bowl - bowl hit

*/


~one = {Warp1.ar(2,d["mgest"][0],SinOsc.kr(LFNoise1.kr(0.1).range(0.01,0.3)),1,0.3,windowRandRatio:0.01,interp:4,mul:0.4)}

~one.play

~fund = {SinOsc.kr(0.04).range(49,51)}

~f = ~fund

p.fadeTime=3


~two = {DFM1.ar(SinOsc.ar([~fund,~fund*1.02],0,0.1),[~fund*1.02,~fund],LFNoise1.kr(0.1).range(0.8,1.2),mul:0.2)}
~two.play

~six = {DFM1.ar(SinOsc.ar([~fund,~fund*1.02]*2,0,0.1),[~fund*1.02,~fund],LFNoise1.kr(0.1).range(1,4.9),mul:0.2)}

~six.play

~three = {DFM1.ar(SinOsc.ar([~fund*2,~fund*2.02],0,0.1),[~fund*2.02,~fund*2],LFNoise1.kr(0.1).range(0.8,1.2),mul:0.2)}

~four = {Pan2.ar(DFM1.ar(SinOsc.ar(~fund*4,0,0.1),LFNoise1.kr(0.7).range(~f,~f*20),EnvGen.ar(Env.perc,Dust.kr(1),1.8),mul:0.2),LFNoise1.kr(5))}

~five = {Pan2.ar(DFM1.ar(SinOsc.ar(~fund*4,0,0.1),LFNoise1.kr(0.7).range(~f,~f*20),EnvGen.ar(Env.perc,Dust.kr(1),1.2),mul:0.2),LFNoise1.kr(5))}


~basshit = Pbind(\instrument,\bplay,\buf,d["bhit"][0],\amp,1,\dur,Pwhite(4,30))
~basshit2 = Pbind(\instrument,\bplay,\buf,d["bhit"][1],\amp,1,\dur,Pwhite(4,30))

~latoo = {Pan2.ar(LatoocarfianN.ar(22050,LFNoise1.kr(0.9).range(0.1,1.2),LFNoise1.kr(0.9).range(2,4),LFNoise1.kr(0.9).range(0.1,0.9),mul:LFNoise1.kr(0.1).range(0,0.2)),LFNoise1.kr(3))}

~one.clear

~latoo.play

~basshit2.play

~mhit = Pbind(\instrument,\bplay,\buf,d["mhit"][0],\dur,Pbjorklund2(Pwhite(1,15),16,inf,Pwhite(1,10).asStream)*Pwrand([1,2,4],[30,10,5].normalizeSum,inf),\pan,Pwhite(-1,1),\amp,Pwhite(0.4,0.8),\rate,Pwrand([0.8,1,1.2],[0.3,0.4,0.3],inf))

~mhitx = Pbind(\instrument,\bplay,\buf,d["mhit"][1],\dur,Pbjorklund2(Pwhite(1,15),16,inf,Pwhite(1,10).asStream)*Pwrand([1,2,4],[9,10,5].normalizeSum,inf),\pan,Pwhite(-1,1),\amp,Pwhite(0.4,0.8),\rate,Pwrand([0.8,1,1.2],[0.3,0.4,0.3],inf))

~mhit1 = Pbind(\instrument,\bplaym,\buf,d["mhit"][2],\dur,Pbjorklund2(Pwhite(1,15),16,inf,Pwhite(1,10).asStream)*Pwrand([1,2,4],[20,10,0].normalizeSum,inf),\pan,Pwhite(-1,1),\amp,Pwhite(0.4,0.8),\rate,Pwrand([0.8,1,1.2],[0.3,0.4,0.3],inf))

~mhit2 = Pbind(\instrument,\bplaym,\buf,d["mhit"][2],\dur,Pbjorklund2(Pwhite(1,15),16,inf,Pwhite(1,10).asStream)*Pwrand([1,2,4],[10,3,1].normalizeSum,inf),\pan,Pwhite(-1,1),\amp,Pwhite(0.4,0.8),\rate,Pwrand([0.8,1,1.2],[0.3,0.4,0.3],inf))

~mhit3 = Pbind(\instrument,\bplay,\buf,d["mhit"][3],\dur,Pbjorklund2(Pwhite(1,15),16,inf,Pwhite(1,10).asStream)*Pwrand([1,2,4],[10,2,5].normalizeSum,inf),\pan,Pwhite(-1,1),\amp,Pwhite(0.4,0.8),\rate,Pwrand([0.8,1,1.2],[0.3,0.4,0.3],inf))



~mhit4 = Pbind(\instrument,\bplay,\buf,d["mhit"][4],\dur,Pbjorklund2(Pwhite(1,15),16,inf,Pwhite(1,10).asStream)*Pwrand([1,2,4],[10,2,5].normalizeSum,inf),\pan,Pwhite(-1,1),\amp,Pwhite(0.4,0.8),\rate,Pwrand([0.8,1,1.2],[0.3,0.4,0.3],inf))



~mhit5 = Pbind(\instrument,\bplay,\buf,d["mhit"][5],\dur,Pbjorklund2(Pwhite(1,15),16,inf,Pwhite(1,10).asStream)*Pwrand([1,2,4],[10,2,5].normalizeSum,inf),\pan,Pwhite(-1,1),\amp,Pwhite(0.4,0.8),\rate,Pwrand([0.8,1,1.2],[0.3,0.4,0.3],inf))

(
~bowl = Pbind(\instrument,\bplay,\buf,d["bowl"][0],\dur,4,\amp,1);
~bowl2 = Pbind(\instrument,\bplay,\buf,d["bowl"][1],\dur,4.25,\amp,1);
~bowl.play;
~bowl2.play;
)

~henon = Pbind(\instrument,\henon,\a,Pexprand(1.3,1.30001),\b,Pexprand(0.3,0.300001),\atk,0,\sus,0,\rel,0.04,\freq,44100,\amp,10,\pan,Pwhite(-1.0,1),\dur,0.25)

~henon2 = Pbind(\instrument,\henon,\a,Pexprand(1.3,1.30001),\b,Pexprand(0.3,0.300001),\atk,0,\sus,0,\rel,0.04,\freq,44100/2,\pan,Pwhite(-1.0,1),\amp,0.4,\dur,Pwrand([0.25,Pseq([0.125],2)],[0.8,0.2],inf))


~henon3 = Pbind(\instrument,\henon,\a,Pexprand(1.3,1.4),\b,Pexprand(0.3,0.5),\atk,0,\sus,0,\rel,0.1,\freq,44100/4,\amp,0.9,\pan,Pwhite(-1.0,1),\dur,Pwrand([0.25,Pseq([0.125],2)],[0.8,0.2],inf))

~henon4 = Pbind(\instrument,\henon,\a,Pexprand(1.2,1.4),\b,Pexprand(0.2,0.5),\atk,0,\sus,0,\rel,0.1,\freq,44100/8,\amp,0.9,\pan,Pwhite(-1.0,1),\dur,Pbjorklund2(Pwhite(1,15),16,inf)/2)




~henon4.play

~henon3.play

~henon2.play

~k = Pbind(\instrument,\bplay,\buf,d["k"][4],\dur,Pbjorklund2(3,8,inf,Pwhite(1,5).asStream)/4,\amp,10)
~k2 = Pbind(\instrument,\bplay,\buf,d["k"][4],\dur,Pbjorklund2(3,8,inf,Pwhite(1,5).asStream)/8,\amp,4,\rate,2)


~k2.play

~h = Pbind(\instrument,\bplay,\buf,d["h"][0],\dur,Pbjorklund2(Pwhite(1,16),16,inf,Pwhite(1,5).asStream)/4,\amp,2)

~sn = Pbind(\instrument,\bplay,\buf,d["sn"][5],\dur,2,\amp,1)

~sn.play


~bpf = Pbind(\instrument,\bpfsaw,\freq,(44100/512),\ldb,12,\lsf,400,\detune,Pexprand(0.000001,0.5),\amp,Pwhite(0.4,4))

~bpf2 = Pbind(\instrument,\bpfsaw,\freq,(44100/1024),\ldb,12,\lsf,400,\detune,Pexprand(0.000001,0.5),\amp,Pwhite(0.4,4))

~bpf2.play


p.clock.tempo=0.000000000001

~h2 = Pbind(\instrument,\bplay,\buf,d["mhit"][0],\dur,Pbjorklund2(Pwhite(1,16),16,inf,Pwhite(1,5).asStream)/8,\amp,8,\rate,Prand([2,4,6,8,10],inf))
~h3 = Pbind(\instrument,\bplaym,\buf,d["mhit"][2],\dur,Pbjorklund2(Pwhite(1,16),16,inf,Pwhite(1,5).asStream)/8,\pan,Pwhite(-1,1.0),\amp,8,\rate,Prand([2,4,6,8,10],inf))


~h2.play

~h3.play

~h.play
~k.play

~henon.play

p.clock.tempo=1.17

~six.clear

(
~one.stop(10);
~two.stop(15);
~three.stop(20);
~four.stop(25);
~five.stop(30);
~six.stop(35);

)


~mhit5.play

d["mhit"].size

~mhit3.play

~one.fadeTime=20





~mhit1.play
~mhit2.play
~mhitx.play
~mhit.play

~five.play

~two.play












