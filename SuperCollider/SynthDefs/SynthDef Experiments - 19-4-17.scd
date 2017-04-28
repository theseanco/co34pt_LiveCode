(
//SynthDef based on an overdriven DFM1 - this is very CPU intensive
//Using resonance values of >1 only will sound the freq value and detune it.
//good for stabs, but is buggy
SynthDef(\dfm1, {
	arg out = 0, freq = 440,mul = 0.5, res = 1,type = 0, noise = 0.0003, atk = 0.01, rel = 1;
	var sig, env;
	env = EnvGen.ar(Env.perc(atk,rel),doneAction:2);
	sig = DFM1.ar(SinOsc.ar,freq,res,1,type,noise,mul);
	sig = sig*env;
	Out.ar(out,Splay.ar([sig]));
}).add;
)

//a very nice example of this - a resolution of 1 - 20 allows the filter to corrupt standing notes
~one = Pbind(\instrument,\dfm1,\res,Pwhite(1,20.0),\degree,[0,4],\scale,Scale.minor,\dur,Pbjorklund2(Pwhite(3,15),16)/4,\rel,0.1)
~one.play


//this RLPFD example is gorgeous, the filter is beautiful
~rlpfd = { RLPFD.ar(Mix(LFSaw.ar([120, 180], 0, 0.33)), LinExp.kr(LFCub.kr(0.1, 0.5*pi), -1, 1, 280, 1500), 0.6, 0.5, mul:3).dup }
p.fadeTime=5
~rlpfd.play

~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,Pbjorklund2(Prand([1,20,1,1,1,1],inf),32)*0.125,\amp,1);
~k.play


~sin = {SinOsc.kr(0.01).range(0.01,10.01)}
~rlpfd.set(\speed,~sin)
~rlpfd = {arg speed = 0.5; RLPFD.ar(Mix(LFSaw.ar([120, 180, 60,SinOsc.kr(speed).range(120,600).round(60),SinOsc.kr(speed*1.01).range(120,1200).round(120)], 0, 0.33)), LinExp.kr(LFCub.kr(0.1, 0.5*pi), -1, 1, 280, 1500), 0.6, 0.5, mul:3).dup }


~one = {SinOsc.ar(SinOsc.ar(0.05).range(200,500),0,0.4)*SinOsc.ar(100,0,0.4)}

//delay
~delaySend = {Mix.ar([##~one##])};
~delay = {CombC.ar(NumChannels.ar([~delaySend]),p.clock.tempo*4,p.clock.tempo/16,1)};
~delay.play

~sn = Pbind(\instrument,\bplay,\buf,d["s"][3],\dur,Pwhite(1,20),\amp,1);
~sn.stop

//A string resonator example, which sounds great
~streson = {arg speed = 0.0001; Streson.ar(LFSaw.ar([220, 180], 0, mul:EnvGen.kr(Env.asr(0.5, 1, 0.02), 1.0) * 0.2), SinOsc.kr(speed).range(0.003,0.9), 0.9, 0.3) }
~streson.play
//modulating the speed
~stresonsine = {SinOsc.kr(0.1).range(0.00001,0.0001)}
~streson.set(\speed,~stresonsine)

//sending a kick to a streson
~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,Pwhite(0.25,1).round(0.25),\amp,1,\rate,2);
~stresonSend = {Mix.ar([~k])}
~streson = {Streson.ar(~stresonSend.ar,SinOsc.kr(0.1).range(0.1,0.00000001),0.9)}
~streson.play
~k.play


~rlpfdSend = {Mix.ar([##~one##])};
~rlpfd = {arg speed = 0, min = 200, max = 500, res = 0.5, dist = 0.5; RLPFD.ar(NumChannels.ar([~rlpfdSend]),SinOsc.kr(speed).range(min,max),res,dist,3)};
~rlpfd.play;

~dfm1Send = {Mix.ar([##~one##])};
~dfm1Filt = {arg freq = 1000, res = 0.7, noise = 0.0003, type = 0; DFM1.ar(NumChannels.ar([~dfm1Send]),freq,res,1,type,noise,1)};
~dfm1Filt.play;


/*

TODO out of the end of this:

- Make RPLFD filter snippet
- Make ravestab snippet

*/