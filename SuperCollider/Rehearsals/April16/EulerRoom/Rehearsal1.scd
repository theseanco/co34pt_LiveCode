~one.play(0,4)


~one = {Warp1.ar(1,d["stairs"][1],SinOsc.ar(Array.fill(4,{rrand(0.001,0.05)})),1,0.2,-1,16,0.01,4,mul:0.1)}

~one.play

~one2 = {Warp1.ar(1,d["stairs"][0],LFTri.ar(Array.fill(4,{rrand(0.01,0.2)})),1,0.2,-1,16,0.01,4,mul:0.5)}

~one2.play

~fund = 50

p.fadeTime=3

~d1 = {DFM1.ar(SinOsc.ar(Array.fill(4,~fund*{rrand(0.99,1.01)}),0,0.1),Array.fill(4,~fund*{rrand(0.99,1.01)})*2,LFNoise1.kr(0.2).range(0.5,2.0),1,0,0.0003,0.1)}

~d2 = {DFM1.ar(SinOsc.ar(Array.fill(4,[~fund*{rrand(0.99,1.01)}].flat*4),0,0.2),Array.fill(4,~fund*{rrand(0.99,1.01)})*8,LFNoise1.kr(0.2).range(0.5,1.3),1,0,0.0003,0.1)}

~dAz = {PanAz.ar(4,DFM1.ar(SinOsc.ar(~fund*4,0,0.1),LFNoise1.kr(0.1).range(~fund,~fund*15).round(~fund),EnvGen.ar(Env.perc(0.01,3),Dust.kr(5),3),mul:0.1),LFNoise1.kr(10),1,1)}

~dAz2 = {PanAz.ar(4,DFM1.ar(SinOsc.ar(~fund*4,0,0.1),LFNoise1.kr(0.4).range(~fund,~fund*15).round(~fund),EnvGen.ar(Env.perc(0.01,3),Dust.kr(5),3),mul:0.1),LFNoise1.kr(10),1,1)}

~latoo = {PanAz.ar(4,LatoocarfianN.ar(~fund*TRand.kr(1,20,Dust.kr),LFNoise1.kr(0.8).range(0.9,1.1),LFNoise1.kr(0.4).range(2,4.0),mul:0.1),LFNoise1.kr(2),1,1)}

~k.play(0,4)


StageLimiter.activate(numChannels:4)

(
~d1.stop(6);
~d2.stop(6);
~dAz.stop(6);
~dAz2.stop(6);
~latoo.stop(6);
)


~one.stop
~one2.stop


p.clock.tempo=1.7

~bigk = Pbind(\instrument,\bplay,\buf,d["k"][4],\dur,Pbjorklund2(3,8,inf,Pwhite(0,7).asStream)/8,\amp,2)

~eeeeee = {PanAz.ar(4,FreeVerb.ar(SinOsc.ar(Line.kr(9,90,120),0,1),LFNoise1.kr(7),1,1))}
~eeeeee.play

~bigdonk = Pbind(\instrument,\bplay,\buf,d["khc"][5],\dur,0.5,\amp,50)
~bigdonk.play


~snare.stop
~h.stop
~hey.stop

p.clock.tempo=0.1



~bigk.play(0,4)

~k = Pbind(\instrument,\bplayAz,\dur,Pbjorklund2(Pwhite(1,7),8,inf,Pwhite(0,8).asStream),\amp,1,\pan,Pwhite(-1.0,1.0),\buf,d["k"][0])

~k2 = Pbind(\instrument,\bplayAz,\dur,Pbjorklund2(Pwhite(1,7),8,inf,Pwhite(0,8).asStream)/8,\rate,Pwhite(1,5),\amp,90,\pan,Pwhite(-1.0,1.0),\buf,d["k"][0])

~k3 = Pbind(\instrument,\bplayAz,\dur,Pbjorklund2(Pwhite(1,7),8,inf,Pwhite(0,8).asStream)/4,\rate,3,\amp,1,\pan,Pwhite(-1.0,1.0),\buf,d["k"][0])

~k4 = Pbind(\instrument,\bplayAz,\dur,Pbjorklund2(Pwhite(1,7),8,inf,Pwhite(0,8).asStream)/8,\rate,6,\amp,1,\pan,Pwhite(-1.0,1.0),\buf,d["k"][0])

~h.play(0,4)

~h =  Pbind(\instrument,\bplay,\dur,Pbjorklund2(Pwhite(1,15),16,inf,Pwhite(0,16).asStream)/8,\amp,1,\pan,Pwhite(-1.0,1.0),\pan2,Pwhite(-1.0,1.0),\buf,d["h"][0])


