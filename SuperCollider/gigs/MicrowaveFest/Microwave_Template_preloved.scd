// This file is the only file needed to operate the live coding language, with the relevant functions that comprise the language being loaded in the .loadRelative below


//turbo-boost server
(
 //increase number of buffers the server has access to for loading samples
 s.options.numBuffers = 1024 * 16;
 //increase the memory available to the server
 s.options.memSize = 8192 * 64;
)

s.boot;

//Load microlanguage, note: only do this at the START of your session
(
("language_0_6_Microwave.scd").loadRelative;
~keyboardResponder.();
~sampleResponder.();
~hostPatternControl.();
//OPTIONAL: StageLimiter, depends on BatLib Quark
StageLimiter.activate;
//These Ndefs are used to hold effects, which are constructed around the In.ar of each class
(Ndef(\keyboardEffects,
	{
		var in = In.ar(4,2);
		in;
}););
Ndef(\keyboardEffects).play;
Ndef(\keyboardEffects).fadeTime = 10;
(Ndef(\samplerEffects,
	{
		var in = In.ar(6,2);
		in;
}););
Ndef(\samplerEffects).play;
Ndef(\samplerEffects).fadeTime = 10;
)

//if you hard stop SCLang, run this block to get functionality back, or you will lose stored patterns.
(
~keyboardResponder.();
~sampleResponder.();
~hostPatternControl.();
(Ndef(\keyboardEffects,
	{
		var in = In.ar(4,2);
		in;
}););
Ndef(\keyboardEffects).play;
Ndef(\keyboardEffects).fadeTime = 10;
(Ndef(\samplerEffects,
	{
		var in = In.ar(6,2);
		in;
}););
Ndef(\samplerEffects).play;
Ndef(\samplerEffects).fadeTime = 10;
)

//load stitches
~stitchHistory = File("~/src/github/Sampler-Sampler/SuperCollider/savedStitches/stitches.txt".standardizePath,"r").readAllString.interpret

//Task Definition to build stitches,  see examples/documentation for how to use
//dir1 and len1 = direction and length of modifier - 0 = normal, 1 = double
//dir2 and len2 "  "    "
//transform = value added to all values in pattern
//multiplier = multiplication performed on all values in pattern
//Parallel Tdefs can be created, which gives an interesting set of results.
(
Tdef(\stitch,
	{ loop ({
		~loopPattern.(
			pattern:0,
			period:0.1,
			num:1,
			delay:1,
			transform:0,
			multiplier:1,
			dir1:"NONE",
			len1:"NONE"
		);
		~sampleResponder.(
			freq:440,
			amp:0.1,
			atk:0.01,
			rel:0.5,
			pan:rrand(-1.0,1.0),
			envMul:2
		);
	})}
)
)

Tdef(\stitch).play;


//keyboard effects - default
(Ndef(\keyboardEffects,
	{
		var in = In.ar(4,2);
		in;
}););


//sampler effects - default
(Ndef(\samplerEffects,
	{
		var in = In.ar(6,2);
		in;
}););

~clearScreen.(20)

//scratchpad goes here:
//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////
//////////////////////////////////////////////////

~clearScreen.(50)

~stitchHistory.size

(
Tdef(\stitch,
	{ loop ({
		~loopPattern.(
			pattern:rrand(0,~stitchHistory.size-1),
			period:[0.05,0.01,0.05,0.001,0.005,0.02,0.05].choose,
			num:1,
			delay:[0,0.01,0.05,0.2,0.5,1,0,0,0,0].choose,
			transform:[0,2,4].choose,
			multiplier:1,
			dir1:rrand(0,2),
			len1:[0,0,0,0,1].choose
		);
		~sampleResponder.(
			freq:[1,2,3,4,5,6,7].choose * 220,
			amp:0.1,
			atk:[0.01,0.01,0.1].choose,
			rel:[0.5,0.1,0.01].choose,
			pan:rrand(-0.6,0.6),
			envMul:2
		);
	})}
)
)

~clearScreen.(60)


(Ndef(\samplerEffects,
	{
		var in = In.ar(6,2);
		FreeVerb.ar(CombC.ar(in,0.2,0.1,5),0.5,0.9);
}););


