
~rung = {Ringz.ar(CoinGate.ar([5,3,9]/10,T2A.ar(Impulse.kr([4,12,6]))),[45,9e3,50,8e3],[6,1,10,3]/10,[9,2,3,1]).sin.sum.tanh!2}


//original freqshifter
(
~freqShifter = {
    var source, local;

	source = SinOsc.ar(LFNoise1.kr(0.5).range(60,80).round(1).midicps,0,0.1);
    local = LocalIn.ar(2) + [source, 0]; // read feedback, add to source
	local = FreqShift.ar(local,[LFNoise1.kr(0.1).range(1,10),LFNoise1.kr(0.1).range(1,10)]); // delay sound

    // reverse channels to give ping pong effect, apply decay factor
	    Limiter.ar(LocalOut.ar(local.reverse*0.96));

    local
}
)

//deconstruct this into four SynthDefs
(
SynthDef(\ring1,
	{
		arg f = 45, a = 9, d = 0.6, pan = 0, amp = 1, out = 0;
		var sig, env;
		env = Line.kr(0,1,d);
		env = FreeSelfWhenDone.kr(env);
		sig = Impulse.ar(0);
		sig = Ringz.ar(sig,f,d,a);
		Out.ar(out,Pan2.ar(sig.tanh,pan) * amp)
	};
).add;
Synth(\ring1);
)

(
SynthDef(\ring2,
	{
		arg f = 9000, a = 2, d = 0.1, amp = 1, pan = 2, out = 0;
		var sig, env;
		env = Line.kr(0,1,d);
		env = FreeSelfWhenDone.kr(env);
		sig = Impulse.ar(0);
		sig = Ringz.ar(sig,f,d,a);
		Out.ar(out,Pan2.ar(sig.tanh,pan) * amp)
	};
).add;
Synth(\ring2);
)

(
SynthDef(\ring3,
	{
		arg f = 50, a = 3, d = 1, pan = 0, amp = 1, out = 0;
		var sig, env;
		env = Line.kr(0,1,d);
		env = FreeSelfWhenDone.kr(env);
		sig = Impulse.ar(0);
		sig = Ringz.ar(sig,f,d,a);
		Out.ar(out,Pan2.ar(sig.tanh,pan) * amp)
	};
).add;
Synth(\ring3);
)

(
SynthDef(\ring4,
	{
		arg f = 8000, a = 1, d = 0.3, pan = 0, amp = 1, out = 0;
		var sig, env;
		env = Line.kr(0,1,d);
		env = FreeSelfWhenDone.kr(env);
		sig = Impulse.ar(0);
		sig = Ringz.ar(sig,f,d,a);
		Out.ar(out,Pan2.ar(sig.tanh,pan) * amp)
	};
).add;
Synth(\ring4);
)

//SET 1 PROTOTYPE START

~rung1 = Pbind(\instrument,\ring1,\dur,Pbjorklund2(Pwhite(1,7),8)/4,\scale,Scale.chromatic(\et53),\degree,Prand((0..5),inf),\f,Pkey(\freq),\a,Prand([0,9,10,20],inf),\pan,-1,\octave,Pwrand([5,6],[0.9,0.1],inf).stutter(2),\amp,0.4)


~rung2 = Pbind(\instrument,\ring1,\dur,Pbjorklund2(Pwhite(1,7),8)/4,\scale,Scale.chromatic(\et53),\degree,Prand((0..5),inf),\f,Pkey(\freq),\a,Prand([0,9,10,20],inf),\pan,1,\octave,Pwrand([4,5],[0.9,0.1],inf),\amp,0.4)

~rung3.play


s = Scale.chromatic(\et53)

~rung3 = Pbind(\instrument,\ring1,\dur,0.25,\a,1,\f,Pkey(\freq),\degree,Pseq((0..140).stutter(2),inf),\pan,Pwhite(-0.8,0.8),\octave,Pwhite(4,5),\scale,s,\d,0.8)



(
~one = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,4/4,\amp,4);
~one2 = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,12/4,\amp,4,\rate,4);
~one3 = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,6/4,\amp,4,\rate,2);
~gab = Pbind(\instrument,\bplaym,\buf,d["gab"][0],\dur,1,\amp,10);
~ch = Pbind(\instrument,\bplay,\buf,d["ch"][1],\dur,Pbjorklund2(Pwhite(1,15),16)/16,\amp,Pexprand(0.01,1));
~uk = Pbind(\instrument,\bplay,\buf,d["c"][0],\dur,Pbjorklund2(Pseq([3,5],inf),8)/4,\amp,Pwhite(0.5,1))
)
~uk.play
~

