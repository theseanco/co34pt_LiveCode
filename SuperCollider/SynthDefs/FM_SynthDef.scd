
//taken from http://danielnouri.org/docs/SuperColliderHelp/Tutorials/Mark_Polishook_tutorial/Synthesis/14_Frequency_modulation.html
//modified to work inside of a Pbind
(
SynthDef(\fm1, { arg bus = 0, freq = 440, carPartial = 1, modPartial = 1, index = 3, mul = 0.05, atk = 0.01, sus = 0, rel = 1, envtype = \exp, pan = 0;

	// index values usually are between 0 and 24
	// carPartial :: modPartial => car/mod ratio

	var mod;
	var car;
	var env;

	mod = SinOsc.ar(
		freq * modPartial,
		0,
		freq * index * LFNoise1.kr(5.reciprocal).abs
	);

	car = SinOsc.ar(
		(freq * carPartial) + mod,
		0,
		mul
	);

	env = EnvGen.ar(Env.linen(atk,sus,rel,1,envtype),doneAction:2);

	Out.ar(
		bus,
		Pan2.ar(car * env,pan)
	)
}).add;
)


(
SynthDef(\fm1, { arg bus = 0, freq = 440, carPartial = 1, modPartial = 1, index = 3, mul = 0.05, atk = 0.01, sus = 0, rel = 1, envtype = \exp, pan = 0;

	// index values usually are between 0 and 24
	// carPartial :: modPartial => car/mod ratio

	var mod;
	var car;
	var env;

	mod = SinOsc.ar(
		freq * modPartial,
		0,
		freq * index * LFNoise1.kr(5.reciprocal).abs
	);

	car = SinOsc.ar(
		(freq * carPartial) + mod,
		0,
		mul
	);

	env = EnvGen.ar(Env.linen(atk,sus,rel,1,envtype),doneAction:2);

	Out.ar(
		bus,
		Pan2.ar(car * env,pan)
	)
}).add;
)

//new

(
SynthDef(\fm1, { arg bus = 0, freq = 440, carPartial = 1, modPartial = 1, index = 3, mul = 0.05, atk = 0.01, sus = 0, rel = 1, envtype = \exp, pan = 0;

	// index values usually are between 0 and 24
	// carPartial :: modPartial => car/mod ratio

	var mod;
	var car;
	var env;

	mod = SawDPW.ar(
		freq * modPartial,
		0,
		freq * index * LFNoise1.kr(5.reciprocal).abs
	);

	car = SawDPW.ar(
		(freq * carPartial) + mod,
		0,
		mul
	);

	env = EnvGen.ar(Env.linen(atk,sus,rel,1,envtype),doneAction:2);

	Out.ar(
		bus,
		Pan2.ar(car * env,pan)
	)
}).add;
)

(
Synth("fm1", [\bus, 0, \freq, 440, \carPartial, 1, \modPartial, 2.4]);
Synth("fm1", [\bus, 1, \freq, 442, \carPartial, 1, \modPartial, 2.401]);
)

//simple FM modulation
~one = Pbind(\instrument,\fm1,\envtype,\exp,\rel,0.5,\atk,0.01,\scale,Scale.chromatic(\et53),\degree,Pseq([0,2,5,10,20],inf),\modPartial,Pwhite(1,5),\dur,Pbjorklund2(3,8)/4,\carPartial,4,\octave,3)

~one = Pbind(\instrument,\fm1,\envtype,\exp,\rel,0.5,\atk,0.01,\scale,Scale.chromatic(\et53),\degree,Pseq([0,2,5,10,20],inf),\modPartial,Pwhite(1,10),\dur,Pbjorklund2(3,8)/4,\carPartial,1,\octave,5)


~two = Pbind(\instrument,\sinfb,\envtype,\exp,\rel,0.5,\atk,0.01,\scale,Scale.chromatic(\et53),\degree,Pseq([0,2,5,10,20],inf),\dur,Pbjorklund2(3,8)/4,\carPartial,4,\octave,5)


~two.play

~mod = {SinOsc.kr(0.1).range(1,4.01)}

~mod.clear

~one.set(\modPartial,~mod)


~one.play