p.clock.tempo=1.3

~k4.play(0,4)

~k3.clear
~k3.play(0,4)

~snare = Pbind(\instrument,\bplay,\buf,d["sn"][5],\amp,1,\dur,Pseq([0.5,Pseq([1],inf)],inf)/2,\pan,Pwhite(-1,1.0),\pan2,Pwhite(-1,1.0))

~bigk.play

~hey = Pbind(\instrument,\bplay,\buf,d["shout"][1],\amp,1,\dur,Pseq([0.5,Pseq([1],inf)],inf)/2,\pan,Pwhite(-1,1.0),\pan2,Pwhite(-1,1.0))
~hey.play(0,4)


~snare.clear

~snare.play(0,4)

~latoo.play

~fund = {Line.kr(2000,30,5)}

~fund = {Line.kr(500,2000,20)}

~dAz2.play

~d2.play


~fund = {Line.kr(50,400,50)}

(
~one2.clear;
~one.clear;
~fer.clear;
~fer2.clear;
~fer3.clear;
~latoo.play;
)

~fer = {DFM1.ar(SinOsc.ar(Array.fill(4,~fund*{rrand(0.99,1.01)}),0,0.1),[~fund*2]!4,LFNoise1.kr(Array.fill(4,{rrand(0.1,0.4)})).range(0.5,1.5),mul:0.3)}

~fer3.play

~fer2 = {PanAz.ar(4,DFM1.ar(SinOsc.ar(~fund*2,0,0.2),~fund*4,EnvGen.ar(Env.perc(0.01,2),Dust.kr(1),2),mul:0.3),LFTri.ar(0.1),1,1)}

~fer3 = {DFM1.ar(SinOsc.ar([~fund*4]!4,0,0.1),LFNoise1.kr([0.1]!4).range(~fund,~fund*15).round(~fund),LFNoise1.kr([0.1]!4,3).abs,mul:0.4).flat}

~fer3.play(0,4)

~latoo = {PanAz.ar(4,LatoocarfianN.ar(LFNoise1.kr(0.1).range(100,3000).round(100),LFNoise1.kr(0.9).range(0.9,1.1),LFNoise1.kr(0.9).range(2.5,3.5),mul:0.4),LFNoise1.kr(0.1),1,1.4)}

~k2 = Pbind(\instrument,\bplayAz,\dur,Pbjorklund2(Pwhite(1,7,Pwhite(1,7).asStream),8,inf)/2,\amp,1,\buf,d["k2"][1],\pan,Pwhite(-1.0,1.0),\pan2,Pwhite(-1,1))
~k3 = Pbind(\instrument,\bplayAz,\dur,Pbjorklund2(Pwhite(1,7),8,inf,Pwhite(1,7).asStream)/4,\amp,1,\buf,d["k"][4],\pan,Pwhite(-1.0,1.0),\pan2,Pwhite(-1,1),\rate,2)

~k4 = Pbind(\instrument,\bplayAz,\dur,Pbjorklund2(Pwhite(1,7),8,inf,Pwhite(1,7).asStream)/8,\amp,1,\buf,d["k"][4],\pan,Pwhite(-1.0,1.0),\pan2,Pwhite(-1,1),\rate,4)

~sn = Pbind(\instrument,\bplay,\buf,d["sn"][5],\amp,1,\dur,2,\dur,Pwrand([2,Pseq([1/3!2,(1+1/3)].flat)],[0.8,0.2],inf))

~sn.play(0,4)

~h = Pbind(\instrument,\bplayAz,\dur,Pbjorklund2(Pwhite(1,15),16,inf,Pwhite(1,15).asStream)/8,\pan,Pwhite(-1.0,1.0),\amp,1,\buf,d["h"][4])

~hx = Pbind(\instrument,\bplayAz,\dur,Pbjorklund2(Pwhite(1,15),16,inf,Pwhite(1,15).asStream)/8,\pan,Pwhite(-1.0,1.0),\amp,1,\buf,d["h"][1],\rate,2)

~hx.play(0,4)


	~h.play(0,4)



p.clock.tempo=1.1

~k4.play

~k4.play(0,4)

~k2.clear

~latoo.play

~fer.play

~k.stop

~fer3.play

~one.stop
~one2.stop


~fer3.play


~fer2.play

~fer.play


~k.play(0,4)


~k = Pbind(\instrument,\bplayAz,\buf,d["k"][5],\dur,Pbjorklund2(Pwhite(3,8),8,inf,Pwhite(1,8).asStream),\rate,1,\amp,1,\pan,Pwhite(-1,1.0))