p.clock.tempo=2.05

~uk.play
~rung1.play
//////////////////SET 1 PROTOTYPE END

//////////////////SET 2 PROTOTYPE START

~r = {0}

~rung1 = Pbind(\instrument,\ring1,\dur,Pbjorklund2(Pwhite(1,7),8)/4,\scale,Scale.chromatic(\et53),\degree,Prand((0..12),inf),\f,Pkey(\freq),\a,Prand([0,9,10,20,50],inf),\pan,-1,\octave,4,\amp,0.4,\d,Pwhite(0.6,0.9))

s.record

~rung2 = Pbind(\instrument,\ring1,\dur,Pbjorklund2(Pwhite(1,7),8)/4,\scale,Scale.chromatic(\et53),\degree,Prand((0..12),inf),\f,Pkey(\freq),\a,Prand([0,9,10,20,50],inf),\pan,1,\octave,4,\amp,0.4,\d,Pwhite(0.6,0.9))

~rung3 = Pbind(\instrument,\ring2,\dur,Pbjorklund2(Pwhite(1,16),16)/4,\a,Pwhite(1,80))
~one.play
~rung3.play

//original freqshifter
(
~freqShifter = {
    var source, local;

	source = SinOsc.ar(LFNoise1.kr(0.5).range(60,80).round(1).midicps*SawDPW.ar(100),0,1);
    local = LocalIn.ar(2) + [source, 0]; // read feedback, add to source
	local = FreqShift.ar(local,[LFNoise1.kr(0.1).range(1,10),LFNoise1.kr(0.1).range(1,10)]); // delay sound
	local = DelayN.ar(local,2,SinOsc.kr(0.01).range(0.000001,0.7));
    // reverse channels to give ping pong effect, apply decay factor
	    Limiter.ar(LocalOut.ar(local.reverse*0.8));

    local
}

)


~freqShifter.play
~freqShifter.fadeTime=5

~one = Pbind(\instrument,\bplaym,\buf,d["sk"][0],\dur,Pbjorklund2(3,8)/4,\amp,4,\rate,1.5)

~uk.play

~freqShifter.play

~freqShifter.fadeTime=20

/////////////////////SET 2 PROTOTYPE END

/////////////////////SET 3 PROTOTYPE START

(
~freqShifter = {
    var source, local;

	source = SinOsc.ar(LFNoise1.kr(0.5).range(60,30).round(1).midicps,0,0.1);
    local = LocalIn.ar(2) + [source, 0]; // read feedback, add to source
	local = FreqShift.ar(local,[LFNoise1.kr(0.1).range(1,10),LFNoise1.kr(0.1).range(1,10)]); // delay sound

    // reverse channels to give ping pong effect, apply decay factor
	    Limiter.ar(LocalOut.ar(local.reverse*0.96));

    local
}
)

~rung1 = Pbind(\instrument,\ring1,\dur,Pbjorklund2(Pwhite(1,7),8)/4,\scale,Scale.chromatic(\et53),\degree,Prand((0..5),inf),\f,Pkey(\freq),\a,Prand([0,9,10,20],inf),\pan,-1,\octave,Pwrand([5,6],[0.9,0.1],inf).stutter(2),\amp,0.4)


~rung2 = Pbind(\instrument,\ring1,\dur,Pbjorklund2(Pwhite(1,7),8)/4,\scale,Scale.chromatic(\et53),\degree,Prand((0..5),inf),\f,Pkey(\freq),\a,Prand([0,9,10,20],inf),\pan,1,\octave,Pwrand([4,5],[0.9,0.1],inf),\amp,0.4)

~rung4 = Pbind(\instrument,\ring1,\dur,Pbjorklund2(Pwhite(1,5),8),\scale,Scale.chromatic(\et53),\degree,Pwhite(-1,1),\f,Pkey(\freq),\a,Pwhite(100,900),\d,1,\octave,3)

~k = Pbind(\instrument,\bplaym,\buf,d["k"][2],\dur,Pbjorklund2(Pseq([3,5],inf),8)/4,\amp,1,\rate,Pseq([1,1.2,1.8],inf))

~k1 = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,6/4,\amp,1)
~k2 = Pbind(\instrument,\bplay,\buf,d["k"][0],\dur,4/4)
~h = Pbind(\instrument,\bplay,\buf,d["ch"][1],\dur,Pbjorklund2(Pwhite(5,16),16)/8,\amp,Pexprand(0.1,1))


