//hi everyone

//My name is Sean

//I will be live coding for you today

//have fun pls

//this will eventually be dance music. bear with me.

~one = {Warp1.ar(1,d["stairs"][1],SinOsc.ar(Array.fill(4,{rrand(0.001,0.05)})),1,0.2,-1,16,0.01,4,mul:0.2)}

~one.play

~one2 = {Warp1.ar(1,d["stairs"][0],LFTri.ar(Array.fill(4,{rrand(0.01,0.2)})),1,0.2,-1,16,0.01,4,mul:0.3)}

~one2.play


~fund = {Line.kr(700,9000,120)}

~fund = {SinOsc.kr(0.1).range(49,51)}

~d1 = {DFM1.ar(SinOsc.ar(Array.fill(4,~fund*{rrand(0.98,1.02)}),0,0.1),~fund*2,LFNoise1.kr(0.1).range(0.5,1.4),mul:0.4)}

~d2 = {DFM1.ar(SinOsc.ar(Array.fill(4,~fund*{rrand(0.98,1.02)})*2,0,0.1),~fund*4,LFNoise1.kr(0.1).range(0.5,1.4),mul:0.4)}

~d3 = {PanAz.ar(4,DFM1.ar(SinOsc.ar(~fund*4,0,0.1),~fund*8,EnvGen.ar(Env.perc(0.01,1),Dust.kr(0.6),1.5),mul:0.4),LFTri.kr(0.1),1,1)}

~latoo = {PanAz.ar(4,LatoocarfianN.ar(LFNoise1.kr(0.1).range(~fund,~fund*15).round(~fund),LFNoise1.kr(0.1).range(0.9,1.1),LFNoise1.kr(0.3).range(2.8,3.2),mul:0.2)*EnvGen.ar(Env.perc,Dust.kr(1)),LFNoise1.kr(1),1,1)}

(
~d1.stop(6);
~d2.stop(6);
~d3.stop(6);
~latoo.stop(6);
)

//this will eventually be dance music. bear with me.Nearly there, promise.

p.clock.te


~k.play(0,4)

~k = Pbind(\instrument,\bplayAz,\buf,d["k"][0],\dur,Pbjorklund2(3,8,inf,Pwhite(0,8).asStream),\amp,1,\pan,Pwhite(-1.0,1.0))

~k2 = Pbind(\instrument,\bplayAz,\buf,d["k"][0],\dur,Pbjorklund2(Pwhite(1,7),8,inf,Pwhite(0,8).asStream)/4,\amp,1,\pan,Pwhite(-1.0,1.0),\rate,2)

~k3 = Pbind(\instrument,\bplayAz,\buf,d["k"][0],\dur,Pbjorklund2(Pwhite(1,7),8,inf,Pwhite(0,8).asStream)/8,\amp,1,\pan,Pwhite(-1.0,1.0),\rate,4)

~k4 = Pbind(\instrument,\bplayAz,\buf,d["k"][0],\dur,Pbjorklund2(Pwhite(1,7),8,inf,Pwhite(0,8).asStream)/8,\amp,1,\pan,Pwhite(-1.0,1.0),\rate,16)

~h2 = Pbind(\instrument,\bplay,\buf,d["h"][0],\dur,Pbjorklund2(Pwhite(1,15),16,inf,Pwhite(0,16).asStream)/8,\amp,1,\rate,2,\pan,Pwhite(-1,1),\pan2,Pwhite(-1,1))

~h2.play(0,4)

~ken.play(0,4)
(
~ken = Pbind(\instrument,\bplay,\buf,d["k"][5],\dur,Pbjorklund2(3,8,inf,Pwhite(0,8).asStream)/4,\amp,2);
~sn.play;
~h.stop;
~k2.stop;
~k3.stop;
~h2.play;
p.clock.tempo=1.3;
)

//here's the drop

//everyone!!!
p.clock.tempo=0.1


~sn4 = Pbind(\instrument,\bplay,\buf,d["cp"][3],\dur,Pbjorklund2(3,8)/8,\pan,Pwhite(-1,1),\pan2,Pwhite(-1,1),\amp,1,\rate,Pwhite(0.8,2))


(
~drone2 = Pbind(\instrument,\bpfsaw,\dur,1,\scale,Scale.minor,\degree,Pwrand([0,2,4],[4,2,0].normalizeSum,inf),\amp,4,\ldb,12,\lsf,400,\octave,3,\degree,4);

~drone = Pbind(\instrument,\bpfsaw,\dur,1,\scale,Scale.minor,\degree,Pwrand([0,2,4],[4,2,0].normalizeSum,inf),\amp,4,\ldb,12,\lsf,400,\octave,3,\degree,4);

~sins = Pbind(\instrument,\sinfb,\dur,Pwrand([0.25,Pseq([0.125],2)],[0.8,0.2],inf),\scale,Scale.minor,\degree,Pseq((0..7),inf),\octave,5,\fb,Pwhite(0,1.5),\amp,1,\pan,Pwhite(-1,1),\pan2,Pwhite(-1,1),\rel,0.1,\degree,4);

~sinsx = Pbind(\instrument,\sinfb,\dur,Pwrand([0.25,Pseq([0.125],2)],[0.8,0.2],inf),\scale,Scale.minor,\degree,Pseq((0..7).reverse,inf),\octave,5,\fb,Pwhite(0,1.6),\amp,1,\pan,Pwhite(-1,1),\pan2,Pwhite(-1,1),\rel,0.05,\degree,4);
)

~sn = Pbind(\instrument,\bplay,\buf,d["shout"][1],\dur,1,\amp,0.7)

~sn.play

~h2.stop

p.clock.tempo=40

~sn4.stop
~sn.stop

(
~drone.stop(10);
~drone2.stop(10);
)

~drone.stop


~sinsx.play(0,4)

~drone2.play(0,4)

~drone.play

p.clock.tempo=1.5

~h2 = Pbind(\instrument,\bplay,\buf,d["h"][0],\dur,Pbjorklund2(Pwhite(1,15),16,inf,Pwhite(0,16).asStream)/16,\amp,1,\pan,Pwhite(-1,1),\pan2,Pwhite(-1,1))

~sn = Pbind(\instrument,\bplay,\buf,d["sn"][4],\amp,0.6,\dur,Pbjorklund2(5,8,inf,Pwhite(1,8).asStream),\rate,0.5)



~sn.play

~sn.clear

~h.clear

~h.clear

~sn.play(0,4)

~k4.play(0,4)

p.clock.tempo=1.3

~k3.play

~one2.clear

~k3.play(0,4)

~latoo.play

~d3.play

~d2.play



~d1.play