Ndef(\samplerEffects).play
/*
////////////BREAK IN CASE OF EMERGENCY
BREAK IN CASE OF EMERGENCY
BREAK IN CASE OF EMERGENCY
BREAK IN CASE OF EMERGENCY

(
Tdef(\stitch,
	{ loop ({
		~loopPattern.(
			pattern:0,
			period:0.1,
			num:1,
			delay:0.5,
			transform:0,
			multiplier:1,
		);
		~sampleResponder.(
			freq:400,
			amp:0.1,
			atk:0.1,
			rel:0.01,
			pan:0,
			envMul:2
		);
	})}
)
)

(
Tdef(\stitchPar,
	{ loop ({
		~loopPattern.(
			pattern:0,
			period:0.1,
			num:1,
			delay:0.5,
			transform:0,
			multiplier:1,
		);
		~sampleResponder.(
			freq:400,
			amp:0.1,
			atk:0.1,
			rel:0.01,
			pan:0,
			envMul:2
		);
	})}
)
)

Tdef(\stitch).play;
Tdef(\stitchPar).play;


//keyboard effects - default
(Ndef(\keyboardEffects,
	{
		var in = In.ar(4,2);
		in;
}););


//sampler effects - default
(Ndef(\samplerEffects,
	{
		var in = In.ar(6,2);
		in;
}););


BREAK IN CASE OF EMERGENCY
BREAK IN CASE OF EMERGENCY
BREAK IN CASE OF EMERGENCY
BREAK IN CASE OF EMERGENCY
BREAK IN CASE OF EMERGENCY
*/
/////////////////
Tdef(\stitches).stop


//co34pt performance
("/home/smc/src/github/co34pt_LiveCode/setup/SuperCollider/Setup/Setup_MIDI.scd").load

(
~warpEnv = {var env = EnvGen.ar(Env.perc(0.01,0.5,0.1),Impulse.kr(LFNoise1.kr(0.1).range(0.5,4)),1,0,1,0);
	FreeVerb.ar(Warp1.ar(2,d["rhodes"][0],LFTri.kr(0.01)+env,2,0.2,-1,32,0.01,4,env*4),0.5)}
)

p.fadeTime = 3

~warp1 = {arg speed = 0.01, winsize = 0.2, rate = 1; Warp1.ar(2,d["rhodes"][0],LFTri.kr(speed),rate,winsize,-1,16,0.02,4,0.5)}

~warp2 = {arg speed = 0.04, winsize = 0.2, rate = 2; Warp1.ar(2,d["rhodes"][0],LFTri.kr(speed),rate,winsize,-1,16,0.02,4,0.5)}

~warp3 = {arg speed = 0.08, winsize = 0.2, rate = 0.5; Warp1.ar(2,d["rhodes"][0],LFTri.kr(speed),rate,winsize,-1,16,0.02,4,0.5)}

~warp3.play

~synth = {Pan2.ar(FreeVerb.ar(SoundIn.ar(0),0.6,0.9,0.2))}

~k = Pbind(\instrument,\bplaym,\buf,d["k"][0],\dur,4,\amp,5);

~sn = Pbind(\instrument,\bplay,\buf,d["s"][0],\dur,8,\amp,1);

~h = Pbind(\instrument,\bplay,\buf,d["ch"][0],\dur,Pseq((0..60).normalizeSum * 16,inf),\amp,Pexprand(0.3,1));


~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,Pseq([0,0,0,0,0,0,35],inf),\amp,1,\rate,Pwhite(0.8,2));


~cym = Pbind(\instrument,\bplaym,\buf,d["cym"][1],\dur,Pseq([0.5,Pseq([1],inf)],inf),\rel,0.1,\amp,0.5)

~cym.play



~warpEnv.stop(340)

~warp3.stop(rrand(120,150))

~r = -2


(
l = Pbjorklund2(Pseq([3,10,14,11,4,5,7,8,1,3,2],inf),16)/4;
~ring1 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,0,\octave,3,\dur,l,\d,0.6,\a,Pexprand(1,100),\pan,0,\amp,0.5);
~ring2 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,0,\octave,4,\dur,l,\d,Pexprand(0.1,0.4),\a,Pexprand(1,30),\pan,0,\amp,0.5);
~ring3 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,0,\octave,Pwrand([5,6],[10,1].normalizeSum,inf),\dur,l,\d,Pexprand(0.01,0.7),\a,Pexprand(1,30),\pan,0,\amp,0.5);
~ring4 = Pbind(\instrument,\ring1,\f,Pkey(\freq),\scale,d[\scale],\root,Pkr(~r),\degree,Pwhite(0,5),\octave,Pwrand([5,6],[10,1].normalizeSum,inf),\dur,l,\d,Pexprand(0.01,0.1),\a,Pexprand(1,30),\pan,0,\amp,0.5);
~k = Pbind(\instrument,\bplaym,\buf,d["k"][80],\dur,Pbjorklund2(3,8)/4,\amp,1,\rate,1.3);
~sinfb = Pbind(\instrument,\sinfb,\scale,d[\scale],\root,Pkr(~r),\octave,[4,5,6],\degree,Pseq([0,1,2,3,4,5,6,7],inf).stutter(3),\dur,l,\amp,0.3,\fb,0.1,\rel,0.1);
)