~sinchords = Pbind(\instrument,\sinfb,\dur,Pwhite(10,20),\atk,Pwhite(2,5),\rel,Pwhite(10,30),\scale,Scale.chromatic(\et53),\degree,Pseq([Pwhite(0,52,1),Pwhite(0,52,1),Pwhite(0,52,1)],inf),\amp,Pwhite(0.3,1.0),\octave,Pwrand([3,4],[0.1,0.9],inf))

~sins = {SinOsc.kr(0.05).range(0.1,1.2)}

~rungx = Pbind(\instrument,\ring1,\dur,0.25,\scale,Scale.chromatic(\et24),\degree,Prand((0..23),inf),\f,Pkey(\freq),\a,Prand([0,1,2,3,4,5,6,7],inf),\pan,Pwhite(-1,1),\octave,Pwrand([2,3,4,5],[0.9,0.1],inf),\amp,0.4,\d,0.1)

~gab = Pbind(\instrument,\bplaym,\buf,d["gab"][0],\dur,1,\amp,2)

p.clock.tempo=0.00001
~gab.play

~rungx.play

~sinchords.set(\fb,~sins)

~rung2.play

~rung4.stop

~sinchords.play

~h.play

s.stopRecording

~freqShifter.play
s.makeWindow
/////////////////////SET 3 PROTOTYPE END


//////////////////////SET 4 PROTOTYPE START

p.clock.tempo = 2.2

(
~freqShifter = {
    var source, local;
	source = Mix.ar(SinOscFB.ar([50,75,100],SinOsc.kr(0.1).range(0.1,0.7),1.5));
    local = LocalIn.ar(2) + [source, 0]; // read feedback, add to source
	local = FreqShift.ar(local,[LFNoise1.kr(0.1).range(1,20),LFNoise1.kr(0.1).range(1,20)]); // delay sound
	local = DelayN.ar(local,0.5,2.2/6,1);
	// reverse channels to give ping pong effect, apply decay factor
	    Limiter.ar(LocalOut.ar(local.reverse*0.9));
    local
}
)

(
~sk.play;
~c.play;
~k2.play;
~k3.play;
~three.play;
)

~r = {0}

~two.play

~freqShifter.fadeTime=20
p.clock.tempo
2.2/6

//central duration Pbind
q = Pbjorklund2(Pseq([3,6,1,2,5,6,7,8,2,12,5,8,10,12].scramble,inf),16)/4;

l = [5,325,7457,231,1,1,1,1,1].scramble


//can be used to sync ALL pbinds, then envelopes can then be restrained and tempo increased
(
q = Pbjorklund2(Pseq([3,6,1,2,4,6,7,8,2,4,5,8,10,12].scramble,inf),16)/4;
~one = Pbind(\instrument,\ring1,\scale,s,\degree,Pwhite(0,2),\dur,q,\amp,4,\f,Pkey(\freq),\octave,Pwrand([5,6],[0.8,0.2],inf),\a,Prand([1,10,20,50,1,2,4,5,5,3],inf),\pan,1,\d,0.2);
~two = Pbind(\instrument,\ring1,\scale,s,\octave,Pwrand([4,5],[0.8,0.2],inf),\degree,Pwhite(0,2),\dur,q,\amp,1,\f,Pkey(\freq),\a,Prand([1,10,20,4,5,6],inf),\pan,-1,\d,0.2);
~five = Pbind(\instrument,\ring1,\scale,s,\octave,Pwrand([6,7],[0.8,0.2],inf),\degree,Pwhite(-1,1),\dur,q,\amp,1,\f,Pkey(\freq),\a,Prand([1,10,20,4,5,6],inf),\pan,Pwhite(-1.0,1.0),\d,0.2);
~three = Pbind(\instrument,\ring1,\scale,s,\octave,3,\degree,Pwhite(0,7),\dur,q,\amp,8,\f,Pkey(\freq),\a,Prand([1,10,50,90,40,50,60,20,4,5,6],inf)*4,\pan,0,\d,Pexprand(0.2,0.7));
~threex = Pbind(\instrument,\ring1,\scale,s,\octave,6,\degree,Pwhite(0,1),\dur,q,\amp,5,\f,Pkey(\freq),\a,Prand([1,10,50,90,40,50,60,20,4,5,6],inf)*4,\pan,0,\d,Pexprand(0.1,0.3));
~threey = Pbind(\instrument,\ring1,\scale,s,\octave,7,\degree,Pseq([0,24+rrand(0,10),38+rrand(0,39),52+rrand(0,90)],inf),\dur,Prand([0.25,0.2,0.1,0.05],inf).stutter(10),\amp,5,\f,Pkey(\freq),\a,Prand([1,10,50,90,40,50,60,20,4,5,6],inf)*4,\pan,0,\d,Pexprand(0.1,0.3));
//~four = Pbind(\instrument,\ring1,\scale,Scale.chromatic(\et24),\degree,Prand([Pseq((0..10),1),Pseq((0..20),1),Pseq((0..40),1)],inf),\d,4,\octave,Prand([6,5],inf).stutter(100),\dur,0.25,\f,Pkey(\freq),\a,Pexprand(1,30.0),\amp,1);
~wun = Pbind(\instrument,\ring1,\dur,0.25,\octave,4,\f,Pkey(\freq),\degree,Pseq([0,0,0,0,1,2,3,4,5,6],inf).stutter(4),\amp,4,\d,0.1,\scale,s,\a,Pexprand(1,400),\pan,Pseq([0,0,0,0,-1,1,-0.5,0.9,-0.1],inf).stutter(4));
~six = Pbind(\instrument,\ring1,\octave,8,\dur,1,\f,Pkey(\freq),\d,2,\scale,s,\degree,Pwhite(-1,1));
~six2 = Pbind(\instrument,\ring1,\octave,9,\dur,1,\f,Pkey(\freq),\d,2,\scale,s,\degree,Pwhite(-1,1));
~sn = Pbind(\instrument,\bplay,\buf,d["s"][1],\dur,q,\amp,30,\rate,4);
~fx = Pbind(\instrument,\bplaym,\buf,d["crash"][0],\dur,q,\amp,2)
)


