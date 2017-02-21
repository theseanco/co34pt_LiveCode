//Welcome to the co34pt show
//live on culturelabradio.ncl.ac.uk
//And watchpeoplecode.com

//i'm going to be doing some live coding in SuperCollider for you today.

//i'll keep going until I run out of ideas, or the music comes to a natural close

~one = {SinOsc.ar([~f,~f+1],0,1)*(~envM)}

~sinesHi2 = {SinOscFB.ar([~f*15,~f*25],1,1)*~envM}

~two = {SinOsc.ar([~f*2,~f*4],0,SinOsc.kr(0.1).range(0.1,0.6))*~envM}

~envM.fadeTime=10

(
Tdef(\tempoChange, {
	loop {
		~envM = {EnvGen.ar(Env.perc(0.01,[1,2,3,4].choose),Impulse.kr(p.clock.tempo*[1,2,9,4,8,3,1].choose))};
		rrand(1,5).wait;
}})
)

~envM.clear

~k2.stop

~klp.stop



~comber.play


Tdef(\tempoChange).play

p.clock.tempo = 8

~f = {SinOsc.kr(Line.kr(200,700,120)).range(100,Line.kr(1000,101,120))}

~three = {SinOscFB.ar([~f*5,~f*2],~envM.ar*2,SinOsc.kr(0.1).range(0.001,0.3))*~envM}

~four = {SinOscFB.ar([~f*4,~f],~envM * 3,0.2)*~envM}

~verbM.play

~verbM = {arg mix = 1, room = 1, damp = 0.2; FreeVerb.ar(Mix.ar([~one,~two,~three,~four]),mix,room,damp,2)}



~shiftMixes = {PitchShift.ar(~mixes,1,Demand.kr(Impulse.kr(p.clock.tempo),0,Dseq([0.5,1,2,3,4,5],inf)),0,0,9)}

~shiftMixes2 = {PitchShift.ar(~mixes,1,Demand.kr(Impulse.kr(p.clock.tempo),0,Dseq([0.5,1,2,3,4,5],inf)),0,0,10)}

~shiftMixes2.play

~shiftMixes5 = {PitchShift.ar(~mixes.ar,0.5,Demand.kr(Impulse.kr(p.clock.tempo*2),0,Dseq([0.5,1,2,3,4,5,8,9,10],inf)),0,0,0,90)}

~shiftMixes5.clear

~shiftMixes5.play

~mixes.stop

~shiftMixes7 = {PitchShift.ar(~mixes,1,Demand.kr(Impulse.kr(p.clock.tempo),0,Dseq([0.5,1,2,3,4,5],inf)),0,0,0,20)}

~shiftMixes9 = {PitchShift.ar(~mixes,0,0,0,20)}

~shiftMixes9.play

~shiftMixes.play

~warp.play
~verbM.play

~mixes = {LPF.ar(Mix.ar([~one,~two,~three,~four,~sinesHi,~sinesHi2]),2000)}

p.fadeTime=1

~k = Pbind(\instrument,\bplaym,\buf,d["BD"][0],\dur,Pwhite(0.25,0.75).round(0.25),\amp,100,\rate,0.8)



~cp = Pbind(\instrument,\bplaym,\buf,d["CP"][0],\dur,2.round(0.25),\amp,200,\rate,0.8)

~k.stop

~bd2 = Pbind(\instrument,\bplaym,\buf,d["BD"][1],\amp,80,\rate,1)

~bd2.play

~h.stop

~h = Pbind(\instrument,\bplaym,\buf,d["CH"][0],\dur,Prand([0.25,0.25,Pseq([0.125],4)],inf),\amp,200,\rate,Pwhite(0.9,1))


~h.play

s.record

~cp.play

p.clock.tempo = 2

~k.play

~sinesHi2.stop

~comber.play

ProxyMixer.new(p)

~comber = {~mixes}


~henoner = Pbind(\instrument,\henon,\dur,0.5,\atk,0,\rel,0.04,\sus,0,\a,Pexprand(1.2,1.4),\b,Pexprand(0.3,0.35),\amp,Pwhite(0.5,0.95),\freq,Pwhite(Pkr(~f),Pkr(~f)*15).round(Pkr(~f)),\dur,Pbjorklund2(Pwhite(1,16),16)/4)

~henoner.stop

~h = Pbind(\instrument,\bplaym,\buf,d["CH"][0],\dur,Pbjorklund2(Pwhite(1,16),16)/16,\amp,Pwhite(1.2,4))

p.clock.tempo=1.15

~k = Pbind(\instrument,\bplaym,\buf,d["BD"][2],\dur,Pbjorklund2(3,8)/3,\amp,14)
~k2 = Pbind(\instrument,\bplaym,\buf,d["BD"][2],\dur,Pbjorklund2(3,16)/8,\amp,3,\rate,2)


~k2.play

~k.play

d.keys
~h.play

~henoner.clear

~comber.clear

~comber.play

Tdef(\chaosClasses).stop


~verbM.set(\damp,0.7)

~sinesHi = {var q = rrand(100,1200).round(100); Splay.ar(SinOscFB.ar((q..q+40),LFNoise1.kr(0.1).range(0.0,2.5),0.1))*~envM}



~saws.stop

~warp.stop(20)

p.fadeTime=10
s.scope

~sinesHi2.stop

~sndIn = {SoundIn.ar([0,1,])}

~sndIn.play

~sndComber = {CombN.ar(~sndIn,0.5,0.15,9)}


~sinesHi.play


~verbM.play

~warp = {Warp1.ar(2,d["BOC"][1],SinOsc.kr(0.01),4,interp:4,mul:0.1)}

~kd = Pbind(\instrument,\bplaym,\buf,d["BD"][1],\dur,Pbjorklund2(Pwhite(1,5),8),\amp,2,\rate,Pwrand([1,1.25,1.5,2],[5,3,2,1].normalizeSum,inf))

~kd2 = Pbind(\instrument,\bplaym,\buf,d["BD"][1],\dur,Pbjorklund2(Pwhite(1,3),16,inf,Pwhite(1,16).asStream)/2,\amp,5,\rate,Pwrand([1,1.25,1.5,2]*2,[5,3,2,1].normalizeSum,inf))


~snrs = Pbind(\instrument,\bplaym,\buf,d["SD"][1],\dur,Pwhite(1,30),\amp,900)


~klp = Pbind(\instrument,\bplaym,\buf,d["CP"][0],\dur,Pwhite(1,30),\amp,900)

~klp.play


~snrs.fadeTime=0

~snrs.play



//help file time
(
Tdef(\chaosClasses, {
	loop {
{Pan2.ar(ChaosGen.allSubclasses.choose.ar(rrand(~f*30,~f*35).round(~f),mul:0.5),0) * EnvGen.ar(Env.perc(0.01,0.2),1,1,0,1,2).dup}.play;
		exprand(0.01,2).wait;
}});
)

~saws = {SawDPW.ar([10,11],0,1)}

~saws.play

p.fadeTime=2

Tdef(\chaosClasses).play;

~kd2.play

~kd.play


~warp.play

~four.play

~three.play

~two.play

~one.play