(
~midiPattern = Pbind(
    \type, \midi,
    \midicmd, \noteOn,
	\midiout, d[\m],
    \chan, 0,
	\scale,d[\scale],
	\degree, Pseq([0,1,2,4],inf),
	\root,-2,
	\octave, 5,
	\dur, Pbjorklund2(3,8)/4,
	\legato, 0.1
)
)
(
~sinfb2 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5],inf)*Pkr(~r2),\dur,0.25,\amp,0.3,\fb,0.1,\rel,0.1);
~sinfb3 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6],inf)*Pkr(~r2)*2,\dur,0.25,\amp,0.3,\fb,0.1,\rel,0.1);
~sinfb4 = Pbind(\instrument,\sinfb,\freq,Pseq([1,2,3,4,5,6,7].reverse,inf)*Pkr(~r2)*2,\dur,0.25,\amp,0.3,\fb,0.1,\rel,0.1);
~sinfb3.play;
~sinfb2.play;
~sinfb4.play;;
)


~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,1);


~k.play
~r2 = {Line.kr(85,399,120)}


p.fadeTime = 0

~sinfb.play

~cym.stop

p.clock.tempo = 2.3

~c = Pbind(\instrument,\bplay,\buf,d["c"][49],\dur,1,\amp,1,\rate,3);
~cym = Pbind(\instrument,\bplaym,\buf,d["cym"][2],\dur,1,\rel,0.1,\amp,0.5)


~cym.play
~sn.stop

~sinfb.stop







~c.play

~sn = Pbind(\instrument,\bplay,\buf,d["s"][0],\dur,Pbjorklund2(3,8)/2,\amp,1);

~sn.play

(
~midiPattern = Pbind(
    \type, \midi,
    \midicmd, \noteOn,
	\midiout, d[\m],
    \chan, 0,
	\scale,d[\scale],
	\degree, Pseq([0,0,3,4,5],inf),
	\root,Pkr(~r),
	\octave, 3,
	\dur, 0.25,
	\legato, 0.1
)
)


~ring4.play





~k.stop


~k = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,1,\amp,1);

(
~ring1.stop;
~ring2.stop;
~ring3.stop;
~ring4.stop;
)

~sinfb.play

~sinfb = Pbind(\instrument,\sinfb,\scale,d[\scale],\root,Pkr(~r),\octave,[4,5],\degree,Place([0,0,[1,2],[0,3],[1,2]],inf),\dur,Pbjorklund2(Pwhite(8,16),16)/4,\amp,Pwhite(0.4,0.7),\fb,0.1,\rel,0.1);



~k = Pbind(\instrument,\bplaym,\buf,d["k"][0],\dur,1,\amp,4);

~k.play

~cym.play

~sin = {SinOsc.kr(0.1).range(0.01,1.41)}

~sin2 = {SinOsc.kr(0.1).range(0.01,1.41)}

~sin3 = {SinOsc.kr(0.1).range(0.01,1.41)}


~sinfb.set(\fb,~sin)
~k.stop;
~cym.stop

~h.stop
~k.stop

~sn.stop

~c.stop

~c = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,Pbjorklund2(Pwhite(1,3),8)/4,\amp,1,\rate,1.5);

~verbSend.stop

~k = Pbind(\instrument,\bplaym,\buf,d["k"][0],\dur,Pbjorklund2(3,8)/4,\amp,3,\rate,Pseq([1.6,2],inf));


~k.play
~synth = {Pan2.ar(FreeVerb.ar(SoundIn.ar(0),0.33,0.7,0.5,2))}

~synth.play

~ring4.play

~ring3.play

~ring2.play

d[\scale] = Scale.minor

~ring1.play

~synth.stop(20)

~c.play

~h.play

(
~verbSend = {
	var array = [~sn.ar,~c.ar];
	FreeVerb.ar(Mix.ar(array),0.4,0.5,0.5,2)
}
)

~sn.play

~verbSend.play

~k.play


~synth.play

~warpEnv.play


d.keys