~six2.play

~threey.stop

~wun.stop

(
~one.play;
~two.play;
~three.play;
~threex.play;
~threey.play;
~six.play;
)

~k3.stop

~threey.play


~c.play

~sk.play

~one.play

~wun.play

~c.play
~sn.stop

~sk.stop

~one.play
~sn.play

~threey.play
~two.clear
~one.clear

p.clock.tempo = 2.7
4
~four.stop
~sk.stop
~sn.stop
~six.play


~fx.stop
~fx.play

p.clock.tempo = 2.5

~wun.play

~sk.play

~fx.stop
~six.play

~sk.play

~fx.play

~c.stop

~sn.play

~freqShifter.stop(30)

~four.stop

~five.play

~three.play

~h = Pbind(\instrument,\bplay,\buf,d["ch"][1],\dur,Pbjorklund2(Pwhite(1,16),16)/8,\amp,Pwhite(0.01,1.2))

~h.play

(
~one.play;
~two.play;
~three.play;
~h.play;
~k.play;
~sk.play;
)

(
~one.stop;
~two.stop;
~uk.stop;
~c.stop;
~k.stop;
)

~h.play

~sk.play
~k.stop

~k.play
(
~k = Pbind(\instrument,\bplaym,\buf,d["t"][2],\dur,Pbjorklund2(Pwrand([3,5,1],[10,10,0.1].normalizeSum,inf),8)/4,\amp,9,\rate,2);
~sk = Pbind(\instrument,\bplaym,\buf,d["sk"][1],\dur,Pseq([1,1,1,1,Pbjorklund2(3,8,1)/4,Pbjorklund2(3,8,1)/4],inf),\amp,30,\rate,1.5);
~k3 = Pbind(\instrument,\bplaym,\buf,d["t"][0],\dur,Pbjorklund2(3,8)/4,\amp,7,\rate,1*2);
~k2 = Pbind(\instrument,\bplaym,\buf,d["t"][0],\dur,Pbjorklund2(3,16)/4,\amp,7,\rate,0.8*2);
~c = Pbind(\instrument,\bplaym,\buf,d["c"][2],\dur,2,\amp,30,\rate,1.4)
)
~c.play

~k2.play

~freqShifter.stop(20)

~c.play
~k2.play

~h.play


~two.play

~one.play

~freqShifter.play

s = Scale.chromatic(\et53)

//////////////////////SET 4 PROTOTYPE END

(
~freqShifter = {
    var source, local;

	source = SinOsc.ar(LFNoise1.kr(2.5).range(60,90).round(1).midicps*SawDPW.ar(400,0,4),0,0.8);
    local = LocalIn.ar(2) + [source, 0]; // read feedback, add to source
	local = FreqShift.ar(local,[LFNoise1.kr(0.1).range(1,10),LFNoise1.kr(0.1).range(1,10)]); // delay sound
	local = DelayN.ar(local,2,SinOsc.kr(0.1).range(0.001,1.5));

    // reverse channels to give ping pong effect, apply decay factor
	    Limiter.ar(LocalOut.ar(local.reverse*0.99999));

    local
}
)
