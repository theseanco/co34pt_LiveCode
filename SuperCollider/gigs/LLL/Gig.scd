//Hi everyone.

//i'm sean.

//i'll be doing some live coding for you in SuperCollider.

//I hope the font is big enough.

//It'll be quite slow to start.

//Sorry.

//yaaaaaaaaaaay(!!)

//come closer if you like, it's a bit lonely up here...

//I forgot to say. I'm doing the creative arts practice MA at culture lab.

//it's BRILLIANT. ESPECIALLY TOM.

//lol jk


~fund = 50

~one = {DFM1.ar(SinOsc.ar([~fund,~fund*1.01],0,0.5),[~fund,~fund*1.01],EnvGen.ar(Env.perc(0.01,1),Impulse.kr(~tempo.kr/4),1.9),0,0,0,0.6)}

~two = {DFM1.ar(SinOsc.ar([~fund,~fund*1.02]*2,0,0.4),[~fund,~fund*1.02]*2,EnvGen.ar(E\Lnv.perc(0.1,0.4),Impulse.kr(~tempo.kr/2),1.5),1,0,0.00004,1)}

~three = {DFM1.ar(SinOsc.ar([~fund,~fund*1.02],0,0.4),[~fund,~fund*1.02],LFNoise1.kr(0.1).range(0.5,1.4),1,0,0,0.1)}

~four = Pbind(\instrument,\sinfb,\dur,1,\amp,Pwhite(0.01,0.4),\atk,2,\sus,2,\rel,2,\freq,Pwhite(1,5)*(Pkr(~fund)),\fb,Pwhite(0.001,0.2))

~five = Pbind(\instrument,\sinfb,\dur,1,\amp,Pwhite(0.01,0.2),\atk,2,\sus,2,\rel,2,\freq,Pwhite(1,7)*(Pkr(~fund)),\fb,Pwhite(0.001,0.2))

~six = {FreeVerb.ar(SinOscFB.ar(LFNoise1.kr(0.2).range(~fund,~fund*8).round(~fund),LFNoise1.kr(0.1).range(0.1,1.2),0.2),0.5)}

~rise = Pbind(\instrument,\sinfb,\dur,0.4,\amp,0.5,\freq,Pseq((1..10),inf)*Pkr(~fund),\which,Pwhite(0,5),\rel,0.1)

~rise2 = Pbind(\instrument,\sinfb,\dur,0.4,\amp,0.7,\freq,Pseq((1..10).mirror,inf)*Pkr(~fund),\which,Pwhite(0,5),\rel,0.1)

~bpf = Pbind(\instrument,\bpfsaw,\atk,2,\rel,2,\freq,Pkr(~fund)*2,\amp,Pwhite(0.1,0.4),\amp,1)

~bpf.play

~rise.play
~rise2.play

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,Pbjorklund2(3,8)/10,\amp,1)

~k2 = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,Pbjorklund2(5,8)/10,\amp,1,\rate,Pwhite(8,20))

~shout.stop(5)



~k2.play

~rise.stop

~shout = Pbind(\instrument,\bplay,\buf,d["shout"][1],\dur,1,\amp,0.6)

~shout.play



~sn = Pbind(\instrument,\bplay,\buf,d["sn"][2],\amp,Pwhite(0.5,1.0),\dur,Pbjorklund2(Pwhite(1,15),16)/2.5)

~rise = Pbind(\instrument,\sinfb,\dur,0.1,\freq,Pseq((1..20),inf)*(Pkr(~fund)*4),\rel,2,\amp,0.3)

~rise.play

~sn.play

~h = Pbind(\instrument,\bplay,\buf,d["h"][0],\dur,Pbjorklund2(Pwhite(1,7),8)/10,\amp,1)

~stabs = Pbind(\instrument,\bplay,\buf,d["edmstab"][0],\rate,Pseq([1,1,0.9,1.1].stutter(3),inf),\amp,1.4,\dur,Pbjorklund2(3,8)/10)

//here comes the drop. lol.

p.clock.tempo=1.08

~stabs2 = Pbind(\instrument,\bplay,\buf,d["edmstab"][0],\rate,Pseq([1,1,0.9,1.1].stutter(3),inf)*4,\amp,1.5,\dur,Pbjorklund2(Pwhite(1,7),8)/10)

~stabs2.play

p.clock.tempo=1.08

~stabs.play

//this is going somewhere. I promise.

~k.play





~h.play

~six.play

//oops.

~six.clear

~six.play

~four.play;
~fund.fadeTime=60

p.clock.tempo=900000000

~fund = {15000}


//i have no idea what i'm doing now.

//see, really starting to sound like something now.???

~three.play


~two.play

//having a few problems, gimme a sec.

p.fadeTime=4

s.makeWindow

~one.play