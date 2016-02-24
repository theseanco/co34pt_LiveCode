// Four Channel start

(
o=ServerOptions.new;
s.options=o;
// Server.local.options.device = "MOTU Traveler";
Server.local.options.memSize * 128;
o.numOutputBusChannels = 4;
s.options.numBuffers=4000;
s.boot;
p=ProxySpace.push(s);
p.makeTempoClock;
p.clock.tempo = 1;
)

(
SynthDef(\bplay,
	{arg out = 0, buf = 0, rate = 1, amp = 0.1, panx = 0, pany = 0, pos = 0, numChans=4, width=1, rel=15;
		var sig,env ;
		sig = PlayBuf.ar(1,buf,BufRateScale.ir(buf) * rate,1,BufDur.kr(buf)*pos*44100,doneAction:2);
		env = EnvGen.ar(Env.linen(0.0,rel,0),doneAction:2);
		sig = sig * env;
		sig = sig * amp;
		Out.ar(out,Pan4.ar(sig,panx,pany));
}).add;
)

d=Dictionary.new;
d.add(\kick ->
	PathName("/home/smc/Documents/Samples/Iain's samples 1.0/EMX-1/emx drums/1 - Kicks").entries.collect({
		arg sf;
		Buffer.read(s,sf.fullPath);
	});
);

p.fadeTime=3


~one = Pbind(\instrument,\bplay,\buf,d[\kick][0],\amp,0.1)

~one.clear

~one.clear


Synth(\bplay,[\panx,0,\pany,-1])

~one = {SplayAz.ar(4,SinOsc.ar([200,300,400,500,600,700,800,2000,2200,2400,21,33,40],0,0.01),1)}

~two = {PanAz.ar(4,WhiteNoise.ar(0.1),LFTri.kr(0.1).unipolar)}

~two.play

~two.clear

~kick = Pbind(\instrument,\bplay,\buf,d[\kick][0],\amp,0.1,\pan,Pwhite(0,1.0),\rate,10)


~k1 = Pseq([Pdef(\kick4)],inf)

~k1.clear

Pdef(\kick,Pbind(\instrument,\bplaya,\buf,d[\kick][0],\amp,0.1))

Pdef(\kick2,Pbind(\instrument,\bplay,\buf,d[\kick][3],\amp,0.1,\rate,10,\dur,Pwhite(0.125,0.5).round(0.125),\panx,Pwhite(-1,1),\pany,Pwhite(-1,1)))

Pdef(\kick3,Pbind(\instrument,\bplay,\buf,d[\kick][9],\amp,0.3,\rate,0.9,\dur,Pwhite(0.125,1).round(0.125),\panx,Pwhite(-1,1),\pany,Pwhite(-1,1)))

Pdef(\kick4,Pbind(\instrument,\bplay,\buf,d[\kick][20],\amp,0.1,\rate,10,\dur,Pwhite(0.125,0.5).round(0.125)/2,\panx,Pwhite(-1,1),\pany,Pwhite(-1,1)))

~four = Pseq([Pdef(\kick4)],inf)
~one = Pseq([Pdef(\kick)],inf)
~two = Pseq([Pdef(\kick2)],inf)
~three = Pseq([Pdef(\kick3)],inf)

(
~one.clear;
~two.clear;
~three.clear;
~four.clear;
)

~four.play.numChannels = 4

~three.play

~two.play

~one.play

~kick.

~kick.stop

~kick.clear

~one.stop

s.scope




