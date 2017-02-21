//this is the co34pt show.

//hello culture lab :)

~soundIn = {GVerb.ar(Mix.ar(SoundIn.ar([0,1],1)),20)}

~soundIn.clear

~soundIn.play

~f = {SinOsc.kr(0.1).range(100,102)}

Line.kr(0.1,1,120)
~one = {Pulse.ar([~f*LFSaw.kr(Line.kr(8,200,120)).range(1,8).round(1),~f*LFSaw.kr(Line.kr(30,200,100)).range(1,8).round(1)],SinOsc.kr(0.1).range(0.01,0.9),SinOsc.kr(0.1).range(0.1,0.5))}

~two = {Pulse.ar([~f*LFSaw.kr(Line.kr(-1,-200,120)).range(1,8).round(1),~f*LFSaw.kr(Line.kr(-1,-300,120)).range(1,8).round(1)],SinOsc.kr(0.1).range(0.01,0.9),SinOsc.kr(0.1).range(0.1,0.9))}




~three = {Pulse.ar([~f*LFSaw.kr(LFNoise1.kr(0.1).range(1,9.0)).range(1,16).round(2),~f*LFSaw.kr(LFNoise1.kr(0.1).range(1,3.0)).range(1,8).round(1)],SinOsc.kr(0.1).range(0.01,0.9),SinOsc.kr(0.1).range(0.3,0.7))}

~three.stop(20)

~one.stop(120)
~two.stop(240)

~drift = {SinOscFB.ar(LFNoise1.kr(1).range(200,2000).round(~f*2),SinOsc.kr(0.1).range(0.1,1.8),0.8)}


ProxyMixer.new(p)

(
~km.stop;
~k.stop;
~kx.stop;
~cp.play;
)

~f = {80}

~sins2 = Pbind(\instrument,\sinfb,\dur,Pwhite(0.25,0.75).round(0.25)/2,\freq,Pseq((1..10),inf)*Pkr(~f),\amp,Pwhite(0.2,1),\rel,0.1,\fb,Pwhite(0.2,1.4))


~sins = Pbind(\instrument,\sinfb,\dur,Pwhite(0.25,0.75).round(0.25)/4,\freq,Pseq((1..10).reverse,inf)*Pkr(~f),\rel,0.1,\amp,Pwhite(0.2,1),\fb,Pwhite(0.2,1.5))

//thx. :)

//enjoy GUSTAV THOMAS
// R E A L S E S H
// && Competition



p.clear
p.clock.tempo = 0.00001

~sins3 = Pbind(\instrument,\sinfb,\dur,Pwhite(0.25,0.75).round(0.25)/4,\freq,Pseq((1..10).reverse,inf)*Pkr(~f)*2,\rel,0.1,\amp,Pwhite(0.2,1),\fb,Pwhite(0.2,1.5))



~sins4 = Pbind(\instrument,\sinfb,\dur,Pwhite(0.25,0.75).round(0.25)/4,\freq,Pseq((1..10).reverse,inf)*Pkr(~f)*4,\rel,0.1,\amp,Pwhite(0.2,1),\fb,Pwhite(0.2,1.5))

~sins4.play

~sins5 = Pbind(\instrument,\sinfb,\dur,Pwhite(0.25,0.75).round(0.25)/4,\freq,Pseq((1..10).reverse,inf)*Pkr(~f)*8,\rel,0.1,\amp,Pwhite(0.2,1),\fb,Pwhite(0.2,1.5))

~sins5.play


~k.stop


~h.stop

~kx.stop
~sins3.play

~sins2.play


~sins.play

~k = Pbind(\instrument,\bplaym,\buf,d["BD"][4],\amp,90,\dur,0.5)

~henoner.stop

~k.play
~mt.stop
~ht.stop
~lt.stop
~cp.stop

~henoner = Pbind(\instrument,\henon,\dur,0.125,\atk,0,\sus,0,\rel,Pexprand(0.01,0.5),\a,Pexprand(1.2,1.31),\b,Pexprand(0.3,0.51),\amp,Pwhite(0.5,1),\freq,Prand([22050,44100,44100/3,10000,8000],inf))

~henoner.play

~kx = Pbind(\instrument,\bplaym,\buf,d["BD"][1],\rate,2,\amp,8,\dur,Pwhite(1,10))

//i hope you are enjoying yourselves.


~km = Pbind(\instrument,\bplaym,\buf,d["BD"][7],\dur,Pbjorklund2(3,8)/8,\amp,8)



~kx = Pbind(\instrument,\bplaym,\buf,d["BD"][0],\dur,Pbjorklund2(3,16)/8,\amp,8,\rate,Pseq([2,4],inf))

~kx.play

~km.play

~f.fadeTime= 0

~sinesBass = {SinOsc.ar([~f,~f*1.01],0,0.9)*EnvGen.ar(Env.perc(0.01,0.4),Impulse.kr(p.clock.tempo*2))}

~sinesBass.clear

~sinesBass.play


Tdef(\fundChange,{
	loop {
		~f = {[70,80,90,100,120,50,40].choose};
		rrand(1,2).wait;
}})

Tdef(\fundChange).play

~kx.play

p.clock.tempo = 1.15


~h = Pbind(\instrument,\bplaym,\buf,d["CH"][0],\amp,7,\dur,Pwrand([0.25,Pseq([0.125],2),Pseq([0.125/2],4)],[0.7,0.2,0.1],inf))

~h.play



~cp = Pbind(\instrument,\bplaym,\buf,d["CP"][0],\dur,Pseq([0.5,Pseq([1],inf)],inf),\amp,7)

~cp.play

~k.play

StageLimiter.activate

~verber.stop(120)

~bpfs.clear

~verber = {FreeVerb.ar(Mix.ar([~drift]),0.8,0.9,0.1,0.1)}

~verber.play

~sins = {SinOsc.ar([~f,~f*1.01],0,0.2)}



~sins.play

~sins.play

~verber.play

~three.play

~ht = Pbind(\instrument,\bplaym,\buf,d["HT"][1],\dur,Pbjorklund2(Pwhite(1,10),16)/8,\amp,5,\rate,4)

~mt = Pbind(\instrument,\bplaym,\buf,d["MT"][1],\dur,Pbjorklund2(Pwhite(1,10),16,Pwhite(1,16).asStream)/8,\amp,5,\rate,4)



~lt = Pbind(\instrument,\bplaym,\buf,d["LT"][1],\dur,Pbjorklund2(Pwhite(1,10),16,Pwhite(1,16).asStream)/8,\amp,2,\rate,2)

~lt.play

~mt.play

d.keys

~ht.play

~bpfs = Pbind(\instrument,\bpfsaw,\dur,Pwhite(2,4),\freq,Pkr(~f),\atk,3,\sus,3,\rel,4,\detune,Pexprand(0.0001,0.2),\amp,Pwhite(0.2,1.5))


~bpfs.play

~two.play

p.fadeTime=3

~two.play

~one.play