// This file is the only file needed to operate the live coding language, with the relevant functions that comprise the language being loaded in the .loadRelative below


//turbo-boost server
(
 //increase number of buffers the server has access to for loading samples
 s.options.numBuffers = 1024 * 16;
 //increase the memory available to the server
 s.options.memSize = 8192 * 64;
)

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




(
Tdef(\stitch,
	{ loop ({
		~loopPattern.(
			pattern:rrand(0,~stitchHistory.size-1),
			period:[0.01,0.02,0.004,0.001].choose,
			num:1,
			delay:0.1,
			transform:[0,0,0,0,2,3,4,5].choose,
			multiplier:1,
			dir1:rrand(0,8),
			len1:[1].choose
		);
		~sampleResponder.(
			freq:[400,500,600,700,800,900,1000,2000,3000].choose * 0.1,
			amp:0.1,
			atk:0.01,
			rel:0.01,
			pan:rrand(-1.0,1.0),
			envMul:2
		);
	})}
)
)

~clearScreen.(60)

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


//co34pt performance
("/home/smc/src/github/co34pt_LiveCode/setup/SuperCollider/Setup/Setup_MIDI.scd").load

(
~warpEnv = {var env = EnvGen.ar(Env.perc(0.01,0.5,0.1),Impulse.kr(LFNoise1.kr(0.1).range(0.5,4)),1,0,1,0);
	Warp1.ar(2,d["rhodes"][0],LFTri.kr(0.01)+env,2,0.2,-1,32,0.01,4,env*4)}
)


d.keys